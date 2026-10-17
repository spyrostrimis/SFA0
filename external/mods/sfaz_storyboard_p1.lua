--;===========================================================
--; P1 CHARACTER ANIMATION IN STORYBOARDS
--;===========================================================
-- Draws the player's own character over a storyboard scene, in the palette
-- that was selected on the character select screen.
--
-- Usage - add to any scene of a storyboard .def (e.g. data/Intros/*.def):
--
--   [Scene 0]
--   ...existing layer0.anim etc...
--   p1.anim      = 5900        ; action number in the character's .air
--   p1.pos       = 192, 200    ; storyboard localcoord, like layerall.pos
--   p1.scale     = 1.0, 1.0
--   p1.facing    = 1           ; -1 to mirror
--   p1.starttime = 0           ; ticks after the SCENE starts
--   p1.endtime   = -1          ; -1 = until the scene ends
--   p1.loop      = 1           ; 0 = play once and hold the last frame
--   p1.applypal  = 1           ; 0 to draw in the character's default palette
--   p1.carry     = 1           ; continue the select screen's pose (see below);
--                              ; 0 = start p1.anim fresh, the old behaviour
--   p1.layerno   = 2           ; which layer pass, exactly like any layer
--   p1.order     = 6           ; draw immediately BEFORE layer6
--                              ; omitted = in front of every layer
--
-- Only P1 is supported, by request.
--
--;-----------------------------------------------------------
--; Depth
--;-----------------------------------------------------------
-- p1.layerno + p1.order place the character anywhere in the stack, the same way
-- a layer is placed: layerno picks the pass, order picks the position within it.
-- order = 0 puts it behind every layer, a number past the last layer puts it in
-- front of them.
--
-- This needs the engine, and here is why script alone cannot do it.
-- runStoryboard() paints the WHOLE scene in one call - draw(0), draw(1),
-- draw(2), with Anim.Draw(ln) returning early unless the anim's layerno equals
-- the pass. Those draws are immediate. A Lua animDraw, by contrast, is QUEUED
-- (sys.luaQueueLayerDraw) and only flushed by refresh(), which runs after the
-- storyboard has already painted - so from script the character always lands on
-- top of every layer, whenever the call is made and whatever layerno it carries.
--
-- setStoryboardChar() hands the animation to the engine instead, and
-- Storyboard.draw() renders it inside its own layer loop. The engine also
-- advances it (once per frame, in step(), not per pass), so nothing here may
-- call animUpdate on it.
--
-- Without that binding (engine not rebuilt yet) this falls back to drawing from
-- script, which still works but is always in front of everything.
local HAS_SLOT = type(setStoryboardChar) == 'function'
--
--;-----------------------------------------------------------
--; Why it is done this way
--;-----------------------------------------------------------
-- The victory screen's p1.state runs the character's real STATES: the engine
-- still has that character loaded from the match just played, ticks its state
-- machine and draws it. None of that is true during a storyboard - storyboard.go
-- has no character concept whatsoever, and nothing ticks or draws players there.
--
-- So this plays an ANIMATION, not a state. For a pose that is usually the same
-- thing to look at, but there is no state code running: no sound, explods,
-- helpers, palfx or state transitions authored in the character's CNS. If a
-- storyboard needs those, it needs an engine-side feature instead.
--
-- Everything else is reused rather than reinvented:
--   * start.f_animGet(..., applypal) is the same call the victory-screen
--     portraits use, and it is what applies the SELECTED palette (it reads
--     start.p[1].t_selected[1].pal and runs start.loadPalettes).
--   * main.f_storyboard is a Lua loop (runStoryboard() + refresh() per frame),
--     so the animation can simply be drawn each frame after the storyboard's
--     own layers - which is also why it lands on top of them.
--   * getStoryboardScene() reports the active scene, so the config can be
--     per-scene exactly like the layers are.
--
-- Animations must be PRELOADED by action number (f_animGet reads through
-- animGetPreloadedCharData). Every p1.anim found under SCAN_DIRS is registered
-- at boot, so adding the line to a .def is all that is needed.

local SCAN_DIRS = {'data/Intros'}

local t_cache = {}  -- def path -> {scenes = {[index] = params}} or false

--;-----------------------------------------------------------
--; Parsing
--;-----------------------------------------------------------
-- The engine discards storyboard keys it does not recognise, so p1.* never
-- reaches the table loadStoryboard() returns. It has to be read from the file.
local function f_numbers(str, count, default)
	local out = {}
	for v in tostring(str):gmatch('[^,%s]+') do
		out[#out + 1] = tonumber(v)
	end
	for i = 1, count do
		if out[i] == nil then out[i] = default[i] end
	end
	return out
end

local function f_parseDef(path)
	if t_cache[path] ~= nil then
		return t_cache[path]
	end
	local fh = io.open(path, 'r')
	if fh == nil then
		t_cache[path] = false
		return false
	end
	local scenes, layerall, order, found = {}, {}, {}, false
	local cur = nil
	for line in fh:lines() do
		line = line:gsub(';.*$', '')          -- strip comments
		local sec = line:match('^%s*%[%s*(.-)%s*%]%s*$')
		if sec ~= nil then
			local no = sec:match('^[Ss][Cc][Ee][Nn][Ee]%s*(%d+)$')
			if no ~= nil then
				cur = tonumber(no)
				order[#order + 1] = cur
			else
				cur = nil
			end
		elseif cur ~= nil then
			local k, v = line:match('^%s*([%w_%.]+)%s*=%s*(.-)%s*$')
			if k ~= nil then
				local lk = k:lower()
				local sub = lk:match('^p1%.(.+)$')
				if sub ~= nil then
					scenes[cur] = scenes[cur] or {}
					scenes[cur][sub] = v
					found = true
				elseif lk == 'layerall.pos' then
					-- The engine adds this to every layer of the scene
					-- (storyboard.go: layerProps.AnimData.AddPos(...)), so p1
					-- has to honour it as well or "same space as the layers"
					-- would be a lie -- which is exactly what made the first
					-- version draw off-screen.
					layerall[cur] = f_numbers(v, 2, {0, 0})
				end
			end
		end
	end
	fh:close()
	if not found then
		t_cache[path] = false
		return false
	end
	-- getStoryboardScene() returns an index into the engine's sorted scene list
	-- (storyboard.go: sceneKeys[currentSceneIndex]), so mirror that ordering
	-- rather than assuming the scene numbers are 0,1,2...
	table.sort(order)
	local byIndex = {}
	for i, no in ipairs(order) do
		if scenes[no] ~= nil then
			scenes[no].__layerall = layerall[no] or {0, 0}
			byIndex[i - 1] = scenes[no] -- engine index is 0-based
		end
	end
	t_cache[path] = {scenes = byIndex}
	return t_cache[path]
end

--;-----------------------------------------------------------
--; Boot: preload every action number the storyboards ask for,
--;       and warm their SPRITE FILES
--;-----------------------------------------------------------
--; The sprite file matters as much as the actions. Storyboard SFFs are not
--; covered by the engine's findActiveSff reuse, so a character intro re-read
--; data/Intros/Intro_New.sff - 4.2MB - at the moment it opened, with the select
--; screen's last frame still on screen. That was the "small freeze before the
--; storyboard kicks in", and team modes never showed it because they have no
--; intro storyboard to load. Reading it here moves the cost to boot, where the
--; game is already loading everything else and nothing is animating.
local function f_sprOf(path)
	local fh = io.open(path, 'r')
	if fh == nil then return nil end
	local spr, section = nil, ''
	for line in fh:lines() do
		local body = line:gsub(';.*$', '')
		local sec = body:match('^%s*%[%s*([^%]]-)%s*%]')
		if sec then
			section = sec:lower()
		elseif section == 'scenedef' then
			local v = body:match('^%s*[Ss][Pp][Rr]%s*=%s*(.-)%s*$')
			if v and v ~= '' then spr = v break end
		end
	end
	fh:close()
	return spr
end

if type(preloadListChar) == 'function' and type(getDirectoryFiles) == 'function' then
	local warmed = {}
	for _, dir in ipairs(SCAN_DIRS) do
		local ok, files = pcall(getDirectoryFiles, dir)
		if ok and type(files) == 'table' then
			for _, f in ipairs(files) do
				if f:lower():match('%.def$') then
					if type(storyboardSff) == 'function' then
						local spr = f_sprOf(f)
						if spr ~= nil and not warmed[spr:lower()] then
							warmed[spr:lower()] = true
							pcall(storyboardSff, spr, f)
						end
					end
					local cfg = f_parseDef(f)
					if cfg then
						for _, p in pairs(cfg.scenes) do
							local n = tonumber(p.anim)
							if n ~= nil and n >= 0 then
								preloadListChar(n)
							end
						end
					end
				end
			end
		end
	end
end

--;-----------------------------------------------------------
--; Diagnostic
--;-----------------------------------------------------------
-- One line per storyboard, written on the first frame actually drawn. If the
-- character does not appear, this says which stage failed: whether the scene
-- was matched, whether the animation was built at all (a nil means the action
-- is missing from the .air or was never preloaded), and the final position it
-- was drawn at -- position being the easiest thing to get wrong, since
-- layerall.pos has to be added on top of p1.pos.
local t_logged = {}
local function f_log(path, scene, p, anim, x, y)
	if t_logged[path] then return end
	t_logged[path] = true
	pcall(function()
		local ref, pal = 'nil', 'nil'
		if start ~= nil and start.p ~= nil and start.p[1] ~= nil then
			local sel = start.p[1].t_selected
			if type(sel) == 'table' and sel[1] ~= nil then
				ref = tostring(sel[1].ref)
				pal = tostring(sel[1].pal)
			end
		end
		local fh = io.open('save/logs/sfaz_storyboard_p1_debug.txt', 'a')
		if fh == nil then return end
		fh:write(string.format(
			'[%s] %s scene=%s anim=%s built=%s p1ref=%s pal=%s drawAt=%s,%s (p1.pos=%s + layerall=%s,%s)\n',
			os.date('%H:%M:%S'), tostring(path), tostring(scene), tostring(p.anim),
			tostring(anim ~= nil), ref, pal, tostring(x), tostring(y),
			tostring(p.pos), tostring((p.__layerall or {0, 0})[1]),
			tostring((p.__layerall or {0, 0})[2])))
		fh:close()
	end)
end

--;-----------------------------------------------------------
--; Drawing
--;-----------------------------------------------------------
--;-----------------------------------------------------------
--; CONTINUING THE SELECT SCREEN'S POSE
--;-----------------------------------------------------------
--; The select screen draws a picked character with [Select Info] pN.face.done
--; (action 198 here), and the storyboard used to start a FRESH p1.anim - so the
--; character snapped from wherever 198 had got to back to frame 1 of the idle.
--;
--; 198 is built for this: a taunt (sprites 195,*) then Loopstart then the SAME
--; six frames as action 0. So the seamless thing to do is not to match frames
--; between two animations - it is to keep playing 198 from exactly where the
--; select screen left it. An unfinished taunt then completes on the storyboard
--; and falls into the idle loop by itself, and a character already looping idle
--; simply carries on.
--;
--; start.lua captures the position on its last frame (sfazSelectCarry) because
--; that is the last moment those Anim objects exist; f_selectReset clears them.
--; It is not captured on a cancel, so a backed-out screen cannot seed this.
--;
--; p1.carry = 0 in a scene opts out and gets the old fresh-p1.anim behaviour.
local function f_carryFor(p, member)
	if tonumber(p.carry) == 0 then return nil end
	if type(sfazSelectCarry) ~= 'table' then return nil end
	local side = sfazSelectCarry[1]
	if type(side) ~= 'table' then return nil end
	local c = side[member]
	if type(c) ~= 'table' or tonumber(c.anim) == nil or tonumber(c.elem) == nil then
		return nil
	end
	return c
end

local function f_buildAnim(p, member)
	member = member or 1
	if start == nil or start.p == nil or start.p[1] == nil then return nil end
	local sel = start.p[1].t_selected
	if type(sel) ~= 'table' or sel[member] == nil or sel[member].ref == nil then return nil end
	local carry = f_carryFor(p, member)
	local anim = tonumber(p.anim)
	if carry ~= nil then anim = tonumber(carry.anim) end
	if anim == nil or anim < 0 then return nil end
	local scale  = f_numbers(p.scale, 2, {1, 1})
	local window = f_numbers(p.window, 4, {0, 0, 0, 0})
	local params = {
		anim        = anim,
		spr         = {-1, 0},
		-- default ON: showing the selected palette is the whole point
		applypal    = tonumber(p.applypal) ~= 0,
		layerno     = tonumber(p.layerno) or 2,
		scale       = scale,
		facing      = tonumber(p.facing) or 1,
		xshear      = tonumber(p.xshear) or 0,
		angle       = tonumber(p.angle) or 0,
		xangle      = tonumber(p.xangle) or 0,
		yangle      = tonumber(p.yangle) or 0,
		projection  = p.projection or 'orthographic',
		focallength = tonumber(p.focallength) or 2048,
		window      = window,
		velocity    = f_numbers(p.velocity, 2, {0, 0}),
		maxdist     = f_numbers(p.maxdist, 2, {0, 0}),
		accel       = f_numbers(p.accel, 2, {0, 0}),
		friction    = f_numbers(p.friction, 2, {1, 1}),
		draworder   = 0,
	}
	local loop = tonumber(p.loop) ~= 0
	-- side 1, THIS member: f_animGet resolves the per-player-number face config
	-- and applies that member's own selected palette, so a team draws in the
	-- same colours the select screen showed.
	local ok, a = pcall(start.f_animGet, sel[member].ref, 1, member, params, nil, loop)
	if ok and a ~= nil and carry ~= nil and type(animSetElem) == 'function' then
		-- Seek to where the select screen was. Failing to seek is not fatal: the
		-- carried animation still plays, just from its first frame.
		pcall(animSetElem, a, carry.elem, carry.time)
		return a
	end
	if ok and a ~= nil then return a end
	-- The carried action may not be preloaded for this character. Fall back to
	-- the scene's own p1.anim rather than drawing nothing.
	if carry ~= nil then
		params.anim = tonumber(p.anim) or -1
		if params.anim >= 0 then
			local ok2, b = pcall(start.f_animGet, sel[member].ref, 1, member, params, nil, loop)
			if ok2 then return b end
		end
	end
	return nil
end

--;-----------------------------------------------------------
--; How many members to draw, and where
--;-----------------------------------------------------------
-- p1.team      = 1  draw P1's whole team (default), 0 = only the first member
-- p1.selectpos = 1  put each member exactly where the SELECT SCREEN put them
--                   (default). p1.offset nudges that. 0 = the old behaviour,
--                   layerall.pos + p1.pos, with no team spacing.
-- p1.spacing   = 45, 0   how far apart the members stand
-- p1.padding   = 1       centre the row over the team instead of stepping right
--
-- These two default to SPREAD_DEFAULT below and apply ONLY when more than one
-- member is being drawn. A scene may override either.
--
-- Why they are needed at all: [Select Info] spacing is tuned for PORTRAITS
-- (40,0 here), and full-body intro animations are wider than that, so a team
-- drawn at the select screen's own spacing overlaps.
--
-- Why they are gated on the member count: padding does not step the row, it
-- CENTRES it over pN.num slots, and that moves a lone character too. With this
-- motif's numbers a single character sits at x=70 on the select screen but at
-- x=137.5 once padding is on - a 67 pixel jump on the hand-off into the intro,
-- for a case that has no overlap to fix. So one member is always placed exactly
-- where the select screen placed them, and the spread only opens up when there
-- is actually a team to spread.
local SPREAD_DEFAULT = {spacing = {45, 0}, padding = true}
--
-- Default ON is deliberate: matching the select screen is the point, and it is
-- the only way to get it right - that position is built from three motif values
-- and pN.pos is not one anybody thinks to copy. See sfaz_selectpos.lua.
-- A .def that wants an absolute position sets p1.selectpos = 0, and its existing
-- p1.pos then means exactly what it always did.
local function f_memberCount(p)
	if tonumber(p.team) == 0 then return 1 end
	if type(sfazSelectTeamSize) ~= 'function' then return 1 end
	return sfazSelectTeamSize(1)
end

local function f_useSelectPos(p)
	if type(sfazSelectPos) ~= 'function' then return false end
	return tonumber(p.selectpos) ~= 0
end

--; Spread overrides for sfazSelectPos. Empty for a single member, so its
--; position stays byte-for-byte the select screen's.
local function f_spread(p, count)
	if (count or 1) < 2 then
		return {}
	end
	local over = {
		spacing = SPREAD_DEFAULT.spacing,
		padding = SPREAD_DEFAULT.padding,
	}
	if p.spacing ~= nil then
		over.spacing = f_numbers(p.spacing, 2, SPREAD_DEFAULT.spacing)
	end
	if p.padding ~= nil then
		over.padding = tonumber(p.padding) ~= 0
	end
	return over
end

--;-----------------------------------------------------------
--; main.f_storyboard wrapper
--;-----------------------------------------------------------
-- Wrapped rather than hooked because main.f_storyboard has no hook of its own.
-- Mods load after main.lua has defined it (main.lua: "EXTERNAL LUA CODE"), so
-- the original is safe to capture here. Storyboards with no p1.* config run
-- through the untouched original.
local f_storyboardOrig = main.f_storyboard

main.f_storyboard = function(path)
	local cfg = f_parseDef(path)
	if not cfg then
		return f_storyboardOrig(path)
	end
	local s = loadStoryboard(path)
	if s == nil then
		return false
	end
	-- This wrapper owns the load for every .def with p1.* config, which is all
	-- of the character intros, so it is the only place the story text can be
	-- injected for them. See sfazInjectIntroText in sfaz_intro_text.lua.
	-- Guarded by type() so this mod still works with that one absent.
	if type(sfazInjectIntroText) == 'function' then
		sfazInjectIntroText(path, s)
	end
	local anims, scene, ticks, handed = {}, nil, 0, false
	local function f_visible(p)
		if #anims == 0 or p == nil then return false end
		local st = tonumber(p.starttime) or 0
		local et = tonumber(p.endtime) or -1
		return ticks >= st and (et < 0 or ticks <= et)
	end
	local function f_pos(p, member, count)
		member = member or 1
		if f_useSelectPos(p) then
			local sx, sy = sfazSelectPos(1, member, f_spread(p, count))
			if sx ~= nil then
				local off = f_numbers(p.offset, 2, {0, 0})
				return sx + off[1], sy + off[2]
			end
		end
		-- Fallback / opt-out: the original absolute placement. Only member 1 has
		-- a meaningful position here, so f_memberCount is forced to 1 when this
		-- path is taken - teammates would otherwise stack on one spot.
		local pos = f_numbers(p.pos, 2, {0, 0})
		local la = p.__layerall or {0, 0}
		return la[1] + pos[1], la[2] + pos[2]
	end
	--; Everything that decides what is in the character slot for the NEXT frame
	--; that gets painted. It is a function only so that it can also be run ONCE
	--; BEFORE the loop; inside the loop it sits exactly where it always did.
	--;
	--; `prime` marks that pre-loop call. It suppresses only the no-engine
	--; fallback draw, which is a per-frame queued draw rather than a hand-over
	--; and would otherwise be queued twice for the first frame.
	local function f_sync(prime)
		local cur = nil
		if type(getStoryboardScene) == 'function' then
			cur = getStoryboardScene()
		end
		if cur ~= scene then
			-- New scene: drop the old animation and restart the clock, so
			-- starttime/endtime are measured from the scene, like the layers.
			scene, ticks, anims = cur, 0, {}
			if handed and HAS_SLOT then
				setStoryboardChar(nil)
				handed = false
			end
			local p = cur ~= nil and cfg.scenes[cur] or nil
			if p ~= nil then
				local n = f_useSelectPos(p) and f_memberCount(p) or 1
				for m = 1, n do
					local a = f_buildAnim(p, m)
					if a ~= nil then
						anims[#anims + 1] = {anim = a, member = m}
					end
				end
				local x, y = f_pos(p, 1, #anims)
				f_log(path, cur, p, anims[1] and anims[1].anim or nil, x, y)
			end
		else
			ticks = ticks + 1
		end
		local p = cur ~= nil and cfg.scenes[cur] or nil
		local show = f_visible(p)
		if HAS_SLOT then
			-- Hand the animation to the engine while it should be on screen and
			-- take it back when the window closes, so starttime/endtime still
			-- apply even though the engine is the one drawing it.
			if show and not handed then
				-- Slots are drawn in order, so hand the LAST member over first:
				-- the point character ends up in front of its team, the same
				-- stacking the select screen shows.
				for i = #anims, 1, -1 do
					local e = anims[i]
					local x, y = f_pos(p, e.member, #anims)
					animSetPos(e.anim, x, y)
					-- Default order is past the last layer, i.e. in front of
					-- everything - the behaviour before this parameter existed.
					setStoryboardChar(e.anim, tonumber(p.layerno) or 2,
						tonumber(p.order) or 9999, #anims - i + 1)
				end
				handed = true
			elseif not show and handed then
				setStoryboardChar(nil)
				handed = false
			end
		elseif show and not prime then
			-- Fallback: engine without the slot binding. Always in front of
			-- every layer, and in the same back-to-front order.
			for i = #anims, 1, -1 do
				local e = anims[i]
				local x, y = f_pos(p, e.member, #anims)
				main.f_animPosDraw(e.anim, x, y)
			end
		end
	end
	--;-----------------------------------------------------------
	--; The character has to be in the slot BEFORE the first frame is painted
	--;-----------------------------------------------------------
	-- runStoryboard() inits, steps AND paints in one call, so the scene could
	-- not be read until it had already been drawn once - the character arrived a
	-- frame late, which shows as a hitch on the hand-off from the select screen
	-- where it is supposed to be continuous.
	--
	-- Handing it over before that first call is not enough on its own either:
	-- init() calls reset(), which calls clearChar() and would drop it. So the
	-- init is done separately first (initStoryboard, src/script.go), and only
	-- then is the slot filled.
	--
	-- This also makes p1.starttime exact. Previously the slot state decided at
	-- tick N was drawn on the engine's frame N+1, so starttime = 0 first
	-- appeared on frame 2; now tick N is the frame it is painted on.
	--
	-- Without the binding (older exe) getStoryboardScene() returns nil here, the
	-- scene-change branch below then fires on the first loop pass and resets
	-- ticks - i.e. it degrades to exactly the previous behaviour.
	if type(initStoryboard) == 'function' then
		initStoryboard()
	end
	f_sync(true)
	while true do
		if not runStoryboard() then
			break
		end
		f_sync()
		main.f_preloadTick(2)
		refresh()
	end
	-- The engine also clears the slot when the next storyboard loads, but do not
	-- rely on that: an animation left behind would be drawn by whatever runs next.
	if handed and HAS_SLOT then
		setStoryboardChar(nil)
	end
	return storyboardCanceled()
end
