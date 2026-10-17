--;===========================================================
--; IN-GAME CHARACTER ENDINGS - real font text, player-paced
--;
--; The ending that plays after match 10 of single arcade used to be four
--; explods on a fixed clock: a stage backdrop, a picture anim, a frame overlay,
--; and a text anim made of pre-rendered sprites. Every transition in it - the
--; text pages fading in and out, the picture cutting from one shot to the next,
--; the fade to black at the end - was a frame duration in the .air or a
--; "trigger1 = time = N" in the .cns, and none of it could be read at the
--; player's own pace.
--;
--; This replaces the text anim with real font text (typed, word-wrapped,
--; skippable) and re-hangs the picture cuts off the TEXT rather than off the
--; clock. The words live in data/endings/ending_texts.lua.
--;
--;-----------------------------------------------------------
--; HOW IT TALKS TO THE CHARACTER
--;-----------------------------------------------------------
--;
--; Through the character's own map values, written from here with the player()
--; redirect and read in plain .cns as Map(name). mapSet() is redirectable and
--; player(n) sets sys.debugWC, which is the same idiom data/victory_quotes.lua
--; and rank.lua already use for reading. No engine change, no rebuild.
--;
--;   map                 written        meaning
--;   ------------------  -------------  -----------------------------------
--;   sfaz_end_active     every frame    1 = this mod is driving the ending.
--;                                      The .cns spawns the font-driven set of
--;                                      explods on 1 and the ORIGINAL sprite
--;                                      set on 0, so a missing mod, a missing
--;                                      data file or an unconverted character
--;                                      all fall back to the old behaviour.
--;   sfaz_end_cue1..4    on page change the anim element the current page cues
--;                                      for each animated LAYER. Channel k
--;                                      addresses the explod with ID 10000 + k;
--;                                      the .cns hands each to ModifyExplod /
--;                                      animelem and latches it so it fires once
--;                                      per change.
--;
--; An ending is SEVERAL animated layers on one clock, not one - typically a
--; backdrop out of data/fightfx.air with the character layer in front of it, and
--; up to four for Kbee and Vega. Cue only some of them and the rest keep running
--; on gameticks and drift. See the two-layer note in
--; data/endings/ending_texts.lua.
--;   sfaz_end_flash      on shot change the page number, whenever a page CHANGES
--;                                      a layer's shot. The .cns latches it and
--;                                      spawns F9999 - a 21 tick black blink -
--;                                      over the pictures and under the F10099
--;                                      frame, and the cue below is held back
--;                                      FLASH_LEAD ticks so the cut happens
--;                                      while the screen is black. Picture
--;                                      layers must NOT fade: a transparent
--;                                      layer shows the live stage through it.
--;   sfaz_end_done       once           1 when the last page has been
--;                                      dismissed. The .cns leaves 18800 for
--;                                      the outro state on this.
--;
--; Note what is NOT in that list: page numbers. The .cns never learns how many
--; pages there are or which one is up - it only ever sees "put the picture on
--; element N". All the per-character knowledge stays in the Lua data file,
--; which is what makes the .cns block identical for every character.
--;
--;-----------------------------------------------------------
--; WHY ModifyExplod / animelem AND NOT ModifyExplod / anim
--;-----------------------------------------------------------
--;
--; ModifyExplod's "anim" parameter is gated on the character declaring an
--; ikemenversion (src/bytecode.go: "You could not modify this one in Mugen").
--; None of this roster declares one, so anim is unavailable and would silently
--; do nothing. "animelem" carries no such gate, so the picture stays ONE anim
--; and the cues are element jumps into it. That is why the .air gets a cued
--; COPY of each animated layer rather than a set of separate per-shot anims.
--;
--; And the shots in that copy WAIT on a large finite duration, not on -1.
--; Animation.Action() opens with "if a.curFrame().Time <= 0 { next() }", so a -1
--; frame does not hold anywhere except as an action's final frame - elsewhere it
--; falls straight through and next() skips past every following -1. Getting that
--; wrong makes every cue land on the last shot with the earlier sprites never
--; appearing, which is a very recognisable symptom.
--;
--;-----------------------------------------------------------
--; WHY THE TEXT IS NOT DRAWN AS AN EXPLOD
--;-----------------------------------------------------------
--;
--; It cannot be. Lua draw operations are queued into sys.luaDrawLayerOps and
--; flushed in renderFrame() AFTER the whole scene, so all three Lua layers land
--; on top of every explod regardless of sprpriority. That is fine for the text,
--; which was the top layer anyway - but it is exactly why the PICTURE stays an
--; explod: drawn from Lua it would cover the F10099 frame overlay that is
--; supposed to sit over it.
--;===========================================================

