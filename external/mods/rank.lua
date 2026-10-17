--;===========================================================
--; RANK MODULE (SFAZ migration port for the 2026 nightly API)
--;
--; Post-match rank screen: score readout, four fill gauges (tech / attack /
--; guard / life), performance icons and a letter grade sprite (D- .. S+).
--;
--; The original (stable install: external/mods/rank/rank.lua) was built on Lua
--; infrastructure that has since moved into the Go engine:
--;   commonStatesInsert()      -> rank.zss is now listed in config.ini [Common] States
--;   motif.f_loadSprData()     -> animNew(motif.Sff, "grp,idx, 0,0, -1") + animSet*
--;   main.f_createTextImg()    -> textImgNew() + fontNew() + textImgSet*
--;   motif.files.snd_data      -> motif.Snd
--;   setLifebarElements()      -> setFightScreenElements()
--; and [Rank Info] is a custom motif section, which the engine now discards
--; instead of exposing on the motif table -- so this module parses it itself.
--;
--; Behaviour, parameter names and the score ramp edit are preserved from the
--; original; only the plumbing is new.
--;===========================================================

local motifPath = gameOption('Config.Motif')
if type(motifPath) ~= 'string' or motifPath == '' then
	motifPath = 'data/system.def'
end
local motifDir = motifPath:gsub('[^/\\]+$', '')

--;===========================================================
--; [Rank Info] / [Files] parsing (engine no longer does it for us)
--;===========================================================
local function f_stripComment(s)
	-- a ';' starts a comment, exactly like the engine's DEF parser
	return (s:gsub(';.*$', ''))
end

local function f_parseValue(raw)
	raw = raw:gsub('^%s+', ''):gsub('%s+$', '')
	local q = raw:match('^"(.*)"$')
	if q ~= nil then
		return q
	end
	if raw:find(',') then
		local t = {}
		for item in raw:gmatch('[^,]+') do
			item = item:gsub('^%s+', ''):gsub('%s+$', '')
			table.insert(t, tonumber(item) or item)
		end
		return t
	end
	return tonumber(raw) or raw
end

-- returns: rank_info table (dots in keys replaced by underscores), font path
-- table, and every [Begin Action n] block (the rank panel background is an
-- animation, not a single sprite)
local function f_parseMotif(path)
	local rank, fonts, actions = {}, {}, {}
	local file = io.open(path, 'r')
	if file == nil then
		return rank, fonts, actions
	end
	local section, action = '', nil
	for line in file:lines() do
		local body = f_stripComment(line)
		local actNo = body:match('^%s*%[%s*[Bb]egin%s+[Aa]ction%s+(%d+)%s*%]')
		if actNo ~= nil then
			action = tonumber(actNo)
			actions[action] = {}
			section = 'action'
		else
			local sec = body:match('^%s*%[%s*([^%]]-)%s*%]')
			if sec ~= nil then
				section = sec:lower()
				action = nil
			elseif section == 'action' and action ~= nil then
				local frame = body:gsub('^%s+', ''):gsub('%s+$', '')
				-- a frame line is "group,index, x,y, time[, flags...]"
				if frame:match('^-?%d+%s*,%s*-?%d+%s*,') then
					table.insert(actions[action], frame)
				end
			else
				local k, v = body:match('^%s*([%w_.]+)%s*=%s*(.-)%s*$')
				if k ~= nil and v ~= nil and v ~= '' then
					if section == 'rank info' then
						rank[k:lower():gsub('%.', '_')] = f_parseValue(v)
					elseif section == 'files' then
						local n = k:lower():match('^font(%d+)$')
						if n ~= nil then
							fonts[tonumber(n)] = v:gsub('^%s+', ''):gsub('%s+$', '')
						end
					end
				end
			end
		end
	end
	file:close()
	return rank, fonts, actions
end

local t_defaults = {
	enabled = 0,
	bars_display = 0,
	snd_time = 0,
	snd = {-1, 0},
	p1_pos = {0, 0},
	p2_pos = {0, 0},
	p1_removetime = 0,
	p2_removetime = 0,
	p1_score_text = '%s',
	p2_score_text = '%s',
	p1_icon_spacing = {0, 0},
	p2_icon_spacing = {0, 0},
}

local parsed, t_fontFiles, t_actions = f_parseMotif(motifPath)
motif.rank_info = main.f_tableMerge(t_defaults, parsed)
local ri = motif.rank_info

