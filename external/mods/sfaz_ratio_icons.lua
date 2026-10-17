--;===========================================================
--; RATIO SPLIT ICONS (team menu)
--;===========================================================
-- Draws the icon for the currently selected ratio split next to the "Ratio"
-- item on the character select team menu, the way the old build did.

local ACTION_BASE = 3000 -- [Begin Action 3000] = split 1, 3001 = split 2, ...

-- Per-player offsets: {x, y}
local OFFSET_P1 = {87, 82}
local OFFSET_P2 = {192, 82} -- Adds 100 pixels to X for Player 2

local t_anim = {}        -- split index -> Anim, built on first use

--;===========================================================
--; P2 SUPPRESSION
--;
--; On the CPU side the ratio split is not the player's to choose - it is worked
--; out per match while the run plays out (start.lua: start.p[1].ratio makes it a
--; ratio run and flags start.p[2].ratio to match, then f_getRatio assigns the
--; levels). The team menu already refuses to let it be selected there, but the
--; icon was still drawn, so P2's menu showed a "2-1-1" that means nothing.
--;
--; The modes below are the exception: both sides are real players picking their
--; own teams, so P2's choice is meaningful and the icon stays.
--;
--; Note this is an allowlist of MODES rather than a test of main.cpuSide[2].
--; cpuSide looks like the natural discriminator - and it is the reason the icon
--; should be hidden - but it does not survive contact with the roster: Free
--; Battle never clears it (main.lua only sets cpuSide[2] = false in versus,
--; versuscoop and netplayversus), so keying on it would hide the icon there too.
--;
--; Only two modes actually put "ratio" in P2's menu at all: TEAM ARCADE (which
--; reports gameMode "arcade", shared with story mode) and TEAM VERSUS (which
--; reports "versus"). So in practice this hides it in team arcade and leaves it
--; in team versus - the rest of the list is there so a mode that gains a P2
--; ratio item later behaves correctly without anyone having to remember this.
--;===========================================================
local t_p2RatioModes = {
	freebattle    = true,
	quickvs       = true,
	versus        = true, -- also Team Versus; both use setGameMode('versus')
	versuscoop    = true,
	netplayversus = true,
}

local function f_p2ShowsRatio()
	if type(gameMode) ~= 'function' then
		return true -- no way to tell: leave the old behaviour alone
	end
	return t_p2RatioModes[gameMode()] == true
end

local function f_icon(n)
	if t_anim[n] ~= nil then
		return t_anim[n]
	end
	if type(motifSff) ~= 'function' or type(motifAnim) ~= 'function'
		or type(animNew) ~= 'function' then
		return nil
	end
	local sff = motifSff()
	local ani = motifAnim(ACTION_BASE + n - 1)
	if sff == nil or ani == nil then
		return nil
	end
	local ok, a = pcall(animNew, sff, ani)
	if not ok or a == nil then
		return nil
	end
	if type(animSetPos) == 'function' then
		animSetPos(a, 0, 0)
	end
	t_anim[n] = a
	return a
end

hook.add("start.f_teamMenu.drawItemValue", "sfaz_ratio_icons", function(side, t, i, x, y, valueCfg)
	if t == nil or t[i] == nil or t[i].itemname ~= 'ratio' then
		return
	end
	if side == 2 and not f_p2ShowsRatio() then
		return -- CPU side: the split is assigned per match, not chosen here
	end
	local n = start.p[side].numRatio or 1
	local a = f_icon(n)
	if a == nil then
		return
	end

	-- Determine offset based on player side
	local offset = (side == 1) and OFFSET_P1 or OFFSET_P2
		main.f_animPosDraw(a, x + offset[1], y + offset[2])
end)