--;-------------------------------------------------------------------
--; TUNABLES
--;-------------------------------------------------------------------
local FONT_FILE   = 'sfa2_dialogue.fnt'
local FONT_HEIGHT = -1              -- -1 = use the font file's own height

-- The fight screen's own coordinate space (data/fight.def [Info] localcoord),
-- NOT system.def's and NOT the character's. This text is drawn over a live
-- match. Same reasoning as external/mods/sfaz_winquote.lua.
local LOCALCOORD_W, LOCALCOORD_H = 384, 222

-- THE BOX, and where it comes from.
--
-- The old text sprites are 308 wide with axis (-38,-158), so they occupied
-- x 38..346, y 158..210 - and the picture sprites above them (axis (-64,-16),
-- 256x128) occupied y 16..144. Those are read straight out of the .sff headers,
-- not guessed. 346 also happens to be the right edge sfaz_winquote.lua arrived
-- at independently by hand, which is a useful cross-check that this is the
-- right coordinate frame.
local WINDOW = {38, 150, 346, 216}   -- x1, y1, x2, y2
local BAND   = {160, 210}            -- top, bottom of the old sprite band

-- *** ALIGNMENT AND X ARE ONE SETTING. ***
-- getLineLength() derives the wrap width from BOTH, so they cannot be chosen
-- separately - see data/Intros/Intro_Adon.def for the full write-up.
--   align 1 (left)   -> width = WINDOW right - x
--   align 0 (centre) -> width = min(x - WINDOW left, WINDOW right - x) * 2
-- Both settings below deliberately yield 308, the original sprite width:
--   left:   346 - 38            = 308
--   centre: min(154, 154) * 2   = 308
local X_LEFT   = 38
local X_CENTER = 192                 -- (38 + 346) / 2

-- Alignment for pages NOT listed in a character's 'center' table. Overridden
-- per character by the third field of its 'font' entry.
-- 0 = centre, 1 = left, -1 = right.
local ALIGN_DEFAULT = 1

--;-------------------------------------------------------------------
--; PORTRAITS
--;-------------------------------------------------------------------
--; The small speaker face that the ORIGINAL art had baked into the left of each
--; text sprite, put back as a real sprite. Which face a page shows comes from
--; the character's own 'faces' table in data/endings/ending_texts.lua; the
--; drawing is an explod in the .cns, driven by the map values written below.
--;
--; *** ONE PLACE TO MOVE EVERY PORTRAIT. ***
--; Finding the right spot is trial and error, so the offset is handed to the
--; .cns as a map value rather than baked into 46 .air axes: change these two
--; numbers, restart, look. Nothing needs recropping or reconverting.
--; x is positive right, y positive down, in the 384x222 fight-screen space.
local FACE_OFFSET = {0, 0}

--; How far the TEXT moves right on a page that has a portrait, so the words
--; clear it. The original strips put a 26px face at x13 inside a box starting
--; at x38, i.e. the text began 46px in - hence the default.
--; This feeds the wrap width too (see f_lineWidth): moving the text without
--; narrowing the line would just push the overflow off the right edge.
local FACE_INSET = 46

-- CUE CHANNELS. Channel k drives the ending explod carrying ID 10000 + k, via
-- the map value named below. Four exist because Kbee and Vega each animate four
-- layers; most characters use one or two.
--
-- Raising this means adding the matching ModifyExplod/MapSet pair to the .cns
-- of every character that needs it - the map name alone does nothing. It is
-- mirrored as SFAZ_END_CHANNELS in data/endings/ending_texts.lua.
local CHANNELS = 10

--; F9999's darkness, tick by tick, as a multiplier for anything that has to
--; look like it is UNDERNEATH the blink. Read straight off the action:
--;
--;   8000,7 / 6 / 5 / 4 / 3   one tick each   (darkening)
--;   8000,2                   six ticks       (full black)
--;   8000,3 / 4 / 5 / 6 / 7   two ticks each  (lightening)
--;
--; Sprite 8000,2 is the darkest of the roster's fade set and 8000,7 the
--; lightest, so darkness is (7 - index) / 5 and what survives is (index - 2)/5.
--; 21 ticks total; past the end the caller stops applying it.
local BLINK = {
	1.0, 0.8, 0.6, 0.4, 0.2,
	0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
	0.2, 0.2, 0.4, 0.4, 0.6, 0.6, 0.8, 0.8, 1.0, 1.0,
}
local CUE_MAP  = {'sfaz_end_cue1', 'sfaz_end_cue2', 'sfaz_end_cue3', 'sfaz_end_cue4', 'sfaz_end_cue5', 'sfaz_end_cue6', 'sfaz_end_cue7', 'sfaz_end_cue8', 'sfaz_end_cue9', 'sfaz_end_cue10'}

