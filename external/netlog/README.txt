SFAZ SESSION LOGGING - for online test sessions
================================================

WHAT IT DOES
  Records what happens during an online session so that afterwards we can see
  why a connection dropped, why the game froze, stuttered or crashed, or why
  the two games stopped agreeing (desync). Nothing is sent anywhere - it only
  writes files on your own PC, and you choose to send them.

INSTALL (both players need the same files)
  SFAZ Online (logged).bat            -> game folder (next to the .exe)
  external\netlog\launch_logged.ps1   -> external\netlog\
  external\netlog\README.txt          -> external\netlog\
  external\mods\sfaz_netlog.lua       -> external\mods\
  external\script\main.lua            -> external\script\   (room-code fix, see below)

HOW TO USE
  1. Start the game with  "SFAZ Online (logged).bat"  instead of the .exe.
     A small black window opens next to the game. Minimise it, but do not
     close it while playing.
  2. Play as normal: HOST ROOM / JOIN ROOM, HOST GAME / JOIN by IP, any mode.
  3. If something goes wrong, note roughly the time. If the game freezes,
     wait about 30 seconds before killing it, so the freeze gets recorded.
  4. Close the game. The black window says where the zip is:
        save\logs\netlog\<date>_<time>_<PC name>.zip
     Press Enter to close it. Both players send their zip from the same session.

WHAT IS IN THE ZIP
  _game.log        menus picked, connection steps (room code status, time to
                   connect, failures and why), every match (mode, characters,
                   stage, netcode, result, rounds), stalls/hitches with the
                   round and timer they happened at, rollback rewinds, FPS,
                   connection lost, loading that hangs, how the session ended,
                   and checkpoints used to find desyncs
  _engine_out/err  the engine's own console messages (netcode events such as
                   connectionInterrupted / DisconnectedFromPeer, warnings,
                   crash traces)
  _monitor.log     Windows version, CPU, GPU, RAM, network adapters (Wi-Fi /
                   cable / VPN) with their local IP addresses, firewall rules
                   for the game, netplay settings, CPU and memory use, freezes
                   (window not responding), ping to the opponent when playing
                   by IP, and how the game closed (clean / crash / killed)
  _files.txt       fingerprint of the game files, to check both installs match
  _crash_*.log     engine crash dumps from that session, if any
  Your PC name is part of the file names. Nothing else personal is recorded.

STARTED WITHOUT THE .BAT?
  The game still logs online sessions to save\logs\netlog\ (or save\logs\ if
  that folder does not exist yet), but without the engine output, monitor,
  file fingerprint or zip. Offline play started normally writes nothing.

ROOM CODES AND ROLLBACK
  Room-code play (HOST ROOM / JOIN ROOM) freezes on the first frame of every
  match when rollback netcode is on. Until that is fixed in the engine, the
  updated main.lua plays room-code sessions on delay netcode automatically
  (your config.ini is not changed, and IP play still uses your setting).
  Both players need the updated main.lua for room codes to connect.

EXTRA DETAIL FOR ROLLBACK PROBLEMS (optional)
  In save\config.ini, [Netplay] section:  Rollback.LogsEnabled = 1
  makes the engine write its own rollback logs, which the launcher adds to the
  zip. It can cost some performance, so only turn it on when chasing a
  rollback problem.

READING THE LOGS
  python external\netlog\netlog_analyze.py <your zip> <friend's zip>
  prints a summary per player (findings + timeline), says whether both
  installs are identical, and where the two games desynced, if they did.
  Add --full to include every heartbeat line.
  The .log files are plain text and can also be read directly.


================================================================================
INSTRUCTIONS FOR CLAUDE CODE (analysing a session)
================================================================================
To use: open Claude Code in the game folder and say something like
  "Read external\netlog\README.txt and analyse the session zips <paths>."

Claude - this section is for you. The user and a friend played Street Fighter
Alpha Zero (an Ikemen GO build) online and want to know what went wrong and
how to fix it.

