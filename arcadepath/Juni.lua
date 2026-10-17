-- SFAZ LOOK-AHEAD: forget the previous run's pre-picked opponents before the
-- choosers below register and draw. See external/mods/sfaz_lookahead.lua.
if matchno() < 2 and type(sfazAheadReset) == 'function' then
	sfazAheadReset()
end

--------------------------------------------
-- JUNI ARCADE PATH
--------------------------------------------
    local match1234characters = {"SFZ_Dan", "SFZ_Karin", "SFZ_Mika", "SFZ_Rolento", "SFZ_Zangief", "SFZ_Birdie", "SFZ_Sodom-X", "SFZ_Blanka"}
    local match5characters = {"SFZ_Honda"}
	local match6characters = {"SFZ_Guile", "SFZ_Charlie", "SFZ_Rose", "SFZ_Gen-X"}
    local match7characters = {"SFZ_DJ", "SFZ_Cody-X", "SFZ_FeiLong"}
    local match8characters = {"SFZ_ChunLi-X"}	
	local match9characters = {"SFZ_Sagat"}
	local match10characters = {"SFZ_Ryu"}

	launchStoryboard('data/Intros/Intro_Juni.def')
	-- SFAZ: Intro2 storyboard retired - the real victory screen is shown early
	-- instead (external/mods/sfaz_earlyvictory.lua). The .def file is still on
	-- disk, just no longer launched.
	--launchStoryboard('data/Intros/Intro_Juni2.def')
	
	local usedCharacters = {}
	
	local function selectRandomCharacter()
    local remainingCharacters = {}
    
    -- Create a table of remaining characters not yet used
    for _, char in ipairs(match1234characters) do
        if not usedCharacters[char] then
            table.insert(remainingCharacters, char)
        end
    end
    
    if #remainingCharacters == 0 then
        -- All characters have been used, reset the usedCharacters table
        for _, char in ipairs(match1234characters) do
            usedCharacters[char] = nil
        end
        return math.random(1, #match1234characters)  -- Select from all characters if none remaining
    end
    
    local randomIndex = math.random(1, #remainingCharacters)
    local selectedCharacter = remainingCharacters[randomIndex]
    usedCharacters[selectedCharacter] = true
    return selectedCharacter
end

-- MATCHES 1 to 4
-- SFAZ LOOK-AHEAD: same choice as before, returned instead of used on
-- the spot, so it can be made one match early.
local function sfazChooseEarly()
        local selectedChar = selectRandomCharacter()
        return {char = selectedChar, stage = nil}
end
sfazAheadRegister(1, 4, sfazChooseEarly)

-- SFAZ LOOK-AHEAD: every chooser is registered HERE, before any match runs.
-- They used to sit next to their own match block, which meant match N+1 had
-- no chooser registered yet when match N's victory screen asked what was
-- coming - so the stage emblem went blank from the first block boundary on.

local function sfazChooseMatch5()
	local randomIndex = math.random(1, #match5characters)
	return {char = match5characters[randomIndex], stage = "stages/_Boss-Honda.def"}
end
sfazAheadRegister(5, 5, sfazChooseMatch5)

local function sfazChooseMatch6()
	local randomIndex = math.random(1, #match6characters)
	return {char = match6characters[randomIndex], stage = nil}
end
sfazAheadRegister(6, 6, sfazChooseMatch6)

local function sfazChooseMatch7()
	local randomIndex = math.random(1, #match7characters)
	return {char = match7characters[randomIndex], stage = nil}
end
sfazAheadRegister(7, 7, sfazChooseMatch7)

local function sfazChooseMatch8()
	local randomIndex = math.random(1, #match8characters)
	return {char = match8characters[randomIndex], stage = nil}
end
sfazAheadRegister(8, 8, sfazChooseMatch8)

local function sfazChooseMatch9()
	local randomIndex = math.random(1, #match9characters)
	return {char = match9characters[randomIndex], stage = nil}
end
sfazAheadRegister(9, 9, sfazChooseMatch9)

local function sfazChooseMatch10()
	local randomIndex = math.random(1, #match10characters)
	return {char = match10characters[randomIndex], stage = "stages/_Boss-Africa.def"}
end
sfazAheadRegister(10, 10, sfazChooseMatch10)


-- SFAZ EARLY VICTORY: replaces the Intro_X2.def storyboards. Placed after the
-- match-1 chooser is registered, because the stage emblem needs this match's
-- opponent to have been chosen. See external/mods/sfaz_earlyvictory.lua.
if matchno() < 2 and type(sfazEarlyVictory) == 'function' then
	sfazEarlyVictory()
end

for match = 1, 4 do
    if matchno() == match then
        local pick
        if type(sfazAhead) == 'function' then pick = sfazAhead(match) end
        if type(pick) ~= 'table' then pick = sfazChooseEarly() end

        local ok = launchFight{
            p2char = {pick.char},
            p2numchars = 1,
            p2teammode = "single",
        }

        if not ok then return end
    end
end


--MATCH 5 MID BOSS
-- SFAZ LOOK-AHEAD: same choice as before, returned instead of used on
-- the spot, so it can be made one match early.

if matchno() == 5 then
	local pick
	if type(sfazAhead) == 'function' then pick = sfazAhead(5) end
	if type(pick) ~= 'table' then pick = sfazChooseMatch5() end

    local ok = launchFight{
        p2char = {pick.char},     
        p2numchars = 1,
        p2teammode = "single",
		stage = pick.stage,
    }
    
    if not ok then return end
end



-- MATCH 6
-- SFAZ LOOK-AHEAD: same choice as before, returned instead of used on
-- the spot, so it can be made one match early.

if matchno() == 6 then
	local pick
	if type(sfazAhead) == 'function' then pick = sfazAhead(6) end
	if type(pick) ~= 'table' then pick = sfazChooseMatch6() end

    local ok = launchFight{
        p2char = {pick.char},     
        p2numchars = 1,
        p2teammode = "single",
    }
    
    if not ok then return end
end



--MATCH 7
-- SFAZ LOOK-AHEAD: same choice as before, returned instead of used on
-- the spot, so it can be made one match early.

if matchno() == 7 then
	local pick
	if type(sfazAhead) == 'function' then pick = sfazAhead(7) end
	if type(pick) ~= 'table' then pick = sfazChooseMatch7() end

    local ok = launchFight{
        p2char = {pick.char},     
        p2numchars = 1,
        p2teammode = "single",
    }
    
    if not ok then return end
end



--MATCH 8
-- SFAZ LOOK-AHEAD: same choice as before, returned instead of used on
-- the spot, so it can be made one match early.

if matchno() == 8 then
	local pick
	if type(sfazAhead) == 'function' then pick = sfazAhead(8) end
	if type(pick) ~= 'table' then pick = sfazChooseMatch8() end

    local ok = launchFight{
        p2char = {pick.char},     
        p2numchars = 1,
        p2teammode = "single",
    }
    
    if not ok then return end
end



--MATCH 9 PRE BOSS
-- SFAZ LOOK-AHEAD: same choice as before, returned instead of used on
-- the spot, so it can be made one match early.

if matchno() == 9 then
	local pick
	if type(sfazAhead) == 'function' then pick = sfazAhead(9) end
	if type(pick) ~= 'table' then pick = sfazChooseMatch9() end

    local ok = launchFight{
        p2char = {pick.char},     
        p2numchars = 1,
        p2teammode = "single",
		stage = pick.stage,
    }
    
    if not ok then return end
end



-- MATCH 10 MAIN BOSS
-- SFAZ LOOK-AHEAD: same choice as before, returned instead of used on
-- the spot, so it can be made one match early.

if matchno() == 10 then
	local pick
	if type(sfazAhead) == 'function' then pick = sfazAhead(10) end
	if type(pick) ~= 'table' then pick = sfazChooseMatch10() end

    local ok = launchFight{
        p2char = {pick.char},     
        p2numchars = 1,
        p2teammode = "single",
		stage = pick.stage,
    }
    
    if not ok then return end
end


launchStoryboard('data/Storyboards/Credits.def')
setMatchNo(-1)