-- Draw layer. MUST equal the layer passed to textImgDraw: TextSprite.draw
-- early-returns on "ts.layerno != ln", silently. textImgNew() defaults it to 0.
local LAYERNO = 2

local COLOR = {255, 255, 255, 255}   -- full white = no tint, see BANK below
local BANK  = 0                      -- font PALETTE bank, not a tint
local TEXT_DELAY   = 2               -- ticks per character
local TEXT_SPACING = {0, -3}
local LINE_H       = 14              -- line advance, for vertical centring

-- Page transition. The original faded each page in over 7 ticks, held it, faded
-- it out over 7 and left a 6 tick gap before the next - so these reproduce the
-- original rhythm, with the HOLD replaced by "wait for the player".
local FADE_TICKS = 7
local GAP_TICKS  = 6

-- SHOT TRANSITION.
--
-- The picture layers do NOT fade between shots. Fading one means it is
-- transparent for those frames, and what shows through is the live stage behind
-- the ending - a flash of it on every shot change. Several endings deliberately
-- want the stage visible, so covering it permanently is not an option either.
--
-- Instead the .cns spawns F9999, the roster's own black blink (21 ticks:
-- darken over 5, hold black 6, lighten over 10), over the picture layers and
-- under the F10099 frame. This mod's job is to say WHEN, and to hold the cue
-- back until the screen is actually black so the cut happens unseen.
--
-- FLASH_LEAD is that delay: 6 ticks in, F9999 is at its darkest.
local FLASH_LEAD = 6
-- Whether the first page flashes. Off by default - the ending has only just
-- faded up from black (statedef 188 spawns its own F9999 before 18800 starts),
-- so blinking again immediately reads as a stutter.
local FLASH_ON_FIRST = false

-- getInput's BUTTON tokens are already edge-triggered engine-side: uiRawInput
-- tests "ib.ab == 1", i.e. the buffer counter being exactly 1, which is only
-- true on the frame the button goes down. (Its DIRECTION tokens are not - those
-- carry UI auto-repeat while held - which is one reason none are listed here.)
-- The st.held latch below is therefore a guard, not the mechanism.
--
-- One thing to know if a third mod ever wants the same buttons in the same
-- frame: uiConsumeTokenThisFrame() lets a token fire only ONCE per frame, so
-- whichever mod calls getInput first consumes it and the other sees nothing.
-- That is safe here because sfaz_winquote.lua only runs for states 180-189 and
-- this only runs for 18800-18899, so the two can never be live together.
local KEYS = {'a', 'b', 'c', 'x', 'y', 'z'}

-- Ends the whole ending at once, the way start cancels a storyboard or a
-- dialogue. Deliberately NOT one of the advance buttons: those are pressed
-- constantly to page through, and sharing them would make a mistimed press
-- throw the rest of the ending away.
local SKIP_ALL_KEYS = {'s'}

--;-------------------------------------------------------------------
--; ONE-TIME SETUP
--;-------------------------------------------------------------------
if type(sfazEndingFor) ~= 'function' then
	local path = 'data/endings/ending_texts.lua'
	if main ~= nil and type(main.f_fileExists) == 'function' and main.f_fileExists(path) then
		local ok, err = pcall(function() assert(loadfile(path))() end)
		if not ok and type(panicError) == 'function' then
			panicError('\nsfaz_ending_text: could not load ' .. path .. '\n' .. tostring(err) .. '\n')
		end
	end
end

--;-------------------------------------------------------------------
--; FONT SELECTION
--;
--; A character may name its own font, palette bank and default alignment in the
--; STORYBOARD SPELLING - the same "file, bank, align" triple written on a
--; storyboard .def font line:
--;
--;     font = 'sfa2_dialogue.fnt, 2, 0'
--;
--; BANK is a palette index inside the .fnt itself, NOT a tint. It selects
--; between colourings the font file already carries, so the glyphs keep their
--; own shading - which is why COLOR below stays full white. sfa2_dialogue.fnt
--; has 15 banks (0-14). An out-of-range bank falls back to 0 SILENTLY, so a
--; typo reads as "the colour did not change" rather than as an error.
--;
--; ALIGN (the third field) is the default for pages NOT listed in 'center';
--; centred pages are always 0. 0 = centre, 1 = left, -1 = right.
--;-------------------------------------------------------------------
local function f_parseFont(spec)
	--; -> file, bank, align  (any may be nil, meaning "use the default")
	if type(spec) == 'number' then
		return nil, spec, nil                   -- bare number = just the bank
	end
	if type(spec) == 'table' then
		return spec[1], tonumber(spec[2]), tonumber(spec[3])
	end
	if type(spec) ~= 'string' then
		return nil, nil, nil
	end
	local f, b, a = nil, nil, nil
	local n = 0
	for field in (spec .. ','):gmatch('([^,]*),') do
		n = n + 1
		local v = field:match('^%s*(.-)%s*$')
		if n == 1 then
			f = (v ~= '') and v or nil
		elseif n == 2 then
			b = tonumber(v)
		elseif n == 3 then
			a = tonumber(v)
		end
	end
	return f, b, a
