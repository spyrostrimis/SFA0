--;===========================================================
--; EARLY VICTORY SCREEN
--;
--; Shows the real victory screen once, before match 1, as the hand-off into the
--; run. It replaces the per-character Intro_X2.def storyboards, which were
--; hand-built copies of the victory screen (background, portrait, win pose,
--; name/nation and a stage graphic) and had to be maintained 45 times.
--;
--; It is the ORDINARY [Victory Screen]: same layout, same config, same stage
--; emblem. The engine relaxes exactly two things that assume a finished match
--; (see runVictoryEarly in src/script.go):
--;
--;   * P1 stands in for the winning team, because there is not one yet;
--;   * the character state transitions are skipped, because nothing is loaded
--;     yet - the portraits come from the select-list preload instead, which is
--;     also why [Victory Screen] p1.anim = 181 still works (FaceProperties
--;     carries preload:"char", so 181 is registered at motif-parse time).
--;
--; At match 1 there are no defeated opponents, so that row is empty and the
--; "next" marker sits in slot 1 - which is exactly what it should say.
--;
--; WHERE IT IS CALLED FROM, AND WHY THERE
--;
--; Immediately after the match-1 chooser is REGISTERED, not at the top of the
--; path file. The stage emblem needs this match's opponent to have been chosen,
--; and that cannot happen before the chooser exists. In the per-character files
--; the intro storyboard still runs first, higher up, so the order a player sees
--; is: character intro -> early victory screen -> match 1.
--;
--; Modes with no victory screen never show it: main.motif.victoryscreen /
--; .winscreen are the same flags the normal victory screen is gated on.
--;
--; P1'S PICKS HAVE TO BE HANDED OVER
--;
--; launchFight calls clearSelected() and only refills the engine's selection
--; while the match loads, so before match 1 sys.sel.selected is EMPTY and the
--; victory screen's buildSideOrder had nothing to build from - the screen came up
--; completely blank. Lua knows the picks (start.p[1].t_selected), so they are
--; passed to runVictoryEarly and the engine uses them for the winning side.
--;===========================================================

--; THE MATCH COUNTER SLIDES UP INSTEAD OF BEING TYPED
--;
--; A letter-by-letter reveal was the first idea and it cannot work here: the
--; counter is ONE character ("0"), so revealing it letter by letter is the same
--; as showing it. It slides up from below the screen instead, which gives the
--; same "it arrives" beat and does not care how many characters there are.
--;
--; Tunables, both in ticks/pixels:
local MATCHNO_SLIDE_FROM = 40   -- pixels below its resting place to start
local MATCHNO_SLIDE_TIME = 18   -- ticks to get there
local MATCHNO_SLIDE_CURVE = 2   -- 1 linear, higher settles more sharply

--; True only while the early screen is on. sfaz_victorystage.lua reads it,
--; because "the next match" means matchNo() here, not matchNo() + 1: this screen
--; comes BEFORE its match, where the normal one comes after.
sfazEarlyVictoryActive = false

function sfazEarlyVictory()
	if type(runVictoryEarly) ~= 'function' then
		return false        -- older exe without the binding
	end
	if type(main) ~= 'table' or type(main.motif) ~= 'table' then return false end
	if not (main.motif.victoryscreen or main.motif.winscreen) then
		return false        -- this mode has no victory screen; do not invent one
	end
	-- Settle this match's opponent first, so the stage emblem has something real
	-- to show. Same call the match loop is about to make, and the cache means it
	-- is made once - what is shown here is what is fought.
	if type(sfazAhead) == 'function' and type(matchNo) == 'function' then
		sfazAhead(matchNo())
	end
	-- P1's picks, {selectNo, palette}. See the header for why this is needed.
	local chars = {}
	if start ~= nil and start.p ~= nil and start.p[1] ~= nil
		and type(start.p[1].t_selected) == 'table' then
		for _, v in ipairs(start.p[1].t_selected) do
			if v ~= nil and v.ref ~= nil then
				chars[#chars + 1] = {v.ref, v.pal or 1}
			end
		end
	end
	if #chars == 0 then
		return false        -- nothing to show; better than a blank screen
	end
	sfazEarlyVictoryActive = true
	local frame = 0
	local ok = pcall(function()
		while runVictoryEarly(chars) do
			-- The match counter, forced to 0: no match has been played yet. It is
			-- drawn here because this loop never reaches the "loop" hook that
			-- normally draws it, and that hook wants roundState 0 + a winner
			-- anyway. Queued like any Lua draw, so it lands over the screen.
			if type(sfazDrawMatchNo) == 'function' then
				local dy = 0
				if MATCHNO_SLIDE_TIME > 0 and frame < MATCHNO_SLIDE_TIME then
					-- Ease out, mirroring the stage emblem's entry.
					local prog = frame / MATCHNO_SLIDE_TIME
					local eased = 1 - (1 - prog) ^ MATCHNO_SLIDE_CURVE
					dy = MATCHNO_SLIDE_FROM * (1 - eased)
				end
				sfazDrawMatchNo(0, 0, dy)
			end
			frame = frame + 1
			if type(main.f_preloadTick) == 'function' then main.f_preloadTick(2) end
			refresh()
		end
	end)
	sfazEarlyVictoryActive = false
	return ok
end
