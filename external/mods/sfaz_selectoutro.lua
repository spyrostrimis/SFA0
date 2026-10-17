--;===========================================================
--; SELECT SCREEN OUTRO
--;
--; When EVERY selection is finished and the select screen is leaving, slide the
--; big 9000,1 portraits off the sides - P1 left, P2 right - and slide the game
--; mode title up off the top. Everything else stays: the `done` animation (198
--; here) holds its place until the screen ends, and the background fade is
--; untouched. That is the hand-off into the intro storyboards.
--;
--; WHY NOT face2.done
--;
--; The obvious hook is [Select Info] p1.face2.done, which start.lua swaps in
--; when a player confirms. It is the wrong moment: P1 confirming does not mean
--; the screen is leaving. P2 may still be choosing, the stage menu may still be
--; ahead, and in team modes there are more members to pick. The portrait would
--; slide away while the screen was still up.
--;
--; The right moment is the one place start.lua decides the screen is finished -
--; both sides' selEnd and teamEnd are set, the stage menu is done, and the
--; per-side screenDelay has run out. That is where this is armed from.
--;
--; TIMING
--;
--; [Select Info] fadeout.time is 0 in this motif, so the fade is a cut: running
--; the slide "during" it would show nothing. The fade is therefore DELAYED until
--; the slide finishes - start.lua asks sfazSelectOutroDone() before arming it.
--; With enabled = 0, or this mod absent, that check passes immediately and the
--; screen behaves exactly as it did before.
--;
--; CONFIG - data/system.def, optional section:
--;
--;   [SFAZ Select Outro]
--;   enabled     = 1
--;   time        = 24        ; ticks the slide takes
--;   face2.dist  = 220       ; px each portrait travels (P1 -x, P2 +x)
--;   face2.disty = 0         ; px vertically, if wanted
--;   title.dist  = 60        ; px the title travels UP
--;   curve       = 2         ; 1 = linear, 2 = ease in (accelerating), 3 = more
--;   names       = 1         ; hide the character names
--;   bg.hide     = 88888887  ; bgdef action to hide, -1 for none
--;   bg.play     = 88888888  ; bgdef action to show during the outro, -1 = none
--;   bg.playreset = 1        ; rewind it, or 0 to leave it exactly as it is
--;
--; bg.playreset IS NOT A DETAIL. Whether to rewind depends on what the action
--; does, and getting it wrong makes the sprite vanish at the START of the outro,
--; which is the opposite of what all of this is for:
--;
--;   * 88888888 is `-1,0,0,0,16` then six frames then blank. It has already run
--;     its single pass and is parked on that final blank, so it needs
--;     playreset = 1 or showing it shows nothing.
--;   * 88888887 is `-1,0,0,0,28` then `100,6,0,0,-1`, an infinite hold. It has
--;     been showing 100,6 since the screen opened, so it needs playreset = 0.
--;     Rewinding it replays that 28-tick blank and 100,6 disappears for the
--;     first half of the outro - reported as "the sprite disappears before its
--;     fadeout animation starts".
--;
--; The rule: rewind an action that has FINISHED and must play again; leave alone
--; an action that is already showing what you want.
--;   bg.playtime = 28        ; ticks bg.play needs before its last frame ends
--;   cursors     = 1         ; hide the player cursors
--;   cells       = 1         ; hide the roster cell portraits (9000,0) at the
--;                           ; same instant bg.play stops being drawn
--;   world.elem  = -1        ; SelectBG element to slide up, by POSITION:
--;                           ; -1 = [SelectBG 1], -2 = [SelectBG 2] ...
--;   world.dist  = 60        ; px it travels up
--;   world.hide  = 1         ; and hide it when the fade starts
--;   bg.playhide = 1         ; hide bg.play the frame fadeout.anim starts DRAWING
--;   bg.playhidemax = 180    ; give up waiting for that and hide it anyway
--;
--; WHY world.hide AND bg.playhide EXIST
--;
--; Both cover the same mistake: an element that should be gone by the time the
--; fade takes over is still being drawn, so the fadeout animation lands on top
--; of it rather than replacing it.
--;
--;   * the world layer is `tile = 1,1`. A tiled element repeats forever, so
--;     sliding it can NEVER take it off screen - it just scrolls. Moving it is
--;     the motion you want during the outro; hiding it is the only thing that
--;     actually removes it.
--;   * bg.play holds its last frame once it has run (88888887 ends on
--;     `100,6,0,0,-1`, an infinite hold), so the wipe stays on screen while
--;     [Select Info] fadeout.anim draws the same wipe over it.
--;
--; The world layer is hidden when the fade is RELEASED. bg.play is not: it is
--; hidden the frame fadeout.anim actually starts DRAWING, which is a different
--; and later moment, because that animation opens with a blank hold
--; ([Begin action 20023] starts `-1,0, 0,0,36`). Hiding on release left a gap of
--; exactly that hold - the wipe was gone and the fade had not appeared yet.
--;
--; AND THE SCREEN HAS TO BE HELD OPEN FOR IT
--;
--; Watching alone was not enough. f_selectScreen ends on
--;
--;     if not fadeActive() and (fadeOutStarted or start.escFlag) then
--;
--; and [Select Info] fadeout.time is 0, so fadeActive() goes false almost
--; immediately - the loop broke a frame or two after the fade was armed, taking
--; the whole select bgdef with it, wipe included, while 20023 was still counting
--; out its 36 blank ticks. The sprite was not being hidden early, the SCREEN was
--; ending early. sfazSelectOutroHoldScreen() keeps that loop alive until the
--; fade animation actually draws, and start.lua asks it before breaking.
--;
--; Only the normal completion path can hold: the hold is armed by Finish(),
--; which the cancel/esc path never calls, so backing out of the select screen
--; still exits at once.
--;
--; This is watched rather than counted on purpose. The alternative is another
--; tick number that has to be kept equal to 20023's lead-in by hand, and would
--; silently desync the moment anyone re-times that action. bg.playhidemax is
--; only a safety net for a fade that never draws at all (no fadeout.anim, or an
--; all-blank one), so the wipe cannot be left on screen forever.
--;
--; bg.playtime is what makes the fade line up with the wipe. bg.play is an
--; action with a blank lead-in (16 ticks here) followed by its frames (6 x 2),
--; so it is not finished until 28 - and the FADE, which plays [Select Info]
--; fadeout.anim, must not start before then or the wipe is cut off mid-way. The
--; outro therefore runs for max(time, bg.playtime). Recount this if the action
--; is re-timed: it is the sum of every frame's duration up to and including the
--; last visible one.
--;
--; bg.hide / bg.play address SELECTBG elements by their `actionno`. A bgdef
--; element normally only answers to the bgdef's own timeline, which runs from
--; when the background was reset, so it cannot react to the screen leaving.
--; bgSetActionState() (engine, src/script.go) is the way in.
--;
--; The engine discards motif params it does not know, so the section is read
--; straight from the file, the same way [SFAZ Defeated Portraits] and [Ratio]
--; are.
--;===========================================================