-- numeric accessors with defaults (parsed values may legitimately be absent)
local function f_num(key, def)
	local v = ri[key]
	if type(v) == 'number' then return v end
	return def or 0
end
local function f_pair(key, dx, dy)
	local v = ri[key]
	if type(v) == 'table' and #v >= 2 then return v[1], v[2] end
	if type(v) == 'number' then return v, dy or 0 end
	return dx or 0, dy or 0
end

--;===========================================================
--; Build the element lists exactly like the original did:
--; every "p<side>_<kind>_<name>_spr" key defines one drawable.
--;===========================================================
ri.gauge, ri.icon, ri.rank = {}, {}, {}
for k in pairs(ri) do
	for _, kind in ipairs({'gauge', 'icon', 'rank'}) do
		local name = k:match('^p[12]_' .. kind .. '_(.+)_spr$')
		if name ~= nil then
			ri[kind][name] = true
		end
	end
end

local lcW, lcH = 320, 240
if motif.info ~= nil and type(motif.info.localcoord) == 'table' then
	lcW = motif.info.localcoord[1] or lcW
	lcH = motif.info.localcoord[2] or lcH
end

local function f_animFromSpr(key, side)
	-- an "<elem>.anim" wins over "<elem>.spr", exactly like the old
	-- motif.f_loadSprData did (the rank panel bg is an animated slide-in)
	local a
	local animNo = ri[key .. '_anim']
	if type(animNo) == 'number' and animNo >= 0 and t_actions[animNo] ~= nil and #t_actions[animNo] > 0 then
		local ok, res = pcall(animNew, motif.Sff, table.concat(t_actions[animNo], '\n'))
		if not ok or res == nil then
			-- fall back to the action's first frame if multi-frame text is rejected
			ok, res = pcall(animNew, motif.Sff, t_actions[animNo][1])
		end
		if ok then a = res end
	end
	if a == nil then
		local spr = ri[key .. '_spr']
		if type(spr) ~= 'table' or #spr < 2 then
			return nil
		end
		local g, i = tonumber(spr[1]), tonumber(spr[2])
		if g == nil or i == nil or g < 0 then
			return nil -- "-1,0" means the element is switched off
		end
		local ok, res = pcall(animNew, motif.Sff, string.format('%d,%d, 0,0, -1', g, i))
		if not ok or res == nil then
			return nil
		end
		a = res
	end
	pcall(animSetLocalcoord, a, lcW, lcH)
	local px, py = f_pair('p' .. side .. '_pos', 0, 0)
	local ox, oy = f_pair(key .. '_offset', 0, 0)
	local sx, sy = f_pair(key .. '_scale', 1, 1)
	animSetPos(a, px + ox, py + oy)
	animSetScale(a, sx, sy)
	animSetFacing(a, f_num(key .. '_facing', 1))
	animUpdate(a)
	return a
end

-- background + per-kind element anims
for side = 1, 2 do
	ri['p' .. side .. '_bg_data'] = f_animFromSpr('p' .. side .. '_bg', side)
	for _, kind in ipairs({'gauge', 'icon', 'rank'}) do
		for name in pairs(ri[kind]) do
			local key = 'p' .. side .. '_' .. kind .. '_' .. name
			ri[key .. '_data'] = f_animFromSpr(key, side)
		end
	end
end

--;===========================================================
--; Score text sprites
--;===========================================================
local function f_makeScoreText(side)
	local fontParam = ri['p' .. side .. '_score_font']
	if type(fontParam) ~= 'table' or fontParam[1] == nil then
		return nil
	end
	local idx = tonumber(fontParam[1])
	local fntFile = idx and t_fontFiles[idx] or nil
	if fntFile == nil then
		return nil
	end
	-- NOTE: fontNew() happily returns a font object for a path that does not
	-- exist, and that font then draws nothing -- so the file has to be probed
	-- first. Search order matches the engine's: system dir, root, data/, font/.
	local fnt
	for _, cand in ipairs({motifDir .. fntFile, fntFile, 'data/' .. fntFile, 'font/' .. fntFile}) do
		if main.f_fileExists(cand) then
			local ok, res = pcall(fontNew, cand)
			if ok and res ~= nil then fnt = res break end
		end
	end
	if fnt == nil then
		return nil
	end
	local t = textImgNew()
	pcall(textImgSetLocalcoord, t, lcW, lcH)
	textImgSetFont(t, fnt)
	textImgSetBank(t, tonumber(fontParam[2]) or 0)
	textImgSetAlign(t, tonumber(fontParam[3]) or 0)
	-- old motif default was white; without this the text can render invisible
	textImgSetColor(t,
		tonumber(fontParam[4]) or 255,
		tonumber(fontParam[5]) or 255,
		tonumber(fontParam[6]) or 255)
	local px, py = f_pair('p' .. side .. '_pos', 0, 0)
	local ox, oy = f_pair('p' .. side .. '_score_offset', 0, 0)
	textImgSetPos(t, px + ox, py + oy)
	local sx, sy = f_pair('p' .. side .. '_score_font_scale', 1, 1)
	textImgSetScale(t, sx, sy)
	return t
