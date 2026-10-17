--;===========================================================
--; VICTORY SCREEN STAGE EMBLEM
--;
--; Which stage the victory screen's emblem shows. The drawing is engine-side
--; ([SFAZ Victory Stage] in system.def, MotifVictory.draw); this file only
--; answers "which stage".
--;
--; IT READS THE EXISTING ROSTER. IT DOES NOT DECIDE, PREDICT OR INVENT.
--;
--; The next battle's stage is knowable for the modes select.def drives, because
--; the ENTIRE opponent sequence is built before match 1 and simply walked:
--;
--;     start.f_makeRoster()  builds start.t_roster = { {ref,...}, {ref,...} ... }
--;                           from the order / ordersurvival params in select.def
--;     default.lua           for i = matchNo(), #start.t_roster do ...
--;                             launchFight{p2char = <that entry>}
--;
--; So at victory N, start.t_roster[matchNo() + 1] is already the next match's
--; opponent - start.lua reads exactly that itself at 2391. And each character
--; carries ONE stage (select.def: "SFZ_Ryu, stages/Ryu.def"), which is the stage
--; f_setStage will give them. Reading it is not a guess.
--;
--; This is deliberately READ-ONLY. It does not call start.stageShuffleBag, does
--; not touch start.p, and does not pin anything for the next match to use. Two
--; earlier attempts did and both failed:
--;
--;   1. predicting a stage and hoping it matched;
--;   2. deciding one here and pinning it - which BROKE THE GAME: matches ended
--;      before starting and stages came out "out of the blue, regardless of the
--;      new character". A stage belongs to its OPPONENT; anything chosen at
--;      victory time is for the wrong fighter, and the shuffle-bag fallback used
--;      when the opponent was unknown made stages random, which they never are.
--;
--; WHEN THE ROSTER IS AUTHORITATIVE - AND WHEN IT LIES
--;
--; start.t_roster existing is NOT the same as the roster being what runs the
--; matches, and trusting `main.makeRoster` for that was wrong. Survival builds a
--; roster from select.def's ordersurvival AND is driven by kumitepath.lua, which
--; ignores that roster completely and picks its own opponents - so reading it
--; there produced confidently wrong stages. The roster is only the truth when
--; external/script/default.lua is the driver, which is what f_driverIsDefault()
--; below actually tests.
--;
--;   AUTHORITATIVE - default arcade, TEAM arcade: default.lua walks the roster.
--;   NOT           - survival, world tour, time attack, vs100 kumite: driven by
--;                   kumitepath.lua, whose survival block calls its own
--;                   selectRandomCharacter() - a RANDOM pick made at the moment
--;                   launchFight is called.
--;   NOT           - single arcade / Story Mode: driven by the per-character
--;                   arcadepath file. arcadepath/Ryu.lua picks matches 1-4 the
--;                   same random way.
--;
--; In a NOT case the next opponent does not exist yet, in any table, at victory
--; time - so the path script has to choose it a match early for anything to be
--; shown. external/mods/sfaz_lookahead.lua provides that, and a script opts in
--; by taking its choice through sfazAhead(). kumitepath.lua's survival block
--; does; the rest do not yet, and stay blank.
--;
--; f_lookaheadStage() below reads that cache and never writes to it, so the
--; emblem still cannot influence what the next match will be.
--;
--; MULTI-OPPONENT MATCHES: SOLVED BY MOVING THE SHUFFLE, NOT BY GUESSING
--;
--; A roster entry can hold several characters (simul/turns). The stage comes
--; from whichever ends up FIRST, and default.lua shuffles them immediately
--; before the fight:
--;
--;     main.f_tableShuffle(t_p2char)      -- default.lua, line 19
--;     launchFight{p2char = t_p2char}     -- f_setStage then reads t_selected[1]
--;
--; so at victory time which member supplied the stage was not decided. Taking
--; entry[1] showed FeiLong's stage for a fight that happened on Dan's - reading
--; the first member was a coin flip.
--;
--; default.lua now does that build-and-shuffle through the look-ahead instead,
--; one match early, and keeps the result. The line-up shown IS the line-up
--; fought, so f_lookaheadTeamStage() can read the first member with no guessing.
--; f_nextStage() below still refuses multi-member entries: it is the fallback
--; for a default.lua without those calls, where the coin flip would be back.
--;
--; THE EARLY VICTORY SCREEN COUNTS FROM A DIFFERENT MATCH
--;
--; The normal victory screen comes AFTER its match, so "next" is matchNo() + 1.
--; The early one (sfaz_earlyvictory.lua) comes BEFORE match 1, so "next" is
--; matchNo() itself. f_targetMatch() below is that one-line difference, and
--; getting it wrong would show match 2's stage on the screen introducing match 1.
--;
--; SET IT WHERE? game.victory_init, which the engine runs immediately before it
--; builds the emblem (motif.go, MotifVictory.init).
--;===========================================================