local cfg = {
	enabled     = true,
	time        = 24,
	face2_dist  = 220,
	face2_disty = 0,
	title_dist  = 60,
	curve       = 2,
	names       = true,
	bg_hide     = -1,
	bg_play     = -1,
	bg_playreset = true,
	bg_playtime = 0,
	cursors     = true,
	cells       = true,
	world_elem  = 0,     -- 0 = none; negatives address SelectBG by position
	world_dist  = 60,
	world_hide  = true,
	bg_playhide = true,
	bg_playhidemax = 180,
}

do
	local path = gameOption('Config.Motif')
	if type(path) ~= 'string' or path == '' then path = 'data/system.def' end
	local fh = io.open(path, 'r')
	if fh then
		local section = ''
		for line in fh:lines() do
			local body = line:gsub(';.*$', '')
			local sec = body:match('^%s*%[%s*([^%]]-)%s*%]')
			if sec then
				section = sec:lower()
			elseif section == 'sfaz select outro' then
				local k, v = body:match('^%s*([%w_.]+)%s*=%s*(.-)%s*$')
				if k and v and v ~= '' then
					k = k:lower():gsub('%.', '_')
					local cur = cfg[k]
					if type(cur) == 'boolean' then
						cfg[k] = (tonumber(v) or 0) ~= 0
					elseif type(cur) == 'number' then
						cfg[k] = tonumber(v) or cur
					end
				end
			end
		end
		fh:close()
	end
