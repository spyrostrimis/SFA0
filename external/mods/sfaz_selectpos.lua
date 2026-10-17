--;===========================================================
--; SELECT-SCREEN PORTRAIT POSITION
--;
--; Where the select screen actually puts a side's big character animation, so
--; the intro storyboards and anything else can land on the SAME pixel instead of
--; guessing.
--;
--; WHY THIS EXISTS
--;
--; Copying `p1.face.offset` out of [Select Info] does not work, and this is the
--; reason: that offset is not the position. start.lua builds the real one in
--; f_portraitsXCalc + drawPortraitLayer out of THREE motif values, and the
--; offset is only one of them:
--;
--;     x = select_info.pN.pos[1] + pM.face.offset[1] + (member-1) * pN.spacing[1]
--;     y = select_info.pN.pos[2] + pM.face.offset[2] + (member-1) * pN.spacing[2]
--;
--;   * pN.pos     is the SIDE's base position - the thing people miss, because
--;                nothing in the face's own config mentions it.
--;   * pM.face    is per PLAYER NUMBER, not per side: member 2 of side 1 is p3,
--;                member 3 is p5. f_getMotifP resolves that, and a motif that
--;                gives p3 a different offset than p1 is respected here too.
--;   * spacing    steps the teammates, which is also exactly where a storyboard
--;                should put them.
--;
--; And when pN.padding is set the x term is not a simple step at all but
--; centres the row over the team, so that branch is reproduced rather than
--; approximated - see f_x below.
--;
--; USAGE
--;
--;     local x, y = sfazSelectPos(1, 1)   -- side 1, member 1
--;     local n    = sfazSelectTeamSize(1)
--;
--; The third argument overrides the SPREAD without touching the anchor, for
--; callers that stand a whole team side by side where the select screen only
--; showed portraits:
--;
--;     sfazSelectPos(1, 2, {spacing = {45, 0}, padding = true})
--;
--; pos and offset still come from the motif, so the row starts in the same
--; place; only how far apart the members sit changes.
--;
--; Both are globals so any mod can use them without a require order.
--;===========================================================

--; The face config for one member of a side, resolved through the same helper
--; start.lua uses so per-player-number overrides are honoured.
local function f_faceCfg(side, member)
	if motif == nil or motif.select_info == nil then return nil end
	local pn = 2 * (member - 1) + side
	local cfg = motif.select_info['p' .. pn]
	-- f_getMotifP falls back to the side's own block when the player number has
	-- no entry of its own; mirror that rather than returning nothing.
	if cfg == nil or cfg.face == nil then
		cfg = motif.select_info['p' .. side]
	end
	if cfg == nil then return nil end
	return cfg.face
end

local function f_pair(t, dflt)
	if type(t) ~= 'table' then return dflt[1], dflt[2] end
	return tonumber(t[1]) or dflt[1], tonumber(t[2]) or dflt[2]
end

--; How many members that side actually selected, capped by the motif's own
--; `num` for the side - drawing more than the select screen would is never right.
function sfazSelectTeamSize(side)
	local n = 1
	if start ~= nil and start.p ~= nil and start.p[side] ~= nil then
		local sel = start.p[side].t_selected
		if type(sel) == 'table' and #sel > 0 then
			n = #sel
		end
	end
	local sideCfg = motif ~= nil and motif.select_info ~= nil
		and motif.select_info['p' .. side] or nil
	if sideCfg ~= nil and tonumber(sideCfg.num) ~= nil then
		n = math.min(n, math.floor(tonumber(sideCfg.num)))
	end
	return math.max(1, n)
end

--; The x term, reproducing start.lua's f_portraitsXCalc including the padding
--; branch. Kept verbatim in shape so a future engine change can be diffed
--; against it rather than re-derived.
local function f_x(side, member, sideCfg, faceCfg, over)
	over = over or {}
	local px = f_pair(sideCfg.pos, {0, 0})
	local ox = f_pair(faceCfg.offset, {0, 0})
	local sx = f_pair(over.spacing or sideCfg.spacing, {0, 0})
	local x = px + ox
	local padding = sideCfg.padding
	if over.padding ~= nil then padding = over.padding end
	if padding then
		local num = tonumber(over.num or sideCfg.num) or 1
		local selected = 0
		if start ~= nil and start.p ~= nil and start.p[side] ~= nil then
			selected = #(start.p[side].t_selected or {})
			selected = math.max(selected, tonumber(start.p[side].numChars) or 0)
		end
		local denom = 2 * math.min(num, math.max(selected, 1))
		if denom == 0 then denom = 2 end
		return x + (2 * member - 1) * sx * num / denom
	end
	return x + (member - 1) * sx
end

--; Returns x, y for one member, or nil when the motif has no such config.
--; `over` is optional; see the header for what it may carry.
function sfazSelectPos(side, member, over)
	side = tonumber(side) or 1
	member = tonumber(member) or 1
	over = over or {}
	if motif == nil or motif.select_info == nil then return nil end
	local sideCfg = motif.select_info['p' .. side]
	local faceCfg = f_faceCfg(side, member)
	if sideCfg == nil or faceCfg == nil then return nil end
	local _, py = f_pair(sideCfg.pos, {0, 0})
	local _, oy = f_pair(faceCfg.offset, {0, 0})
	local _, sy = f_pair(over.spacing or sideCfg.spacing, {0, 0})
	-- The y term has no padding branch: start.lua's own drawPortraitLayer steps
	-- y plainly even when padding is on, and centring only ever applied to x.
	return f_x(side, member, sideCfg, faceCfg, over), py + oy + (member - 1) * sy
end
