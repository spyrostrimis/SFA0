"""SFAZ session log analyzer.

Reads the session zips (or folders / *_game.log files) written by
"SFAZ Online (logged).bat" and prints a readable report: what happened when,
what went wrong, and - given one session from EACH player - whether the two
installs match and where the two games stopped agreeing (desync).

    python external/netlog/netlog_analyze.py my_session.zip
    python external/netlog/netlog_analyze.py my_session.zip friends_session.zip
    python external/netlog/netlog_analyze.py save/logs/netlog          (newest session)

Add  --full  to include every heartbeat line in the timeline.
"""

import io
import re
import sys
import zipfile
from collections import Counter
from pathlib import Path

LINE = re.compile(r"^(\d{4}-\d\d-\d\d \d\d:\d\d:\d\d(?:\.\d+)?) (?:\[\s*([\d.]+)\] )?(\S+)\s*(.*)$")
CP = re.compile(r"^CP gt=(\d+) m=(\S+) r=(\S+) rt=(\S+) \| (.*)$")
PARTS = ("game.log", "monitor.log", "engine_out.txt", "engine_err.txt", "files.txt")

# events worth showing in the timeline (HB only with --full)
TIMELINE = {
    "SESSION_START", "MENU", "MODE", "NET_START", "ROOM_STATUS", "ROOM_FAILED", "CONNECTED", "SYNC_END",
    "SYNC_WARNING", "SESSION_WARN", "LOAD_SLOW", "MATCH_START", "MATCH_TEAMS", "ROUND_END", "MATCH_END",
    "MATCH_ROUNDS", "STALL", "CONNECTION_LOST", "NET_END", "LUA_PANIC", "LOGGER_ERROR", "SESSION_END",
    "REPLAY_REC", "FREEZE_START", "FREEZE_END", "HIGH_CPU", "PEER_FOUND", "PEER_GONE", "PING_SUMMARY", "END",
    "ENGINE", "GAME_HALTED", "GAME_RESUMED", "GAME_HALTED_END", "STUCK_MATCH_START", "STUCK_SYNC",
}


class Session:
    def __init__(self, name, files):
        self.name = name
        self.files = files  # part -> text
        self.events = []  # (timestamp, source, tag, msg)
        self.cps = []  # (net session index, gt, m, r, rt, body)
        self._parse()

    def _parse(self):
        net_idx = 0
        for raw in self.files.get("game.log", "").splitlines():
            raw = raw.lstrip("\ufeff")
            m = CP.match(raw)
            if m:
                self.cps.append((net_idx, int(m[1]), m[2], m[3], m[4], m[5]))
                continue
            m = LINE.match(raw)
            if m:
                if m[3] == "CONNECTED":
                    net_idx += 1
                self.events.append((m[1], "game", m[3], m[4]))
        for raw in self.files.get("monitor.log", "").splitlines():
            m = LINE.match(raw.lstrip("\ufeff"))
            if m:
                self.events.append((m[1], "mon", m[3], m[4]))
        self.events.sort(key=lambda e: e[0])

    def tag(self, tag):
        return [e for e in self.events if e[2] == tag]

    def first(self, tag):
        t = self.tag(tag)
        return t[0][3] if t else None

    def manifest(self):
        out = {}
        for raw in self.files.get("files.txt", "").splitlines():
            parts = raw.lstrip("\ufeff").split("  ", 2)
            if len(parts) == 3 and not raw.startswith(("#", "DIGEST")):
                out[parts[2]] = (parts[0], parts[1])
        return out

    def digest(self):
        m = re.search(r"^DIGEST (\w+)", self.files.get("files.txt", "").lstrip("\ufeff"), re.M)
        return m[1] if m else None