end

local t = -1         -- -1 = not running
local bgDone = false -- the bg swap is a one-shot, not a per-frame state
local outroBg = nil  -- the bgdef handed over by the select screen
local finishDone = false
local playHidden = false  -- bg.play hidden once fadeout.anim began drawing
local sinceFade = -1      -- ticks since the fade was released, -1 = not yet

-- Forward declaration: sfazSelectOutroTick() below calls this, and a local
-- declared further down would not be in scope there - the call would silently
-- resolve to a nil global instead.
local f_progress

--; Called when the select screen starts, so a cancelled or re-entered screen
--; never inherits a half-finished slide.
function sfazSelectOutroReset()
	-- Put the world layer back before forgetting the bgdef, or a cancelled
	-- screen would come back with it still shifted up.
	if outroBg ~= nil and cfg.world_elem < 0 and type(bgSetActionState) == 'function' then
		bgSetActionState(outroBg, cfg.world_elem, nil, false, 0, 0)
	end
	-- Show again what Finish() hid, or a cancelled screen comes back empty.
	if outroBg ~= nil and type(bgSetActionState) == 'function' then
		if cfg.bg_play >= 0 then bgSetActionState(outroBg, cfg.bg_play, true, false) end
		if cfg.world_elem < 0 then bgSetActionState(outroBg, cfg.world_elem, true, false) end
	end
	t = -1
	bgDone = false
	finishDone = false
	playHidden = false
	sinceFade = -1
	if start ~= nil then start.needUpdateDrawList = true end
	outroBg = nil
end

--; Arm it. Safe to call every frame; only the first call starts the clock.
function sfazSelectOutroStart()
	if not cfg.enabled then return end
	if t < 0 then t = 0 end
end

--; Hide one bgdef action and restart another, once, at the moment the outro
--; starts. Separate from Start() because the caller has to hand over the bgdef
--; and only the select screen knows which one that is.
function sfazSelectOutroBg(bgdef)
	if not cfg.enabled or bgDone or t < 0 then return end
	if bgdef == nil or type(bgSetActionState) ~= 'function' then return end
	bgDone = true
	outroBg = bgdef
	if cfg.bg_hide >= 0 then
		bgSetActionState(bgdef, cfg.bg_hide, false, false)
	end
	if cfg.bg_play >= 0 then
		-- Rewind only when the action needs replaying; see bg.playreset above.
		bgSetActionState(bgdef, cfg.bg_play, true, cfg.bg_playreset)
	end
end

--; True while the character names should still be drawn.
function sfazSelectOutroNamesVisible()
	if not cfg.enabled or not cfg.names then return true end
	return t < 0
end

--; Called at the instant the fade is released, so whatever must not survive into
--; the fadeout animation stops being drawn on the same frame. One-shot.
function sfazSelectOutroFinish()
	if finishDone or outroBg == nil then return end
	if type(bgSetActionState) ~= 'function' then return end
	finishDone = true
	sinceFade = 0
	if cfg.world_hide and cfg.world_elem < 0 then
		bgSetActionState(outroBg, cfg.world_elem, false, false)
	end
end

--; True while f_selectScreen must NOT end yet: the fade has been armed but its
--; animation has not drawn a frame, so ending now would take the wipe off screen
--; before anything replaced it. False in every other case, including cancel.
function sfazSelectOutroHoldScreen()
	if not cfg.enabled or not cfg.bg_playhide then return false end
	if cfg.bg_play < 0 or sinceFade < 0 or playHidden then return false end
	return sinceFade < cfg.bg_playhidemax
