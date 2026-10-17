--;===========================================================
--; SFAZ AI TELEMETRY  (diagnostic - safe to delete)
--;
--; Records what each character's AI actually DID during a round and writes one
--; summary block per round to  save/logs/sfaz_ai_report.txt
--;
--; Point of it: "character X is too easy" is not something you can see from the
--; outside. This says whether the AI ever switched on at all (var 58/59 - see
--; AI ACTIVATION below), how much of the round it spent doing nothing, how many
--; attacks it actually started, how much of its meter it sat on without
--; spending, and how often what it threw out connected.
--;
--; ENABLE: add  sfazAiReport()  to [Common] Lua in save/config.ini, i.e.
--;     Lua     = loop(), if sfazAiReport then sfazAiReport() end
--; DISABLE: put that line back to  Lua     = loop()
--;
--; Costs nothing during play - everything is counted in memory and the file is
--; written once, when the round ends.
--;
--; AI ACTIVATION, which is the thing most worth checking:
--; every .cmd in this roster detects "am I being played by the CPU" with a block
--; of dummy commands AI_1..AI_50 that only the engine's AI input can produce,
--; and latches the answer in var(58) (38 characters) or var(59) (7 of them).
--; var(59) is then re-rolled EVERY FRAME as random < var(58) * <scale by
--; AILevel>, and nearly every AI decision in the file is gated on it. If var58
--; never reaches 1 the character's whole AI is dead and it just stands there;
--; if var59 is rarely 1 it acts rarely. Both are reported below as a percentage
--; of the round.
--;===========================================================

local LOG = 'save/logs/sfaz_ai_report.txt'

local st          = nil   -- per-round accumulator
local wasFighting = false

local function newSide()
	return {
		frames = 0, name = '?', ai = 0,
		-- time census
		idle = 0, walk = 0, crouch = 0, run = 0, jump = 0, guard = 0,
		normal = 0, special = 0, hyper = 0, throw = 0, hurt = 0, other = 0,
		ctrlFrames = 0,
		-- entry counts (state changes into a category)
		nNormal = 0, nSpecial = 0, nHyper = 0, nThrow = 0, nJump = 0, nGuard = 0,
		-- outcomes
		hits = 0, blocked = 0,
		-- meter
		powMax = 0, pow1000 = 0, pow2000 = 0, pow3000 = 0,
		-- ai flags
		v58 = 0, v59 = 0, v55 = 0,
		-- spacing
		distSum = 0, distN = 0, idleCtrl = 0, atk = {},
		lifeStart = 0, lifeEnd = 0,
		last = -1, lastHit = 0, lastGuarded = 0,
	}
end

local function classify(s)
	if s == 0 then return 'idle'
	elseif s >= 10 and s <= 12 then return 'crouch'
	elseif s >= 20 and s <= 22 then return 'walk'
	elseif s >= 40 and s <= 59 then return 'jump'
	elseif s >= 100 and s <= 106 then return 'run'
	elseif s >= 120 and s <= 155 then return 'guard'
	elseif s >= 200 and s <= 499 then return 'normal'
	elseif s >= 800 and s <= 899 then return 'throw'
	elseif s >= 1000 and s <= 2999 then return 'special'
	elseif s >= 3000 and s <= 4999 then return 'hyper'
	elseif s >= 5000 then return 'hurt'
	end
	return 'other'
end

local function sample(n, t)
	if not player(n) then return end
	local s = stateNo()
	player(n); local c = ctrl()
	player(n); local pw = power()
	player(n); local mh = moveHit()
	player(n); local mg = moveGuarded()
	player(n); local d  = p2BodyDistX()
	player(n); t.name = name()
	player(n); t.ai = aiLevel()
	player(n); local v55 = var(55)
	player(n); local v58 = var(58)
	player(n); local v59 = var(59)
	player(n); t.lifeEnd = life()
	if t.frames == 0 then t.lifeStart = t.lifeEnd end

	t.frames = t.frames + 1
	local k = classify(s)
	t[k] = t[k] + 1
	if c then t.ctrlFrames = t.ctrlFrames + 1 end
	-- the real "doing nothing" number: standing idle WITH control available
	if c and (s == 0 or s == 11) then t.idleCtrl = t.idleCtrl + 1 end

	-- category ENTRIES, so "attacks started" is not confused with "frames spent attacking"
	if s ~= t.last then
		local pk = (t.last ~= nil and t.last >= 0) and classify(t.last) or ''
		if k ~= pk then
			if k == 'normal'  then t.nNormal  = t.nNormal + 1
			elseif k == 'special' then t.nSpecial = t.nSpecial + 1
			elseif k == 'hyper'   then t.nHyper   = t.nHyper + 1
			elseif k == 'throw'   then t.nThrow   = t.nThrow + 1
			elseif k == 'jump'    then t.nJump    = t.nJump + 1
			elseif k == 'guard'   then t.nGuard   = t.nGuard + 1
			end
			-- which move, not just which category
			if k == 'normal' or k == 'special' or k == 'hyper' or k == 'throw' then
				t.atk[s] = (t.atk[s] or 0) + 1
			end
		end
		t.last = s
	end

	if mh > 0 and t.lastHit <= 0 then t.hits = t.hits + 1 end
	if mg > 0 and t.lastGuarded <= 0 then t.blocked = t.blocked + 1 end
	t.lastHit, t.lastGuarded = mh, mg

	if pw > t.powMax then t.powMax = pw end
	if pw >= 1000 then t.pow1000 = t.pow1000 + 1 end
	if pw >= 2000 then t.pow2000 = t.pow2000 + 1 end
	if pw >= 3000 then t.pow3000 = t.pow3000 + 1 end

	if v55 ~= 0 then t.v55 = t.v55 + 1 end
	if v58 ~= 0 then t.v58 = t.v58 + 1 end
	if v59 ~= 0 then t.v59 = t.v59 + 1 end

	if d then t.distSum = t.distSum + math.abs(d); t.distN = t.distN + 1 end