def load(path):
    p = Path(path)
    if p.is_dir():
        zips = sorted(p.glob("*.zip"))
        logs = sorted(p.glob("*_game.log"))
        if zips:
            p = zips[-1]
        elif logs:
            p = logs[-1]
        else:
            sys.exit(f"no session found in {p}")
    files = {}
    if p.suffix.lower() == ".zip":
        with zipfile.ZipFile(p) as z:
            for n in z.namelist():
                for part in PARTS:
                    if n.endswith("_" + part):
                        files[part] = z.read(n).decode("utf-8-sig", "replace")
                if "_crash_" in n:
                    files.setdefault("crash", "")
                    files["crash"] += f"--- {n}\n" + z.read(n).decode("utf-8-sig", "replace")
        name = p.stem
    else:
        stem = p.name[: -len("_game.log")] if p.name.endswith("_game.log") else p.stem
        for part in PARTS:
            f = p.parent / f"{stem}_{part}"
            if f.exists():
                files[part] = f.read_text("utf-8-sig", "replace")
        for f in p.parent.glob(f"{stem}_crash_*"):
            files.setdefault("crash", "")
            files["crash"] += f"--- {f.name}\n" + f.read_text("utf-8-sig", "replace")
        name = stem
    return Session(name, files)


def num(pattern, text, cast=float):
    m = re.search(pattern, text)
    return cast(m[1]) if m else None