end

--; True while the ROSTER CELL PORTRAITS should still be drawn.
--;
--; These are the 9000,0 sprites, which alternate characters use to change their
--; cell image. They are drawn on top of the roster plate that bg.play (100,6)
--; provides, so when that is hidden they were left floating with nothing behind
--; them. Tied to playHidden rather than to `t` so the two disappear on the SAME
--; frame - the plate goes when fadeout.anim starts drawing, which is later than
--; the start of the slide.
function sfazSelectOutroCellsVisible()
	if not cfg.enabled or not cfg.cells then return true end
	return not playHidden
end

--; True while the player cursors should still be drawn.
function sfazSelectOutroCursorsVisible()
	if not cfg.enabled or not cfg.cursors then return true end
	return t < 0
end

--; How long the outro lasts: the slide, or the background wipe if that is
--; longer. The fade is held for all of it.
local function f_duration()
	local d = cfg.time
	if cfg.bg_play >= 0 and cfg.bg_playtime > d then
		d = cfg.bg_playtime
	end
	return d
end

--; One tick. Call once per frame from the select screen loop.
function sfazSelectOutroTick()
	if t >= 0 and t < f_duration() then
		t = t + 1
	end
	-- Hand the wipe over to the fade with no gap: hide bg.play the frame
	-- fadeout.anim starts drawing. See the header for why this is watched.
	if sinceFade >= 0 and not playHidden and cfg.bg_playhide and cfg.bg_play >= 0
		and outroBg ~= nil and type(bgSetActionState) == 'function' then
		sinceFade = sinceFade + 1
		local drawing = false
		if type(fadeAnimDrawing) == 'function' and motif ~= nil
			and motif.select_info ~= nil and motif.select_info.fadeout ~= nil then
			local ok, r = pcall(fadeAnimDrawing, motif.select_info.fadeout.FadeData)
			drawing = ok and r
		end
		if drawing or sinceFade >= cfg.bg_playhidemax then
			playHidden = true
			bgSetActionState(outroBg, cfg.bg_play, false, false)
			-- The cell portraits go with it. They are in the select screen's
			-- CACHED draw list (start.updateDrawList, rebuilt only when this
			-- flag is set), so flipping the state is not enough - the list has
			-- to be rebuilt or they stay on screen until something else
			-- happens to invalidate it.
			if start ~= nil then start.needUpdateDrawList = true end
		end
	end
	-- Slide the world layer with the rest of it. Done here rather than in the
	-- draw path because a bgdef element is drawn by the engine, not by start.lua.
	if t >= 0 and outroBg ~= nil and cfg.world_elem < 0
		and type(bgSetActionState) == 'function' then
		bgSetActionState(outroBg, cfg.world_elem, nil, false, 0, -cfg.world_dist * f_progress())
	end
end

--; True once there is nothing left to animate - which is also true when the
--; outro is disabled or was never armed, so callers can gate the fade on it
--; unconditionally.
function sfazSelectOutroDone()
	if not cfg.enabled then return true end
	return t < 0 or t >= f_duration()
end

--; 0 before it starts, 1 when finished, eased in between. Uses the SLIDE's own
--; time, not the outro duration: when the background wipe is the longer of the
--; two the portraits should still finish on schedule rather than crawl.
f_progress = function()
	if not cfg.enabled or t < 0 then return 0 end
	if cfg.time <= 0 then return 1 end
	local p = t / cfg.time
	if p > 1 then p = 1 end
	local c = cfg.curve
	if c == nil or c <= 1 then return p end
	return p ^ c
end

--; How far this side's 9000,1 portrait has slid. P1 goes left, P2 right.
function sfazSelectOutroFaceDx(side)
	local dir = (tonumber(side) == 2) and 1 or -1
	return dir * cfg.face2_dist * f_progress()
end

function sfazSelectOutroFaceDy(side)
	return cfg.face2_disty * f_progress()
end

--; How far the mode title has slid up (negative y).
function sfazSelectOutroTitleDy()
	return -cfg.title_dist * f_progress()
end
