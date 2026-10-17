--;===========================================================
--; HANDICAP MATCHES ("guardian" fights)
--;===========================================================
-- Marks a single fight as a handicap match - one player against a team whose
-- non-leader members cannot be killed, and the fight ends when the leader
-- falls. Add handicap = true to the launchFight arguments:
--
--     launchFight{
--         p2char     = {"SFZ_Mika", "SFZ_Zangief"},
--         p2numchars = 2,
--         p2teammode = "simul",
--         handicap   = true,
--         ...
--     }
--
-- start.lua runs this hook immediately before updateCommon(common, true), so
-- the state file is appended to Common.States before the characters compile,
-- and start.f_game's updateCommon(common, false) removes it again when the
-- fight is over. Nothing outside a flagged fight ever sees it, which is why
-- this needs no gamemode or matchno test of its own - the path lua decides.

local HANDICAP_STATES = 'data/wt_handicap.zss'
local HANDICAP_PROBE = 'sfazGuardianProbe()'

-- Diagnostic probe. Common.Lua entries are executed once per frame while a
-- match runs (src/system.go), so this only ticks during a flagged fight. It
-- writes a line whenever the guardian's state changes, which is what tells us
-- whether he actually reaches the lose pose and what happens to him after.
-- Safe to stop logging by removing HANDICAP_PROBE from the hook below.
local probeLast = nil
function sfazGuardianProbe()
	local ok, err = pcall(function()
		if type(player) ~= 'function' or not player(4) then
			return
		end
		local line = string.format(
			'teamSide=%s state=%s anim=%s ctrl=%s moveType=%s targets=%s',
			tostring(teamSide()), tostring(stateNo()), tostring(anim()),
			tostring(ctrl()), tostring(moveType()), tostring(numTarget()))
		if line == probeLast then
			return
		end
		probeLast = line
		local fh = io.open('save/logs/sfaz_guardian_probe.txt', 'a')
		if fh == nil then return end
		fh:write(os.date('%H:%M:%S') .. ' P4 ' .. line .. '\n')
		fh:close()
	end)
	if not ok and probeLast ~= 'ERR' then
		probeLast = 'ERR'
		print('sfazGuardianProbe error: ' .. tostring(err))
	end
end

hook.add("launchFight", "sfaz_handicap_states", function(common, t, data)
	if data == nil or not data.handicap then
		return
	end
	common.states = common.states or {}
	-- launchFight re-runs this hook for every rematch/continue of the same
	-- fight, so make the insert idempotent.
	for _, v in ipairs(common.states) do
		if v == HANDICAP_STATES then
			return
		end
	end
	table.insert(common.states, HANDICAP_STATES)
	common.lua = common.lua or {}
	table.insert(common.lua, HANDICAP_PROBE)
	probeLast = nil -- start each fight with a fresh first line
	-- One line per flagged fight, so a match that does not behave as expected
	-- can be checked against whether the states were actually queued.
	pcall(function()
		local fh = io.open('save/logs/sfaz_handicap_debug.txt', 'a')
		if fh == nil then return end
		fh:write(string.format('[%s] mode=%s match=%s -> queued %s\n',
			os.date('%H:%M:%S'), tostring(gameMode()), tostring(matchNo()), HANDICAP_STATES))
		fh:close()
	end)
end)
