-- WORLD TOUR game mode (SFAZ migration port for 2026 nightly API)
-- Original module last tested on Ikemen GO v0.98; rewritten for the new
-- main.motif.* flags / textImgSetText / engine-side results architecture.
-- Mode is detectable by GameMode trigger as worldtour.
-- NOTE: the old custom [WORLD TOUR Results Screen] is engine-side now; the
-- standard Win Screen is used as the results screen instead.

--;===========================================================
--; main.lua
--;===========================================================
main.t_itemname.worldtour = function(t, item)
	main.aiRamp = false
	main.charparam.ai = true
	main.charparam.music = true
	main.charparam.rounds = true
	main.charparam.single = false
	main.charparam.stage = true
	main.charparam.time = true
	main.exitSelect = true
	main.makeRoster = true
	main.motif.continuescreen = true
	main.motif.hiscore = true
	main.motif.vsscreen = true
	main.motif.vsmatchno = true
	main.motif.winscreen = true
	main.orderSelect[1] = true
	main.orderSelect[2] = true
	main.persistLife = false
	main.quickContinue = false
	main.rankingCondition = true
	main.resetScore = false
	main.storyboard.credits = true
	main.storyboard.gameover = true
	main.teamMenu[1].single = true
	main.teamMenu[2].single = true
	local titleText = 'WORLD TOUR'
	if motif.select_info.title.text ~= nil and motif.select_info.title.text.worldtour ~= nil then
		titleText = motif.select_info.title.text.worldtour
	end
	textImgSetText(motif.select_info.title.TextSpriteData, titleText)
	remapInput(1, getLastInputController())
	remapInput(getLastInputController(), 1)
	setGameMode('worldtour')
	hook.run("main.t_itemname", t, item)
	return start.f_selectMode
end

--;===========================================================
--; start.lua
--;===========================================================
-- Roster: 40 matches against random characters (ratiomatches style table)
start.t_makeRoster.worldtour = function()
	local t = {}
	local t_static = {main.t_randomChars}
	for i = 1, 40 do
		table.insert(t, {['rmin'] = start.p[2].numChars, ['rmax'] = start.p[2].numChars, ['order'] = 1})
	end
	return t, t_static
end

--;===========================================================
--; MISSION NOTES (lifebar)
--;===========================================================
-- The note saying what the current match asks for. Three pieces:
--   data/worldtour_missions.lua  the words, one per match number
--   [Mission] in data/fight.def  where and how they are drawn
--   this block                   picks the note for the match about to start
--
-- Drawing is engine-side (FightScreenMission) rather than a queued Lua draw, so
-- the note sits in the same pass as the lifebars and hides with them - dialogue,
-- pause menu, nobardisplay - with nothing to keep in sync here.
local MISSIONS_FILE = 'data/worldtour_missions.lua'

if type(sfazWorldTourMissionFor) ~= 'function' then
	if main ~= nil and type(main.f_fileExists) == 'function' and main.f_fileExists(MISSIONS_FILE) then
		local ok, err = pcall(function() assert(loadfile(MISSIONS_FILE))() end)
		if not ok and type(panicError) == 'function' then
			panicError('\nworldtour: could not load ' .. MISSIONS_FILE .. '\n' .. tostring(err) .. '\n')
		end
	end
end

-- matchNo() is the 1-based number of the match ABOUT to be fought at this point:
-- start.f_selectStart sets it to 1 for a new run and launchFight bumps it only
-- after a match finishes. It is the same number [Match] prints as "MATCH#n".
hook.add("launchFight", "sfaz_worldtour_mission", function(common, t, data)
	if type(setMissionText) ~= 'function' then
		return          -- older exe without the binding; nothing to do
	end
	local note = ''
	if gameMode('worldtour') and type(sfazWorldTourMissionFor) == 'function' then
		note = sfazWorldTourMissionFor(matchNo()) or ''
	end
	-- Set it on EVERY fight, not just World Tour ones. The engine holds the last
	-- string it was handed, so without the unconditional clear a note could
	-- outlive its run and reappear in the next mode whose [Mission] is enabled.
	setMissionText(note)
end)
