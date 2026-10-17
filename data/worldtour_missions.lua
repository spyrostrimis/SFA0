--;===========================================================
--; WORLD TOUR - PER-MATCH MISSION NOTES
--;
--; One short note per match, drawn on the lifebar for the whole fight to say
--; what that match is asking for. This file is ONLY the words; the element that
--; draws them is [Mission] in data/fight.def and the wiring is in
--; external/mods/worldtour.lua.
--;
--; HOW TO WRITE ONE
--;
--;     [3] = "Win without blocking",
--;
--; The key is the MATCH NUMBER, 1 to 40, the same number [Match] prints as
--; "MATCH#n" on the lifebar. World Tour's roster is 40 matches long
--; (start.t_makeRoster.worldtour), so keys past 40 are never reached.
--;
--; A match with no entry here simply shows no note - the whole element,
--; background included, stays hidden while the string is empty. So you can fill
--; these in a few at a time; the ones you have not written yet cost nothing.
--;
--; TWO LINES
--;
--; Embed a newline and the note wraps to a second line, stepped by whatever
--; `spacing` says in [Mission]:
--;
--;     [7] = "Win with more than half\nyour health remaining",
--;
--; There is no automatic wrapping - the engine splits on newlines you put here
--; and nothing else - so keep each line short enough for the space to the right
--; of the CPU level readout, and check it on screen. Three lines will collide
--; with the lifebar below unless you move [Mission] pos up.
--;
--; PREFIX
--;
--; If you want every note to read "MISSION: ...", do NOT type that 40 times -
--; put it in fight.def as `text.text = MISSION: %s`. It is substituted before
--; the note is split into lines, so it prints once and not on every line.
--;
--; The mode is dynamic, so if you ever generate the roster instead of fixing it
--; at 40 matches, replace the table below with a function of the match number;
--; sfazWorldTourMissionFor() at the bottom is the only thing worldtour.lua
--; calls, so that is the seam to change.
--;===========================================================

sfazWorldTourMissions = {
	-- PLACEHOLDER - delete this line once you have seen the note appear on
	-- match 1 and know the pipeline works.
	[1] = "TURNS",
	[2] = "SIMUL",
	[3] = "RATIO 1:2:1",
	[4] = "SINGLE",
	[5] = "SPECIAL COMBO",
	[6] = "SIMUL",
	[7] = "RATIO 2:2",
	[8] = "SINGLE",
	[9] = "RATIO 1:1:2",
	[10] = "TARGET MIKA",
	[11] = "TURNS",
	[12] = "TAGx2",
	[13] = "TARGET CAMMY",
	[14] = "SINGLE",
	[15] = "TURNS",
	[16] = "HYPER COMBO",
	[17] = "TIME ATTACK",
	[18] = "SPECIAL COMBO",
	[19] = "SINGLE",
	[20] = "TURNS",
	[21] = "HYPER COMBO",
	[22] = "SIMUL",
	[23] = "SIMUL",
	[24] = "RATIO 2:2",
	[25] = "SIMUL",
	[26] = "TIME ATTACK",
	[27] = "SINGLE",
	[28] = "TARGET KARIN",
	[29] = "SPECIAL COMBO",
	[30] = "RATIO 3:1",
	[31] = "TARGET ROLENTO",
	[32] = "GUARD CRUSH",
	[33] = "TURNS",
	[34] = "SIMUL",
	[35] = "RATIO 2:1:1",
	[36] = "RATIO 1:3",
	[37] = "TAG",
	[38] = "THROW",
	[39] = "SIMUL",
	[40] = "TAG",
}

--; Returns the note for a match number, or nil when there is nothing to show.
--;
--; Every caller treats nil as "no note", so this is deliberately forgiving: a
--; bad match number, a missing entry, a non-string value left behind by an edit
--; and an entry that is only whitespace all come back nil rather than putting
--; junk on the lifebar for a whole fight.
function sfazWorldTourMissionFor(matchNumber)
	local n = tonumber(matchNumber)
	if n == nil or n < 1 then
		return nil          -- matchNo() is -1 outside a run
	end
	if type(sfazWorldTourMissions) ~= 'table' then
		return nil
	end
	local note = sfazWorldTourMissions[math.floor(n)]
	if type(note) ~= 'string' or note:match('^%s*$') ~= nil then
		return nil
	end
	return note
end