def report(s, full, out):
    w = out.write
    w(f"\n{'=' * 78}\nSESSION {s.name}\n{'=' * 78}\n")
    for tag in ("BUILD", "CFG_NETPLAY", "PC_OS", "PC_CPU", "PC_GPU"):
        for e in s.tag(tag):
            w(f"  {tag:<12} {e[3]}\n")
    for e in s.tag("NET_ADAPTER") + s.tag("NET_PROFILE") + s.tag("FIREWALL"):
        w(f"  {e[2]:<12} {e[3]}\n")

    findings = []
    # ---- how it ended
    end = s.tag("END")
    if end:
        findings.append(("END", end[-1][3]))
    elif not s.tag("SESSION_END"):
        findings.append(("END", "log stops without SESSION_END - the game crashed, froze and was killed, "
                                "or is still running"))
    if "crash" in s.files:
        err = re.search(r"^Error:.*(?:\n.+){0,3}", s.files["crash"], re.M)
        findings.append(("CRASH DUMP", err[0].replace("\n", " ") if err else "see crash file"))

    # ---- connection
    for e in s.tag("ROOM_FAILED"):
        hint = ""
        if re.search(r"nat|ice|candidate|timeout|failed", e[3], re.I):
            hint = "  -> both PCs may be behind strict NAT/CGNAT; use HOST GAME/JOIN by IP over Radmin VPN"
        findings.append(("ROOM FAILED", e[3] + hint))
    for e in s.tag("NET_END"):
        if "FAILED" in e[3] or "cancelled" in e[3]:
            findings.append(("NO CONNECTION", e[3]))
    for e in s.tag("SYNC_END"):
        if "ok=true" not in e[3]:
            findings.append(("SYNC FAILED", e[3] + " " + (s.first("SYNC_WARNING") or "")))
    for e in s.tag("SESSION_WARN"):
        findings.append(("ENGINE WARNING", e[3]))
    for e in s.tag("CONNECTION_LOST"):
        before = [x for x in s.events if x[0] <= e[0] and x[2] in ("STALL", "PING", "MATCH_START")][-4:]
        ctx = "; ".join(f"{x[2]} {x[3][:70]}" for x in before)
        findings.append(("CONNECTION LOST", f"{e[0][11:19]} {e[3]}" + (f"  [just before: {ctx}]" if ctx else "")))

    # ---- freezes / hangs / stalls
    for e in s.tag("FREEZE_START"):
        before = [x for x in s.events if x[0] <= e[0] and x[1] == "game" and x[2] not in ("HB",)]
        last = f"{before[-1][2]} {before[-1][3][:90]}" if before else "?"
        ends = [x for x in s.tag("FREEZE_END") if x[0] >= e[0]]
        dur = ends[0][3] if ends else "never recovered"
        findings.append(("FREEZE", f"{e[0][11:19]} window not responding ({dur}); last game event: {last}"))
    for e in s.tag("HIGH_CPU"):
        findings.append(("BUSY HANG?", f"{e[0][11:19]} {e[3]}"))
    for e in s.tag("LOAD_SLOW"):
        findings.append(("SLOW LOAD", f"{e[0][11:19]} {e[3]}"))
    for e in s.tag("GAME_HALTED") + s.tag("STUCK_MATCH_START") + s.tag("STUCK_SYNC"):
        findings.append((e[2].replace("_", " "), f"{e[0][11:19]} {e[3]}"))
    # a match whose first frame never came (works on logs from before FIRST_FRAME existed)
    open_match = None
    for e in s.events:
        if e[1] != "game":
            continue
        if e[2] == "MATCH_START":
            open_match = e
        elif e[2] in ("FIRST_FRAME", "ROUND_START", "HB"):
            open_match = None
        elif e[2] == "MATCH_END" and open_match:
            findings.append(("NO FIRST FRAME", f"{open_match[0][11:19]} {open_match[3]} - ended without ever running"))
            open_match = None
    if open_match:
        findings.append(("NO FIRST FRAME", f"{open_match[0][11:19]} {open_match[3]} - the game never drew this match "
                                           "(froze or was killed during the match start)"))
    # engine side: every match starts with "Replay sync write" then "Network synchronized"
    ee_lines = s.files.get("engine_err.txt", "").splitlines()
    pending = None
    for l in ee_lines:
        if "Replay sync write" in l:
            pending = l
        elif "Network synchronized" in l:
            pending = None
    if pending:
        findings.append(("SYNC NOT DONE", "engine wrote '" + pending[:60] + "...' but never logged 'Network synchronized' "
                                          "after it - stuck in the per-match network sync"))
    room_bad = [l for l in ee_lines if re.search(r"Room (host|guest): (ICE )?(disconnected|failed)", l)]
    if room_bad:
        findings.append(("ROOM LINK", f"{len(room_bad)} disconnect/fail event(s), first: {room_bad[0][:120]}"))
    stalls = s.tag("STALL")
    if stalls:
        worst = max(stalls, key=lambda e: num(r"frozen (\d+)ms", e[3], int) or 0)
        findings.append(("STALLS", f"{len(stalls)} in-match stall(s) over 400ms, worst: {worst[0][11:19]} {worst[3]}"))
    for e in s.tag("LUA_PANIC") + s.tag("LOGGER_ERROR"):
        findings.append((e[2], e[3]))

    # ---- performance
    fps = [num(r"\| ([\d.]+) fps", e[3]) for e in s.tag("HB")]
    fps = [f for f in fps if f]
    if fps:
        low = [f for f in fps if f < 57]
        if low:
            findings.append(("LOW FPS", f"{len(low)} of {len(fps)} heartbeats under 57 fps (lowest {min(low):.1f})"))
    for e in s.tag("PING_SUMMARY"):
        findings.append(("PING", e[3]))
    if any("[WIFI]" in e[3] for e in s.tag("NET_ADAPTER")):
        findings.append(("WIFI", "a Wi-Fi adapter is active - Wi-Fi jitter causes stalls/rollbacks; use a cable if you can"))
    if any("no Windows Firewall rule" in e[3] for e in s.tag("FIREWALL")):
        findings.append(("FIREWALL", "no firewall rule for the game - hosting by IP needs one"))

    # ---- matches
    starts, ends = s.tag("MATCH_START"), s.tag("MATCH_END")
    aborted = [e for e in ends if "ABORTED" in e[3] or "LOST" in e[3]]
    w(f"\n  matches started={len(starts)} ended={len(ends)} aborted/lost={len(aborted)}"
      f"  net sessions connected={len(s.tag('CONNECTED'))}\n")
    rollback = any("rollback(" in e[3] for e in starts)
    rew = sum(num(r"rewinds=(\d+)", e[3], int) or 0 for e in ends)
    if rew and rollback:
        w(f"  rollback rewinds over all matches: {rew}\n")

    # ---- engine console
    eo = s.files.get("engine_out.txt", "")
    codes = Counter(re.findall(r"^(EventCode\w+)", eo, re.M))
    if codes:
        w("  engine netcode events: " + ", ".join(f"{k}={v}" for k, v in codes.most_common()) + "\n")
        for bad in ("EventCodeconnectionInterrupted", "EventCodeDisconnectedFromPeer"):
            if codes.get(bad):
                findings.append(("NETCODE", f"engine reported {bad} x{codes[bad]}"))
    ee = s.files.get("engine_err.txt", "")
    errs = [l for l in ee.splitlines() if re.search(r"error|panic|fatal|desync", l, re.I)
            and not l.startswith("WARNING") and "Failed to add char: EMPTY" not in l]
    if errs:
        findings.append(("ENGINE STDERR", f"{len(errs)} error line(s), first: {errs[0][:160]}"))
        if re.search(r"^goroutine \d+ \[", ee, re.M):
            findings.append(("GO PANIC", "engine_err.txt contains a Go stack trace - the engine itself crashed"))

    w("\n  FINDINGS\n")
    if not findings:
        w("    nothing wrong detected\n")
    for k, v in findings:
        w(f"    {k:<16} {v}\n")

    w("\n  TIMELINE\n")
    for ts, src, tag, msg in s.events:
        if tag in TIMELINE or (full and tag in ("HB", "PING", "RES")):
            w(f"    {ts[11:23]} {'*' if src == 'mon' else ' '} {tag:<15} {msg[:200]}\n")