end

local ts, fnt, fntFile
local fontCache = {}

--; Rebuilt when the FONT FILE changes rather than mutated in place: the setters
--; below are order-dependent (SetLocalcoord bakes localScale into everything
--; SetWindow/SetPos then store), so re-running them on a live sprite is a good
--; way to get subtly wrong geometry. Building fresh keeps one correct order.
local function f_ensureTextSprite(file)
	file = file or FONT_FILE
	if ts ~= nil and fntFile == file then
		return
	end
	if fontCache[file] == nil then
		fontCache[file] = fontNew(file, FONT_HEIGHT)
	end
	fnt = fontCache[file]
	fntFile = file
	ts = textImgNew()
	textImgSetFont(ts, fnt)
	textImgSetColor(ts, COLOR[1], COLOR[2], COLOR[3], COLOR[4])
	textImgSetBank(ts, BANK)
	-- Must precede SetWindow/SetPos: both bake localScale into what they store.
	textImgSetLocalcoord(ts, LOCALCOORD_W, LOCALCOORD_H)
	textImgSetLayerno(ts, LAYERNO)
	textImgSetWindow(ts, WINDOW[1], WINDOW[2], WINDOW[3], WINDOW[4])
	textImgSetTextSpacing(ts, TEXT_SPACING[1], TEXT_SPACING[2])
	textImgSetTextDelay(ts, TEXT_DELAY)
end

--;-------------------------------------------------------------------
--; WORD WRAP
--;
--; The engine's own wrapText() is unreachable from Lua - it is called only from
--; Go, and TextSprite.Draw() splits on newlines and nothing else, so
--; textImgSetTextWrap() sets a flag no code on this path reads. Measured here
--; with textImgGetTextWidth instead, deriving the width exactly as
--; getLineLength() does.
--;-------------------------------------------------------------------
local function f_lineWidth(centered, inset)
	inset = inset or 0
	local v = LOCALCOORD_W
	if LOCALCOORD_W * 3 > LOCALCOORD_H * 4 then
		v = LOCALCOORD_H * 4 / 3
	end
	local localScale = 320 / v
	if centered then
		local a = X_CENTER - WINDOW[1]
		local b = WINDOW[3] - X_CENTER
		return math.min(a, b) * 2 * localScale
	end
	return (WINDOW[3] - X_LEFT - inset) * localScale
end

