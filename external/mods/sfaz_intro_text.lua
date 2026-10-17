--;===========================================================
--; CHARACTER INTRO TEXT - injector
--;
--; Puts the story text from data/Intros/intro_texts.lua into the text layers a
--; character intro .def declares, just before that storyboard starts.
--;
--; WHY IT IS DONE THIS WAY
--;
--; The engine already has everything this feature needs - real font text with a
--; letter-by-letter reveal, and a skip queue that finishes the current chunk on
--; one press and advances to the next on another (src/storyboard.go:
--; buildDialogueQueue / revealTextLayer, and the "Skip handling" block in
--; step()). None of that was reachable, because the intros drew their text as
--; SPRITES on layer8 instead of as text layers.
--;
--; So there is no new mechanism here. The .def files declare the layout - box,
--; font, typing speed - and this fills in the words. The split matters: the
--; layout is per character (the art differs), the words are all in one file,
--; which is what makes them editable in one place.
--;
--; TIMING
--;
--; The injector also assigns each chunk its starttime/endtime, so the .def does
--; not have to. Chunk N starts at N * CHUNK_SPACING and ends when chunk N+1
--; starts, which is what makes chunk N vanish as N+1 appears. The spacing is
--; deliberately generous: it is only the "if the player never touches anything"
--; fallback. Pressing skip fast-forwards straight to the next chunk, so the
--; spacing never has to be matched to how long a chunk actually is - which was
--; the whole problem with doing this in sprite animation timings.
--;
--; WHERE IT HOOKS
--;
--; loadStoryboard() populates the text sprites; the first runStoryboard() calls
--; init() -> reset() -> buildDialogueQueue(), which is what reads the text and
--; skips any layer whose text is empty. So the injection has to land between
--; those two, which is exactly the gap main.f_storyboard leaves.
--;===========================================================

local TEXT_DATA = 'data/Intros/intro_texts.lua'

--; Layer numbers the .def files reserve for story text. Kept well clear of the
--; art layers (0-11) so nothing collides.
local FIRST_SLOT = 20
local SLOTS = 8

--; Fallback pacing when nobody presses anything, in ticks. See TIMING above.
local CHUNK_SPACING = 420

--; Load the text table once.
if type(sfazIntroTexts) ~= 'table' then
	if main ~= nil and type(main.f_fileExists) == 'function' and main.f_fileExists(TEXT_DATA) then
		local ok, err = pcall(function() assert(loadfile(TEXT_DATA))() end)
		if not ok and type(panicError) == 'function' then
			panicError('\nsfaz_intro_text: could not load ' .. TEXT_DATA .. '\n' .. tostring(err) .. '\n')
		end
	end
end

--; "data/Intros/Intro_Adon.def" -> "Intro_Adon"
local function f_defName(path)
	if type(path) ~= 'string' then
		return ''
	end
	local name = path:match('([^/\\]+)$') or path
	return (name:gsub('%.[^%.]+$', ''))
end

--; The scene's key in the storyboard's own scene map, e.g. "scene_0".
--;
--; It is NOT simply "scene0". The .def section is written "[Scene 0]" and the
--; loader turns that space into an underscore, so the path modifyStoryboard()
--; wants is "scene_0.layer20.text". Getting this wrong fails in the worst
--; possible way: modifyStoryboard raises, an enclosing pcall eats it, no text is
--; ever written, and every reserved layer then draws whatever the .def left in
--; it. That is exactly how the first version failed.
--;
--; Rather than hardcode either spelling, read the key back off the table
--; loadStoryboard() returned - that is the actual map, whatever it is called.
local function f_sceneKey(s)
	if type(s) ~= 'table' or type(s.scene) ~= 'table' then
		return nil
	end
	for _, k in ipairs({'scene_0', 'scene0', '0'}) do
		if s.scene[k] ~= nil then
			return k
		end
	end
	-- Otherwise take the lowest-numbered key present.
	local best, bestN = nil, nil
	for k in pairs(s.scene) do
		local n = tonumber(tostring(k):match('%d+') or '')
		if n ~= nil and (bestN == nil or n < bestN) then
			best, bestN = k, n
		end
	end
	return best
end

--; Current scene end.time, read out of the table loadStoryboard() returned.
--; Returns nil when it cannot be found, and the caller then leaves end.time
--; alone. (getStoryboardScene() is no use here - it returns the scene INDEX,
--; not the scene.)
local function f_sceneEndTime(s, sceneKey)
	if type(s) ~= 'table' or type(s.scene) ~= 'table' or sceneKey == nil then
		return nil
	end
	local sc = s.scene[sceneKey]
	if type(sc) == 'table' then
		local e = sc['end']
		if type(e) == 'table' and tonumber(e.time) ~= nil then
			return tonumber(e.time)
		end
	end
	return nil
