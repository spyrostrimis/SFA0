# SFAZ logged launcher - started by "SFAZ Online (logged).bat" in the game folder.
#
# Starts the game exactly as normal, plus records what is needed to work out
# afterwards why an online session dropped, froze or crashed:
#
#   <session>_game.log         written by the game (external/mods/sfaz_netlog.lua)
#   <session>_engine_out.txt   the engine's console output: netcode events
#   <session>_engine_err.txt   (GGPO connectionInterrupted / DisconnectedFromPeer,
#                              "Network synchronized"), engine warnings, Go panics
#   <session>_monitor.log      this script: PC/network/firewall info, window
#                              not-responding (freeze) periods, CPU and memory,
#                              ping to the opponent (IP play), how the game ended
#   <session>_files.txt        fingerprint of the install, to check both PCs match
#   <session>_crash_*.log      engine crash dumps written during the session
#
# and zips all of them into save\logs\netlog\<session>.zip to send.
# Any arguments given to the .bat are passed on to the game.

param([Parameter(ValueFromRemainingArguments = $true)] [string[]] $GameArgs)

$ErrorActionPreference = 'Continue'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
Set-Location $root

$exe = Join-Path $root 'Ikemen_GO_NEWBUILD.exe'
if (-not (Test-Path $exe)) {
	$exe = Get-ChildItem $root -Filter *.exe | Where-Object { $_.Name -notmatch 'unins|setup' } |
		Select-Object -First 1 -ExpandProperty FullName
}
if (-not $exe) { Write-Host 'Game exe not found next to this launcher.'; Read-Host 'Press Enter'; exit 1 }

$logDir = Join-Path $root 'save\logs\netlog'
New-Item -ItemType Directory -Force $logDir | Out-Null
# keep the folder from growing forever: drop session files older than 45 days
Get-ChildItem $logDir -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-45) -and $_.Name -ne 'README.txt' } |
	Remove-Item -Force -ErrorAction SilentlyContinue

$id = (Get-Date -Format 'yyyy-MM-dd_HH-mm-ss') + '_' + $env:COMPUTERNAME
$base = Join-Path $logDir $id
$mon = "${base}_monitor.log"

function M([string]$tag, [string]$msg, [switch]$Show) {
	$line = '{0} {1,-14} {2}' -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss.fff'), $tag, $msg
	Add-Content -LiteralPath $mon -Value $line -Encoding UTF8
	if ($Show) { Write-Host $line }
}

function IniSection([string]$path, [string]$section) {
	$out = @(); $in = $false
	foreach ($l in (Get-Content -LiteralPath $path -ErrorAction SilentlyContinue)) {
		if ($l -match '^\s*\[(.+)\]') { $in = ($Matches[1] -eq $section); continue }
		if ($in -and $l -match '^\s*[^;\s]') { $out += $l.Trim() }
	}
	$out
}

# ---------------------------------------------------------------- start game
$cfgPath = Join-Path $root 'save\config.ini'
for ($i = 0; $i -lt $GameArgs.Count - 1; $i++) {
	if ($GameArgs[$i] -eq '-config') { $cfgPath = $GameArgs[$i + 1] }
}
$env:SFAZ_NETLOG_ID = $id
$startTime = Get-Date
$sp = @{
	FilePath = $exe; WorkingDirectory = $root; PassThru = $true
	RedirectStandardOutput = "${base}_engine_out.txt"; RedirectStandardError = "${base}_engine_err.txt"
}
if ($GameArgs.Count -gt 0) {
	$sp.ArgumentList = $GameArgs | ForEach-Object { if ($_ -match '\s') { '"' + $_ + '"' } else { $_ } }
}
$p = Start-Process @sp
$null = $p.Handle # keeps ExitCode readable after the game closes

$host.UI.RawUI.WindowTitle = 'SFAZ logger - leave this window open while you play'
Write-Host ''
Write-Host '  Street Fighter Alpha Zero is running with session logging.'
Write-Host '  Leave this window open (minimise it) until the game is closed.'
Write-Host "  Logs: $logDir"
Write-Host ''
M 'LAUNCH' ("session=$id exe=$(Split-Path $exe -Leaf) pid=$($p.Id) args=" + ($GameArgs -join ' '))

