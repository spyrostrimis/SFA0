if not main.makeRoster then
	launchFight{}
	setMatchNo(-1)
	return
end

if main.storyboard.intro and matchNo() == 1 and not continued() then
	launchStoryboard(start.f_getCharData(start.p[1].t_selected[1].ref).intro)
end

-- SFAZ [1/1] LOOK-AHEAD: build and SHUFFLE each match's line-up through the
-- look-ahead cache, so match N+1's opponents - and therefore its stage - are
-- settled before match N's victory screen draws.
--
-- Why the shuffle is the whole problem: f_setStage takes the stage from
-- start.p[2].t_selected[1], i.e. whoever the shuffle put FIRST, and that used
-- to happen on the line before launchFight. For a simul match the stage was
-- therefore undecided until the fight began, so the victory screen before it
-- could only guess - and guessing showed one team member's stage for a fight
-- that happened on another's.
--
-- Nothing about the shuffle changes: same call, same randomness, still exactly
-- once per match. It just happens a match earlier and the result is kept, so
-- what was shown is what is fought. See external/mods/sfaz_lookahead.lua.
local function sfazMakeChooser(i)
	return function()
		local t_p2char = {}
		for _, v in ipairs(start.t_roster[i]) do
			table.insert(t_p2char, start.f_getCharData(v).char)
		end
		main.f_tableShuffle(t_p2char)
		return {chars = t_p2char}
	end
end
-- Reset only at the start of a run. This script is re-entered mid-roster when
-- the infinite-matches flag appends entries, and resetting there would discard
-- a pick a victory screen has already shown.
if type(sfazAheadReset) == 'function' and matchNo() <= 1 then
	sfazAheadReset()
end
if type(sfazAheadRegister) == 'function' then
	for i = 1, #start.t_roster do
		if start.t_roster[i][1] ~= -1 then
			sfazAheadRegister(i, i, sfazMakeChooser(i))
		end
	end
end

-- SFAZ EARLY VICTORY: the real victory screen, shown once before match 1, in
-- place of the retired Intro_X2.def storyboards. After the registrations above
-- so the stage emblem can announce the match about to be played, and after the
-- intro storyboard higher up so a story-mode run reads: intro -> this -> fight.
if matchNo() <= 1 and type(sfazEarlyVictory) == 'function' then
	sfazEarlyVictory()
end

for i = matchNo(), #start.t_roster do
	if start.t_roster[i][1] == -1 then --infinite matches flag detected
		return --restart lua script after appending new entries
	end
	local pick
	if type(sfazAhead) == 'function' then pick = sfazAhead(i) end
	if type(pick) ~= 'table' or type(pick.chars) ~= 'table' then
		pick = sfazMakeChooser(i)()
	end
	if not launchFight{p2char = pick.chars, p2numchars = #pick.chars} then return end
end

if main.storyboard.ending then
	if not launchStoryboard(start.f_getCharData(start.p[1].t_selected[1].ref).ending) and motif.default_ending.enabled then
		launchStoryboard(motif.default_ending.storyboard)
	end
end

setMatchNo(-1)