end

--; Write one chunk into its reserved layer. The failure is reported rather than
--; swallowed: modifyStoryboard raises when the path does not resolve, and hiding
--; that is what made the first version fail invisibly.
local function f_setChunk(sceneKey, slot, text, startTime, endTime)
	if type(modifyStoryboard) ~= 'function' or sceneKey == nil then
		return false
	end
	local base = sceneKey .. '.layer' .. slot .. '.'
	local ok, err = pcall(modifyStoryboard, base .. 'text', text)
	if not ok then
		if type(panicError) == 'function' then
			panicError('\nsfaz_intro_text: could not write ' .. base .. 'text\n'
				.. tostring(err) .. '\n\n'
				.. 'The .def is probably missing its story text layers - see\n'
				.. 'data/Intros/Intro_Adon.def for the block.\n')
		end
		return false
	end
	pcall(modifyStoryboard, base .. 'starttime', tostring(startTime))
	pcall(modifyStoryboard, base .. 'endtime', tostring(endTime))
	return true
end

--; PUBLIC. Injects the story text into a storyboard that has ALREADY been
--; loaded, and is a no-op for one that has no text.
--;
--; It is a global, not a wrapper's private business, because main.f_storyboard
--; has more than one wrapper. external/mods/sfaz_storyboard_p1.lua also wraps
--; it, and for any .def carrying p1.* config - which every character intro does
--; - that mod runs its OWN loadStoryboard and its own frame loop, never calling
--; through to the wrapper it replaced. A wrapper here could therefore never see
--; a character intro at all, which is exactly what happened: the text was
--; written into a storyboard object that was then thrown away and reloaded.
--;
--; So whoever performs the load calls this straight afterwards. Both callers do.
function sfazInjectIntroText(path, s)
	local chunks = nil
	if type(sfazIntroTextsFor) == 'function' then
		chunks = sfazIntroTextsFor(f_defName(path))
	end

	local sceneKey = f_sceneKey(s)

	if chunks ~= nil and #chunks > 0 and sceneKey ~= nil then
		local n = #chunks
		if n > SLOTS then
			n = SLOTS -- more chunks than the .def reserved slots for
		end
		for i = 1, n do
			local startTime = (i - 1) * CHUNK_SPACING
			-- The last chunk has no successor to hide it, so it stays up until
			-- the scene itself ends.
			local endTime = 0
			if i < n then
				endTime = i * CHUNK_SPACING
			end
			f_setChunk(sceneKey, FIRST_SLOT + i - 1, chunks[i], startTime, endTime)
		end
		-- Blank any reserved slot this character does not use, so a leftover
		-- value can never linger. buildDialogueQueue skips empty layers.
		for i = n + 1, SLOTS do
			f_setChunk(sceneKey, FIRST_SLOT + i - 1, '', 0, 1)
		end

		-- Make sure the scene outlives its own text. The .def files were timed
		-- for the old sprite text (Adon's end.time is 1020), so a character with
		-- more chunks than that allows would have the scene end underneath them.
		--
		-- EXTEND ONLY. If the current value cannot be read this does nothing at
		-- all, rather than guessing - writing a computed value blind would
		-- SHORTEN any intro whose own end.time is already longer.
		local needed = n * CHUNK_SPACING + CHUNK_SPACING
		local cur = f_sceneEndTime(s, sceneKey)
		if cur ~= nil and cur < needed and type(modifyStoryboard) == 'function' then
			pcall(modifyStoryboard, sceneKey .. '.end.time', tostring(needed))
		end
	end
end

--; Wrapper for every storyboard that sfaz_storyboard_p1.lua does NOT take over
--; (no p1.* config in the .def). That mod handles the rest and calls
--; sfazInjectIntroText itself.
--;
--; LOAD ORDER MATTERS and is currently correct by filename. main.lua loads
--; external/mods in directory order, so sfaz_intro_text comes before
--; sfaz_storyboard_p1, which means that mod wraps THIS one and ends up
--; outermost - exactly what is wanted, since it is the one that must decide
--; whether a .def is its business. If the two were ever renamed so the order
--; flipped, this wrapper would become outermost, would run its own loop for
--; every storyboard, and the p1 character animation would silently stop
--; appearing in the intros.
local f_storyboardOrig = main.f_storyboard

function main.f_storyboard(path)
	local s = loadStoryboard(path)
	if s == nil then
		return false
	end

	sfazInjectIntroText(path, s)

	while true do
		if not runStoryboard() then
			break
		end
		main.f_preloadTick(2)
		refresh()
	end
	return storyboardCanceled()
end

--; Keep a reference so the original is still reachable if it is ever needed.
main.f_storyboardNoText = f_storyboardOrig