# install fingerprint in the background (about 5-10 s of disk reading)
$manifestJob = Start-Job -ArgumentList $root, "${base}_files.txt" -ScriptBlock {
	param($root, $outFile)
	$md5 = [Security.Cryptography.MD5]::Create()
	$lines = New-Object System.Collections.Generic.List[string]
	$dirs = 'chars', 'data', 'stages', 'font', 'external\script', 'external\mods'
	$files = foreach ($d in $dirs) {
		$full = Join-Path $root $d
		if (Test-Path $full) { Get-ChildItem $full -Recurse -File | Where-Object { $_.Name -notmatch '\.bak' } }
	}
	$files += Get-ChildItem $root -File -Filter *.exe
	foreach ($f in ($files | Sort-Object FullName)) {
		$rel = $f.FullName.Substring($root.Length + 1)
		try {
			$s = [IO.File]::OpenRead($f.FullName)
			try { $h = [BitConverter]::ToString($md5.ComputeHash($s)).Replace('-', '').ToLower() } finally { $s.Dispose() }
		} catch { $h = 'unreadable' }
		$lines.Add("$h  $($f.Length)  $rel")
	}
	foreach ($f in (Get-ChildItem (Join-Path $root 'sound') -Recurse -File -ErrorAction SilentlyContinue | Sort-Object FullName)) {
		$lines.Add("size-only  $($f.Length)  $($f.FullName.Substring($root.Length + 1))")
	}
	$all = [Text.Encoding]::UTF8.GetBytes(($lines -join "`n"))
	$digest = [BitConverter]::ToString($md5.ComputeHash($all)).Replace('-', '').ToLower()
	$header = @("# SFAZ install fingerprint - identical DIGEST on both PCs = identical game files",
		"DIGEST $digest  files=$($lines.Count)")
	Set-Content -LiteralPath $outFile -Value ($header + $lines) -Encoding UTF8
	"DIGEST $digest files=$($lines.Count)"
}

# ---------------------------------------------------------------- PC info
try {
	$os = Get-CimInstance Win32_OperatingSystem
	M 'PC_OS' "$($os.Caption) $($os.Version) build $($os.BuildNumber), RAM $([math]::Round($os.TotalVisibleMemorySize / 1MB, 1)) GB, free $([math]::Round($os.FreePhysicalMemory / 1MB, 1)) GB"
	$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
	M 'PC_CPU' "$($cpu.Name.Trim()) - $($cpu.NumberOfCores) cores / $($cpu.NumberOfLogicalProcessors) threads"
	foreach ($g in (Get-CimInstance Win32_VideoController)) {
		M 'PC_GPU' "$($g.Name) driver $($g.DriverVersion), $($g.CurrentHorizontalResolution)x$($g.CurrentVerticalResolution) @ $($g.CurrentRefreshRate) Hz"
	}
	$power = (powercfg /getactivescheme) 2>$null
	if ($power) { M 'PC_POWER' (($power -join ' ') -replace '^.*?:\s*', '') }
} catch { M 'PC_INFO_ERR' $_.Exception.Message }

try {
	foreach ($a in (Get-NetAdapter | Where-Object Status -eq 'Up')) {
		$ips = (Get-NetIPAddress -InterfaceIndex $a.ifIndex -AddressFamily IPv4 -ErrorAction SilentlyContinue).IPAddress -join ','
		$kind = if ($a.InterfaceDescription -match 'Wi-?Fi|Wireless|802\.11') { 'WIFI' }
			elseif ($a.InterfaceDescription -match 'Radmin|ZeroTier|Tailscale|Hamachi|WireGuard|TAP|VPN') { 'VPN' }
			else { 'wired/other' }
		M 'NET_ADAPTER' "$($a.Name) [$kind] '$($a.InterfaceDescription)' $($a.LinkSpeed) ipv4=$ips"
	}
	foreach ($c in (Get-NetConnectionProfile -ErrorAction SilentlyContinue)) {
		M 'NET_PROFILE' "$($c.InterfaceAlias): $($c.NetworkCategory) network, internet=$($c.IPv4Connectivity)"
	}
	$rules = Get-NetFirewallApplicationFilter -Program $exe -ErrorAction SilentlyContinue | Get-NetFirewallRule -ErrorAction SilentlyContinue
	if (-not $rules) {
		M 'FIREWALL' 'no Windows Firewall rule for the game exe - hosting by IP will be blocked until Windows asks and you allow it'
	}
	foreach ($r in $rules) {
		$pf = $r | Get-NetFirewallPortFilter -ErrorAction SilentlyContinue
		M 'FIREWALL' "$($r.DisplayName): enabled=$($r.Enabled) $($r.Direction) $($r.Action) profiles=$($r.Profile) protocol=$($pf.Protocol)"
	}
} catch { M 'NET_INFO_ERR' $_.Exception.Message }

