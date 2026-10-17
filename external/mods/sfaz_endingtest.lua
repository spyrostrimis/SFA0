--;===========================================================
--; TEST LEVER - start an arcade run at a chosen match number
--;
--; *** DIAGNOSTIC. Delete this file, or just the save/ lever, when the ending
--; *** conversion work is finished. Listed in SFAZ_SESSION_HANDOVER.md §10.
--;
--; WHY THIS EXISTS
--;
--; The in-game character endings only play after match 10, and the character's
--; own gate is specific: SFZ_Ryu.cns [State -2, detect] sets var(43) on
--;     StageVar(info.name) = "Akuma Boss"  &&  matchno = 10
--; and the win pose only branches to Statedef 188 when that var is set. So an
--; ending cannot be reached by winning one fight - it needs the whole run, and
--; checking a one-line text tweak would mean playing ten matches every time.
--;
--; The arcade paths make this cheap to fix, because they are pure functions of
--; matchno(): arcadepath/Ryu.lua is a chain of "if matchno() == N then
--; launchFight{...} end" blocks, and match 10 launches SFZ_Akuma on
--; stages/_Boss-Gokuento.def - whose [Info] name IS "Akuma Boss". So starting a
--; run AT match 10 produces a genuine final match, not a simulated one: the
--; real opponent, the real stage, the real gate, the real ending.
--;
--; HOW TO USE IT
--;
--;   create  save/sfaz_endingtest          -> runs start at match 10
--;   put a number in it, e.g. 5            -> runs start at that match instead
--;   delete it                             -> normal behaviour, no cost
--;
--; Then pick the character and start Arcade as usual; the first fight is the
--; last fight. Works for any character whose arcadepath keys off matchno(),
--; which is all of them.
--;
--; CAVEAT: this moves the match counter for the WHOLE run, so anything else
--; keyed on match number moves with it - the AI ramp, and the win-screen total
--; in sfaz_core.lua. That is the point for testing an ending, but it does mean
--; a lever-on run is not a representative run for anything else. Do not leave
--; the lever in place while testing unrelated things, and do not combine it
--; with resuming a saved run.
--;===========================================================

local LEVER = 'save/sfaz_endingtest'
local DEFAULT_MATCH = 1

--; Returns the match number to start at, or nil when the lever is absent.
--; Re-read every time rather than cached at load, so the file can be created,
--; edited and deleted without restarting the game.
local function f_leverMatch()
	local fh = io.open(LEVER, 'r')
	if not fh then
		return nil
	end
	local body = fh:read('*a')
	fh:close()
	local n = tonumber((tostring(body or ''):match('%-?%d+')) or '')
	if n == nil or n < 1 then
		return DEFAULT_MATCH
	end
	return math.floor(n)
end

--; start.f_selectReset runs setMatchNo(1) when a run begins, and fires this
--; hook at the very END of the function (external/script/start.lua) - so the
--; hook lands after the reset and simply overrides it. Same hook point
--; sfaz_joyside.lua re-arms from.
hook.add("start.f_selectReset", "sfaz_endingtest", function()
	local n = f_leverMatch()
	if n == nil then
		return
	end
	--; CLEAR THE LOOK-AHEAD CACHE. This is not optional and it is subtle.
	--;
	--; Every arcadepath file resets it with
	--;     if matchno() < 2 then sfazAheadReset() end
	--; at the top - which this lever makes permanently FALSE, because it has
	--; already moved the counter to 10 by the time the path file runs. The cache
	--; is global and keyed by MATCH NUMBER ALONE, so without a reset the run
	--; inherits whatever was cached for match 10 last time: another character's
	--; boss, on another character's stage.
	--;
	--; That also fails quietly in the worst way. The ending is gated in the .cns
	--; on StageVar(info.name) - Adon wants "U-Sagat Boss" - so a stale stage
	--; means no ending at all, and the two symptoms look unrelated.
	--;
	--; The first lever run of a session works either way (empty cache), so this
	--; only bites from the second run on - which is exactly when you are
	--; iterating on an ending.
	if type(sfazAheadReset) == 'function' then
		sfazAheadReset()
	end
	setMatchNo(n)
end)