--; Read `fallback` out of the motif section the engine already parses.
local function f_fallback()
	if motif == nil or motif.sfaz_victory_stage == nil then return false end
	return tonumber(motif.sfaz_victory_stage.fallback) == 1
end

--; Declared BEFORE its callers on purpose. It was originally written between
--; f_lookaheadStage and f_lookaheadTeamStage, which made it a nil GLOBAL inside
--; the first of those - the call threw, pcall(f_ref) swallowed it, and every
--; script-driven mode silently got setVictoryStage(0). Team arcade escaped only
--; because its reader happens to sit after the declaration.
--; The next match's stage from default.lua's own look-ahead. Its pick carries
--; the SHUFFLED line-up (`chars`), and the stage is the first member's - the same
--; one f_setStage will take from t_selected[1].
--;
--; Deliberately keyed on `chars`, which only default.lua's chooser produces. A
--; pick left behind by a scripted path carries `stage`/`char` instead, so the two
--; kinds can never be read by the wrong driver even if a reset were missed.
--; Which match the emblem is announcing. See the header.
local function f_targetMatch()
	if type(matchNo) ~= 'function' then return nil end
	if sfazEarlyVictoryActive then return matchNo() end
	return matchNo() + 1
end

--; The next match's stage from a path script that pre-chose it (see
--; sfaz_lookahead.lua). Its choice carries both the character and, when the
--; script names one, the stage itself - so prefer the named stage and fall back
--; to that character's select.def stage when it left it nil.
local function f_lookaheadStage()
	if type(sfazAheadPeek) ~= 'function' then return nil end
	local n = f_targetMatch()
	if n == nil then return nil end
	local pick = sfazAheadPeek(n)
	if type(pick) ~= 'table' then return nil end
	if type(pick.stage) == 'string' and pick.stage ~= ''
		and start ~= nil and type(start.f_getStageRef) == 'function' then
		local ok, n = pcall(start.f_getStageRef, pick.stage)
		if ok and type(n) == 'number' and n >= 1 then return n end
	end
	if type(pick.char) ~= 'string' or start == nil
		or type(start.f_getCharRef) ~= 'function'
		or type(start.f_getCharData) ~= 'function' then
		return nil
	end
	local ok, ref = pcall(start.f_getCharRef, pick.char)
	if not ok or type(ref) ~= 'number' then return nil end
	local ok2, cd = pcall(start.f_getCharData, ref)
	if not ok2 or type(cd) ~= 'table' or type(cd.stage) ~= 'table' or #cd.stage ~= 1 then
		return nil
	end
	local n = tonumber(cd.stage[1])
	if n == nil or n < 1 then return nil end
	return n
end

local function f_lookaheadTeamStage()
	if type(sfazAheadPeek) ~= 'function' then return nil end
	local n = f_targetMatch()
	if n == nil then return nil end
	local pick = sfazAheadPeek(n)
	if type(pick) ~= 'table' or type(pick.chars) ~= 'table' then return nil end
	local first = pick.chars[1]
	if type(first) ~= 'string' or start == nil
		or type(start.f_getCharRef) ~= 'function'
		or type(start.f_getCharData) ~= 'function' then
		return nil
	end
	local ok, ref = pcall(start.f_getCharRef, first)
	if not ok or type(ref) ~= 'number' then return nil end
	local ok2, cd = pcall(start.f_getCharData, ref)
	if not ok2 or type(cd) ~= 'table' or type(cd.stage) ~= 'table' or #cd.stage ~= 1 then
		return nil
	end
	local n = tonumber(cd.stage[1])
	if n == nil or n < 1 then return nil end
	return n
end

--; Is external/script/default.lua the script that will run the next match?
--; Only then does start.t_roster describe what actually happens. Mirrors the
--; two things f_selectMode uses to choose the driver.
local function f_driverIsDefault()
	if main == nil or main.defaultLuaPath == nil then return false end
	if start ~= nil and start.customArcadePath then return false end
	return main.luaPath == main.defaultLuaPath
end

