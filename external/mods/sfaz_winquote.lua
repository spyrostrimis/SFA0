--;===========================================================
--; IN-FIGHT VICTORY QUOTE - real font text over the win pose
--;
--; Replaces the per-character sprite-based "; Quotes (Chara)" Explod that used
--; to appear in every win-pose statedef (181 and its siblings - see NOT JUST
--; STATE 181 below) with one shared, real-font, typed, word-wrapped, skippable
--; line, sourced from data/victory_quotes.lua.
--;
--; WHY THIS NEEDS NO CNS/ZSS CHANGES AT ALL
--;
--; Every condition the original Explod tested is already readable from Lua
--; through the player() redirect - exactly the idiom external/mods/rank.lua
--; already uses for its own live win-pose overlay ("winnerteam() ~= -1 and
--; player(winnerteam()) and stateNo() < 190 and stateNo() > 179"):
--;
--;   CNS trigger                          Lua equivalent (after player(side))
--;   ----------------------------------   -----------------------------------
--;   GameMode = "arcade"                  gameMode('arcade')
--;   Teammode = Single                    teamMode() == 'single'
--;   MatchOver                            matchOver()
--;   (inside Statedef 181)                stateNo() == 181
--;   time = 250                           time() >= 250
--;
--; So detection, quote selection, typing and skipping are all done here, and
--; the ONLY thing that still needs to change per character is deleting the old
--; sprite Explod block - see tools/remove_winquote_sprites.py. The shared
--; background frame (F9001/F9002), the "Winner" name plate and the character
--; Portrait explods are NOT touched; only the text itself moves to Lua.
--;
--; NOT JUST STATE 181
--;
--; Every character has SEVERAL win-pose statedefs (Akuma: 181-186, one per win
--; animation), and EVERY one carries its own copy of the Quotes explod, always
--; drawing from the SAME quote pool regardless of which pose played. So the
--; detection below checks the same range rank.lua does (180-189), not just
--; 181, and data/victory_quotes.lua holds one pool per CHARACTER, not per pose.
--;
--; RANDOM SELECTION, NOT SEQUENTIAL CHUNKS
--;
--; This is the one place this differs from the character-intro text system.
--; Intro chunks are successive pages of ONE story, shown in order. A victory
--; quote pool is the opposite: N INDEPENDENT one-line quotes, of which ONE is
--; chosen at random per win - exactly what "anim = 9401+(random%N)" did. There
--; is no "press again for the next line": once the chosen quote has finished
--; typing (or been skipped to completion), it just stays up, same as the old
--; sprite did.
--;===========================================================

--;-------------------------------------------------------------------
--; TUNABLES
--;-------------------------------------------------------------------
local FONT_FILE   = 'sfa2_dialogue.fnt'
local FONT_HEIGHT = -1              -- -1 = use the font file's own height

-- 384,222 is data/fight.def's own [Info] localcoord - NOT system.def's
-- (384,224) and NOT a bare guess. This text is drawn over a live match, so it
-- has to share the fight screen's own coordinate space, not the motif's.
local LOCALCOORD_W, LOCALCOORD_H = 384, 224

-- *** offset.x AND align ARE ONE SETTING - see data/Intros/Intro_Adon.def for
-- the full derivation. align 1 (left) needs offset.x AT the window's left
-- edge; the wrap width is then simply (window right - offset.x). Change the
-- window, recompute offset.x, or the box silently narrows to one word a line
-- again - that whole bug hunt is written up there so it does not have to
-- happen twice.
local ALIGN = 1                                  -- 1 = left
local WINDOW = {24, 150, 346, 220}                -- x1, y1, x2, y2

-- NOTE ON TRANSLATING VALUES FROM THE STORYBOARD .def FILES:
-- there they are RELATIVE to "layerall.pos = 192,0", so the intro block's
-- offset.x = -108 actually put the text at x = 192 + (-108) = 84. Nothing
-- adds a base offset here, so the storyboard number has to be pre-added:
-- copying -108 across verbatim puts the text 108 units LEFT of the screen
-- origin, where the window's own left edge (24) then clips essentially all
-- of it. 84 is the faithful translation of the tuned intro layout.
local OFFSET = {65, 203}                          -- x already includes the 192

-- Draw layer. MUST match the layer passed to textImgDraw below: TextSprite.draw
-- bails out immediately on "ts.layerno != ln" (src/font.go), so a mismatch
-- discards the draw silently - no error, no warning, nothing on screen. A fresh
-- textImgNew() defaults layerno to 0, so drawing at 2 without setting this is
-- exactly that silent no-op. 2 = same layer the storyboard text layers use.
local LAYERNO = 2

-- Left deliberately neutral. These are the trailing r,g,b,a of a storyboard
-- font line, and full white means "no tint" - the glyphs then show exactly the
-- colours of whichever palette BANK is selected. Changing this would filter
-- over the font's own artwork, which is not what the bank variants are for.
local COLOR = {255, 255, 255, 255}                -- r, g, b, a

-- Default font palette bank for characters with no "bank" of their own in
-- data/victory_quotes.lua. See the note there for what banks are.
local BANK = 0
local TEXT_DELAY = 2                              -- ticks per character
local TEXT_SPACING = {0, -3}

-- Vertical centring in the background box. The box is a fixed-height piece
-- of art, but the text grows DOWNWARD from OFFSET.y, so a two-line quote
-- hangs lower in the box than a one-line one. Every wrapped line past the
-- first lifts the whole block by this much, which keeps it centred:
--
--   1 line   no shift        2 lines  up by 1x        3 lines  up by 2x
--
-- In localcoord units, not raw pixels - SetPos multiplies by localScale
-- (about 1.07 here), so 10 lands at roughly 11 screen pixels.
local LINE_SHIFT_Y = 6

-- Win-pose window: the character must have been in ANY win-pose state (see
-- NOT JUST STATE 181 above) for at least this many ticks before the quote
-- appears. Matches the sprite version's "time = 250".
local SHOW_AFTER_TICKS = 250

--;-------------------------------------------------------------------
--; ONE-TIME SETUP
--;-------------------------------------------------------------------
if type(sfazVictoryQuoteFor) ~= 'function' then
	local path = 'data/victory_quotes.lua'
	if main ~= nil and type(main.f_fileExists) == 'function' and main.f_fileExists(path) then
		local ok, err = pcall(function() assert(loadfile(path))() end)
		if not ok and type(panicError) == 'function' then
			panicError('\nsfaz_winquote: could not load ' .. path .. '\n' .. tostring(err) .. '\n')
		end
	end
end

local ts, fnt
local function f_ensureTextSprite()
	if ts ~= nil then
		return
	end
	fnt = fontNew(FONT_FILE, FONT_HEIGHT)
	ts = textImgNew()
	textImgSetFont(ts, fnt)
	textImgSetAlign(ts, ALIGN)
	textImgSetColor(ts, COLOR[1], COLOR[2], COLOR[3], COLOR[4])
	-- Default only; re-applied per quote below, since the bank is per character.
	textImgSetBank(ts, BANK)
	-- Must precede SetWindow/SetPos: both bake localScale into the values they
	-- store, so setting the coordinate space afterwards would leave them scaled
	-- for the wrong one.
	textImgSetLocalcoord(ts, LOCALCOORD_W, LOCALCOORD_H)
	textImgSetLayerno(ts, LAYERNO)   -- see LAYERNO above; without this nothing draws
	textImgSetWindow(ts, WINDOW[1], WINDOW[2], WINDOW[3], WINDOW[4])
	-- NOT a mistake that this is absent: TextSprite.textWrap is only consulted
	-- by wrapText(), and wrapText() is called exclusively from Go (dialogue,
	-- victory screen, storyboard layers). Nothing on the Lua textImg* path calls
	-- it, and TextSprite.Draw() does not either - Draw only splits on newlines
	-- and renders. So setting the flag here would achieve precisely nothing;
	-- f_wrap() below does the wrapping instead.
	textImgSetTextSpacing(ts, TEXT_SPACING[1], TEXT_SPACING[2])
	textImgSetPos(ts, OFFSET[1], OFFSET[2])
end

--;-------------------------------------------------------------------
--; WORD WRAP
--;
--; Done here in Lua because the engine's own wrapText() is unreachable from
--; script - see the note in f_ensureTextSprite above. Without this a long
--; quote simply runs past the window and gets clipped.
--;
--; Explicit line breaks written into the quote are preserved: both a real
--; newline (Lua "a\nb") and a literal backslash-n (Lua "a\\nb") are honoured,
--; and each resulting paragraph is wrapped independently.
--;-------------------------------------------------------------------

--; The usable line width, in the same units textImgGetTextWidth() returns
--; ("local 320" space). Mirrors what the engine's getLineLength() computes for
--; align 1 (left):  width = (window RIGHT - text x) * localScale.
--; localScale is derived exactly as TextSprite.SetLocalcoord does, so this
--; tracks LOCALCOORD_W/H automatically instead of hardcoding a number.
local function f_lineWidth()
	local v = LOCALCOORD_W
	if LOCALCOORD_W * 3 > LOCALCOORD_H * 4 then
		v = LOCALCOORD_H * 4 / 3
	end
	local localScale = 320 / v
	return (WINDOW[3] - OFFSET[1]) * localScale
end

--; Split on explicit breaks, accepting either spelling.
local function f_paragraphs(text)
	local out = {}
	local normalised = text:gsub('\\n', '\n')
	for para in (normalised .. '\n'):gmatch('(.-)\n') do
		out[#out + 1] = para
	end
	return out
end

--; Greedy word wrap. Requires ts to exist (textImgGetTextWidth measures with
--; the sprite's own font/bank/spacing), so only call after f_ensureTextSprite.
local function f_wrap(text)
	if text == nil or text == '' then
		return ''
	end
	local maxw = f_lineWidth()
	local lines = {}
	for _, para in ipairs(f_paragraphs(text)) do
		local line = ''
		for word in para:gmatch('%S+') do
			local cand = (line == '') and word or (line .. ' ' .. word)
			-- A single word longer than the box still goes on its own line
			-- rather than vanishing - hence the "line ~= ''" guard.
			if line ~= '' and textImgGetTextWidth(ts, cand) > maxw then
				lines[#lines + 1] = line
				line = word
			else
				line = cand
			end
		end
		lines[#lines + 1] = line
	end
	return table.concat(lines, '\n')
end

--;-------------------------------------------------------------------
--; PER-ROUND STATE
--;-------------------------------------------------------------------
local pickedForState = nil   -- the stateNo() we last picked a quote for, or nil
local function f_reset()
	pickedForState = nil
	if ts ~= nil then
		textImgSetText(ts, '')
	end
end

--; "chars/SFZ_Adon/SFZ_Adon.def" -> "SFZ_Adon". See data/victory_quotes.lua
--; for why this, and not name()/displayName(), is the right key.
local function f_winnerFolder(side)
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
--; MAIN HOOK
--;-------------------------------------------------------------------
hook.add("loop", "sfaz_winquote", function()
	if roundStart() then
		f_reset()
		return
	end

	-- The win pose is over and a motif screen has taken over (victory screen,
	-- results screen, continue screen). The quote belongs to the in-fight pose
	-- only and must not survive into any of them.
	--
	-- The stateNo check further down does NOT cover this: nothing moves the
	-- character out of its win-pose state when the match ends, so it is still
	-- sitting in 181-186 while the victory screen draws over the top, and every
	-- other gate here still passes. postMatch() is the actual boundary -
	-- sys.postMatchFlg is set once the round is fully over, which is strictly
	-- after the pose (the characters assert roundnotover through it, up to
	-- time 710), so this cannot cut the quote short.
	if postMatch() then
		f_reset()
		return
	end

	local side = winnerteam()
	if side ~= 1 and side ~= 2 then
		return
	end
	if not player(side) then
		return
	end
	-- Everything from here on reads sys.debugWC, which player(side) just set.
	local sn = stateNo()
	if gameMode('arcade') ~= true or teamMode() ~= 'single' or not matchOver() then
		return
	end
	if sn < 180 or sn > 189 then
		-- Not a win pose. In practice the postMatch() gate above catches the
		-- end-of-match case first; this covers anything that moves the winner
		-- out of the pose while the match is still live.
		f_reset()
		return
	end
	if time() < SHOW_AFTER_TICKS then
		return
	end

	f_ensureTextSprite()

	if pickedForState ~= sn then
		local folder = f_winnerFolder(side)
		local quote = folder ~= nil and sfazVictoryQuoteFor(folder) or nil
		pickedForState = sn
		local wrapped = f_wrap(quote or '')

		-- Count the breaks f_wrap inserted (plus any written into the quote by
		-- hand) and lift the block to keep it centred in the background art.
		-- Re-applied per quote rather than set once in f_ensureTextSprite,
		-- because it depends on how THIS quote happened to wrap.
		local extraLines = 0
		for _ in wrapped:gmatch('\n') do
			extraLines = extraLines + 1
		end

		-- Per-character font palette bank. Re-applied on every pick, not set
		-- once at setup: the sprite is shared across matches, so without this
		-- the previous winner's bank would persist into the next character's
		-- quote. Falls back to BANK when the character defines none.
		local bank = nil
		if folder ~= nil and type(sfazVictoryQuoteBankFor) == 'function' then
			bank = sfazVictoryQuoteBankFor(folder)
		end
		textImgSetBank(ts, bank or BANK)

		textImgSetText(ts, wrapped)
		textImgSetPos(ts, OFFSET[1], OFFSET[2] - extraLines * LINE_SHIFT_Y)
		textImgSetTextDelay(ts, TEXT_DELAY)   -- restore in case a prior quote was skip-completed
		textImgReset(ts, {"delay"})           -- elapsedTicks = 0, nothing else touched
	end

	-- Skip: finish the current line instantly. Idempotent (setting textDelay to
	-- 0 repeatedly does nothing extra), so no edge-detection/debounce needed -
	-- unlike the intro screens there is no "next chunk" to accidentally skip
	-- past by holding the button.
	if getInput(side, {'a', 'b', 'c', 'x', 'y', 'z'}) then
		textImgSetTextDelay(ts, 0)
	end

	textImgUpdate(ts)
	textImgDraw(ts, LAYERNO)   -- must equal the layerno set above, see LAYERNO
end)