RULE: ANALYSE, CHECK, TEST AND PLAN ONLY. DO NOT CHANGE ANYTHING.
  Do not edit, create, move or delete any file in the game folder (scripts,
  mods, data, chars, stages, save\config.ini, save\*) until the user
  explicitly says to go ahead with a specific change. "Analyse this" is not
  permission. Scratch files go in your scratchpad or temp folder only. When
  you finish, present findings and a plan, then stop and wait.

1. WHERE THINGS ARE
  Session zips:   save\logs\netlog\<date>_<time>_<PC>.zip (one per player)
                  or wherever the user saved the friend's zip. Ask for both.
  In each zip:    _game.log, _monitor.log, _engine_out.txt, _engine_err.txt,
                  _files.txt, maybe _crash_*.log and Rollback-*.log
                  (see "WHAT IS IN THE ZIP" above)
  Sessions started without the .bat: save\logs\netlog\*_game.log or
                  save\logs\netlog_*_game.log (game log only)
  Older crash dumps:  save\logs\Ikemen_<date>.log
  Older netplay team/char-count log:  save\logs\sfaz_netsync_debug.txt
  Logger:         external\mods\sfaz_netlog.lua (in game, read-only)
  Launcher:       external\netlog\launch_logged.ps1
  Analyser:       external\netlog\netlog_analyze.py
  Netplay menus:  external\script\main.lua - ['roomhost'], ['roomjoin'],
                  ['serverhost'], ['serverconnect'], ['netplayversus'],
                  ['netplayteamcoop'], ['netplaysurvivalcoop'],
                  main.f_connect, main.f_connectRoom, main.f_roomNetcodeBegin
  Match flow:     external\script\start.lua (launchFight, start.f_game)
  Netplay config: save\config.ini [Netplay]
  The engine Go source is NOT in this folder and Go is not installed, so
  engine bugs can only be worked around in Lua or reported for an engine fix.

2. FIRST PASS
  python external\netlog\netlog_analyze.py <zip A> <zip B>
  Then read the raw _game.log and _monitor.log around every problem time.
  Times in both logs are each PC's local clock (they can be a few seconds
  apart). Match them up by the room code, match number and round instead.

