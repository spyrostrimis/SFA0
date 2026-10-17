--;===========================================================
--; SFAZ SESSION / NETPLAY LOGGER  (diagnostic - safe to delete)
--;
--; Writes one readable log per game session to
--;     save/logs/netlog/<session>_game.log
--; for every session started through "SFAZ Online (logged).bat", and for a
--; normally started session only once it goes online (see "output" below).
--; It covers everything the scripts can see during online (and offline) play:
--;
--;   * menu path taken (HOST ROOM, JOIN ROOM, HOST GAME, VERSUS, ARCADE ...)
--;   * connection attempts: method (IP / room code), role, room code, every
--;     room status change, time to connect, failures and their reason, cancels
--;   * synchronize() result and the engine's session warning text
--;   * every match: mode, team modes, characters, stage, netcode settings,
--;     result, duration, rounds, FPS
--;   * in-match health: frame hitches (>50ms), STALLS (>400ms with the exact
--;     round/timer they happened at), rewound frames (rollback), heartbeats
--;   * CP lines (online only): a small snapshot of life/power/position/state
--;     every 60 game frames. Both PCs write them for the same frames, so the
--;     first CP line that differs between the two logs is where a DESYNC began
--;     (external/netlog/netlog_analyze.py does that comparison)
--;   * connection lost, loading that takes too long (the "stuck on VS screen"
--;     case), Lua panics, and how the session ended
--;
--; Once logging, every line is written and the file closed straight away, so
--; the log is complete up to the moment of a crash or freeze.
--;
--; It only READS game state. It never changes anything that is simulated, so
--; it cannot cause a desync, and it is fine if only one of the two PCs has it.
--;
--; Launched through "SFAZ Online (logged).bat" the session id is shared with
--; the launcher, which adds the engine console output, a freeze/memory monitor,
--; crash dumps and a file fingerprint, then zips everything for sending.
--;===========================================================

local LOG_DIR = 'save/logs/netlog/'
local HB_ONLINE, HB_OFFLINE = 5, 10   -- heartbeat interval, seconds
local CP_EVERY = 60                   -- checkpoint every N game frames (online)
local CP_SETTLE = 30                  -- frames a CP waits before being final (rollback)
local HITCH_MS, STALL_MS = 50, 400

local clock = os.clock -- wall-clock seconds since start in this engine
local T0 = clock()

local sessionId = os.getenv('SFAZ_NETLOG_ID')
local viaLauncher = sessionId ~= nil and sessionId ~= ''
if not viaLauncher then
	sessionId = os.date('%Y-%m-%d_%H-%M-%S') .. '_' .. (os.getenv('COMPUTERNAME') or 'PC')
end
local path = LOG_DIR .. sessionId .. '_game.log'

--;-----------------------------------------------------------
--; output
--; Started through the launcher, everything is written. Started normally, lines
--; are held in memory (session header + the last 300 lines) and only written
--; once an online connection is attempted or Lua panics, so plain offline play
--; does not leave a log file behind.
--;-----------------------------------------------------------
local active = false
local held, heldHeader = {}, {}

