-- SFAZ CORE MODULE (migration port, 2026)
-- Ports Street Fighter Alpha Zero (Orange Dolphin edit) behaviors that used to
-- live as direct edits in the 2024-06-27 build's scripts / custom engine.

--;===========================================================
--; LEGACY API ALIASES
--; Keeps the game's arcadepath/*.lua scripts and older modules working
--; without editing all of them (matchno() was renamed to matchNo(), etc.)
--;===========================================================
if matchno == nil and matchNo ~= nil then
	matchno = matchNo
end
if continue == nil and continued ~= nil then
	continue = continued
end
if winnerteam == nil and getWinnerTeam ~= nil then
	winnerteam = getWinnerTeam
end
if gamemode == nil and gameMode ~= nil then
	gamemode = gameMode
end
-- Additional renames used by arcadepath/kumitepath.lua (2026 camelCase API)
if matchover == nil and matchOver ~= nil then
	matchover = matchOver
end
if lifemax == nil and lifeMax ~= nil then
	lifemax = lifeMax
end
if teamsize == nil and teamSize ~= nil then
	teamsize = teamSize
end
if timeelapsed == nil and timeElapsed ~= nil then
	timeelapsed = timeElapsed
end
if timeremaining == nil and timeRemaining ~= nil then
	timeremaining = timeRemaining
end
-- ratiolevel() has no equivalent in the new engine (ratio handling moved into
-- the Go side and is not exposed to Lua). SFAZ never puts the scripted player
-- in a ratio team (worldtour/kumite lock P1 to single), so the old call always
-- returned 0; keep that behavior.
if ratiolevel == nil then
	ratiolevel = function() return 0 end
end
-- Old global "config" table (parsed config.json). kumitepath.lua reads life
-- recovery percentages from it. Map the keys it uses onto gameOption values;
-- the Ratio.Recovery options no longer exist, so use the values from the
-- stable build's config.json (identical to the Turns ones).
if config == nil then
	config = {
		TurnsRecoveryBase = gameOption('Options.Turns.Recovery.Base'),
		TurnsRecoveryBonus = gameOption('Options.Turns.Recovery.Bonus'),
		RatioRecoveryBase = 0,
		RatioRecoveryBonus = 20,
	}
end

--;===========================================================
--; TEMP DIAGNOSTIC -- continue screen black background.
--; The stage is only drawn when  s.envcol_time == 0 && !gsf(GSF_nobg)
--; (src/system.go), so log what is actually asserted while it is up.
--;===========================================================
do
	local logged = false
	local function f_coLog(tag)
		local fh = io.open('save/logs/sfaz_continue_debug.txt', 'a')
		if not fh then return end
		local function A(f)
			if type(isAsserted) ~= 'function' then return '?' end
			local ok, v = pcall(isAsserted, f)
			return ok and tostring(v) or 'err'
		end
		fh:write(string.format(
			'[%s] nobg=%s nofg=%s nobardisplay=%s intro=%s roundnotover=%s | roundState=%s winnerTeam=%s\n',
			tag, A('nobg'), A('nofg'), A('nobardisplay'), A('intro'), A('roundnotover'),
			tostring(type(roundState) == 'function' and roundState()),
			tostring(type(getWinnerTeam) == 'function' and getWinnerTeam())))
		fh:close()
	end
	hook.add("game.continue_init", "sfaz_continue_diag_init", function()
		logged = false
		f_coLog('continue_init')
	end)
	hook.add("game.continue", "sfaz_continue_diag", function()
		if logged then return end
		logged = true
		f_coLog('continue frame1')
	end)
end

--;===========================================================
--; VICTORY SCREEN PORTRAIT ANIM PRELOAD
--;
--; [Victory Screen] p1.face2.anim = 181 only works if action 181 is present in
--; the select-char anim table (sc.anims). buildPortrait (src/motif.go) does:
--;     animCopy = sc.anims.get(animNo, -1)
--; and, when that misses, falls back to sprite 9000,1 -- a fallback that needs
--; 9000,1 preloaded, which the anim branch does not register. So an unpreloaded
--; anim yields neither the animation nor the portrait.
--;
--; The motif parser normally registers anims tagged preload:"char" as it reads
--; them, but that did not happen for the face2 slot (its struct field carries no
--; ini tag, unlike its siblings). preloadListChar() is the engine's own Lua API
--; for exactly this, and runs early enough here -- modules load before any
--; character sprites are read.
--;
--; Add further action numbers here if other screens reference character anims.
--;===========================================================
if type(preloadListChar) == 'function' then
	preloadListChar(181) -- win pose, used by [Victory Screen] p1.face2.anim
end

--;===========================================================
--; DEFEATED-OPPONENT PORTRAITS ON THE VICTORY SCREEN
--;
--; Shows every opponent beaten so far in the run, left to right, match 1
--; onward, INCLUDING the one just beaten. After winning match 1 you see one
--; portrait; after match 5 you see five.
--;
--; Tunable from data/system.def -- add a section like:
--;
--;   [SFAZ Defeated Portraits]
--;   enabled  = 1
--;   spr      = 9000,100
--;   pos      = 12, 196      ; bottom-left anchor, motif localcoord (384x224)
--;   spacing  = 34, 0        ; step per MATCH (x, y) - one match, one slot
--;   groupspacing = 3, -3    ; offset within a slot for members 2+ of a simul
--;                           ; match. Does NOT move the next slot; 0,0 stacks
--;                           ; them exactly on top of each other.
--;   scale    = 1, 1
--;   facing   = 1
--;   layerno  = 2            ; MUST be 0, 1 or 2 -- nothing else is ever drawn
--;   max      = 10
--;   window   = 0, 0, 384, 224
--;   applypal = 0
--;
--; The engine discards motif params it does not know, so the section is read
--; straight from the motif file, the same way the matchno counter below is.
--;===========================================================
local sfazDP = {
	enabled  = false,
	spr      = {9000, 9000},
	pos      = {12, 196},
	spacing  = {34, 0},   -- step from one MATCH GROUP to the next
	groupspacing = {3, -3}, -- offset WITHIN a slot for members 2+ (simul); does
	                        -- not move the next slot. {0, 0} = exact overlap.
	scale    = {1, 1},
	facing   = 1,
	layerno  = 2,
	max      = 10,
	window   = {0, 0, 384, 224},
	applypal = false,
	-- "next opponent" marker, drawn after the last defeated group.
	-- Action number from a [Begin Action N] in system.def, using system.sff.
	next_anim   = -1,
	next_offset = {0, 0},
	next_scale  = {1, 1},
	-- Colour treatment for the defeated portraits.
	-- greyscale: saturation, 0 = black and white, 256 = untouched.
	-- brightness: multiplier, 256 = normal, lower = darker.
	greyscale  = 0,
	brightness = 256,
}