3. WHAT TO LOOK FOR, AND WHERE
  Could not connect   ROOM_STATUS / ROOM_FAILED / NET_END "FAILED" or
                      "cancelled" in _game.log. Strict NAT/CGNAT on both sides
                      -> room codes cannot work, IP over Radmin VPN can.
                      IP play: _monitor.log FIREWALL (rule missing? profile
                      Public vs Private), NET_PROFILE, wrong IP typed.
  Sync failed         SYNC_END ok=false, SYNC_WARNING / SESSION_WARN text,
                      different netplay settings (CFG_NETPLAY in both logs).
  Connection dropped  CONNECTION_LOST, MATCH_END "ABORTED"/"CONNECTION LOST",
                      the STALL just before it, PING timeouts / PEER_GONE in
                      _monitor.log, EventCodeconnectionInterrupted /
                      EventCodeDisconnectedFromPeer in _engine_out.txt.
                      Did it happen on both PCs at the same moment (network)
                      or start on one (that PC froze or crashed first)?
  Stutter / lag       STALL and HB lines (fps, maxGap, hitch, rewind counts),
                      RES cpu/mem in _monitor.log, [WIFI] adapters, LOW FPS.
  Freeze              FREEZE_START in _monitor.log = window not responding;
                      HIGH_CPU with the window still responding = busy-wait
                      hang; LOAD_SLOW = stuck loading (VS screen); the last
                      _game.log line before it says what the game was doing.
  Crash               _monitor.log END line, _crash_*.log ("Error:" + Lua
                      traceback = script/data error; Go stack trace in
                      _engine_err.txt = engine crash), LUA_PANIC. A game log
                      that stops without SESSION_END = crash or killed.
  Desync              analyser "desync check". The first differing CP line
                      gives the frame; the round/characters/moves around it
                      point to the cause. Custom systems (ratio, hyper levels,
                      custom combos, handicaps, AI helpers, ProjScanner) are
                      the usual suspects. Different _files.txt digests = the
                      installs differ: list the files.
  Game stopped        GAME_HALTED / GAME_RESUMED in _monitor.log = frames
  mid-match           stopped while the window still responded (the launcher
                      notices within ~3s; the in-game log only writes STALL
                      once frames resume). The engine's own lines, mirrored as
                      ENGINE (e.g. "waiting for the other player's input",
                      "Room host: ICE disconnected"), show what it waited for.
                      Analyser "aborted match ... SAME frame on both PCs" =
                      the link stopped carrying data; neither game crashed.
  Stuck at match      MATCH_START with no FIRST_FRAME, STUCK_MATCH_START, and
  start               analyser "NO FIRST FRAME" / "SYNC NOT DONE" (engine
                      wrote "Replay sync write" but never "Network
                      synchronized") = stuck in the per-match network sync.
                      STUCK_SYNC = synchronize() itself never returned.
  Wrong mode/teams    MATCH_START / MATCH_TEAMS and sfaz_netsync_debug.txt:
                      both PCs must show the same team modes and counts.
  Logger problems     LOGGER_ERROR lines (the logger itself failed somewhere).

4. KNOWN FACTS (checked 2026-10-05, two game copies on one PC)
  - IP play works with delay and with rollback, no desync in AI matches.
  - Room codes connect and play on delay netcode. Room + rollback freezes on
    the first frame of every match, so main.lua forces delay for room sessions
    (main.f_roomNetcodeBegin/End). Both PCs need that main.lua.
  - Under rollback, connected() is false during a match and true after it, by
    design. isHost() returns true on both PCs, so it says nothing about role.
  - The Lua "loop" hook also runs during rollback re-simulation (counted as
    "rewinds" in the log; only reported when rollback is on).
  - Checked 2026-10-11: the Oct 5 Survival freeze (Gen+Adon vs CPU R.Mika+Adon,
    Sardine Beach) does NOT reproduce with two local copies - both builds, IP
    and room, both players' exact Oct 5 files, with an 85s select screen. A
    simulated link stall at match start on the current build is handled (host
    gives up after ~20s, window stays responsive); mid-match it ends the match
    after ~13s. Oct 5's drops and freeze came from the live room link.
  - The engine rewrites save\config.ini every time it starts.

5. TESTING (allowed, as long as it changes nothing)
  - Back up save\ to your scratchpad first and restore it exactly afterwards
    (the game writes config.ini, stats.json and debug logs while running).
  - Never edit the real config or scripts to test. Copy save\config.ini to
    your scratchpad, change the copy, and start the exe with
      -config <copy> -nosound -windowed
  - Capture engine output with PowerShell Start-Process
    -RedirectStandardOutput/-RedirectStandardError (cmd ">" captures nothing
    from this exe).
  - Two-PC behaviour can be reproduced with two copies of the game on one PC:
    a test driver .lua loaded only through the config copy
    ([Common] Modules = <driver>, path relative to the game folder; put it in a
    temporary folder you delete afterwards) that connects (enterNetPlay('') /
    enterNetPlay('127.0.0.1') or enterNetPlayRoom), calls synchronize(), sets
    both sides to AI (setCom), and runs loadStart() + game(). Kill one copy
    mid-match to test drops. Same-PC tests do not cover real routers/NAT.
  - Remove every test file and confirm save\ matches the backup before
    reporting.

6. WHAT TO REPORT
  - What happened, in order, for each player, with times and evidence (quote
    the log lines).
  - The most likely cause of each problem and how sure you are. Say plainly
    what the logs cannot show.
  - A PLAN: the changes you suggest (file, function, what and why), what each
    risks, how it would be tested, and what to log or try in the next session
    if the cause is still unclear. Settings changes the players can make
    themselves (wired connection, Radmin VPN, firewall, rollback on/off,
    Rollback.LogsEnabled) go in the plan as well.
  - Then STOP. Make no changes until the user explicitly approves a specific
    step.