local function write(text)
	if not active then
		if #heldHeader < 8 then
			heldHeader[#heldHeader + 1] = text
		else
			held[#held + 1] = text
			if #held > 300 then table.remove(held, 1) end
		end
		return
	end
	local f = io.open(path, 'a')
	if f then
		f:write(text)
		f:close()
	end
end

local function activate()
	if active then return end
	active = true
	local f = io.open(path, 'a')
	if f then
		f:close()
	else
		-- netlog folder missing (game started without the launcher, folder not copied)
		path = 'save/logs/netlog_' .. sessionId .. '_game.log'
	end
	write(table.concat(heldHeader) .. table.concat(held))
	held, heldHeader = {}, {}
end

local function stamp()
	local ok, ts = pcall(getTimestamp)
	if ok and type(ts) == 'string' and ts ~= '' then
		return ts
	end
	return os.date('%Y-%m-%d %H:%M:%S')
end

local function oneLine(s)
	return (tostring(s or ''):gsub('[\r\n]+', ' | '))
end

local function log(tag, fmt, ...)
	local msg = ''
	if fmt ~= nil then
		local ok, s = pcall(string.format, fmt, ...)
		msg = ok and s or tostring(fmt)
	end
	write(string.format('%s [%9.2f] %-15s %s\n', stamp(), clock() - T0, tag, msg))
end

local function safe(f, ...)
	local ok, err = pcall(f, ...)
	if not ok then
		pcall(log, 'LOGGER_ERROR', '%s', oneLine(err))
	end
end

local function pack(...)
	return {n = select('#', ...), ...}
end

-- netplay calls whose errors are logged and labelled (see wrap)
local LABEL_ERRORS = {
	synchronize = true, enterNetPlay = true, enterNetPlayRoom = true, netPlayRoomStatus = true,
	connected = true, exitNetPlay = true,
}

-- Replace global engine function `name` with a wrapper. `before` runs ahead of
-- the real call and may return a context value; `after` gets that context, the
-- call's arguments and its results. Logging failures never reach the game, and
-- errors raised by the real function still stop the game as before.

local function wrap(name, before, after)
	local orig = _G[name]
	if type(orig) ~= 'function' then
		return
	end
	_G[name] = function(...)
		local ctx
		if before then
			local ok, r = pcall(before, ...)
			if ok then ctx = r else pcall(log, 'LOGGER_ERROR', '%s: %s', name, oneLine(r)) end
		end
		local res
		if LABEL_ERRORS[name] then
			-- A netplay call raised an error (the Oct 5 build does this when the
			-- room link aborts mid-sync). Record it, then raise it again,
			-- labelled so the crash dump does not blame this file. Other calls
			-- (game, loading) are not caught, so real engine crashes keep their
			-- own trace.
			res = pack(pcall(orig, ...))
			if not res[1] then
				local msg = tostring(res[2]):gsub('^[^\n]-sfaz_netlog%.lua:%d+:%s*', '')
				pcall(log, 'ENGINE_ERROR', '%s() raised: %s', name, oneLine(msg))
				error(name .. '() failed inside the engine (passed through sfaz_netlog, not caused by it): ' .. msg, 0)
			end
			res = {n = res.n - 1, unpack(res, 2, res.n)}
		else
			res = pack(orig(...))
		end
		if after then
			local args = pack(...)
			safe(after, ctx, args, res)
		end
		return unpack(res, 1, res.n)
	end
end

local function opt(key)
	local ok, v = pcall(gameOption, key)
	if not ok then return '?' end
	if type(v) == 'table' then
		local t = {}
		for _, x in ipairs(v) do t[#t + 1] = tostring(x) end
		return table.concat(t, ',')
	end
	return tostring(v)
end

local function call(f, ...)
	if type(f) ~= 'function' then return nil end
	local ok, v = pcall(f, ...)
	if ok then return v end
	return nil
end

--;-----------------------------------------------------------
--; state
--;-----------------------------------------------------------
local net = nil        -- current netplay attempt/session
local match = nil      -- current game() call
local session = {matches = 0, netSessions = 0, stalls = 0, lost = 0}
local lastMode, lastRoomStatus, lastRoomErr, lastWarning = nil, nil, nil, nil
local loadT, loadNextWarn = nil, 10

local function netDesc()
	if net == nil then return 'offline' end
	return string.format('%s %s%s', net.method, net.role,
		net.code and (' code=' .. net.code) or (net.target ~= '' and (' ip=' .. net.target) or ''))
end

local function netcodeDesc()
	if opt('Netplay.RollbackNetcode') == 'true' then
		return 'rollback(framedelay=' .. opt('Netplay.Rollback.FrameDelay') .. ')'
	end
	return 'delay'
end

local function online()
	return net ~= nil and net.connected == true
end

--;-----------------------------------------------------------
--; session header
--;-----------------------------------------------------------
safe(function()
	write('\n================================================================================\n')
	log('SESSION_START', 'id=%s launcher=%s', sessionId, tostring(viaLauncher))
	log('BUILD', '%s | os=%s | lua=%s', tostring(call(version)), tostring(call(getRuntimeOS)), tostring(_VERSION))
	local flags = {}
	local ok, t = pcall(getCommandLineFlags)
	if ok and type(t) == 'table' then
		for k, v in pairs(t) do flags[#flags + 1] = tostring(k) .. '=' .. tostring(v) end
		table.sort(flags)
	end
	log('CMDLINE', '%s', table.concat(flags, ' '))
	log('CFG_NETPLAY', 'RollbackNetcode=%s FrameDelay=%s DisconnectNotifyStart=%s DisconnectTimeout=%s LogsEnabled=%s DesyncTest=%s ListenPort=%s',
		opt('Netplay.RollbackNetcode'), opt('Netplay.Rollback.FrameDelay'), opt('Netplay.Rollback.DisconnectNotifyStart'),
		opt('Netplay.Rollback.DisconnectTimeout'), opt('Netplay.Rollback.LogsEnabled'), opt('Netplay.Rollback.DesyncTest'),
		opt('Netplay.ListenPort'))
	log('CFG_GAME', 'GameSpeed=%s Difficulty=%s Life=%s Time=%s MatchWins=%s ButtonAssist=%s',
		opt('Options.GameSpeed'), opt('Options.Difficulty'), opt('Options.Life'), opt('Options.Time'),
		opt('Options.Match.Wins'), opt('Input.ButtonAssist'))
	log('CFG_VIDEO', 'RenderMode=%s VSync=%s Fullscreen=%s GameWidth=%s GameHeight=%s VsScreenLoading=%s BootLoadingMode=%s',
		opt('Video.RenderMode'), opt('Video.VSync'), opt('Video.Fullscreen'), opt('Video.GameWidth'),
		opt('Video.GameHeight'), opt('Config.VsScreenLoading'), opt('Config.BootLoadingMode'))
end)

--;-----------------------------------------------------------
--; menus and modes
--;-----------------------------------------------------------
if hook ~= nil then
	hook.add('main.t_itemname', 'sfaz_netlog', function(t, item)
		safe(function()
			local it = t and t[item]
			if it then
				log('MENU', '%s%s', tostring(it.itemname),
					(it.displayname and it.displayname ~= '') and (' "' .. tostring(it.displayname) .. '"') or '')
			end
		end)
	end)
end

wrap('setGameMode', nil, function(_, a)
	local mode = tostring(a[1])
	if mode ~= lastMode then
		lastMode = mode
		log('MODE', '%s  [%s]', mode, netDesc())
	end
end)

--;-----------------------------------------------------------
--; connection
--;-----------------------------------------------------------
wrap('enterNetPlay', function(server)
	activate()
	server = tostring(server or '')
	net = {method = 'IP', role = server == '' and 'HOST' or 'GUEST', target = server, t = clock(), matches = 0}
	session.netSessions = session.netSessions + 1
	if server == '' then
		log('NET_START', 'IP HOST - listening on port %s, netcode=%s', opt('Netplay.ListenPort'), netcodeDesc())
	else
		log('NET_START', 'IP GUEST - connecting to %s, netcode=%s', server, netcodeDesc())
	end
end)

wrap('enterNetPlayRoom', function(code)
	activate()
	code = tostring(code or '')
	net = {method = 'ROOM', role = code == '' and 'HOST' or 'GUEST', target = '', t = clock(), matches = 0}
	session.netSessions = session.netSessions + 1
	lastRoomStatus, lastRoomErr = nil, nil
end, function(_, a, r)
	net.code = tostring(r[1] or a[1] or '')
	log('NET_START', 'ROOM %s - code=%s, netcode=%s', net.role, net.code, netcodeDesc())
end)

wrap('netPlayRoomStatus', nil, function(_, _, r)
	local status, err = tostring(r[1] or ''), tostring(r[2] or '')
	if status ~= lastRoomStatus or err ~= lastRoomErr then
		lastRoomStatus, lastRoomErr = status, err
		local since = net and (clock() - net.t) or 0
		if err ~= '' then
			log('ROOM_FAILED', 'after %.1fs: %s (last status: %s)', since, oneLine(err), oneLine(status))
			if net then net.failure = err end
		else
			log('ROOM_STATUS', 'after %.1fs: %s', since, oneLine(status))
		end
	end
end)

wrap('connected', nil, function(_, _, r)
	if net == nil then return end
	-- Under rollback the engine hands the link to GGPO for the match and
	-- connected() reads false until game() returns, so it says nothing there.
	if match and match.rollback then return end
	local c = r[1] == true
	if c and not net.connected then
		net.connected = true
		net.connectedAt = clock()
		log('CONNECTED', '%s after %.1fs', netDesc(), clock() - net.t)
	elseif not c and net.connected and not net.lost then
		net.lost = true
		session.lost = session.lost + 1
		log('CONNECTION_LOST', '%s - was connected for %.1fs, %d match(es) played%s', netDesc(),
			clock() - (net.connectedAt or net.t), net.matches,
			match and string.format(', during match %s round %s', tostring(match.matchNo), tostring(match.round)) or '')
	end
end)

wrap('synchronize', function()
	log('SYNC_BEGIN', '%s', netDesc())
	return clock()
end, function(t, _, r)
	log('SYNC_END', 'ok=%s took=%.2fs', tostring(r[1]), clock() - (t or clock()))
	-- The warning is not read here: getSessionWarning() clears it, which hid
	-- the message from the menu. The menu reads it right after a failed
	-- synchronize() and the wrapper below logs it as SESSION_WARN.
end)

wrap('getSessionWarning', nil, function(_, _, r)
	local w = tostring(r[1] or '')
	if w ~= '' and w ~= lastWarning then
		lastWarning = w
		log('SESSION_WARN', '%s', oneLine(w))
	end
end)

wrap('exitNetPlay', function()
	if net == nil then return end
	local dur = clock() - net.t
	if net.connected then
		log('NET_END', '%s - session lasted %.1fs (%.1fs connected), matches=%d%s', netDesc(), dur,
			clock() - (net.connectedAt or net.t), net.matches, net.lost and ', CONNECTION WAS LOST' or '')
	elseif net.failure then
		log('NET_END', '%s - FAILED before connecting after %.1fs: %s', netDesc(), dur, oneLine(net.failure))
	else
		log('NET_END', '%s - gave up / cancelled before connecting after %.1fs%s', netDesc(), dur,
			lastRoomStatus and (' (last status: ' .. oneLine(lastRoomStatus) .. ')') or '')
	end
	net = nil
	lastWarning = nil
end)

wrap('replayRecord', nil, function(_, a)
	log('REPLAY_REC', '%s', tostring(a[1]))
end)

wrap('enterReplay', nil, function(_, a, r)
	log('REPLAY_PLAY', '%s ok=%s', tostring(a[1]), tostring(r[1]))
end)

--;-----------------------------------------------------------
--; loading (a VS screen that never ends shows up here)
--;-----------------------------------------------------------
wrap('loadStart', function()
	loadT, loadNextWarn = clock(), 10
	log('LOAD_START', 'mode=%s match=%s [%s]', tostring(call(gameMode)), tostring(call(matchNo)), netDesc())
end)

wrap('loading', nil, function(_, _, r)
	if loadT == nil then return end
	local el = clock() - loadT
	if r[1] then
		if el >= loadNextWarn then
			log('LOAD_SLOW', 'still loading after %ds [%s, connected=%s]', loadNextWarn, netDesc(),
				tostring(net and net.connected and not net.lost))
			loadNextWarn = loadNextWarn + 10
		end
	else
		log('LOAD_DONE', 'took %.2fs', el)
		loadT = nil
	end
end)

--;-----------------------------------------------------------
--; matches
--;-----------------------------------------------------------
local function charName(ref)
	if ref == nil then return '?' end
	if start ~= nil and type(start.f_getCharData) == 'function' then
		local ok, d = pcall(start.f_getCharData, ref)
		if ok and type(d) == 'table' and d.name then return tostring(d.name) end
	end
	local n = call(getCharName, ref)
	return n and tostring(n) or ('ref' .. tostring(ref))
end

local function sideDesc(side)
	if start == nil or start.p == nil or start.p[side] == nil then return '?' end
	local p = start.p[side]
	if p.t_selected == nil or #p.t_selected == 0 then return '(no select-screen data)' end
	local names = {}
	for _, v in ipairs(p.t_selected or {}) do names[#names + 1] = charName(v.ref) end
	local modes = {[0] = 'single', [1] = 'simul', [2] = 'turns', [3] = 'tag', [4] = 'ratio'}
	return string.format('%s(%s) [%s]%s', modes[p.teamMode] or tostring(p.teamMode), tostring(p.numChars),
		table.concat(names, ', '), (main and main.cpuSide and main.cpuSide[side]) and ' CPU' or '')
end

local function stageDesc()
	local no = call(getStageNo)
	if no and main and main.t_selStages and main.t_selStages[no] then
		local s = main.t_selStages[no]
		return tostring(s.name or s.def or no)
	end
	return tostring(no)
end

-- per-player snapshot; player(n) only switches which character the
-- following trigger calls read from - it does not touch the simulation.
local function snap(n)
	if not player(n) then return nil end
	return {
		name = call(name) or '?', life = call(life) or 0, lifeMax = call(lifeMax) or 0,
		power = call(power) or 0, x = call(posX) or 0, y = call(posY) or 0,
		state = call(stateNo) or 0, ai = call(aiLevel) or 0,
	}
end

local function playersDesc(withAi)
	local t = {}
	for n = 1, 4 do
		local s = snap(n)
		if s then
			t[#t + 1] = string.format('P%d %s life=%d/%d pow=%d%s', n, s.name, s.life, s.lifeMax, s.power,
				withAi and (s.ai > 0 and (' ai=' .. s.ai) or ' human') or '')
		end
	end
	return table.concat(t, ' | ')
end

local function flushCp(all)
	if match == nil or match.cp == nil then return end
	local keys = {}
	for gt in pairs(match.cp) do
		if all or gt <= (match.lastGt or 0) - CP_SETTLE then keys[#keys + 1] = gt end
	end
	if #keys == 0 then return end
	table.sort(keys)
	local lines = {}
	for _, gt in ipairs(keys) do
		lines[#lines + 1] = match.cp[gt]
		match.cp[gt] = nil
	end
	write(table.concat(lines, '\n') .. '\n')
end

-- one round from getGameStats(): who won, how, and what life was left
local function roundResult(i, rd)
	local won, how, life = '-', '', {}
	for side = 1, 2 do
		local hp = {}
		for _, f in ipairs((rd.Fighters and rd.Fighters[side]) or {}) do
			hp[#hp + 1] = tostring(f.Life or '?')
			if f.Win then
				won = 'P' .. side .. ' side'
				how = f.WinPerfect and 'perfect' or f.WinHyper and 'super' or f.WinSpecial and 'special'
					or f.WinKO and 'KO' or f.WinTime and 'time' or 'win'
			end
			if f.DrawGame then won, how = 'draw', '' end
		end
		life[side] = table.concat(hp, '+')
	end
	return string.format('R%d %s%s (life %s vs %s, %ss)', i, won, how ~= '' and (' by ' .. how) or '',
		life[1] or '?', life[2] or '?', tostring(rd.Timer and math.floor(rd.Timer / 60) or '?'))
end

wrap('game', function()
	session.matches = session.matches + 1
	if net then net.matches = net.matches + 1 end
	match = {
		t = clock(), matchNo = call(matchNo), round = nil, rstate = nil, frames = 0,
		maxGap = 0, hitches = 0, stalls = 0, rewinds = 0, rewindFrames = 0, maxRewind = 0,
		hbT = clock(), hbFrames = 0, hbMaxGap = 0, cp = {}, online = online(), ended = {},
	}
	match.rollback = match.online and opt('Netplay.RollbackNetcode') == 'true'
	log('MATCH_START', '#%d mode=%s match=%s [%s] netcode=%s', session.matches, tostring(call(gameMode)),
		tostring(match.matchNo), netDesc(), match.online and netcodeDesc() or 'n/a')
	log('MATCH_TEAMS', 'P1 side: %s || P2 side: %s || stage=%s', sideDesc(1), sideDesc(2), stageDesc())
	return match
end, function(m, _, r)
	if m == nil then return end
	flushCp(true)
	-- match cleared first: under rollback connected() is only meaningful again
	-- once game() has returned, and this is the first look at it
	match = nil
	if m.online then call(connected) end
	local dur = clock() - m.t
	local winner = r[1]
	local stats = {}
	local ok, gs = pcall(getGameStats)
	if ok and type(gs) == 'table' and type(gs.Matches) == 'table' then
		local last = gs.Matches[#gs.Matches]
		if type(last) == 'table' and type(last.Rounds) == 'table' then
			for i, rd in ipairs(last.Rounds) do
				stats[#stats + 1] = roundResult(i, rd)
			end
		end
	end
	local verdict = 'finished'
	if winner == -1 then
		verdict = online() and 'ABORTED (esc, or the connection ended the match)' or 'exited (esc)'
	end
	if net and net.lost then verdict = verdict .. ', CONNECTION LOST' end
	if not m.firstFrame then verdict = verdict .. ', NEVER REACHED THE FIRST FRAME' end
	log('MATCH_END', '#%d winner=%s challenger=%s -> %s | %.1fs, %d frames, last gt=%s, avg %.1f fps | hitches=%d stalls=%d maxGap=%dms%s',
		session.matches, tostring(winner), tostring(r[2]), verdict, dur, m.frames, tostring(m.lastGt),
		dur > 0 and m.frames / dur or 0, m.hitches, m.stalls, m.maxGap,
		m.rollback and string.format(' rewinds=%d (frames=%d, deepest=%d)', m.rewinds, m.rewindFrames, m.maxRewind) or '')
	if #stats > 0 then log('MATCH_ROUNDS', '%s', table.concat(stats, ' | ')) end
end)

local function netState()
	if net == nil then return 'offline' end
	if net.lost then return 'net=LOST' end
	if match and match.rollback then return 'net=rollback' end
	return net.connected and 'net=ok' or 'net=connecting'
end

local function heartbeat(c)
	local m = match
	local el = c - m.hbT
	log('HB', 'm=%s r=%s st=%s rt=%s gt=%s | %.1f fps (%d frames/%.1fs) maxGap=%dms | hitch=%d stall=%d rewind=%d | %s | %s',
		tostring(m.matchNo), tostring(m.round), tostring(m.rstate), tostring(call(roundTime)), tostring(m.lastGt),
		call(getGameFPS) or 0, m.hbFrames, el, m.hbMaxGap, m.hitches, m.stalls, m.rewinds,
		playersDesc(false), netState())
	m.hbT, m.hbFrames, m.hbMaxGap = c, 0, 0
end

local function onFrame()
	local m = match
	if m == nil then return end
	local c = clock()
	m.frames = m.frames + 1
	m.hbFrames = m.hbFrames + 1
	if m.lastClock then
		local gap = math.floor((c - m.lastClock) * 1000 + 0.5)
		if gap > m.maxGap then m.maxGap = gap end
		if gap > m.hbMaxGap then m.hbMaxGap = gap end
		if gap > HITCH_MS then m.hitches = m.hitches + 1 end
		if gap > STALL_MS then
			m.stalls = m.stalls + 1
			session.stalls = session.stalls + 1
			log('STALL', 'game frozen %dms (resumed at match %s round %s gt=%s) [%s%s]', gap, tostring(m.matchNo),
				tostring(m.round), tostring(m.lastGt), netState(),
				m.online and (m.rollback and ', rollback' or ', delay: both PCs wait for each other') or '')
		end
	end
	m.lastClock = c
	if not player(1) then return end
	-- rewinds: the game clock went backwards or repeated = rollback re-simulation
	local gt = call(gameTime)
	if m.rollback and gt and m.lastGt and gt <= m.lastGt then
		local depth = m.lastGt - gt + 1
		m.rewinds = m.rewinds + 1
		m.rewindFrames = m.rewindFrames + depth
		if depth > m.maxRewind then m.maxRewind = depth end
	end
	-- rounds
	local rn, rs = call(roundNo), call(roundState)
	if not m.firstFrame then
		m.firstFrame = true
		log('FIRST_FRAME', 'match %s running after %.2fs in game()', tostring(m.matchNo), c - m.t)
	end
	if rn ~= m.round then
		m.round, m.rstate = rn, rs
		log('ROUND_START', 'match %s round %s | %s', tostring(m.matchNo), tostring(rn), playersDesc(true))
	elseif rs ~= m.rstate then
		if rs == 4 and not m.ended[rn or 0] then
			m.ended[rn or 0] = true
			player(1)
			log('ROUND_END', 'match %s round %s rt=%s | %s', tostring(m.matchNo), tostring(rn), tostring(call(roundTime)),
				playersDesc(false))
		end
		m.rstate = rs
	end
	-- checkpoints for desync comparison (online only)
	if m.online and gt and gt % CP_EVERY == 0 then
		local parts = {string.format('CP gt=%d m=%s r=%s rt=%s', gt, tostring(m.matchNo), tostring(rn), tostring(call(roundTime)))}
		for n = 1, 4 do
			local s = snap(n)
			if s then
				parts[#parts + 1] = string.format('p%d %d %d %.2f,%.2f s%d', n, s.life, s.power, s.x, s.y, s.state)
			end
		end
		m.cp[gt] = table.concat(parts, ' | ')
	end
	if gt then m.lastGt = math.max(m.lastGt or gt, gt) end
	if net then call(connected) end
	-- once a second, a tiny "still running" note for the launcher: it is the
	-- only thing that can notice frames STOPPING (this code does not run then)
	if viaLauncher and c - (m.aliveT or 0) >= 1 then
		m.aliveT = c
		local f = io.open(LOG_DIR .. sessionId .. '_alive.txt', 'w')
		if f then
			f:write(string.format('match %s round %s gt=%s', tostring(m.matchNo), tostring(m.round), tostring(m.lastGt)))
			f:close()
		end
	end
	if c - m.hbT >= (m.online and HB_ONLINE or HB_OFFLINE) then
		flushCp(false)
		heartbeat(c)
	end
end

if hook ~= nil then
	hook.add('loop', 'sfaz_netlog', function()
		-- Other loop hooks (rank.lua) read triggers from whatever character is
		-- current when they run, so put the context back exactly as found.
		local prevId = call(id)
		safe(onFrame)
		if prevId ~= nil then call(playerId, prevId) end
	end)
end

--;-----------------------------------------------------------
--; errors and exit
--;-----------------------------------------------------------
wrap('panicError', function(msg)
	activate()
	log('LUA_PANIC', '%s', oneLine(msg))
end)

do
	local exit = os.exit
	os.exit = function(...)
		safe(function()
			flushCp(true)
			log('SESSION_END', 'os.exit after %.1fs | matches=%d net sessions=%d stalls=%d connections lost=%d%s',
				clock() - T0, session.matches, session.netSessions, session.stalls, session.lost,
				net and (' | still in netplay: ' .. netDesc()) or '')
		end)
		return exit(...)
	end
end

log('LOGGER_READY', 'session %s', sessionId)
if viaLauncher then activate() end
