--;===========================================================
--; ONE-MATCH LOOK-AHEAD FOR SCRIPTED ARCADE PATHS
--;
--; Lets a victory screen know what the NEXT match will be, in the modes where
--; nothing could previously know it.
--;
--; THE PROBLEM
--;
--; kumitepath.lua and the per-character arcadepath files are re-run once per
--; match and each writes its matches as
--;
--;     for match = 1, 10 do
--;         if matchno() == match then
--;             launchFight{p2char = {selectRandomCharacter()}, stage = ...}
--;
--; The opponent is drawn with math.random AT THE MOMENT launchFight is called,
--; and the victory screen runs INSIDE that call. So during match N nothing has
--; chosen match N+1 - not "chosen but unread", genuinely not chosen. No amount
--; of reading tables can fix that.
--;
--; THE FIX: CHOOSE ONE MATCH EARLY, ONCE, AND REMEMBER IT
--;
--; sfazAhead(n) returns the choice for match n and, as a side effect, makes the
--; choice for match n+1 straight away. Both are cached by match number, so the
--; choice shown on match N's victory screen is the SAME OBJECT the script uses
--; when match N+1 comes round - it is not re-drawn and cannot drift.
--;
--; The victory screen only ever calls sfazAheadPeek(), which never draws. All
--; the randomness stays where it already was: inside the path script's own
--; chooser, called the same number of times, just one match sooner.
--;
--; EACH MATCH RANGE NEEDS ITS OWN CHOOSER REGISTERED
--;
--; This is not optional and it is the whole reason for the registry. A path
--; script does not use one chooser throughout - vs100kumite has five, one per
--; block (1-30, 31-60, 61-90, 91-95, 96-100), each drawing from a different
--; pool, and the per-character files have one per match. Looking ahead from
--; match 30 with match 30's OWN chooser would pre-pick match 31 out of the wrong
--; pool, and because the cache is authoritative the fight would then honour that
--; wrong pick. So the look-ahead asks for match n+1's chooser, not the caller's:
--;
--;     sfazAheadRegister(1,  30, chooseA)
--;     sfazAheadRegister(31, 60, chooseB)
--;     ... then sfazAhead(30) draws 31 with chooseB, not chooseA.
--;
--; A range with no chooser registered simply gets no look-ahead: the emblem is
--; blank for that one match and the fight is unaffected.
--;
--; Register every range on every run, right after defining the chooser. The
--; registry is rebuilt each run because the choosers are fresh closures over
--; fresh pools - keeping old ones would draw from a previous run's state.
--;
--; A chooser returns whatever the script needs - here a table
--; {char = "SFZ_Ken", stage = "Stages/Ken2.def"} - and this file never inspects
--; it. Only the caller and the reader need to agree on the shape.
--;
--; WHAT THIS COSTS
--;
--; The last match of a run pre-draws a choice that is never used: one wasted
--; draw from that pool per run, and that is the whole price.
--;
--; RESETTING
--;
--; sfazAheadReset() must run once at the start of a run, before any registering
--; or drawing, or match 1 would reuse the previous run's choice. kumitepath.lua
--; calls it from its matchno() < 2 block at the top of the file.
--;===========================================================

local cache = {}    -- match number -> the choice made for it
local ranges = {}   -- {from, to, chooser}, rebuilt every script run

--; Forget everything. Call once per run, before registering or drawing.
function sfazAheadReset()
	cache = {}
	ranges = {}
end

--; Say which chooser owns which matches. Re-registering the same range replaces
--; it, so calling this on every run is correct and expected.
function sfazAheadRegister(from, to, chooser)
	from, to = tonumber(from), tonumber(to)
	if from == nil or type(chooser) ~= 'function' then return end
	if to == nil then to = from end
	for _, r in ipairs(ranges) do
		if r.from == from and r.to == to then
			r.chooser = chooser
			return
		end
	end
	ranges[#ranges + 1] = {from = from, to = to, chooser = chooser}
end

local function f_chooserFor(n)
	for _, r in ipairs(ranges) do
		if n >= r.from and n <= r.to then return r.chooser end
	end
	return nil
end

--; Make the choice for match n if it has not been made, cache it, and return it.
local function f_draw(n, chooser)
	if cache[n] ~= nil then return cache[n] end
	chooser = chooser or f_chooserFor(n)
	if type(chooser) ~= 'function' then return nil end
	-- pcall so a chooser that runs out of characters cannot take the match down
	local ok, v = pcall(chooser)
	if not ok or v == nil then return nil end
	cache[n] = v
	return v
end

--; The choice for match n, plus the look-ahead for n+1 so the victory screen
--; running inside this match can see where it goes next. `chooser` is an
--; optional fallback for n itself when no range covers it.
function sfazAhead(n, chooser)
	n = tonumber(n)
	if n == nil then return nil end
	local mine = f_draw(n, chooser)
	-- n+1 is drawn with ITS OWN registered chooser. Never with `chooser`.
	f_draw(n + 1, nil)
	return mine
end

--; READ-ONLY. The choice already made for match n, or nil. Never draws, so a
--; victory screen calling this cannot change what the next match will be.
function sfazAheadPeek(n)
	n = tonumber(n)
	if n == nil then return nil end
	return cache[n]
end
