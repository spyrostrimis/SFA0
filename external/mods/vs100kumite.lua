-- VS 100 KUMITE game mode (SFAZ migration port for 2026 nightly API)
-- Original module last tested on Ikemen GO v0.98; rewritten for the new
-- main.motif.* flags / textImgSetText / engine-side results architecture.
-- Mode is detectable by GameMode trigger as vs100kumite.
-- NOTE: the old custom [VS100 Kumite Results Screen] is engine-side now; the
-- standard Win Screen is used as the results screen instead.

--;===========================================================
--; main.lua
--;===========================================================
main.t_itemname.vs100kumite = function(t, item)
	main.charparam.ai = true
	main.charparam.music = true
	main.charparam.single = true
	main.charparam.stage = true
	main.charparam.time = true
	main.exitSelect = true
	main.forceRosterSize = true
	main.makeRoster = true
	main.matchWins.draw = {0, 0}
	main.matchWins.simul = {1, 1}
	main.matchWins.single = {1, 1}
	main.matchWins.tag = {1, 1}
	main.motif.hiscore = true
	main.motif.vsscreen = true
	main.motif.vsmatchno = true
	main.motif.winscreen = true
	main.orderSelect[1] = true
	main.orderSelect[2] = true
	main.rankDisplay = true
	main.rotationChars = true
	main.storyboard.credits = true
	main.storyboard.gameover = true
	main.teamMenu[1].single = true
	main.teamMenu[2].single = true
	local titleText = 'VS 100 Kumite'
	if motif.select_info.title.text ~= nil and motif.select_info.title.text.vs100kumite ~= nil then
		titleText = motif.select_info.title.text.vs100kumite
	end
	textImgSetText(motif.select_info.title.TextSpriteData, titleText)
	remapInput(1, getLastInputController())
	remapInput(getLastInputController(), 1)
	setGameMode('vs100kumite')
	hook.run("main.t_itemname", t, item)
	return start.f_selectMode
end

--;===========================================================
--; start.lua
--;===========================================================
-- Roster: 100 matches against random characters (ratiomatches style table)
start.t_makeRoster.vs100kumite = function()
	local t = {}
	local t_static = {main.t_randomChars}
	for i = 1, 100 do
		table.insert(t, {['rmin'] = start.p[2].numChars, ['rmax'] = start.p[2].numChars, ['order'] = 1})
	end
	return t, t_static
end