foreach ($l in (IniSection $cfgPath 'Netplay')) { M 'CFG_NETPLAY' $l }
$listenPort = 7500
foreach ($l in (IniSection $cfgPath 'Netplay')) { if ($l -match '^ListenPort\s*=\s*(\d+)') { $listenPort = [int]$Matches[1] } }

# ---------------------------------------------------------------- monitor
# Read what a file gained since the last look (the game keeps writing to it).
$tailPos = @{}
function NewLines([string]$path) {
	if (-not (Test-Path -LiteralPath $path)) { return @() }
	try {
		$fs = [IO.File]::Open($path, 'Open', 'Read', 'ReadWrite')
		try {
			$pos = if ($tailPos.ContainsKey($path)) { $tailPos[$path] } else { 0 }
			if ($fs.Length -lt $pos) { $pos = 0 }
			[void]$fs.Seek($pos, 'Begin')
			$text = (New-Object IO.StreamReader($fs)).ReadToEnd()
			$cut = $text.LastIndexOf("`n")
			if ($cut -lt 0) { return @() }
			$tailPos[$path] = $pos + [Text.Encoding]::UTF8.GetByteCount($text.Substring(0, $cut + 1))
			return $text.Substring(0, $cut).Split("`n") | ForEach-Object { $_.TrimEnd("`r") }
		} finally { $fs.Dispose() }
	} catch { return @() }
}
# Engine console lines worth having in the timeline: room connection states,
# per-match network sync, netcode events, errors. (EventCodeTimeSync is chatter.)
$engineKeep = 'Room (host|guest):|EventCode(?!TimeSync)|Netplay|Network synchronized|Replay sync write|panic|fatal|[Ee]rror'
function MirrorEngine {
	foreach ($f in @("${base}_engine_err.txt", "${base}_engine_out.txt")) {
		foreach ($l in (NewLines $f)) {
			if ($l -match $engineKeep -and $l -notmatch '^WARNING') {
				$x = $l -replace '^\d{4}/\d\d/\d\d \d\d:\d\d:\d\d ', ''
				M 'ENGINE' $x.Substring(0, [math]::Min(220, $x.Length))
			}
		}
	}
}
# Game progress, from the game log and the once-a-second alive note.
$gameLog = "${base}_game.log"
$aliveFile = "${base}_alive.txt"
$inMatch = $false; $matchDesc = ''; $matchAt = $null; $firstFrame = $false; $startFlagged = $false
$syncAt = $null; $syncFlagged = $false; $haltedAt = $null
$cores = [Environment]::ProcessorCount
$lastCpu = [TimeSpan]::Zero; $lastT = Get-Date
$hungSince = $null; $highCpu = 0
$peer = $null; $pinger = New-Object System.Net.NetworkInformation.Ping
$pingN = 0; $pingLost = 0; $pingSum = 0; $pingMax = 0
$tick = 0
while (-not $p.HasExited) {
	Start-Sleep -Seconds 1
	$tick++
	try { $p.Refresh() } catch { break }
	if ($p.HasExited) { break }

	# freeze: the game window stops answering Windows (engine main loop blocked)
	$resp = $true
	try { $resp = $p.Responding } catch { }
	if (-not $resp -and -not $hungSince) {
		$hungSince = Get-Date
		M 'FREEZE_START' 'game window is NOT RESPONDING (engine main loop blocked)' -Show
	} elseif ($resp -and $hungSince) {
		M 'FREEZE_END' ('game responding again after {0:N1}s' -f ((Get-Date) - $hungSince).TotalSeconds) -Show
		$hungSince = $null
	}

	# resources every 10 s
	if ($tick % 10 -eq 0) {
		$now = Get-Date; $cpuNow = $p.TotalProcessorTime
		$pct = 100 * ($cpuNow - $lastCpu).TotalSeconds / [math]::Max(0.001, ($now - $lastT).TotalSeconds)
		$lastCpu = $cpuNow; $lastT = $now
		M 'RES' ('cpu={0:N0}% (100%=one core, {1} cores) mem={2}MB private={3}MB threads={4} handles={5} responding={6}' -f `
			$pct, $cores, [int]($p.WorkingSet64 / 1MB), [int]($p.PrivateMemorySize64 / 1MB), $p.Threads.Count, $p.HandleCount, $resp)
		# a busy-spin hang (window still responds, nothing moves) shows as several cores pinned
		if ($pct -gt 250) { $highCpu++ } else { $highCpu = 0 }
		if ($highCpu -eq 3) {
			M 'HIGH_CPU' ('game has used {0:N0}% CPU for 30s - looks like a busy-wait hang if the screen is not moving' -f $pct) -Show
		}
	}

	# what the game is doing, and whether it is still advancing
	foreach ($l in (NewLines $gameLog)) {
		if ($l -match '\] (\S+)\s+(.*)$') {
			switch ($Matches[1]) {
				'MATCH_START' { $inMatch = $true; $matchDesc = $Matches[2]; $matchAt = Get-Date; $firstFrame = $false; $startFlagged = $false; $haltedAt = $null }
				'FIRST_FRAME' { $firstFrame = $true }
				'MATCH_END'   { $inMatch = $false; if ($haltedAt) { M 'GAME_RESUMED' ('match ended after frames had stopped for {0:N1}s' -f ((Get-Date) - $haltedAt).TotalSeconds) -Show; $haltedAt = $null } }
				'SYNC_BEGIN'  { $syncAt = Get-Date; $syncFlagged = $false }
				'SYNC_END'    { $syncAt = $null }
			}
		}
	}
	if ($inMatch -and $firstFrame -and (Test-Path -LiteralPath $aliveFile)) {
		$age = ((Get-Date) - (Get-Item -LiteralPath $aliveFile).LastWriteTime).TotalSeconds
		if ($age -gt 2.5 -and -not $haltedAt) {
			$haltedAt = (Get-Date).AddSeconds(-$age)
			$at = Get-Content -LiteralPath $aliveFile -ErrorAction SilentlyContinue
			M 'GAME_HALTED' ("no game frames for {0:N1}s, stopped at $at, window responding=$resp - [$matchDesc]" -f $age) -Show
		} elseif ($age -lt 1.5 -and $haltedAt) {
			M 'GAME_RESUMED' ('frames running again after {0:N1}s' -f ((Get-Date) - $haltedAt).TotalSeconds) -Show
			$haltedAt = $null
		}
	}
	if ($inMatch -and -not $firstFrame -and -not $startFlagged -and ((Get-Date) - $matchAt).TotalSeconds -gt 15) {
		$startFlagged = $true
		M 'STUCK_MATCH_START' "match began 15s ago but has not drawn its first frame, window responding=$resp - [$matchDesc]" -Show
	}
	if ($syncAt -and -not $syncFlagged -and ((Get-Date) - $syncAt).TotalSeconds -gt 15) {
		$syncFlagged = $true
		M 'STUCK_SYNC' "synchronize() has not finished after 15s, window responding=$resp" -Show
	}
	MirrorEngine

	# IP play: find the opponent's TCP connection on the netplay port and ping it
	if ($tick % 5 -eq 0) {
		$c = Get-NetTCPConnection -OwningProcess $p.Id -State Established -ErrorAction SilentlyContinue |
			Where-Object { ($_.LocalPort -eq $listenPort -or $_.RemotePort -eq $listenPort) -and $_.RemoteAddress -notmatch '^(127\.|::1)' } |
			Select-Object -First 1
		$addr = if ($c) { $c.RemoteAddress } else { $null }
		if ($addr -ne $peer) {
			if ($peer) { M 'PEER_GONE' "TCP connection to $peer closed" -Show }
			if ($addr) { M 'PEER_FOUND' "opponent at $addr (port $listenPort)" -Show }
			$peer = $addr
		}
		if ($peer) {
			try { $r = $pinger.Send($peer, 1000) } catch { $r = $null }
			$pingN++
			if ($r -and $r.Status -eq 'Success') {
				$pingSum += $r.RoundtripTime; if ($r.RoundtripTime -gt $pingMax) { $pingMax = $r.RoundtripTime }
				M 'PING' "$peer $($r.RoundtripTime)ms"
			} else {
				$pingLost++
				M 'PING' "$peer TIMEOUT ($(if ($r) { $r.Status } else { 'error' }))"
			}
		}
	}
}

# ---------------------------------------------------------------- game closed
$p.WaitForExit()
MirrorEngine
foreach ($l in (NewLines $gameLog)) {
	if ($haltedAt -and $l -match '\] MATCH_END') {
		M 'GAME_RESUMED' ('match ended after frames had stopped for {0:N1}s' -f ((Get-Date) - $haltedAt).TotalSeconds)
		$haltedAt = $null
	}
}
if ($haltedAt) { M 'GAME_HALTED_END' ('game closed while frames were stopped ({0:N1}s)' -f ((Get-Date) - $haltedAt).TotalSeconds) }
Remove-Item -LiteralPath $aliveFile -Force -ErrorAction SilentlyContinue
$dur = (Get-Date) - $startTime
$code = $p.ExitCode
if ($hungSince) { M 'FREEZE_END' ('game closed while not responding ({0:N1}s)' -f ((Get-Date) - $hungSince).TotalSeconds) }
if ($pingN -gt 0) {
	$ok = $pingN - $pingLost
	M 'PING_SUMMARY' ('{0} pings, {1} lost, avg {2}ms, max {3}ms' -f $pingN, $pingLost, $(if ($ok) { [int]($pingSum / $ok) } else { '-' }), $pingMax)
}

$mins = [int]$dur.TotalMinutes
$crashes = @()
foreach ($f in (Get-ChildItem (Join-Path $root 'save\logs') -File -Filter '*.log' -ErrorAction SilentlyContinue |
		Where-Object { $_.LastWriteTime -ge $startTime -and $_.Name -match '^(Ikemen_|Rollback-)' })) {
	$dest = "${base}_crash_$($f.Name)"
	if ($f.Name -like 'Rollback-*') { $dest = "${base}_$($f.Name)" } else { $crashes += $f }
	Copy-Item -LiteralPath $f.FullName -Destination $dest -Force
}
$cleanEnd = (Test-Path $gameLog) -and (Select-String -LiteralPath $gameLog -Pattern 'SESSION_END' -Quiet)
if ($crashes.Count -gt 0) {
	$err = (Get-Content -LiteralPath $crashes[0].FullName | Select-String -Pattern '^Error:' -Context 0, 3 | Select-Object -First 1) -join ' '
	M 'END' "ENGINE ERROR - exit code $code after $mins min. Crash dump: $($crashes[0].Name). $err" -Show
} elseif ($code -ne 0) {
	$tail = (Get-Content -LiteralPath "${base}_engine_err.txt" -Tail 6 -ErrorAction SilentlyContinue) -join ' | '
	M 'END' "CRASHED or was killed - exit code $code after $mins min (Task Manager kills land here too). stderr tail: $tail" -Show
} elseif (-not $cleanEnd) {
	M 'END' "game closed without the script shutting down (window closed / Alt+F4) after $mins min, exit code 0" -Show
} else {
	M 'END' "clean exit after $mins min" -Show
}

$m = Receive-Job $manifestJob -Wait -AutoRemoveJob -ErrorAction SilentlyContinue
if ($m) { M 'FILES' ($m -join ' ') }

$zip = "$base.zip"
try {
	$parts = Get-ChildItem $logDir -File | Where-Object { $_.Name.StartsWith($id) -and $_.Extension -ne '.zip' }
	Compress-Archive -LiteralPath $parts.FullName -DestinationPath $zip -Force
	Write-Host ''
	Write-Host "  Session logs zipped: $zip"
	Write-Host '  Send that zip (both players send theirs from the same session).'
} catch {
	Write-Host "  Could not zip the logs ($($_.Exception.Message)) - send the files starting with $id instead."
}
Write-Host ''
if ($env:SFAZ_NETLOG_NOPAUSE -ne '1') { Read-Host '  Press Enter to close this window' }