--; The next match's stage, from the roster, or nil when nothing knows it.
--; Read-only: no shuffle bag, no state touched.
local function f_nextStage()
	if not f_driverIsDefault() then return nil end
	if main == nil or not main.makeRoster then return nil end
	if start == nil or type(start.t_roster) ~= 'table' then return nil end
	if type(start.f_getCharData) ~= 'function' then return nil end
	local target = f_targetMatch()
	if target == nil then return nil end
	local entry = start.t_roster[target]
	if type(entry) ~= 'table' then return nil end
	-- More than one opponent: default.lua shuffles them before the fight, so
	-- which one supplies the stage is not decided yet. See the header.
	if #entry ~= 1 then return nil end
	local ref = entry[1]
	-- -1 is the "infinite matches" flag, not a character.
	if type(ref) ~= 'number' or ref < 0 then return nil end
	local ok, cd = pcall(start.f_getCharData, ref)
	if not ok or type(cd) ~= 'table' or type(cd.stage) ~= 'table' then return nil end
	-- Exactly one stage is the normal case here and the only unambiguous one.
	if #cd.stage ~= 1 then return nil end
	local n = tonumber(cd.stage[1])
	if n == nil or n < 1 then return nil end
	return n
end

--; The stage just fought - only used when `fallback` asks for it.
local function f_currentStage()
	if type(getStageNo) ~= 'function' then return nil end
	local n = getStageNo()
	if type(n) ~= 'number' or n < 1 then return nil end
	return n
end

local function f_ref()
	-- ONE SOURCE PER DRIVER, never a fallback chain between them.
	--
	-- Trying the look-ahead first and the roster second looked harmless and was
	-- not: external/script/default.lua has no sfazAheadReset() call, so a cache
	-- left by the previous survival or single-arcade run survives into team
	-- arcade, and a stale peek then beat the correct roster read. Team arcade
	-- started showing stages from the run before it - reported as "it used to
	-- work, but not anymore".
	--
	-- Whoever drives the matches owns the answer, and nothing else is consulted:
	--   default.lua drives  -> the roster is the truth (team + default arcade)
	--   a script drives     -> only its look-ahead is (survival, time attack,
	--                          vs100, world tour, the per-character paths)
	local n
	if f_driverIsDefault() then
		-- Prefer default.lua's own look-ahead: it knows the SHUFFLE, which the
		-- roster alone cannot, and is the only thing that makes a simul match's
		-- stage knowable. The roster read stays as a fallback for a default.lua
		-- that has not been given the look-ahead calls.
		n = f_lookaheadTeamStage()
		if n == nil then n = f_nextStage() end
	else
		n = f_lookaheadStage()
	end
	if n ~= nil then return n end
	if f_fallback() then return f_currentStage() or 0 end
	return 0
end

--;-----------------------------------------------------------
--; THE LOCATION MARKER
--;-----------------------------------------------------------
--; Action 5801 pinned to a spot on the stage map. The spot is per stage and
--; lives in data/stage_marks.lua, keyed by def path - see that file for where
--; the numbers came from. The engine does the drawing; this only answers
--; "which point", exactly as the rest of this file only answers "which stage".
--;
--; Loaded once, lazily, and a missing or broken file is not fatal: no table
--; means no marker, and the map still shows.
local t_marks, marksTried = nil, false

local function f_marks()
	if not marksTried then
		marksTried = true
		local ok, t = pcall(function() return assert(loadfile('data/stage_marks.lua'))() end)
		if ok and type(t) == 'table' then t_marks = t end
	end
	return t_marks
end

--; The marker for stage `ref`, or nil. main.t_selStages[ref].def is the path the
--; select list was built from, which is what the table is keyed on.
local function f_mark(ref)
	local t = f_marks()
	if t == nil or type(ref) ~= 'number' or ref < 1 then return nil end
	if main == nil or type(main.t_selStages) ~= 'table' then return nil end
	local st = main.t_selStages[ref]
	if type(st) ~= 'table' or type(st.def) ~= 'string' then return nil end
	local m = t[st.def:lower():gsub('\\', '/')]
	if type(m) ~= 'table' or #m < 2 then return nil end
	return tonumber(m[1]), tonumber(m[2])
end

hook.add("game.victory_init", "sfaz_victorystage", function()
	if type(setVictoryStage) ~= 'function' then
		return          -- older exe without the binding
	end
	local ok, ref = pcall(f_ref)
	ref = (ok and type(ref) == 'number') and ref or 0
	setVictoryStage(ref)
	-- AFTER setVictoryStage, which clears any previous marker.
	if type(setVictoryStageMark) == 'function' then
		local x, y = f_mark(ref)
		if x ~= nil and y ~= nil then
			setVictoryStageMark(x, y)
		end
	end
end)
