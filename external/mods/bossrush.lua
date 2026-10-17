-- BOSS RUSH game mode (SFAZ migration port for 2026 nightly API)
-- Original module last tested on Ikemen GO v0.98; rewritten for the new
-- main.motif.* flags / textImgSetText / engine-side results architecture.
-- Mode is detectable by GameMode trigger as bossrush.
-- Only characters with select.def "boss = 1" parameter are used in this mode.
-- NOTE: the old custom [Boss Rush Results Screen] is engine-side now; the
-- standard Win Screen is used as the results screen instead.

--;===========================================================
--; main.lua
--;===========================================================
main.t_itemname.bossrush = function(t, item)
	main.charparam.ai = true
	main.charparam.music = true
	main.charparam.rounds = true
	main.charparam.single = true
	main.charparam.stage = true
	main.charparam.time = true
	main.elimination = true
	main.exitSelect = true
	main.makeRoster = true
	main.motif.hiscore = true
	main.motif.vsscreen = true
	main.motif.vsmatchno = true
	main.motif.winscreen = true
	main.orderSelect[1] = true
	main.orderSelect[2] = true
	main.rankingCondition = true
	main.storyboard.credits = true
	main.storyboard.gameover = true
	main.teamMenu[1].simul = true
	main.teamMenu[1].single = true
	main.teamMenu[1].tag = true
	main.teamMenu[1].turns = true
	main.teamMenu[2].simul = true
	main.teamMenu[2].single = true
	main.teamMenu[2].tag = true
	main.teamMenu[2].turns = true
	local titleText = 'Boss Rush'
	if motif.select_info.title.text ~= nil and motif.select_info.title.text.bossrush ~= nil then
		titleText = motif.select_info.title.text.bossrush
	end
	textImgSetText(motif.select_info.title.TextSpriteData, titleText)
	remapInput(1, getLastInputController())
	remapInput(getLastInputController(), 1)
	setGameMode('bossrush')
	hook.run("main.t_itemname", t, item)
	return start.f_selectMode
end

--;===========================================================
--; start.lua
--;===========================================================
main.t_bossChars = {}
for _, v in ipairs(main.t_selChars) do
	if v.boss ~= nil and v.boss == 1 then
		if main.t_bossChars[v.order] == nil then
			main.t_bossChars[v.order] = {}
		end
		table.insert(main.t_bossChars[v.order], v.char_ref)
	end
end

if main.t_selOptions.bossrushmaxmatches == nil or #main.t_selOptions.bossrushmaxmatches == 0 then
	local size = 1
	for k, _ in pairs(main.t_bossChars) do if k > size then size = k end end
	main.t_selOptions.bossrushmaxmatches = {}
	for i = 1, size do
		table.insert(main.t_selOptions.bossrushmaxmatches, 0)
	end
	for k, v in pairs(main.t_bossChars) do
		main.t_selOptions.bossrushmaxmatches[k] = #v
	end
end

start.t_makeRoster.bossrush = function()
	return start.f_unifySettings(main.t_selOptions.bossrushmaxmatches, main.t_bossChars), main.t_bossChars
end