def compare(a, b, out):
    w = out.write
    w(f"\n{'=' * 78}\nCOMPARE  A={a.name}\n         B={b.name}\n{'=' * 78}\n")
    da, db = a.digest(), b.digest()
    if da and db:
        if da == db:
            w("  game files: IDENTICAL (same install fingerprint)\n")
        else:
            ma, mb = a.manifest(), b.manifest()
            diff = sorted(k for k in set(ma) | set(mb) if ma.get(k) != mb.get(k))
            w(f"  game files: {len(diff)} DIFFERENT - different files can desync or fail to load:\n")
            for k in diff[:60]:
                w(f"    {k:<60} A={ma.get(k, ('missing', ''))[1] or 'missing':>10} B={mb.get(k, ('missing', ''))[1] or 'missing':>10}\n")
            if len(diff) > 60:
                w(f"    ... and {len(diff) - 60} more\n")
    else:
        w("  game files: no fingerprint in one of the sessions (started without the launcher?)\n")

    ga = [e[3] for e in a.tag("CFG_NETPLAY") if e[1] == "game"]
    gb = [e[3] for e in b.tag("CFG_NETPLAY") if e[1] == "game"]
    ca, cb = (ga[0] if ga else None), (gb[0] if gb else None)
    if ca and cb and ca != cb:
        w(f"  netplay config differs:\n    A: {ca}\n    B: {cb}\n")

    ea = [e for e in a.tag("MATCH_END")]
    eb = [e for e in b.tag("MATCH_END")]
    if len(ea) == len(eb):
        for x, y in zip(ea, eb):
            if "ABORTED" in x[3] or "ABORTED" in y[3] or "NEVER" in x[3] or "NEVER" in y[3]:
                fx, fy = num(r"(\d+) frames", x[3], int), num(r"(\d+) frames", y[3], int)
                if fx == fy:
                    same = "SAME frame on both PCs -> the link stopped carrying data both ways; neither game crashed"
                else:
                    same = "different frames -> one side stopped first"
                w(f"  aborted match ({x[0][11:19]} / {y[0][11:19]}): A stopped at {fx} frames, B at {fy}: {same}\n")

    # desync check: same net session (n-th successful connection) and same game frame
    ia = {(c[0], c[1]): c for c in a.cps}
    ib = {(c[0], c[1]): c for c in b.cps}
    common = sorted(set(ia) & set(ib))
    if not common:
        w("  desync check: no common checkpoints (not the same online session, or no online match)\n")
        return
    bad = [k for k in common if ia[k][5] != ib[k][5] or ia[k][2:5] != ib[k][2:5]]
    if not bad:
        w(f"  desync check: {len(common)} checkpoints compared - NO DESYNC, both games agreed the whole time\n")
        return
    k = bad[0]
    w(f"  desync check: DESYNC - {len(bad)} of {len(common)} checkpoints differ\n")
    w(f"    first difference at online session {k[0]}, game frame {k[1]} (match {ia[k][2]} round {ia[k][3]})\n")
    w(f"    A: {ia[k][5]}\n    B: {ib[k][5]}\n")
    prev = [c for c in common if c < k]
    if prev:
        w(f"    last frame that still agreed: {prev[-1][1]} - the cause is between those two frames\n")


def main():
    args = [x for x in sys.argv[1:] if not x.startswith("--")]
    full = "--full" in sys.argv
    if not args:
        print(__doc__)
        sys.exit(1)
    sessions = [load(x) for x in args]
    out = io.StringIO()
    for s in sessions:
        report(s, full, out)
    if len(sessions) == 2:
        compare(sessions[0], sessions[1], out)
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    print(out.getvalue())


if __name__ == "__main__":
    main()