end

local t_scoreTxt = {f_makeScoreText(1), f_makeScoreText(2)}

--;===========================================================
--; Rank calculation (unchanged logic, new trigger spellings)
--;===========================================================
local function f_readMaps(t, side)
	for k in pairs(ri.gauge) do
		local maxKey = 'p' .. side .. '_gauge_' .. k .. '_max'
		t.values[k] = math.min(f_num(maxKey, 0), (t.values[k] or 0) + (map('_iksys_rank' .. k .. 'value') or 0))
	end
	for k in pairs(ri.icon) do
		if not main.f_tableHasValue(t.icons, k) and (map('_iksys_rankicon' .. k) or 0) ~= 0 then
			table.insert(t.icons, k)
		end
	end
end

local function f_getRank(side)
	local t = {values = {}, icons = {}}
	player(side)
	f_readMaps(t, side)
	for i = 1, numPartner() do
		partner(i - 1)
		f_readMaps(t, side)
	end
	return t
end

local active, rankInit, counter, tableremoved = false, false, 0, false
local t_rank = {{}, {}}

local function f_rankInit()
	if rankInit then
		return active
	end
	rankInit = true
	counter = 0
	if f_num('enabled', 0) == 0 or not main.rankDisplay then
		return false
	end
	-- select.def rankdisplay flag opt-out
	for side = 1, 2 do
		for _, v in ipairs(start.p[side].t_selected) do
			local cd = start.f_getCharData(v.ref)
			if cd ~= nil and cd.rankdisplay == 0 then
				return false
			end
		end
	end
	for side = 1, 2 do
		local bg = ri['p' .. side .. '_bg_data']
		if bg ~= nil then animReset(bg) animUpdate(bg) end
		for _, kind in ipairs({'gauge', 'icon', 'rank'}) do
			for k in pairs(ri[kind]) do
				local a = ri['p' .. side .. '_' .. kind .. '_' .. k .. '_data']
				if a ~= nil then animReset(a) animUpdate(a) end
			end
		end
		t_rank[side].rank = f_getRank(side)
		local total = 0
		for _, v in pairs(t_rank[side].rank.values) do
			total = total + v
		end
		t_rank[side].rank.total = total
		t_rank[side].rank.grade = math.max(1, math.min(main.f_tableLength(ri.rank), math.floor(total / 8)))
		for k in pairs(ri.gauge) do
			local maxv = f_num('p' .. side .. '_gauge_' .. k .. '_max', 0)
			t_rank[side]['gauge_' .. k] = {
				ratio = maxv > 0 and ((t_rank[side].rank.values[k] or 0) / maxv) or 0,
				temp = 0,
			}
		end
	end
	if f_num('bars_display', 0) == 0 then
		setFightScreenElements({bars = false})
	end
	active = true
	return false
end