--; Explicit breaks, accepting a real newline or a literal backslash-n.
--;
--; The gsub result MUST land in its own local first. Chaining it inline -
--;     for para in (text:gsub('\\n', '\n') .. '\n'):gmatch('(.-)\n')
--; - crashes gopher-lua outright with a nil pointer dereference, which in the
--; engine means the crash lands inside a per-frame hook during the ending.
--; Verified by running this mod under tools/luarun. sfaz_winquote.lua already
--; uses the two-step form; that is not a stylistic difference, it is the reason
--; it works.
local function f_paragraphs(text)
	local out = {}
	local normalised = text:gsub('\\n', '\n')
	for para in (normalised .. '\n'):gmatch('(.-)\n') do
		out[#out + 1] = para
	end
	return out
end

local function f_wrap(text, centered, inset)
	if text == nil or text == '' then
		return '', 1
	end
	local maxw = f_lineWidth(centered, inset)
	local lines = {}
	for _, para in ipairs(f_paragraphs(text)) do
		local line = ''
		for word in para:gmatch('%S+') do
			local cand = (line == '') and word or (line .. ' ' .. word)
			-- A single word wider than the box still gets its own line rather
			-- than vanishing - hence the "line ~= ''" guard.
			if line ~= '' and textImgGetTextWidth(ts, cand) > maxw then
				lines[#lines + 1] = line
				line = word
			else
				line = cand
			end
		end
		lines[#lines + 1] = line
	end
	return table.concat(lines, '\n'), #lines
end


--;-------------------------------------------------------------------
--; DIAGNOSTIC  *** remove when the ending work is finished ***
--;
--; Off unless save/sfaz_endinglog exists, so it costs one io.open per ending
--; rather than per frame. Writes save/logs/sfaz_ending_debug.txt: one line when
--; an ending starts, one per page turn, one when it finishes, and one if the
--; mod stands down. That is enough to tell "the mod ended it" from "the .cns
--; ended it", which is the question that keeps coming up and cannot be answered
--; by reading either file.
--;-------------------------------------------------------------------
local LOGGING = nil
local function f_log(msg)
	if LOGGING == nil then
		local fh = io.open('save/sfaz_endinglog', 'r')
		LOGGING = fh ~= nil
		if fh then fh:close() end
	end
	if not LOGGING then
		return
	end
	local fh = io.open('save/logs/sfaz_ending_debug.txt', 'a')
	if fh == nil then
		return
	end
	fh:write(tostring(msg) .. '\n')
	fh:close()
end

--;-------------------------------------------------------------------
--; PER-ENDING STATE
--;-------------------------------------------------------------------
local st = nil       -- nil when no ending is running

local function f_reset()
	st = nil
	if ts ~= nil then
		textImgSetText(ts, '')
	end
end

--; Map values persist on the character for the whole session, so they have to
--; be wiped at the start of a round rather than merely left alone. A stale
--; sfaz_end_done = 1 is the dangerous one: the .cns leaves 18800 the instant it
--; sees it, so an ending would flash past before its first page ever drew.
local function f_clearMaps()
	for i = 1, 2 do
		if player(i) then
			mapSet('sfaz_end_active', 0)
			mapSet('sfaz_end_done', 0)
			mapSet('sfaz_end_flash', 0)
			mapSet('sfaz_end_page', 0)
			mapSet('sfaz_end_face', 0)
			for ch = 1, CHANNELS do
				mapSet(CUE_MAP[ch], 0)
			end
		end
	end
end

--; "chars/SFZ_Ryu/SFZ_Ryu.def" -> "SFZ_Ryu". Folder, not name() - see the note
--; at the top of data/endings/ending_texts.lua.
local function f_charFolder(side)
	if type(start) ~= 'table' or type(start.p) ~= 'table' then
		return nil
	end
	local p = start.p[side]
	if type(p) ~= 'table' or type(p.t_selected) ~= 'table' or p.t_selected[1] == nil then
		return nil
	end
	local ref = p.t_selected[1].ref
	if ref == nil or type(start.f_getCharData) ~= 'function' then
		return nil
	end
	local cd = start.f_getCharData(ref)
	if type(cd) ~= 'table' or type(cd.def) ~= 'string' then
		return nil
	end
	return cd.def:match('([^/\\]+)[/\\][^/\\]+%.def$')
end

--;-------------------------------------------------------------------
--; PAGE SETUP
--;
--; Vertical centring is absolute, not incremental: the block is centred inside
--; the band the original sprites occupied, so a one-line page and a three-line
--; page both sit in the middle of the same box. (sfaz_winquote.lua lifts by a
--; fixed amount per extra line instead; that works there because the art it
--; sits in is a fixed two-line plate.)
--;-------------------------------------------------------------------
--; Forward-declared: f_startPage calls it, and it calls nothing back.
local f_applyStep

local function f_startPage(n)
	local text = st.entry.pages[n]
	local centered = sfazEndingCentered(st.entry, n)
	local align = centered and 0 or st.align
	-- A portrait only insets LEFT-ALIGNED text. A centred page keeps its full
	-- box: centred pages are narration, which the original art drew without a
	-- face, and centring inside a narrowed box would shift the words off the
	-- axis every other page.
	st.face = sfazEndingFace(st.entry, n)
	--; TEMPORARY DIAGNOSTIC - remove once every ending shows its portraits.
	--; One line per page: which ending, which page, what face the table gives,
	--; and whether the table exists at all. That separates "Lua never sent a
	--; face" from "the .cns did not draw the one it was sent".
	pcall(function()
		local fh = io.open('save/logs/sfaz_face_debug.txt', 'a')
		if fh == nil then return end
		fh:write(string.format('%s  %-14s page %-3d face=%-5s facesTable=%s%s',
			os.date('%H:%M:%S'), tostring(st.folder or '?'), n, tostring(st.face),
			tostring(type(st.entry.faces)), '\n'))
		fh:close()
	end)
	local inset = (st.face ~= nil and align ~= 0) and FACE_INSET or 0
	local wrapped, nlines = f_wrap(text, align == 0, inset)

	textImgSetAlign(ts, align)
	local x = ((align == 0) and X_CENTER or X_LEFT) + inset
	local y = BAND[1] + ((BAND[2] - BAND[1]) - nlines * LINE_H) / 2
	-- Per-character nudge. The box is derived from the ORIGINAL sprite axes, so
	-- it is right in principle for every character, but the art it sits in
	-- differs - hence a per-entry offset rather than editing WINDOW/BAND here
	-- and moving every character's text at once.
	textImgSetPos(ts, x + st.offset[1], y + st.offset[2])
	textImgSetText(ts, wrapped)
	textImgSetTextDelay(ts, TEXT_DELAY)
	textImgReset(ts, {"delay"})       -- elapsedTicks = 0, nothing else touched

	f_log('page ' .. n .. '/' .. #st.entry.pages)
	st.page   = n
	st.phase  = 'in'
	st.clock  = 0
	-- IsFullyTyped() is not exposed to Lua, so the reveal is tracked here on the
	-- same arithmetic font.go uses: maxChars = (elapsedTicks + delay) / delay,
	-- so the last character is up once elapsedTicks reaches (len - 1) * delay.
	st.typed  = math.max(0, (#wrapped - 1) * TEXT_DELAY)

	-- Cue the layers for this page. Both are sticky: a page with no cue leaves
	-- the layer where it is, which is what lets three pages share one shot.
	-- Written unconditionally every frame below; the .cns latches them so each
	-- ModifyExplod fires once per change.
	--; Work out this page's cues, but do NOT publish them yet if anything is
	--; actually changing: the shot has to cut while the transition is black.
	--; A page with no cue of its own inherits the one before it (the layer just
	--; stays where it is), so only a real CHANGE triggers a flash.
	--; STEPPED PAGES. A page normally carries one cue per channel. A page whose
	--; shots were left ungrouped (tools/endings/make_cue_anim.group_shots)
	--; carries a LIST, and each button press walks one step along it instead of
	--; turning the page - so a page holding several separate pictures cannot be
	--; skipped past with a single press, and the text stays up until its last
	--; shot is on screen. Bison's control room is five shots on page 10; Akuma's
	--; faces on the moon are two apiece on pages 2 and 3.
	st.steps = {}
	st.nsteps = 1
	for ch = 1, CHANNELS do
		local list = (type(sfazEndingSteps) == 'function')
			and sfazEndingSteps(st.entry, ch, n) or nil
		if list == nil then
			local v = sfazEndingCue(st.entry, ch, n)
			list = (v ~= nil) and { v } or nil
		end
		if list ~= nil then
			st.steps[ch] = list
			if #list > st.nsteps then
				st.nsteps = #list
			end
		end
	end
	f_applyStep(1, n)
end

--; Publish step `k` of the current page. Split out of f_startPage because a
--; stepped page runs it again on every press, and the cut still has to happen
--; behind the black - which is the whole reason cues are staged rather than
--; written straight through.
f_applyStep = function(k, n)
	local pending, changed = {}, false
	for ch = 1, CHANNELS do
		local list = st.steps and st.steps[ch]
		if list ~= nil then
			--; Short lists hold their last value: only one layer usually has
			--; something new to show on any given step.
			local v = list[math.min(k, #list)]
			if v ~= nil then
				pending[ch] = v
				if st.cue[ch] ~= v then
					changed = true
				end
			end
		end
	end

	--; A cue whose target is BLANK needs no transition: the blink is there to
	--; hide a cut between two pictures, and there is nothing to hide when the
	--; layer is simply clearing. sync_cues.py derives which pages those are.
	--; Only the page's FIRST step can be quiet - a step is by definition a cut
	--; between two pictures the player asked for.
	local quiet = (k == 1) and (type(sfazEndingNoFlash) == 'function')
		and sfazEndingNoFlash(st.entry, n) or false

	--; ...and the mirror image. A page whose picture changes ONLY because an
	--; ELEMENT spawns or is removed moves nothing in the cue tables, so
	--; `changed` is false and the scene cuts with no blink at all. The .cns
	--; gates those explods on sfaz_end_page and this mod never learns about
	--; them, so the page has to say so itself. Cammy's page 12: the helicopter
	--; leaves on 11 and London pops in over it on 12.
	--;
	--; First step only - a stepped page's later steps are cue changes by
	--; definition and already flash on their own.
	local forced = (k == 1) and (type(sfazEndingFlash) == 'function')
		and sfazEndingFlash(st.entry, n) or false
	if (changed or forced) and (n > 1 or k > 1 or FLASH_ON_FIRST) and not quiet then
		st.pending = pending          -- applied FLASH_LEAD ticks from now
		--; A COUNTER, not the page number. The .cns latches on "flash changed",
		--; and a stepped page flashes more than once while n stays put - so the
		--; page number would only ever fire the first of them.
		st.flashseq = (st.flashseq or 0) + 1
		st.flash = st.flashseq        -- published immediately, starts F9999
		st.pendclock = 0              -- the black has to land before the cut
		st.blink = 0                  -- dims the text, and hides the stage
	else
		for ch, v in pairs(pending) do
			st.cue[ch] = v
		end
	end
	st.step = k
end

--;-------------------------------------------------------------------
--; MAIN HOOK
--;-------------------------------------------------------------------
hook.add("loop", "sfaz_ending_text", function()
	if roundStart() then
		f_reset()
		f_clearMaps()
		return
	end

	--; Find whoever is playing an ending. Deliberately NOT keyed on
	--; winnerteam(): the ending is a state the character is in, and testing the
	--; state directly means this cannot be fooled by whatever the win flags
	--; happen to say after the last match of a run.
	local side, sn = nil, nil
	for i = 1, 2 do
		if player(i) then
			local s = stateNo()
			if s ~= nil and s >= 18800 and s <= 18899 then
				side, sn = i, s
				break
			end
		end
	end
	if side == nil then
		f_reset()
		return
	end

	--; The type() test is not belt-and-braces: if data/endings/ending_texts.lua
	--; is missing or failed to load, sfazEndingFor is nil and calling it would
	--; throw from inside a per-frame hook. Standing down instead is what makes a
	--; missing data file degrade to the original sprite ending rather than
	--; taking the match down with it.
	local folder = f_charFolder(side)
	local entry = nil
	if folder ~= nil and type(sfazEndingFor) == 'function' then
		entry = sfazEndingFor(folder)
	end
	if entry == nil or type(sfazEndingCentered) ~= 'function'
		or type(sfazEndingCue) ~= 'function' then
		--; No text for this character: stand down completely and leave
		--; sfaz_end_active at 0, which is what makes the .cns spawn the
		--; ORIGINAL sprite text explod and keep its original pacing.
		if st ~= nil then
			f_log('STAND DOWN  folder=' .. tostring(folder)
				.. '  entry=' .. tostring(entry ~= nil))
		end
		f_reset()
		return
	end

	if st == nil or st.folder ~= folder then
		local file, bank, align = f_parseFont(entry.font)
		f_ensureTextSprite(file)

		--; The OFFSET shifts the window by the same amount as the text, which
		--; is why f_lineWidth needs no knowledge of it: every width it computes
		--; is a DIFFERENCE between a window edge and the text x, and both move
		--; together. Offsetting only the text would silently narrow the wrap
		--; and start clipping at the far edge.
		local off = entry.offset
		if type(off) ~= 'table' or type(off[1]) ~= 'number' or type(off[2]) ~= 'number' then
			off = {0, 0}
		end
		textImgSetWindow(ts, WINDOW[1] + off[1], WINDOW[2] + off[2],
		                     WINDOW[3] + off[1], WINDOW[4] + off[2])
		textImgSetBank(ts, bank or BANK)

		st = {
			folder = folder, entry = entry,
			cue = {}, pending = nil, flash = nil, held = false,
			offset = off,
			align = (align ~= nil) and align or ALIGN_DEFAULT,
		}
		f_log('---- ENDING START  ' .. tostring(folder)
			.. '  pages=' .. tostring(#entry.pages)
			.. '  channels=' .. tostring(CHANNELS))
		f_startPage(1)
	end

	--; 18801 is the teardown state - the explods are already gone and the
	--; engine is on its way to the win screen. Nothing left to draw.
	if sn ~= 18800 then
		player(side)
		mapSet('sfaz_end_active', 1)
		return
	end

	--; ---- input ---- (see KEYS: the tokens are already edge-triggered)
	local down = getInput(side, KEYS) and true or false
	local pressed = down and not st.held
	st.held = down

	--; Skip the rest of the ending outright. Jumps straight to done, which is
	--; what the .cns watches to leave 18800 for the outro.
	if getInput(side, SKIP_ALL_KEYS) then
		st.phase = 'done'
	end

	--; ---- staged cue: apply it once the transition has gone black ----
	--; On its OWN counter, not st.clock. A stepped page stages a second cut
	--; without restarting the page (the text must not re-type), so st.clock is
	--; already far past FLASH_LEAD by then and the cut would land a frame later
	--; in plain sight instead of behind the black.
	if st.pending ~= nil and (st.pendclock or 0) >= FLASH_LEAD then
		for ch, v in pairs(st.pending) do
			st.cue[ch] = v
		end
		st.pending = nil
	end
	st.pendclock = (st.pendclock or 0) + 1

	--; ---- phase machine ----
	st.clock = st.clock + 1
	if st.phase == 'in' then
		if pressed then
			--; First press finishes the typing rather than turning the page,
			--; the same two-stage skip the intro storyboards use.
			textImgSetTextDelay(ts, 0)
			st.typed = 0
		end
		if st.clock >= FADE_TICKS and st.clock >= st.typed then
			st.phase = 'hold'
		end
	elseif st.phase == 'hold' then
		--; No timeout here by design: the page waits for the player.
		if pressed then
			if (st.step or 1) < (st.nsteps or 1) then
				--; STEPPED PAGE: the press buys the next SHOT, not the next
				--; page. The words stay where they are until the last picture
				--; on this page is up, which is the point - Bison's control
				--; room ran five shots under one screenful of text and a
				--; single press used to turn the page and lose four of them.
				--; The clock is deliberately NOT reset: the text has already
				--; faded in and typed out, and re-running that would make the
				--; page flicker on every step.
				f_applyStep((st.step or 1) + 1, st.page)
			else
				st.phase = 'out'
				st.clock = 0
			end
		end
	elseif st.phase == 'out' then
		if st.clock >= FADE_TICKS then
			st.phase = 'gap'
			st.clock = 0
		end
	elseif st.phase == 'gap' then
		if st.clock >= GAP_TICKS then
			if st.page >= #st.entry.pages then
				st.phase = 'done'
			else
				f_startPage(st.page + 1)
			end
		end
	end

	--; ---- alpha ramp, mirroring the AS0D256..AS192D256 ramps in the old anim ----
	local a = COLOR[4]
	if st.phase == 'in' then
		a = math.floor(COLOR[4] * math.min(1, st.clock / FADE_TICKS))
	elseif st.phase == 'out' then
		a = math.floor(COLOR[4] * math.max(0, 1 - st.clock / FADE_TICKS))
	elseif st.phase == 'gap' or st.phase == 'done' then
		a = 0
	end

	--; ---- the transition goes OVER the text ----
	--;
	--; It cannot do that by sprpriority. Lua draw operations are queued into
	--; sys.luaDrawLayerOps and flushed in renderFrame() AFTER the whole scene,
	--; so this text lands on top of every explod no matter what priority the
	--; F9999 blink is given - and on a STEPPED page, where the flash fires with
	--; the words already fully up, it read as the screen blinking behind lit
	--; text.
	--;
	--; So the text is dimmed by the same curve instead, which is what being
	--; covered would look like. BLINK is F9999's own frame table read as
	--; darkness: sprite 8000,7 is the lightest of the fade set and 8000,2 the
	--; darkest, held 6 ticks in the middle, so the multiplier is (index - 2) / 5
	--; per tick. Keep the two in step if F9999 is ever retimed.
	if st.blink ~= nil then
		local m = BLINK[st.blink + 1]
		if m == nil then
			st.blink = nil
		else
			a = math.floor(a * m)
		end
	end

	--; ---- tell the character where it is ----
	player(side)
	mapSet('sfaz_end_active', 1)
	for ch = 1, CHANNELS do
		if st.cue[ch] ~= nil then
			mapSet(CUE_MAP[ch], st.cue[ch])
		end
	end
	if st.flash ~= nil then
		mapSet('sfaz_end_flash', st.flash)
	end
	--; The page number itself, for SCENE ELEMENTS - explods that appear on one
	--; page and are removed on another. Those cannot be driven by animelem (a
	--; loop cued that way freezes on its last frame) so the .cns gates their
	--; spawn and removal on this directly. Nothing else reads it.
	mapSet('sfaz_end_page', st.page or 1)

	--; THE SPEAKER PORTRAIT.
	--;
	--; sfaz_end_face is the element number inside the character's face action,
	--; 1-based, or 0 for a page with no portrait - so the .cns block is the same
	--; shape as the picture cues: spawn once, ModifyExplod/animelem, remove on 0.
	--; The two offsets are handed over every frame so FACE_OFFSET above can be
	--; re-tuned without touching a single .cns or .air.
	--; Cleared on the last page as well as on a page with no portrait. Without
	--; this the explod outlives the text: removetime is 999999 and the .cns only
	--; removes it when this reads 0, so the face would sit through the outro and
	--; the fade to black.
	mapSet('sfaz_end_face', (st.phase == 'done') and 0 or (st.face or 0))
	mapSet('sfaz_end_face_x', FACE_OFFSET[1])
	mapSet('sfaz_end_face_y', FACE_OFFSET[2])

	--; WHILE THE TRANSITION IS BLACK, HIDE THE STAGE.
	--;
	--; The ending explods do not cover the whole screen, so what shows around
	--; and through a half-faded blink is the live stage - and the KO'd opponent
	--; lying on it. Statedef 18800 cannot simply assert noBG for its whole
	--; duration: several endings deliberately want the stage seen.
	--;
	--; So it is asserted only for these 21 ticks, from data/common1.cns
	--; [Statedef -4], which is why this works without reconverting a single
	--; character.
	mapSet('sfaz_end_blink', (st.blink ~= nil) and 1 or 0)
	if st.blink ~= nil then
		st.blink = st.blink + 1
	end
	if st.phase == 'done' then
		if not st.loggedDone then
			st.loggedDone = true
			f_log('DONE at page ' .. tostring(st.page)
				.. ' of ' .. tostring(#st.entry.pages))
		end
		mapSet('sfaz_end_done', 1)
	end

	if a > 0 then
		textImgSetColor(ts, COLOR[1], COLOR[2], COLOR[3], a)
		textImgUpdate(ts)
		textImgDraw(ts, LAYERNO)   -- must equal the layerno set above
	end
end)