end

local function pct(a, b) if b == 0 then return 0 end return a * 100 / b end

-- Which states it actually entered, most-used first. This is what says whether a
-- character simply never attempts a move at all.
local function topMoves(tbl)
	local a = {}
	for k, v in pairs(tbl) do a[#a + 1] = { k, v } end
	table.sort(a, function(x, y) return x[2] > y[2] end)
	local out = {}
	for i = 1, math.min(#a, 10) do out[#out + 1] = string.format('%dx%d', a[i][1], a[i][2]) end
	if #out == 0 then return '(none)' end
	return table.concat(out, '  ')
end

local function dump(t, n)
	local f = t.frames
	if f == 0 then return {} end
	return {
		string.format('  P%d %-18s aiLevel=%d   round frames=%d (%.1fs)  life %d -> %d',
			n, t.name, t.ai, f, f / 60, t.lifeStart, t.lifeEnd),
		string.format('     AI FLAGS      var58 on %5.1f%% of frames   var59 on %5.1f%%   var55 on %5.1f%%',
			pct(t.v58, f), pct(t.v59, f), pct(t.v55, f)),
		string.format('     TIME          idle %4.1f%%  walk %4.1f%%  crouch %4.1f%%  run %4.1f%%  jump %4.1f%%  guard %4.1f%%',
			pct(t.idle, f), pct(t.walk, f), pct(t.crouch, f), pct(t.run, f), pct(t.jump, f), pct(t.guard, f)),
		string.format('                   normal %4.1f%%  special %4.1f%%  hyper %4.1f%%  throw %4.1f%%  hurt %4.1f%%  other %4.1f%%',
			pct(t.normal, f), pct(t.special, f), pct(t.hyper, f), pct(t.throw, f), pct(t.hurt, f), pct(t.other, f)),
		string.format('     ATTEMPTS      normals=%d  specials=%d  hypers=%d  throws=%d  jumps=%d  guards=%d',
			t.nNormal, t.nSpecial, t.nHyper, t.nThrow, t.nJump, t.nGuard),
		string.format('     CONNECTED     hit=%d  blocked=%d   (attempts that did neither = %d)',
			t.hits, t.blocked,
			math.max(0, t.nNormal + t.nSpecial + t.nHyper + t.nThrow - t.hits - t.blocked)),
		string.format('     METER         peak=%d   sat on >=1000 for %4.1f%% of round, >=2000 %4.1f%%, >=3000 %4.1f%%',
			t.powMax, pct(t.pow1000, f), pct(t.pow2000, f), pct(t.pow3000, f)),
		string.format('     SPACING       mean body distance %.0f      had ctrl %4.1f%% of frames',
			t.distN > 0 and t.distSum / t.distN or 0, pct(t.ctrlFrames, f)),
		string.format('     DOING NOTHING %4.1f%% of the round stood idle WITH control available',
			pct(t.idleCtrl, f)),
		'     MOVES USED    ' .. topMoves(t.atk),
	}
end

function sfazAiReport()
	local ok, err = pcall(function()
		if type(player) ~= 'function' or not player(1) or not player(2) then return end
		local rs = roundState()

		if rs == 2 then
			if not wasFighting then
				wasFighting = true
				st = { newSide(), newSide() }
			end
			sample(1, st[1])
			sample(2, st[2])
			return
		end

		-- round just ended: write the block once
		if wasFighting and st then
			wasFighting = false
			local lines = { string.format('===== round %d ended  %s =====', roundNo(), os.date('%H:%M:%S')) }
			for n = 1, 2 do
				for _, l in ipairs(dump(st[n], n)) do lines[#lines + 1] = l end
			end
			lines[#lines + 1] = ''
			local fh = io.open(LOG, 'a')
			if fh then fh:write(table.concat(lines, '\n') .. '\n'); fh:close() end
			st = nil
		end
	end)
	if not ok then
		local fh = io.open(LOG, 'a')
		if fh then fh:write('sfazAiReport error: ' .. tostring(err) .. '\n'); fh:close() end
	end
end