local function f_rank()
	if not f_rankInit() then
		return
	end
	if gameMode('timeattack') or gameMode('watch') or gameMode('demo') or gameMode('versus')
		or gameMode('vs100kumite') or gameMode('freebattle') then
		active = false
		return
	end
	for side = 1, 2 do
		player(side)
		if win() or drawGame() then
			if counter >= f_num('p' .. side .. '_removetime', 0) then
				rankInit = false
				tableremoved = true
			end
			-- background
			if counter >= f_num('p' .. side .. '_bg_displaytime', 0) then
				local bg = ri['p' .. side .. '_bg_data']
				if bg ~= nil then animUpdate(bg) animDraw(bg) end
			end
			-- score (original ramp edit: 180 instead of 90)
			local txt = t_scoreTxt[side]
			if txt ~= nil and counter >= f_num('p' .. side .. '_score_displaytime', 0) then
				textImgDraw(txt)
				local sc = math.min(
					scoreTotal(),
					scoreTotal() - score() + math.ceil(score() / math.max(1, 180 - counter - f_num('p' .. side .. '_score_displaytime', 0)))
				)
				local fmt = ri['p' .. side .. '_score_text']
				if type(fmt) ~= 'string' then fmt = '%s' end
				textImgSetText(txt, (fmt:gsub('%%s', tostring(sc))))
			end
			-- letter grade
			if counter >= f_num('p' .. side .. '_rank_displaytime', 0) then
				local a = ri['p' .. side .. '_rank_' .. tostring(t_rank[side].rank.grade) .. '_data']
				if a ~= nil then animUpdate(a) animDraw(a) end
			end
			-- gauges
			if counter >= f_num('p' .. side .. '_gauge_displaytime', 0) then
				for k in pairs(ri.gauge) do
					local key = 'p' .. side .. '_gauge_' .. k
					local a = ri[key .. '_data']
					local t = t_rank[side]['gauge_' .. k]
					if a ~= nil and t ~= nil then
						if not paused() then
							local ticks = f_num(key .. '_ticks', 30)
							if ticks <= 0 then ticks = 30 end
							t.temp = math.min(t.ratio, t.temp + t.ratio / ticks)
						end
						local w = ri[key .. '_window']
						if type(w) == 'table' and #w >= 4 and not _G.RANK_DEBUG_NOWINDOW then
							-- Window is authored x1,y1,x2,y2 and this engine's
							-- animSetWindow takes the same corner form (the 2024
							-- engine took x,y,width,height, which is why the old
							-- module converted -- doing that here clipped the
							-- gauges away entirely while the un-windowed rank
							-- letter still drew).
							local length = w[3] - w[1]
							if f_num(key .. '_facing', 1) == -1 then
								animSetWindow(a, w[3] - t.temp * length, w[2], w[3], w[4])
							else
								animSetWindow(a, w[1], w[2], w[1] + t.temp * length, w[4])
							end
						end
						animUpdate(a)
						animDraw(a)
						if _G.RANK_DEBUG_LOG and not _G.RANK_DEBUG_DONE then
							local fh = io.open('save/logs/gauge.txt', 'a')
							if fh then
								fh:write(string.format('side=%d gauge=%s ratio=%.3f temp=%.3f window=%s drawn\n',
									side, k, t.ratio, t.temp,
									(type(w) == 'table' and table.concat(w, ',') or 'none')))
								fh:close()
							end
						end
					end
				end
				if _G.RANK_DEBUG_LOG then _G.RANK_DEBUG_DONE = true end
			end
			-- icons
			if counter >= f_num('p' .. side .. '_icon_displaytime', 0) then
				local i = 1
				local sx, sy = f_pair('p' .. side .. '_icon_spacing', 0, 0)
				for k in pairs(ri.icon) do
					if main.f_tableHasValue(t_rank[side].rank.icons, k) then
						local a = ri['p' .. side .. '_icon_' .. k .. '_data']
						if a ~= nil then
							main.f_animPosDraw(a, (i - 1) * sx, (i - 1) * sy, f_num('p' .. side .. '_icon_' .. k .. '_facing', 1))
							i = i + 1
						end
					end
				end
			end
			break
		end
	end
	if not paused() then
		local snd = ri.snd
		if winnerteam() == 1 and player(winnerteam()) and counter == f_num('snd_time', 0)
			and type(snd) == 'table' and (tonumber(snd[1]) or -1) >= 0 then
			sndPlay(motif.Snd, tonumber(snd[1]), tonumber(snd[2]) or 0)
		end
		counter = counter + 1
	end
end

--;===========================================================
--; Hooks
--;===========================================================
hook.add("loop", "rankHook1", function()
	if roundStart() then
		rankInit = false
		tableremoved = false
	elseif winnerteam() ~= -1 and player(winnerteam()) and stateNo() < 190 and stateNo() > 179
		and roundState() == 4 and tableremoved == false then
		f_rank()
	end
end)

hook.add("main.t_itemname", "rankHook2", function()
	main.rankDisplay = main.rankDisplay or gameMode("arcade") or gameMode("teamarcade")
		or gameMode("worldtour") or gameMode("bossrush") or gameMode("freebattle")
		or gameMode("netplaysurvivalcoop") or gameMode("netplayteamcoop") or gameMode("netplayversus")
		or gameMode("survival") or gameMode("survivalcoop") or gameMode("teamcoop")
		or gameMode("timeattack") or gameMode("versus") or gameMode("versuscoop") or gameMode("watch")
end)

hook.add("main.f_default", "rankHook3", function()
	main.rankDisplay = false
end)