do
	local path = gameOption('Config.Motif')
	if type(path) ~= 'string' or path == '' then path = 'data/system.def' end
	local fh = io.open(path, 'r')
	if fh then
		local section = ''
		local function nums(v)
			local t = {}
			for s in v:gmatch('[^,]+') do t[#t + 1] = tonumber(s:match('^%s*(-?[%d.]+)')) end
			return t
		end
		for line in fh:lines() do
			local body = line:gsub(';.*$', '')
			local sec = body:match('^%s*%[%s*([^%]]-)%s*%]')
			if sec then
				section = sec:lower()
			elseif section == 'sfaz defeated portraits' then
				local k, v = body:match('^%s*([%w_.]+)%s*=%s*(.-)%s*$')
				if k and v and v ~= '' then
					-- next.anim -> next_anim, so dotted params map onto flat keys
					k = k:lower():gsub('%.', '_')
					local cur = sfazDP[k]
					-- Assign by the DEFAULT's type, so adding a new param above is
					-- all that is needed to make it configurable.
					if type(cur) == 'boolean' then
						sfazDP[k] = (tonumber(v) or 0) ~= 0
					elseif type(cur) == 'number' then
						sfazDP[k] = tonumber(v) or cur
					elseif type(cur) == 'table' then
						local n = nums(v)
						for i = 1, #cur do
							if n[i] ~= nil then cur[i] = n[i] end
						end
					end
				end
			end
		end
		fh:close()
	end
end

-- The chosen sprite must be preloaded or animGetPreloadedCharData() returns nil
-- for every character (only 9000,0 / 9000,1 are seeded by default).
if sfazDP.enabled and type(preloadListChar) == 'function' then
	preloadListChar(sfazDP.spr[1], sfazDP.spr[2])
end

local t_defeated = {}  -- matchNo -> select ref of that match's P2
local t_dpDraw   = {}  -- AnimData built for the current victory screen

-- f_animGet indexes every one of these, so provide the full set.
local function f_dpParams()
	return {
		anim        = -1,
		spr         = {sfazDP.spr[1], sfazDP.spr[2]},
		applypal    = sfazDP.applypal,
		layerno     = sfazDP.layerno,
		scale       = {sfazDP.scale[1], sfazDP.scale[2]},
		facing      = sfazDP.facing,
		xshear      = 0,
		angle       = 0,
		xangle      = 0,
		yangle      = 0,
		projection  = 'orthographic',
		focallength = 2048,
		window      = {sfazDP.window[1], sfazDP.window[2], sfazDP.window[3], sfazDP.window[4]},
		velocity    = {0, 0},
		maxdist     = {0, 0},
		accel       = {0, 0},
		friction    = {1, 1},
		draworder   = 0,
	}
end

-- Every opponent-side character for the match just played. Simul/turns fights
-- put more than one entry in t_selected (P2, P4, ...), and they are kept
-- together as one "group" so they can be drawn side by side.
local function f_dpCurrentOpponentRefs()
	local out = {}
	if start == nil or start.p == nil or start.p[2] == nil then return out end
	local sel = start.p[2].t_selected
	if type(sel) ~= 'table' then return out end
	for _, s in ipairs(sel) do
		if s ~= nil and s.ref ~= nil then
			out[#out + 1] = s.ref
		end
	end
	return out
end

-- "Next opponent" marker, built once from a [Begin Action N] in system.def.
-- Read the raw text of a [Begin Action N] block out of the motif file. Used as
-- a fallback because animNew() also accepts a plain AIR definition string, so
-- this works regardless of how (or whether) the parsed anim table is exposed
-- to Lua.
local function f_dpReadActionText(no)
	local path = gameOption('Config.Motif')
	if type(path) ~= 'string' or path == '' then path = 'data/system.def' end
	local fh = io.open(path, 'r')
	if not fh then return nil end
	local want = '^%s*%[%s*[Bb]egin%s+[Aa]ction%s+' .. tostring(no) .. '%s*%]'
	local grabbing, lines = false, {}
	for line in fh:lines() do
		if line:match(want) then
			grabbing = true
		elseif grabbing and line:match('^%s*%[') then
			break -- next section ends the action
		elseif grabbing then
			local body = line:gsub(';.*$', '')
			if body:match('%S') then
				lines[#lines + 1] = body
			end
		end
	end
	fh:close()
	if #lines == 0 then return nil end
	return table.concat(lines, '\n')
end

-- TEMP DIAGNOSTIC -- remove once the next-opponent marker is working.
local function f_dpLog(fmt, ...)
	local fh = io.open('save/logs/sfaz_nextanim_debug.txt', 'a')
	if not fh then return end
	fh:write(string.format(fmt, ...) .. '\n')
	fh:close()
end

local dpNextAnim = nil
local dpNextTried = false
local dpDrawLogged = false
local function f_dpNextAnim()
	if sfazDP.next_anim < 0 then
		if not dpNextTried then
			dpNextTried = true
			f_dpLog('next_anim is %s (<0) -- marker disabled in system.def',
				tostring(sfazDP.next_anim))
		end
		return nil
	end
	if dpNextAnim ~= nil then return dpNextAnim end
	if dpNextTried then return nil end
	dpNextTried = true
	f_dpLog('--- building next marker: anim=%s animNew=%s sffNew=%s motif=%s',
		tostring(sfazDP.next_anim), type(animNew), type(sffNew), type(motif))
	if type(animNew) ~= 'function' or motif == nil then return nil end
	-- The motif's Sff and AnimTable are NOT exposed to Lua: script.go only
	-- surfaces struct fields carrying an `ini` or `lua` tag, and those two have
	-- neither. animNew() silently substitutes an empty SFF when handed nil,
	-- which is why the action loaded but drew nothing. Load system.sff directly
	-- instead, and take the action definition from the file as raw AIR text.
	local sffPath = nil
	if motif.files ~= nil and type(motif.files.spr) == 'string' and motif.files.spr ~= '' then
		sffPath = motif.files.spr
	end
	-- Prefer the engine's already-loaded system.sff. sffNew() re-reads and
	-- re-decodes the whole ~10MB file and keeps a second copy in memory, which
	-- stalls the victory screen for about a second; motifSff() just hands back
	-- the existing instance. sffNew stays as a fallback for older builds.
	local sff = nil
	if type(motifSff) == 'function' then
		local okM, s = pcall(motifSff)
		f_dpLog('motifSff() ok=%s sff=%s', tostring(okM), tostring(s))
		if okM and s ~= nil then sff = s end
	end
	if sff == nil then
		f_dpLog('motifSff unavailable; falling back to sffNew (slow). spr=%s', tostring(sffPath))
		for _, p in ipairs({sffPath, 'data/system.sff', 'system.sff'}) do
			if p ~= nil then
				local okS, s = pcall(sffNew, p)
				f_dpLog('  sffNew(%s) ok=%s sff=%s', tostring(p), tostring(okS), tostring(s))
				if okS and s ~= nil then
					sff = s
					break
				end
			end
		end
	end
	if sff == nil then
		f_dpLog('ABORT: no SFF could be loaded')
		return nil
	end
	-- Prefer the engine's OWN parsed action. ReadAnimationTable() builds it with
	-- the motif SFF *and* its palette list; a hand-parsed AIR string has no
	-- palette linkage, which is why the anim built fine and drew nothing.
	local src = nil
	if type(motifAnim) == 'function' then
		local okA, parsed = pcall(motifAnim, sfazDP.next_anim)
		f_dpLog('motifAnim(%d) ok=%s anim=%s', sfazDP.next_anim, tostring(okA), tostring(parsed))
		if okA and parsed ~= nil then src = parsed end
	end
	if src == nil then
		src = f_dpReadActionText(sfazDP.next_anim)
		f_dpLog('fallback action %d text: %s', sfazDP.next_anim,
			src and ('FOUND (' .. #src .. ' chars): ' .. src:gsub('\n', ' | ')) or 'NOT FOUND')
	end
	if src == nil then return nil end
	local ok, a = pcall(animNew, sff, src)
	f_dpLog('animNew ok=%s anim=%s', tostring(ok), tostring(a))
	if not ok or a == nil then return nil end
	-- Same treatment f_animGet gives portraits, or it draws in the wrong space.
	if type(animSetLocalcoord) == 'function' and motif.info ~= nil then
		animSetLocalcoord(a, motif.info.localcoord[1], motif.info.localcoord[2])
	end
	-- MUST zero the base position: main.f_animPosDraw does
	--     animReset(a, {"pos"}) ; animAddPos(a, x, y)
	-- so x,y is an OFFSET FROM THE BASE, not an absolute position. f_animGet
	-- calls animSetPos(a, 0, 0) for exactly this reason; without it the marker
	-- is drawn relative to whatever animNew left behind.
	if type(animSetPos) == 'function' then
		animSetPos(a, 0, 0)
	end
	-- Match the rest of f_animGet's setup so nothing is left uninitialised.
	if type(animSetVelocity) == 'function' then animSetVelocity(a, 0, 0) end
	if type(animSetAccel) == 'function' then animSetAccel(a, 0, 0) end
	if type(animSetFriction) == 'function' then animSetFriction(a, 1, 1) end
	if type(animSetFacing) == 'function' then animSetFacing(a, sfazDP.facing) end
	if type(animSetScale) == 'function' then
		animSetScale(a, sfazDP.next_scale[1], sfazDP.next_scale[2])
	end
	if type(animSetLayerno) == 'function' then
		animSetLayerno(a, sfazDP.layerno)
	end
	if type(animSetWindow) == 'function' then
		animSetWindow(a, sfazDP.window[1], sfazDP.window[2], sfazDP.window[3], sfazDP.window[4])
	end
	dpNextAnim = a
	return dpNextAnim
end

--;===========================================================
--; VICTORY SCREEN MUSIC
--; The ENGINE (src/motif.go, MotifVictory.init) plays [Music] victory.bgm only
--; when sys.tmode[0] != TM_Single, i.e. when P1's side is a team. Note that
--; setTeamMode() turns "simul with 1 character" into TM_Single, so a one-man
--; simul team counts as single here too.
--;
--; That team-size test silenced every solo-P1 mode, Survival included. The rule
--; actually wanted is narrower: stay silent ONLY in arcade with a solo player.
--;
--; The engine cannot be asked to STOP a track from Lua -- its Music.Play runs
--; inside init() AFTER the game.victory_init hook, so a script would only be a
--; frame late. STARTING one is fine though, and that is all that is needed:
--; in exactly the cases the engine suppresses (solo P1), this hook starts the
--; same track first, and the engine's own decision is then "do not play", so
--; nothing restarts or overrides it. No engine rebuild required.
--;===========================================================
hook.add("game.victory_init", "sfaz_victorybgm", function()
	if type(gameMode) ~= 'function' or type(playBgm) ~= 'function' then
		return
	end
	-- Story mode AND Team Arcade both report "arcade" (main.lua aliases
	-- t_itemname.teamarcade to t_itemname.arcade), which is what makes this the
	-- right test for "arcade": a solo run of either stays silent, while a real
	-- simul team is already covered by the engine.
	if gameMode('arcade') then
		return
	end
	local p1 = start ~= nil and start.p ~= nil and start.p[1] or nil
	if p1 ~= nil and (p1.numChars or 1) > 1 then
		return -- P1 is a team: the engine plays it already, do not restart it
	end
	playBgm({source = 'motif.victory', interrupt = true})
end)

hook.add("game.victory_init", "sfaz_defeatedportraits_init", function()
	t_dpDraw = {}
	if not sfazDP.enabled or type(matchNo) ~= 'function' then return end
	local mn = matchNo()
	if type(mn) ~= 'number' or mn < 1 then return end
	-- A new run starts at match 1: drop any history from the previous run.
	if mn == 1 then
		t_defeated = {}
	end
	-- Record the opponents just beaten. This happens BEFORE the list is built, so
	-- the current match is included: after match 1 you see match 1's opponent(s).
	local refs = f_dpCurrentOpponentRefs()
	if #refs > 0 then
		t_defeated[mn] = refs
	end
	-- Build one GROUP of portraits per beaten match: matches 1 .. mn (inclusive).
	-- A group holds every opponent from that match, so simul fights contribute
	-- two or more portraits that stay visually together.
	if type(start) ~= 'table' or type(start.f_animGet) ~= 'function' then return end
	local last = math.min(mn, sfazDP.max)
	for i = 1, last do
		local group = t_defeated[i]
		if type(group) == 'table' then
			local built = {}
			for member, r in ipairs(group) do
				local ok, a = pcall(start.f_animGet, r, 2, member, f_dpParams(), nil, true)
				if ok and a ~= nil then
					-- Desaturate: animSetPalFX 'color' is a saturation factor
					-- (0-256 mapped to 0.0-1.0), so 0 = black and white.
					-- sfazDP.greyscale = 256 leaves the portrait untouched.
					if type(animSetPalFX) == 'function' and sfazDP.greyscale < 256 then
						pcall(animSetPalFX, a, {
							time  = -1, -- persist for as long as it is drawn
							color = sfazDP.greyscale,
							mul   = {sfazDP.brightness, sfazDP.brightness, sfazDP.brightness},
						})
					end
					built[#built + 1] = a
				end
			end
			if #built > 0 then
				t_dpDraw[#t_dpDraw + 1] = built
			end
		end
	end
end)

hook.add("game.victory", "sfaz_defeatedportraits_draw", function()
	if not sfazDP.enabled or type(main) ~= 'table' or type(main.f_animPosDraw) ~= 'function' then
		return
	end
	-- Pass 1: work out where each group sits, left to right in match order.
	--
	-- ONE MATCH IS ONE SLOT. The advance is exactly spacing whatever the match
	-- held, so a simul match takes the same width as a single one and every
	-- portrait keeps landing on its pedestal. groupspacing offsets the extra
	-- members WITHIN their slot and deliberately does not accumulate.
	--
	-- It used to advance by spacing + (members - 1) * groupspacing, on the
	-- reasoning that a simul group should consume the width of its own members.
	-- That is wrong here: the pedestals behind the row are fixed art at a fixed
	-- pitch, so the moment one match was worth more than one slot the whole row
	-- lost alignment with them - and the "next" marker, which sits at the end of
	-- this same cursor, landed on top of a portrait.
	local x, y = sfazDP.pos[1], sfazDP.pos[2]
	local gx, gy = {}, {}
	for gi, group in ipairs(t_dpDraw) do
		gx[gi], gy[gi] = x, y
		x = x + sfazDP.spacing[1]
		y = y + sfazDP.spacing[2]
	end
	-- Pass 2: draw BACK TO FRONT, because only layers 0/1/2 exist and within a
	-- layer the draw order decides depth.
	--   * groups in reverse (last match first) so MATCH 1 ends up on top and
	--     each later match sits one order lower;
	--   * members in reverse within a group so P2 is above P4 above P6.
	for gi = #t_dpDraw, 1, -1 do
		local group = t_dpDraw[gi]
		for j = #group, 1, -1 do
			main.f_animPosDraw(
				group[j],
				gx[gi] + (j - 1) * sfazDP.groupspacing[1],
				gy[gi] + (j - 1) * sfazDP.groupspacing[2]
			)
		end
	end
	-- "Next opponent" marker sits in the slot the next group would occupy.
	-- Hidden once matchNo reaches max, i.e. on the final match of the run --
	-- set max to your run length for that to line up.
	local mn = (type(matchNo) == 'function') and matchNo() or 0
	if type(mn) == 'number' and mn < sfazDP.max then
		local a = f_dpNextAnim()
		if a ~= nil then
			-- f_animPosDraw already calls animUpdate; do not advance it twice.
			local dx = x + sfazDP.next_offset[1]
			local dy = y + sfazDP.next_offset[2]
			if not dpDrawLogged then
				dpDrawLogged = true
				f_dpLog('DRAW marker at x=%s y=%s (groups=%d, pos=%s,%s, spacing=%s,%s, scale=%s,%s, layerno=%s)',
					tostring(dx), tostring(dy), #t_dpDraw,
					tostring(sfazDP.pos[1]), tostring(sfazDP.pos[2]),
					tostring(sfazDP.spacing[1]), tostring(sfazDP.spacing[2]),
					tostring(sfazDP.next_scale[1]), tostring(sfazDP.next_scale[2]),
					tostring(sfazDP.layerno))
				-- Compare the marker against a portrait that IS visible: if the
				-- marker has no sprite info, the animation resolved but carries
				-- no drawable sprite (i.e. 100,11111 is not in system.sff).
				local function f_info(label, an)
					if an == nil then f_dpLog('  %s: anim nil', label) return end
					if type(animGetSpriteInfo) ~= 'function' then return end
					local okI, inf = pcall(animGetSpriteInfo, an)
					if not okI or inf == nil then
						f_dpLog('  %s: animGetSpriteInfo -> NIL (no drawable sprite)', label)
					else
						f_dpLog('  %s: sprite %s,%s size=%sx%s offset=%s,%s palidx=%s',
							label, tostring(inf.Group), tostring(inf.Number),
							tostring(inf.Size and inf.Size[1]), tostring(inf.Size and inf.Size[2]),
							tostring(inf.Offset and inf.Offset[1]), tostring(inf.Offset and inf.Offset[2]),
							tostring(inf.palidx))
					end
				end
				f_info('MARKER  ', a)
				if t_dpDraw[1] ~= nil then f_info('PORTRAIT', t_dpDraw[1][1]) end
			end
			main.f_animPosDraw(a, dx, dy)
		end
	else
		f_dpLog('marker SKIPPED: matchNo=%s max=%s (hidden on the final match)',
			tostring(mn), tostring(sfazDP.max))
	end
end)

--;===========================================================
--; RATIOPATH FOR MISSION MODES (was: start.lua f_selectMode edit)
--; vs100kumite / worldtour / timeattack load the character's "ratiopath"
--; lua file instead of its regular arcadepath. "ratiopath" is a custom
--; [Arcade] section param in the char .def files; the old custom engine
--; returned it from getCharInfo(), the 2026 engine does not, so read it
--; from the .def file directly (cached per def path).
--;===========================================================
local t_ratiopathCache = {}
local function f_readRatiopath(defPath)
	if defPath == nil then
		return ''
	end
	if t_ratiopathCache[defPath] ~= nil then
		return t_ratiopathCache[defPath]
	end
	local rp = ''
	local file = io.open(defPath, 'r')
	if file then
		local inArcade = false
		for line in file:lines() do
			line = line:gsub(';.*$', '')
			local sec = line:match('^%s*%[%s*([^%]]-)%s*%]')
			if sec then
				inArcade = sec:lower() == 'arcade'
			elseif inArcade then
				local v = line:match('^%s*[Rr]atiopath%s*=%s*(.-)%s*$')
				if v and v ~= '' then
					rp = v:gsub('"', '')
					break
				end
			end
		end
		file:close()
	end
	t_ratiopathCache[defPath] = rp
	return rp
end

--;===========================================================
--; MISSION MODES USE kumitepath.lua (was: start.lua f_selectMode edit)
--;
--; The old build ran its ratiopath check as a SEPARATE, ungated block:
--;     local path = main.luaPath
--;     if main.charparam.arcadepath then ... char arcadepath ... end
--;     if gamemode('vs100kumite') or gamemode('worldtour') or gamemode('timeattack') then
--;         path = <char>.ratiopath
--;     end
--; The 2026 engine only offers a hook INSIDE the arcadepath gate
--; (start.lua:1748-1752), and main.charparam.arcadepath is false for these
--; modes -- so the hook below never fired and they fell back to the default
--; script. Setting main.luaPath instead reproduces the old behaviour, because
--; start.f_selectMode begins with "local path = main.luaPath" before the gate.
--;
--; Doing it this way (rather than forcing charparam.arcadepath = true) also
--; keeps customArcadePath false, so these modes still get their generated
--; roster -- worldtour's 40 and vs100kumite's 100 matches depend on it.
--;
--; Every playable .def in this game sets ratiopath = arcadepath/kumitepath.lua
--; (verified: 51/51), so the constant below matches the per-character value.
--;===========================================================
local RATIOPATH = 'arcadepath/kumitepath.lua'
local t_ratioModes = {
	vs100kumite = true,
	worldtour = true,
	timeattack = true, -- present in the old build's mode list
	survival = true,   -- user reports this one too; remove if it should not
}
hook.add("main.t_itemname", "sfaz_missionluapath", function()
	if type(gameMode) ~= 'function' then return end
	local gm = gameMode()
	local want = t_ratioModes[gm] == true
	-- DO NOT ADD TEAM ARCADE HERE. It was tried, to get the second intro
	-- storyboard into simul/turns/tag/ratio, and it broke the mode completely:
	-- battles ended the instant they started and dropped back to the select
	-- screen. main.luaPath is not a decoration, it is the script that RUNS THE
	-- MATCHES. Team arcade is roster-driven, and the file that walks
	-- start.t_roster and calls launchFight is external/script/default.lua;
	-- kumitepath.lua has no gamemode('arcade') block at all, so pointing team
	-- arcade at it left the mode with no driver.
	--
	-- The modes listed above are different: each has its own block in
	-- kumitepath.lua that calls launchFight itself. Only add a mode here if
	-- kumitepath actually drives it.
	if want and main.f_fileExists(RATIOPATH) then
		main.luaPath = RATIOPATH
	end
end)

hook.add("start.f_selectMode.luaPath", "sfaz_ratiopath", function(path)
	if gameMode('vs100kumite') or gameMode('worldtour') or gameMode('timeattack') then
		local charData = start.f_getCharData(start.p[1].t_selected[1].ref)
		local rp = charData.ratiopath
		if type(rp) ~= 'string' or rp == '' then
			rp = f_readRatiopath(charData.def)
			-- resolve like main.lua does for arcadepath (char dir, root, motif dir, data/)
			if rp ~= '' and not main.f_fileExists(rp) then
				local dir = charData.def:gsub('[^/\\]+%.def$', '')
				for _, prefix in ipairs({dir, motif.fileDir or '', 'data/'}) do
					if main.f_fileExists(prefix .. rp) then
						rp = prefix .. rp
						break
					end
				end
			end
		end
		if type(rp) == 'string' and rp ~= '' then
			if not main.f_fileExists(rp) then
				panicError("\n" .. charData.name .. " ratiopath doesn't exist: " .. rp .. "\n")
			end
			return rp
		end
	end
	return nil
end)

--;===========================================================
--; TEAM SIZE RESET (was: start.lua f_selectReset edit)
--; On hard reset simul team size starts at 2 in co-op modes, 1 otherwise.
--;===========================================================
hook.add("start.f_selectReset.side", "sfaz_numsimul", function(side, hardReset, preserveProgress, p)
	if hardReset then
		if main.coop then
			p.numSimul = 2
		else
			p.numSimul = 1
		end
	end
end)

--;===========================================================
--; VICTORY SCREEN MATCH COUNTER (was: start.lua txt_matchno /
--; start.f_getMatchNumber, drawn by the old Lua-side victory screen)
--;
--; The 2026 engine renders the victory screen itself and dropped the "matchno"
--; element, so the number rides on the engine's winquote element instead (see
--; the [Victory Screen] note in data/system.def -- it is positioned with the
--; old matchno offset/font, and no character defines victory quotes, so the
--; slot is otherwise unused). Called before each fight; matchNo() here is the
--; match about to be played, which is the same value the old build displayed
--; on the post-match victory screen (it drew before setMatchNo(matchno()+1)).
--;===========================================================
--;===========================================================
--; FINAL MATCH NUMBER PER GAME MODE
--; Old build compared matchno() against #start.t_roster. Custom arcadepath
--; runs no longer populate that table, so derive the same total from the
--; select.def "<mode>.maxmatches" values (the numbers f_makeRoster used), with
--; explicit lengths for the mission modes whose rosters live in the modules.
--;===========================================================
-- NOTE: these must match the LAST match number the path lua actually plays
-- (arcadepath/kumitepath.lua), not just the roster loop. Nothing derives them
-- automatically, so if you shorten a path for testing the results screen will
-- not appear until this number comes down to match -- that is what the
-- "finalMatch=40 match=1" line in save/logs/sfaz_screenflags_debug.txt means.
-- For a quick test without touching these, create an empty save/sfaz_shortrun,
-- which forces the run length to 1 for EVERY mode (see the lever below).
local t_fixedLength = {
	worldtour = 40,    -- kumitepath.lua "MATCH 40" / worldtour.lua roster loop
	vs100kumite = 100, -- external/mods/vs100kumite.lua roster loop
}
-- Survival modes are deliberately absent: they keep their own consecutive-wins
-- rule further below (old ledger item G). Bossrush is absent too, so the engine's
-- normal roster-based suppression applies (it builds a real roster).
local t_maxMatchesKey = {
	arcade = 'arcademaxmatches',
	teamarcade = 'teammaxmatches',
	teamcoop = 'teammaxmatches',
	netplayteamcoop = 'teammaxmatches',
	timeattack = 'timeattackmaxmatches',
}
local function f_finalMatchNo()
	if type(gameMode) ~= 'function' then
		return nil
	end
	local mode = gameMode()
	if t_fixedLength[mode] ~= nil then
		return t_fixedLength[mode]
	end
	local key = t_maxMatchesKey[mode]
	local t = key and main.t_selOptions and main.t_selOptions[key]
	if type(t) ~= 'table' then
		return nil
	end
	local total = 0
	for _, v in ipairs(t) do
		if v == -1 then
			return nil -- infinite matches (e.g. endless survival): no final match
		end
		total = total + v
	end
	if total <= 0 then
		return nil
	end
	return total
end

-- Read the ORIGINAL [Victory Screen] matchno.* params (text/offset/font) plus the
-- [Files] font list straight from the motif file: the engine drops unknown motif
-- params, so they never reach the motif table.
local t_matchno, t_fontFiles = {}, {}
do
	local path = gameOption('Config.Motif')
	if type(path) ~= 'string' or path == '' then path = 'data/system.def' end
	local fh = io.open(path, 'r')
	if fh then
		local section = ''
		for line in fh:lines() do
			local body = line:gsub(';.*$', '')
			local sec = body:match('^%s*%[%s*([^%]]-)%s*%]')
			if sec then
				section = sec:lower()
			else
				local k, v = body:match('^%s*([%w_.]+)%s*=%s*(.-)%s*$')
				if k and v and v ~= '' then
					k = k:lower()
					if section == 'victory screen' then
						local sub = k:match('^matchno%.(.+)$')
						if sub then t_matchno[sub:gsub('%.', '_')] = v end
					elseif section == 'files' then
						local n = k:match('^font(%d+)$')
						if n then t_fontFiles[tonumber(n)] = v end
					end
				end
			end
		end
		fh:close()
	end
end

-- Build our own text sprite for the counter (the engine's victory screen has no
-- matchno element, and its winquote slot is re-initialised by the engine each
-- time the screen opens, so writing to that only ever showed the boot value).
local matchnoTxt
do
	local fontSpec = t_matchno.font
	local offset = t_matchno.offset
	if fontSpec and offset then
		local fidx = tonumber(fontSpec:match('^%s*(-?%d+)'))
		local bank = tonumber(fontSpec:match('^%s*-?%d+%s*,%s*(-?%d+)')) or 0
		local align = tonumber(fontSpec:match('^%s*-?%d+%s*,%s*-?%d+%s*,%s*(-?%d+)')) or 0
		local ox = tonumber(offset:match('^%s*(-?[%d.]+)'))
		local oy = tonumber(offset:match(',%s*(-?[%d.]+)'))
		local file = fidx and t_fontFiles[fidx] or nil
		if file and ox and oy then
			-- fontNew() returns a usable-looking object even for a missing path
			-- (which then draws nothing), so probe the file first
			local fnt
			for _, cand in ipairs({'data/' .. file, file, 'font/' .. file}) do
				if main.f_fileExists(cand) then
					local ok, res = pcall(fontNew, cand)
					if ok and res then fnt = res break end
				end
			end
			if fnt then
				matchnoTxt = textImgNew()
				-- without this the element is laid out in the engine's default
				-- 320x240 space instead of the screenpack's, which shifts it
				if motif.info ~= nil and type(motif.info.localcoord) == 'table' then
					pcall(textImgSetLocalcoord, matchnoTxt,
						motif.info.localcoord[1] or 320, motif.info.localcoord[2] or 240)
				end
				textImgSetFont(matchnoTxt, fnt)
				textImgSetBank(matchnoTxt, bank)
				textImgSetAlign(matchnoTxt, align)
				textImgSetPos(matchnoTxt, ox, oy)
			end
		end
	end
end

--; Draw the match counter with an EXPLICIT number, bypassing the usual
--; roundState/winnerteam gate below.
--;
--; The early victory screen (external/mods/sfaz_earlyvictory.lua) needs this for
--; two reasons. It runs its own Lua loop, so it never reaches the "loop" hook
--; that normally draws the counter; and even if it did, that hook requires
--; roundState() == 0 and winnerteam() == 1, neither of which is true before a
--; single match has been played. It asks for 0, which reads as "no matches yet".
--; `dx`/`dy` offset it for this frame only and are put back afterwards, so the
--; resting position configured by matchno.offset is never disturbed.
function sfazDrawMatchNo(n, dx, dy)
	if matchnoTxt == nil then return false end
	local fmt = t_matchno.text or '%i'
	fmt = fmt:gsub('^"(.*)"$', '%1')
	textImgSetText(matchnoTxt, (fmt:gsub('%%[0-9]*[is]', tostring(n))))
	dx, dy = tonumber(dx) or 0, tonumber(dy) or 0
	if dx ~= 0 or dy ~= 0 then
		textImgAddPos(matchnoTxt, dx, dy)
		textImgDraw(matchnoTxt)
		textImgAddPos(matchnoTxt, -dx, -dy)
	else
		textImgDraw(matchnoTxt)
	end
	return true
end

local function f_matchnoString()
	local n = matchNo()
	if n == nil or n < 1 then return nil end
	local fmt = t_matchno.text or '%i'
	fmt = fmt:gsub('^"(.*)"$', '%1')
	-- same substitution the old main.f_extractText did for %i / %s
	return (fmt:gsub('%%[0-9]*[is]', tostring(n)))
end

-- Draw it every frame while the engine's victory screen is up. The per-frame
-- match loop hook keeps running there, which is also how the old build drew this
-- element (start.f_victory ran from global.lua's loop at match end).
local mnFrames = 0
hook.add("loop", "sfaz_matchno", function()
	if matchnoTxt == nil then return end
	-- winnerteam() == 1 (P1 won), NOT ~= -1.
	--
	-- The victory screen only appears when the player WINS; a loss goes to the
	-- game over screen instead. The old test accepted any decided result, so it
	-- matched the loss path too and drew the match counter over game over.
	--
	-- Do NOT gate this on motifState('victoryscreen'): sys.motif.vi.active is
	-- only set inside MotifVictory.step(), and this per-frame match loop runs in
	-- a different phase, so it reads false here and suppresses the counter
	-- everywhere.
	local rs = roundState()
	if rs == 0 and winnerteam() == 1 then
		-- Only while the victory screen itself is up. roundState stays 0 well
		-- past it (through the win screen), so bound it two ways:
		--   * the victory screen is suppressed past match 9 anyway (see the
		--     launchFight hook), and lasts victory_screen.time frames;
		--   * once the win screen takes over it puts the winner into the state
		--     from [Win Screen] p1.win.state (19000 here), which the victory
		--     screen never does.
		local vsTime = 360
		if motif.victory_screen and type(motif.victory_screen.time) == 'number' then
			vsTime = motif.victory_screen.time
		end
		player(1)
		local winScreenPose = stateNo() ~= nil and stateNo() >= 19000
		if matchNo() > 9 or mnFrames > vsTime or winScreenPose then
			mnFrames = mnFrames + 1
			return
		end
		local s = f_matchnoString()
		if s ~= nil then
			textImgSetText(matchnoTxt, s)
			textImgDraw(matchnoTxt)
			mnFrames = mnFrames + 1
			if _G.SFAZ_DEBUG_MATCHNO and mnFrames % 60 == 1 then
				local fh = io.open('save/logs/matchno.txt', 'a')
				if fh then
					fh:write(string.format('frame %d: roundState=%s winnerteam=%s matchNo=%s text=%q\n',
						mnFrames, tostring(rs), tostring(winnerteam()), tostring(matchNo()), s))
					fh:close()
				end
			end
		end
	elseif rs ~= 0 then
		mnFrames = 0
	end
end)

local function f_setMatchCounter()
	-- kept for the engine's own winquote slot (harmless if the engine
	-- overwrites it); the authoritative counter is drawn above.
	local vs = motif and motif.victory_screen
	local wq = vs and vs.winquote
	if wq == nil or type(matchNo) ~= 'function' then
		return
	end
	local n = matchNo()
	if n == nil or n < 1 then
		return
	end
	local txt = string.format('%d', n)
	wq.text = txt
	if wq.TextSpriteData ~= nil and type(textImgSetText) == 'function' then
		textImgSetText(wq.TextSpriteData, txt)
	end
end

--;===========================================================
--; PER-MATCH SCREEN FLAGS (was: start.lua f_victoryInit / t_resultData edits)
--;===========================================================
-- Cache of motif flags already pushed to the engine.
--
-- setMotifElements() re-applies element state, so calling it on every match
-- launch (which this hook does, for victoryscreen and winscreen) re-arms the
-- motif fades and produces visible fade-out/fade-in between matches. The flags
-- only need pushing when their value actually CHANGES, which is rare -- so
-- remember what was last sent and skip redundant calls.
local t_motifFlagCache = {}

hook.add("launchFight", "sfaz_screenflags", function(common, t, data)
	-- Both MotifVictory.isEnabled() and MotifWin.isEnabled() (src/motif.go) do:
	--     if sys.sel.gameParams != nil { return sys.sel.gameParams.<Screen> }
	--     return <motif-level flag>
	-- so whenever gameParams is nil the per-match launch params are ignored and
	-- the motif-level flag decides -- and that flag defaults to true. Setting
	-- t.victoryscreen / t.winscreen alone is therefore not enough; the decision
	-- has to be pushed into the engine too, via the same setter start.lua:313
	-- uses. This one helper covers both screens.
	-- Set ONE motif flag in the engine.
	--
	-- Do NOT call setMotifElements(main.motif) with the whole table: it iterates
	-- every key it recognises and re-applies all of them on each match launch,
	-- which is what blanked the VS-screen portraits for characters that have a
	-- separate CPU .def (Ryu/Rose/Sagat). setMotifElements switches per key, so
	-- handing it a single-key table changes only that flag.
	local function f_setMotifFlag(k, v)
		if main ~= nil and main.motif ~= nil then
			main.motif[k] = v
		end
		-- Only touch the engine when the value actually changes; see the note on
		-- t_motifFlagCache above (redundant calls caused between-match fades).
		if t_motifFlagCache[k] == v then
			return
		end
		t_motifFlagCache[k] = v
		if type(setMotifElements) == 'function' then
			setMotifElements({[k] = v})
		end
	end

	-- SFA2-style map/victory screen: first 9 matches only, and NEVER in World
	-- Tour (which shows its own storyboard between fights instead).
	--
	-- Previously this only ever set t.victoryscreen and left the engine flag
	-- alone. When the engine-flag sync was added it started forcing the flag
	-- TRUE on every match <= 9, which switched the victory screen ON in World
	-- Tour where it had been off -- and each extra screen brought its own
	-- fade-out/fade-in, which is where the fades between matches came from.
	-- Decide once, explicitly, and apply the same value to both.
	--
	-- It must only ever turn the victory screen OFF, never on. Starting from a
	-- hardcoded "true" overrode modes that had already decided against it:
	-- main.lua sets main.motif.victoryscreen = false for Time Attack, and this
	-- hook forced it back on, so it played and interrupted the rounds.
	-- t.victoryscreen already holds that decision (start.lua:
	-- main.f_arg(data.victoryscreen, main.motif.victoryscreen)), so start there.
	local showVictory = t.victoryscreen
	if showVictory == nil then
		showVictory = main.motif.victoryscreen
	end
	if gameMode('worldtour') then
		showVictory = false
	elseif type(matchNo) == 'function' and matchNo() > 9 then
		showVictory = false
	end
	t.victoryscreen = showVictory
	f_setMotifFlag('victoryscreen', showVictory)
	if showVictory then
		f_setMatchCounter()
	end
	-- Win screen ("ALL CLEAR") only on the FINAL match of the run.
	--
	-- Old build: start.f_result showed it when matchno() >= #start.t_roster
	-- (the "character has an ending" test was commented out, so it doubles as
	-- the arcade result screen). That worked because the old start.lua built
	-- start.t_roster even for custom arcadepath runs.
	--
	-- The 2026 engine leaves start.t_roster empty when a custom arcadepath is
	-- used (start.lua:1774) and then unconditionally suppresses the win screen
	-- for those runs (start.lua:2316). A previous migration pass compensated by
	-- forcing data.winscreen = true on every arcade match, which is why the win
	-- screen fired after each victory. Instead, work out the same match total
	-- the old roster would have had and only force it on the last one.
	local total = f_finalMatchNo()

	-- TEST LEVER: create an empty file named  save/sfaz_shortrun  and the run is
	-- treated as ending after match 1, so the win screen (and its background /
	-- win pose) can be checked without playing all ten matches. Delete the file
	-- to restore normal length. Costs one io.open per match launch.
	do
		local fh = io.open('save/sfaz_shortrun', 'r')
		if fh then
			fh:close()
			total = 1
		end
	end

	-- Push the decision into the ENGINE as well, not just the launch params.
	--
	-- MotifWin.isEnabled() (src/motif.go) reads:
	--     if sys.sel.gameParams != nil { return sys.sel.gameParams.WinScreen }
	--     return wi.winEnabled
	-- so whenever gameParams is nil the per-match "winscreen" launch param is
	-- ignored entirely and the motif-level flag decides. That flag defaults to
	-- true, which is why "ALL CLEAR" fired after match 1 even though the
	-- diagnostic showed t.winscreen correctly set to false.
	--
	-- setMotifElements() is the same setter start.lua:313 uses; it maps
	-- main.motif.winscreen onto wi.winEnabled.
	local function f_applyWinScreen(enabled)
		f_setMotifFlag('winscreen', enabled) --single key only; see note above
	end

	if data.winscreen ~= nil then
		-- The path lua asked for this match explicitly (launchFight{winscreen=...}).
		-- That always wins: it is the only way a CUSTOM arcadepath can mark its
		-- own final match, because nothing here can know how long such a path is
		-- (t_fixedLength is a hand-maintained guess, and start.t_roster is left
		-- empty for custom paths). Previously the "mid-run" branch below forced
		-- t.winscreen = false regardless, so an explicit request was ignored.
		t.winscreen = data.winscreen
		f_applyWinScreen(data.winscreen and true or false)
	elseif total ~= nil and type(matchNo) == 'function' then
		if matchNo() >= total then
			data.winscreen = true --explicit assignment skips engine auto-suppression
			t.winscreen = true
			f_applyWinScreen(true)
		else
			t.winscreen = false --mid-run: never show it
			f_applyWinScreen(false)
		end
	end

	-- Survival: the results screen mirrors the victory screen's cutoff. The
	-- victory screen shows for matches 1-9 (above), and from match 10 onwards
	-- the results screen takes over.
	--
	-- The old rule counted CONSECUTIVE wins (the ledger's "10+ wins"), which is
	-- not the same thing: a run that drops a match reaches match 10 without ever
	-- reaching 10 straight wins, so the screen never appeared. Keyed on the
	-- match number now, exactly like the victory screen.
	if gameMode('survival') or gameMode('survivalcoop') or gameMode('netplaysurvivalcoop') then
		local reached = type(matchNo) == 'function' and matchNo() >= 10
		if reached then
			if data.winscreen == nil then
				-- Explicit assignment also skips the engine's own suppression of
				-- the win screen while a roster still has matches left
				-- (start.lua: "start.t_roster[matchNo() + 1] ~= nil").
				data.winscreen = true
				t.winscreen = true
			end
			f_applyWinScreen(true) --engine-level flag, see note above
		elseif data.winscreen == nil then
			data.winscreen = false
			t.winscreen = false
			f_applyWinScreen(false)
		end
	end

	-- Decision log, one line per match launch. The victory / win screens are
	-- decided across three places (this hook, the launch params, and the engine
	-- flag), so when one of them does not appear this says which of the three
	-- said no -- rather than having to reason about it from the source.
	pcall(function()
		local fh = io.open('save/logs/sfaz_screenflags_debug.txt', 'a')
		if fh == nil then return end
		fh:write(string.format(
			'[%s] mode=%s match=%s finalMatch=%s | victory=%s | winscreen: data=%s t=%s motif=%s\n',
			os.date('%H:%M:%S'), tostring(gameMode()),
			tostring(type(matchNo) == 'function' and matchNo()), tostring(total),
			tostring(showVictory), tostring(data.winscreen), tostring(t.winscreen),
			tostring(main.motif.winscreen)))
		fh:close()
	end)
end)