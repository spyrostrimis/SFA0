--;===========================================================
--; CONTROLLER SIDE - auto-assign on first press
--;
--; PROBLEM
--; A single connected controller always drove P1. Nothing in the engine chose
--; that: src/system.go uiSetConfigDefaults() assigns "joyVal = pn - 1", so
--; player 1 gets joystick device 0, player 2 device 1, and so on. With one pad
--; connected the only device that exists is 0, so it can only ever be P1.
--;
--; RULE
--; The first device to press something on the character select screen takes P1,
--; and the single pad goes to whichever side is left:
--;
--;     pad presses first       -> pad is P1   (keyboard is P2)
--;     keyboard presses first  -> pad is P2   (keyboard is P1)
--;
--; So to put the controller on P2, just start navigating with the keyboard.
--;
--; Only ever runs with EXACTLY ONE pad connected. With two or more there is
--; nothing to decide - they take P1 and P2 in device order - and this restores
--; that mapping in case a previous single-pad session had moved it.
--;
--; NOT PERSISTED, by design. setJoystickIndex() writes the live config only, so
--; the decision is made fresh on every trip through the select screen and never
--; ends up in save/config.ini. Change your mind by pressing on the other device
--; next time.
--;===========================================================

local MAX_PADS = 8

local armed = false   -- a decision is wanted
local idle = false    -- both devices have been released at least once since arming

--; Count connected pads and return the index of the first one.
local function f_padScan()
	local n, first = 0, -1
	if type(getJoystickPresent) ~= 'function' then
		return 0, -1
	end
	for i = 0, MAX_PADS - 1 do
		if getJoystickPresent(i) then
			n = n + 1
			if first < 0 then
				first = i
			end
		end
	end
	return n, first
end

--; "" when nothing is held. getJoystickKey() with no argument listens on any pad.
local function f_padPressed()
	if type(getJoystickKey) ~= 'function' then
		return false
	end
	local ok, k = pcall(getJoystickKey)
	return ok and k ~= nil and k ~= ''
end

local function f_keyPressed()
	if type(getKey) ~= 'function' then
		return false
	end
	local ok, k = pcall(getKey)
	return ok and k ~= nil and k ~= ''
end

local function f_assign(p1Joy, p2Joy)
	if type(setJoystickIndex) ~= 'function' then
		return
	end
	pcall(setJoystickIndex, 1, p1Joy)
	pcall(setJoystickIndex, 2, p2Joy)
end

--; Re-arm whenever the select screen is reset, so the choice can be changed
--; between runs rather than being fixed for the whole session.
hook.add("start.f_selectReset", "sfaz_joyside_arm", function()
	armed = true
	idle = false
end)

hook.add("start.f_selectScreen", "sfaz_joyside", function()
	if not armed then
		return
	end

	local n, dev = f_padScan()
	if n ~= 1 then
		-- 0 pads: nothing to assign. 2+: the default device order is already
		-- right, but put it back in case a previous single-pad run moved it.
		if n >= 2 then
			f_assign(0, 1)
		end
		armed = false
		return
	end

	-- Wait for a clean press. Entering the select screen means a button was
	-- already held on some device, and getKey()/getJoystickKey() report what is
	-- held right now - so without this the decision would be made from the
	-- leftover press that opened the screen, on whichever device happened to
	-- still be down.
	if not idle then
		if not f_keyPressed() and not f_padPressed() then
			idle = true
		end
		return
	end

	if f_padPressed() then
		f_assign(dev, -1)   -- pad on P1
		armed = false
	elseif f_keyPressed() then
		f_assign(-1, dev)   -- pad on P2
		armed = false
	end
end)
