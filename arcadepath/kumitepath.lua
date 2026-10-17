--------------------------------------------
-- TIME ATTACK PATH
--------------------------------------------

--------------------------------------------
-- EARLY VICTORY SCREEN
--------------------------------------------
-- The Intro_X2.def storyboards that used to be launched here are retired.
-- They were hand-built copies of the victory screen; the real one is now shown
-- early instead, from inside each mode block below - it has to go after that
-- mode has registered its match-1 chooser, or the stage emblem has nothing to
-- announce. See external/mods/sfaz_earlyvictory.lua.

if gamemode('timeattack') then

local SFZ_Chunlis = math.random() > 0.5 and "SFZ_Chunli-X" or "SFZ_Chunli-Z"
local SFZ_Codys = math.random() > 0.5 and "SFZ_Cody-Z" or "SFZ_Cody-X"
local SFZ_Gens = math.random() > 0.5 and "SFZ_Gen-X" or "SFZ_Gen-Z"
local SFZ_Sodoms = math.random() > 0.5 and "SFZ_Sodom-X" or "SFZ_Sodom-Z"
local SFZ_Bisons = math.random() > 0.5 and "SFZ_N-Bison" or "SFZ_Bison"
local SFZ_Sagats = math.random() > 0.5 and "SFZ_U-Sagat" or "SFZ_Sagat"
local SFZ_Balrogs = math.random() > 0.5 and "SFZ_Mike" or "SFZ_Balrog"
local SFZ_Ryus = math.random() > 0.5 and "SFZ_E-Ryu" or "SFZ_Ryu"
local SFZ_Kens = math.random() > 0.5 and "SFZ_Ken" or "SFZ_V-Ken"
local SFZ_Sakuras = math.random() > 0.5 and "SFZ_D-Sakura" or "SFZ_Sakura"
local SFZ_Charlies = math.random() > 0.5 and "SFZ_R-Charlie" or "SFZ_Charlie"
local SFZ_Cammys = math.random() > 0.5 and "SFZ_Kbee" or "SFZ_Cammy"

local match1234characters = {"SFZ_Adon", "SFZ_Akuma", SFZ_Balrogs, "SFZ_Birdie", SFZ_Bisons, "SFZ_Blanka", SFZ_Cammys, SFZ_Charlies, SFZ_Chunlis, SFZ_Codys, "SFZ_Dan", "SFZ_Dhalsim", "SFZ_DJ", "SFZ_FeiLong", SFZ_Gens, "SFZ_Guile", "SFZ_Guy", "SFZ_Honda", "SFZ_Karin", SFZ_Kens, "SFZ_Mika", "SFZ_Rolento", "SFZ_Rose", SFZ_Ryus, SFZ_Sakuras, SFZ_Sodoms, "SFZ_T-Hawk", SFZ_Sagats, "SFZ_Vega", "SFZ_Zangief"}

local usedCharacters = {}
local currentWave = 1

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
-- SFAZ LOOK-AHEAD: same choices as before, returned instead of used on the
-- spot, so they can be made one match early. See sfaz_lookahead.lua.
local function chooseMatch_1_10()
        local selectedChar = selectRandomCharacter()
        return {char = selectedChar, stage = "stages/Venezuela.def"}
end
sfazAheadRegister(1, 10, chooseMatch_1_10)  -- SFAZ LOOK-AHEAD: this chooser owns these matches

-- SFAZ EARLY VICTORY: after this mode registered its match-1 chooser, so the
-- stage emblem can announce the match about to be played.
if matchno() < 2 and type(sfazEarlyVictory) == 'function' then
	sfazEarlyVictory()
end

for match = 1, 10 do
    if matchno() == match then
        local pick
        if type(sfazAhead) == 'function' then pick = sfazAhead(match) end
        if type(pick) ~= 'table' then pick = chooseMatch_1_10() end

        local ok = launchFight{
            p2char = {pick.char},
            p2numchars = 1,
            p2teammode = "single",
			p1rounds = 1,
			p2rounds = 1,
			ai = 2,
			stage = pick.stage,
        }

        if not ok then return end
    end
end

setMatchNo(-1)

end

--------------------------------------------
-- VS100KUMITE PATH
--------------------------------------------
if gamemode('vs100kumite') then
-- 30, 30, 30, 10
local SFZ_Chunli = math.random() > 0.5 and "SFZ_Chunli-Z" or "SFZ_Chunli-X"
local SFZ_Cody = math.random() > 0.5 and "SFZ_Cody-Z" or "SFZ_Cody-X"
local SFZ_Gen = math.random() > 0.5 and "SFZ_Gen-Z" or "SFZ_Gen-X"
local SFZ_Sodom = math.random() > 0.5 and "SFZ_Sodom-Z" or "SFZ_Sodom-X"

local wave1characters = {"SFZ_Adon", "SFZ_Akuma", "SFZ_Birdie", "SFZ_Bison", "SFZ_Blanka", "SFZ_Cammy", "SFZ_Charlie", SFZ_Chunli, SFZ_Cody, "SFZ_Dan", "SFZ_Dhalsim", "SFZ_DJ", "SFZ_FeiLong", SFZ_Gen, "SFZ_Guile", "SFZ_Guy", "SFZ_Honda", "SFZ_Karin", "SFZ_Ken", "SFZ_Mika", "SFZ_Mike", "SFZ_Rolento", "SFZ_Rose", "SFZ_Ryu", "SFZ_Sakura", SFZ_Sodom, "SFZ_T-Hawk", "SFZ_U-Sagat", "SFZ_Vega", "SFZ_Zangief"}
local wave2characters = {"SFZ_Adon", "SFZ_Akuma", "SFZ_Bison", "SFZ_Birdie", "SFZ_Blanka", "SFZ_ChunLi-X", "SFZ_Cody-Z", "SFZ_Dan", "SFZ_Dhalsim", "SFZ_DJ", "SFZ_FeiLong", "SFZ_Gen-Z","SFZ_Guile", "SFZ_Guy", "SFZ_Honda", "SFZ_Karin", "SFZ_Kbee", "SFZ_Ken", "SFZ_Mika", "SFZ_Mike", "SFZ_R-Charlie", "SFZ_Rolento", "SFZ_Rose", "SFZ_Ryu", "SFZ_Sagat", "SFZ_Sakura", "SFZ_Sodom-Z", "SFZ_T-Hawk", "SFZ_Vega", "SFZ_Zangief"}
	
local wave3characters = {"SFZ_Adon", "SFZ_AkumaS", "SFZ_Balrog", "SFZ_Birdie", "SFZ_Blanka", "SFZ_ChunLi-Z", "SFZ_Cody-X", "SFZ_Dan", "SFZ_Dhalsim", "SFZ_DJ", "SFZ_D-Sakura", "SFZ_E-Ryu", "SFZ_FeiLong", "SFZ_Gen-X", "SFZ_Guile", "SFZ_Guy", "SFZ_Honda", "SFZ_Karin", "SFZ_Kbee", "SFZ_Mika", "SFZ_N-Bison", "SFZ_R-Charlie", "SFZ_Rolento", "SFZ_Rose", "SFZ_Sagat", "SFZ_Sodom-X","SFZ_T-Hawk", "SFZ_Vega", "SFZ_V-Ken", "SFZ_Zangief"}
local wave4characters = {'SFZ_D-Sakura', 'SFZ_Gen-Z', 'SFZ_Balrog', 'SFZ_Rose', 'SFZ_R-Charlie',}
local wave5characters = {"SFZ_E-Ryu", "SFZ_AkumaS", 'SFZ_V-Ken', 'SFZ_N-Bison', "chars/SFZ_Sagat/SFZ_Sagat_CPU"}

local usedCharacters = {}
local currentWave = 1

local function selectRandomCharacter()
    local remainingCharacters = {}

    local currentWaveCharacters
    if currentWave == 1 then
        currentWaveCharacters = wave1characters
    elseif currentWave == 2 then
        currentWaveCharacters = wave2characters
    elseif currentWave == 3 then
        currentWaveCharacters = wave3characters
    elseif currentWave == 4 then
        currentWaveCharacters = wave4characters		
    elseif currentWave == 5 then
        currentWaveCharacters = wave5characters		
    end

    -- Create a table of remaining characters not yet used
    for _, char in ipairs(currentWaveCharacters) do
        if not usedCharacters[char] then
            table.insert(remainingCharacters, char)
        end
    end

    if #remainingCharacters == 0 then
        -- All characters have been used, reset the usedCharacters table
        for _, char in ipairs(currentWaveCharacters) do
            usedCharacters[char] = nil
        end

        currentWave = currentWave % 5 + 1  -- Move to the next wave (1, 2, 3, 1, 2, 3, ...)
        
        return selectRandomCharacter()  -- Recursive call for the next wave
    end

    local randomIndex = math.random(1, #remainingCharacters)
    local selectedCharacter = remainingCharacters[randomIndex]
    usedCharacters[selectedCharacter] = true
    return selectedCharacter
end

-- MATCHES 1 to 30
-- SFAZ LOOK-AHEAD: same choices as before, returned instead of used on the
-- spot, so they can be made one match early. See sfaz_lookahead.lua.
local function chooseMatch_1_30()
        local selectedChar = selectRandomCharacter()
        local stage = nil  -- Initialize stage variable

        -- Check the character and set the stage accordingly
        if selectedChar == "SFZ_Adon" then
            stage = math.random() > 0.5 and "Stages/Adon2.def" or "Stages/Adon.def"
        elseif selectedChar == "SFZ_Birdie" then
            stage = math.random() > 0.5 and "Stages/Birdie2.def" or "Stages/Birdie.def"
        elseif selectedChar == "SFZ_ChunLi-Z" then
            stage = math.random() > 0.5 and "Stages/Chunli3.def" or "Stages/Chunli.def"
        elseif selectedChar == "SFZ_Dan" then
            stage = math.random() > 0.5 and "Stages/Dan2.def" or "Stages/Dan.def"
        elseif selectedChar == "SFZ_Dhalsim" then
            stage = math.random() > 0.5 and "Stages/Dhalsim2.def" or "Stages/Dhalsim.def"
        elseif selectedChar == "SFZ_Guy" then
            stage = math.random() > 0.5 and "Stages/Guy2.def" or "Stages/Guy.def"
        elseif selectedChar == "SFZ_Honda" then
            stage = math.random() > 0.5 and "Stages/Honda3.def" or "Stages/Honda2.def"
        elseif selectedChar == "SFZ_Karin" then
            stage = math.random() > 0.5 and "Stages/Karin2.def" or "Stages/Karin.def"
        elseif selectedChar == "SFZ_Rolento" then
            stage = math.random() > 0.5 and "Stages/Rolento2.def" or "Stages/Rolento.def"
        elseif selectedChar == "SFZ_Rose" then
            stage = math.random() > 0.5 and "Stages/Rose3.def" or "Stages/Rose2.def"
        elseif selectedChar == "SFZ_Zangief" then
            stage = math.random() > 0.5 and "Stages/Zangief2.def" or "Stages/Zangief.def"			
        else
            -- For characters other than Ryu, use the randomized option from select.def
            stage = nil  -- You can replace this with your logic to get the randomized stage
        end

        return {char = selectedChar, stage = stage}
end
sfazAheadRegister(1, 30, chooseMatch_1_30)  -- SFAZ LOOK-AHEAD: this chooser owns these matches

-- SFAZ LOOK-AHEAD: every chooser in this mode is registered HERE, before any
-- of its matches run. Registering next to each block meant match N+1 had no
-- chooser yet when match N's victory screen asked what was coming.

local function chooseMatch_31_60()
        local selectedChar = selectRandomCharacter()
        local stage = nil  -- Initialize stage variable

        -- Check the character and set the stage accordingly
        if selectedChar == "SFZ_Adon" then
            stage = math.random() > 0.5 and "Stages/Adon2.def" or "Stages/Adon.def"
        elseif selectedChar == "SFZ_Birdie" then
            stage = math.random() > 0.5 and "Stages/Birdie2.def" or "Stages/Birdie.def"
        elseif selectedChar == "SFZ_ChunLi-X" then
            stage = math.random() > 0.5 and "Stages/Chunli3.def" or "Stages/Chunli2.def"
        elseif selectedChar == "SFZ_Dan" then
            stage = math.random() > 0.5 and "Stages/Dan2.def" or "Stages/Dan.def"
        elseif selectedChar == "SFZ_Dhalsim" then
            stage = math.random() > 0.5 and "Stages/Dhalsim2.def" or "Stages/Dhalsim.def"
        elseif selectedChar == "SFZ_Guy" then
            stage = math.random() > 0.5 and "Stages/Guy2.def" or "Stages/Guy.def"
        elseif selectedChar == "SFZ_Honda" then
            stage = math.random() > 0.5 and "Stages/Honda3.def" or "Stages/Honda2.def"
        elseif selectedChar == "SFZ_Karin" then
            stage = math.random() > 0.5 and "Stages/Karin2.def" or "Stages/Karin.def"
        elseif selectedChar == "SFZ_Ken" then
            stage = math.random() > 0.5 and "Stages/Ken2.def" or "Stages/Ken.def"
        elseif selectedChar == "SFZ_Rolento" then
            stage = math.random() > 0.5 and "Stages/Rolento2.def" or "Stages/Rolento.def"
        elseif selectedChar == "SFZ_Rose" then
            stage = math.random() > 0.5 and "Stages/Rose3.def" or "Stages/Rose2.def"
        elseif selectedChar == "SFZ_Ryu" then
            stage = math.random() > 0.5 and "Stages/Ryu3.def" or "Stages/Ryu.def"
        elseif selectedChar == "SFZ_Zangief" then
            stage = math.random() > 0.5 and "Stages/Zangief2.def" or "Stages/Zangief.def"			
        else
            -- For characters other than Ryu, use the randomized option from select.def
            stage = nil  -- You can replace this with your logic to get the randomized stage
        end

        return {char = selectedChar, stage = stage}
end
sfazAheadRegister(31, 60, chooseMatch_31_60)  -- SFAZ LOOK-AHEAD: this chooser owns these matches

local function chooseMatch_61_90()
        local selectedChar = selectRandomCharacter()
        local stage = nil  -- Initialize stage variable

        -- Check the character and set the stage accordingly
        if selectedChar == "SFZ_Adon" then
            stage = math.random() > 0.5 and "Stages/Adon2.def" or "Stages/Adon.def"
        elseif selectedChar == "SFZ_Birdie" then
            stage = math.random() > 0.5 and "Stages/Birdie2.def" or "Stages/Birdie.def"
        elseif selectedChar == "SFZ_ChunLi-Z" then
            stage = math.random() > 0.5 and "Stages/Chunli3.def" or "Stages/Chunli.def"
        elseif selectedChar == "SFZ_Dan" then
            stage = math.random() > 0.5 and "Stages/Dan2.def" or "Stages/Dan.def"
        elseif selectedChar == "SFZ_Dhalsim" then
            stage = math.random() > 0.5 and "Stages/Dhalsim2.def" or "Stages/Dhalsim.def"
        elseif selectedChar == "SFZ_Guy" then
            stage = math.random() > 0.5 and "Stages/Guy2.def" or "Stages/Guy.def"
        elseif selectedChar == "SFZ_Honda" then
            stage = math.random() > 0.5 and "Stages/Honda3.def" or "Stages/Honda2.def"
        elseif selectedChar == "SFZ_Karin" then
            stage = math.random() > 0.5 and "Stages/Karin2.def" or "Stages/Karin.def"
        elseif selectedChar == "SFZ_Ken" then
            stage = math.random() > 0.5 and "Stages/Ken2.def" or "Stages/Ken.def"
        elseif selectedChar == "SFZ_Rolento" then
            stage = math.random() > 0.5 and "Stages/Rolento2.def" or "Stages/Rolento.def"
        elseif selectedChar == "SFZ_Rose" then
            stage = math.random() > 0.5 and "Stages/Rose3.def" or "Stages/Rose2.def"
        elseif selectedChar == "SFZ_Ryu" then
            stage = math.random() > 0.5 and "Stages/Ryu3.def" or "Stages/Ryu.def"
        elseif selectedChar == "SFZ_Zangief" then
            stage = math.random() > 0.5 and "Stages/Zangief2.def" or "Stages/Zangief.def"			
        else
            -- For characters other than Ryu, use the randomized option from select.def
            stage = nil  -- You can replace this with your logic to get the randomized stage
        end

        return {char = selectedChar, stage = stage}
end
sfazAheadRegister(61, 90, chooseMatch_61_90)  -- SFAZ LOOK-AHEAD: this chooser owns these matches

local function chooseMatch_91_95()
        local selectedChar = selectRandomCharacter()
        local music = nil  -- Initialize stage variable
        -- Check if the selected character is Ryu and set the stage accordingly
        if selectedChar == "SFZ_D-Sakura" then
            music = {"Sound/D-Sakura.mp3", 255, 1788293, 4143390}
        elseif selectedChar == "SFZ_Gen-Z" then
            music = {"Sound/Gen2.mp3", 255, 341986, 2568662}	
        elseif selectedChar == "SFZ_Balrog" then
            music = {"Sound/Balrog.mp3", 255, 463039, 2782029}	
        elseif selectedChar == "SFZ_Rose" then
            music = {"Sound/Rose.mp3", 255, 791341, 2633097}	
        elseif selectedChar == "SFZ_R-Charlie" then
            music = {"Sound/Charlie2.mp3", 255, 215877, 2792605}				
        else
            -- For characters other than Ryu, use the randomized option from select.def
            music = nil  -- You can replace this with your logic to get the randomized stage
        end

        return {char = selectedChar, stage = "stages/Venezuela.def"}
end
sfazAheadRegister(91, 95, chooseMatch_91_95)  -- SFAZ LOOK-AHEAD: this chooser owns these matches

local function chooseMatch_96_VS100_FINAL_MATCH()
        local selectedChar = selectRandomCharacter()
        local music = nil  -- Initialize stage variable
        -- Check if the selected character is Ryu and set the stage accordingly
        if selectedChar == "SFZ_AkumaS" then
            music = {"Sound/Shin Akuma.mp3", 255, 2014476, 4260540}
        elseif selectedChar == "SFZ_E-Ryu" then
            music = {"Sound/Ryu.mp3", 255, 1888, 2706545}		
        elseif selectedChar == "SFZ_N-Bison" then
            music = {"Sound/ViolentEvil.mp3", 255, 1065260, 3118373}
        elseif selectedChar == "SFZ_V-Ken" then
            music = {"Sound/Ken.mp3", 255, 1415590, 4014076}
        elseif selectedChar == "chars/SFZ_Sagat/SFZ_Sagat_CPU" then
            music = {"Sound/Sagat2.mp3", 255, 2241627, 4808826}				
        else
            -- For characters other than Ryu, use the randomized option from select.def
            music = nil  -- You can replace this with your logic to get the randomized stage
        end

        return {char = selectedChar, stage = "stages/Outbacks.def"}
end
sfazAheadRegister(96, VS100_FINAL_MATCH, chooseMatch_96_VS100_FINAL_MATCH)  -- SFAZ LOOK-AHEAD: this chooser owns these matches


-- SFAZ EARLY VICTORY: after this mode registered its match-1 chooser, so the
-- stage emblem can announce the match about to be played.
if matchno() < 2 and type(sfazEarlyVictory) == 'function' then
	sfazEarlyVictory()
end

for match = 1, 30 do -- Increase the number of matches as needed
    if matchno() == match then
        local pick
        if type(sfazAhead) == 'function' then pick = sfazAhead(match) end
        if type(pick) ~= 'table' then pick = chooseMatch_1_30() end

        local ok = launchFight{
            p2char = {pick.char},
            p2numchars = 1,
            p2teammode = "single",
            stage = pick.stage, -- Pass the stage information to launchFight
        }

        if not ok then return end
    end
end

-- MATCHES 31 to 60
-- SFAZ LOOK-AHEAD: same choices as before, returned instead of used on the
-- spot, so they can be made one match early. See sfaz_lookahead.lua.

for match = 31, 60 do -- Increase the number of matches as needed
    if matchno() == match then
        local pick
        if type(sfazAhead) == 'function' then pick = sfazAhead(match) end
        if type(pick) ~= 'table' then pick = chooseMatch_31_60() end

        local ok = launchFight{
            p2char = {pick.char},
            p2numchars = 1,
            p2teammode = "single",
            stage = pick.stage, -- Pass the stage information to launchFight
        }

        if not ok then return end
    end
end

-- MATCHES 61 to 90
-- SFAZ LOOK-AHEAD: same choices as before, returned instead of used on the
-- spot, so they can be made one match early. See sfaz_lookahead.lua.

for match = 61, 90 do -- Increase the number of matches as needed
    if matchno() == match then
        local pick
        if type(sfazAhead) == 'function' then pick = sfazAhead(match) end
        if type(pick) ~= 'table' then pick = chooseMatch_61_90() end

        local ok = launchFight{
            p2char = {pick.char},
            p2numchars = 1,
            p2teammode = "single",
            stage = pick.stage, -- Pass the stage information to launchFight
        }

        if not ok then return end
    end
end

-- MATCHES 91 to 95
-- SFAZ LOOK-AHEAD: same choices as before, returned instead of used on the
-- spot, so they can be made one match early. See sfaz_lookahead.lua.

for match = 91, 95 do -- Increase the number of matches as needed
    if matchno() == match then
        local pick
        if type(sfazAhead) == 'function' then pick = sfazAhead(match) end
        if type(pick) ~= 'table' then pick = chooseMatch_91_95() end

        local ok = launchFight{
            p2char = {pick.char},
            p2numchars = 1,
            p2teammode = "single",
            stage = pick.stage,
			music = music,
        }

        if not ok then return end
    end
end

-- MATCHES 96 to 100
local VS100_FINAL_MATCH = 100 -- win screen matchno
-- SFAZ LOOK-AHEAD: same choices as before, returned instead of used on the
-- spot, so they can be made one match early. See sfaz_lookahead.lua.

for match = 96, VS100_FINAL_MATCH do
    if matchno() == match then
        local pick
        if type(sfazAhead) == 'function' then pick = sfazAhead(match) end
        if type(pick) ~= 'table' then pick = chooseMatch_96_VS100_FINAL_MATCH() end

        local ok = launchFight{
            p2char = {pick.char},
            p2numchars = 1,
            p2teammode = "single",
            stage = pick.stage,
			music = music,
			winscreen = (match == VS100_FINAL_MATCH),
        }

        if not ok then return end
    end
end

setMatchNo(-1)

end

--------------------------------------------
-- SURVIVAL PATH
--------------------------------------------

if gamemode('survival') or gamemode('netplaysurvivalcoop') or gamemode('survivalcoop') then

local SFZ_Chunlis = math.random() > 0.5 and "SFZ_Chunli-X" or "SFZ_Chunli-Z"
local SFZ_Codys = math.random() > 0.5 and "SFZ_Cody-Z" or "SFZ_Cody-X"
local SFZ_Gens = math.random() > 0.5 and "SFZ_Gen-X" or "SFZ_Gen-Z"
local SFZ_Sodoms = math.random() > 0.5 and "SFZ_Sodom-X" or "SFZ_Sodom-Z"
local SFZ_Bisons = math.random() > 0.5 and "SFZ_N-Bison" or "SFZ_Bison"
local SFZ_Sagats = math.random() > 0.5 and "SFZ_U-Sagat" or "SFZ_Sagat"
local SFZ_Balrogs = math.random() > 0.5 and "SFZ_Mike" or "SFZ_Balrog"
local SFZ_Ryus = math.random() > 0.5 and "SFZ_E-Ryu" or "SFZ_Ryu"
local SFZ_Kens = math.random() > 0.5 and "SFZ_Ken" or "SFZ_V-Ken"
local SFZ_Sakuras = math.random() > 0.5 and "SFZ_D-Sakura" or "SFZ_Sakura"
local SFZ_Charlies = math.random() > 0.5 and "SFZ_R-Charlie" or "SFZ_Charlie"
local SFZ_Cammys = math.random() > 0.5 and "SFZ_Kbee" or "SFZ_Cammy"

local survivalcharacters = {"SFZ_Adon", "SFZ_Akuma", SFZ_Balrogs, "SFZ_Birdie", SFZ_Bisons, "SFZ_Blanka", SFZ_Cammys, SFZ_Charlies, SFZ_Chunlis, SFZ_Codys, "SFZ_Dan", "SFZ_Dhalsim", "SFZ_DJ", "SFZ_FeiLong", SFZ_Gens, "SFZ_Guile", "SFZ_Guy", "SFZ_Honda", "SFZ_Karin", SFZ_Kens, "SFZ_Mika", "SFZ_Rolento", "SFZ_Rose", SFZ_Ryus, SFZ_Sakuras, SFZ_Sodoms, "SFZ_T-Hawk", SFZ_Sagats, "SFZ_Vega", "SFZ_Zangief"}

local usedCharacters = {}
local currentWave = 1

local function selectRandomCharacter()
    local remainingCharacters = {}

    local currentWaveCharacters

    local currentWaveCharacters
    if currentWave == 1 then
        currentWaveCharacters = survivalcharacters
    end


    -- Create a table of remaining characters not yet used
    for _, char in ipairs(currentWaveCharacters) do
        if not usedCharacters[char] then
            table.insert(remainingCharacters, char)
        end
    end

    if #remainingCharacters == 0 then
        -- All characters have been used, reset the usedCharacters table
        for _, char in ipairs(currentWaveCharacters) do
            usedCharacters[char] = nil
        end

        currentWave = currentWave % 5 + 1  -- Move to the next wave (1, 2, 3, 1, 2, 3, ...)
        
        return selectRandomCharacter()  -- Recursive call for the next wave
    end

    local randomIndex = math.random(1, #remainingCharacters)
    local selectedCharacter = remainingCharacters[randomIndex]
    usedCharacters[selectedCharacter] = true
    return selectedCharacter
end

-- MATCHES
-- SFAZ LOOK-AHEAD: the character AND the stage are now chosen by this one
-- function, so the choice can be made a match early and remembered. Nothing
-- about WHAT it chooses has changed - same pools, same math.random calls, in
-- the same order. It just returns them instead of using them on the spot.
local function chooseSurvival()
        local selectedChar = selectRandomCharacter()
        local stage = nil  -- Initialize stage variable

        -- Check the character and set the stage accordingly
        if selectedChar == "SFZ_Adon" then
            stage = math.random() > 0.5 and "Stages/Adon2.def" or "Stages/Adon.def"
        elseif selectedChar == "SFZ_Birdie" then
            stage = math.random() > 0.5 and "Stages/Birdie2.def" or "Stages/Birdie.def"
        elseif selectedChar == "SFZ_ChunLi-Z" then
            stage = math.random() > 0.5 and "Stages/Chunli3.def" or "Stages/Chunli.def"
        elseif selectedChar == "SFZ_Dan" then
            stage = math.random() > 0.5 and "Stages/Dan2.def" or "Stages/Dan.def"
        elseif selectedChar == "SFZ_Dhalsim" then
            stage = math.random() > 0.5 and "Stages/Dhalsim2.def" or "Stages/Dhalsim.def"
        elseif selectedChar == "SFZ_Guy" then
            stage = math.random() > 0.5 and "Stages/Guy2.def" or "Stages/Guy.def"
        elseif selectedChar == "SFZ_Honda" then
            stage = math.random() > 0.5 and "Stages/Honda3.def" or "Stages/Honda2.def"
        elseif selectedChar == "SFZ_Karin" then
            stage = math.random() > 0.5 and "Stages/Karin2.def" or "Stages/Karin.def"
        elseif selectedChar == "SFZ_Ken" then
            stage = math.random() > 0.5 and "Stages/Ken2.def" or "Stages/Ken.def"
        elseif selectedChar == "SFZ_Rolento" then
            stage = math.random() > 0.5 and "Stages/Rolento2.def" or "Stages/Rolento.def"
        elseif selectedChar == "SFZ_Rose" then
            stage = math.random() > 0.5 and "Stages/Rose3.def" or "Stages/Rose2.def"
        elseif selectedChar == "SFZ_Ryu" then
            stage = math.random() > 0.5 and "Stages/Ryu3.def" or "Stages/Ryu.def"
        elseif selectedChar == "SFZ_Zangief" then
            stage = math.random() > 0.5 and "Stages/Zangief2.def" or "Stages/Zangief.def"			
        else
            -- For characters other than Ryu, use the randomized option from select.def
            stage = nil  -- You can replace this with your logic to get the randomized stage
        end

        return {char = selectedChar, stage = stage}
end
sfazAheadRegister(1, 10, chooseSurvival)  -- SFAZ LOOK-AHEAD: this chooser owns these matches

-- SFAZ EARLY VICTORY: after this mode registered its match-1 chooser, so the
-- stage emblem can announce the match about to be played.
if matchno() < 2 and type(sfazEarlyVictory) == 'function' then
	sfazEarlyVictory()
end

for match = 1, 10 do -- Increase the number of matches as needed
    if matchno() == match then
        -- sfazAhead returns this match's choice and pre-makes the next one, so
        -- the victory screen inside launchFight can show where you go next.
        -- Falls back to choosing on the spot if the mod is absent.
        local pick
        if type(sfazAhead) == 'function' then
            pick = sfazAhead(match)
        end
        if type(pick) ~= 'table' then pick = chooseSurvival() end

        local ok = launchFight{
            p2char = {pick.char},
            p2numchars = p2numchars,
            p2teammode = p2teammode,
            stage = pick.stage,  -- Pass the stage information to launchFight
        }

        if not ok then return end
    end
end

setMatchNo(-1)

end

--------------------------------------------
-- WORLD TOUR PATH
--------------------------------------------

if gamemode('worldtour') then

local SFZ_Chunlis = math.random() > 0.5 and "SFZ_Chunli-X" or "SFZ_Chunli-Z"
local SFZ_Codys = math.random() > 0.5 and "SFZ_Cody-Z" or "SFZ_Cody-X"
local SFZ_Gens = math.random() > 0.5 and "SFZ_Gen-X" or "SFZ_Gen-Z"
local SFZ_Sodoms = math.random() > 0.5 and "SFZ_Sodom-X" or "SFZ_Sodom-Z"
local SFZ_Bisons = math.random() > 0.5 and "SFZ_N-Bison" or "SFZ_Bison"
local SFZ_Sagats = math.random() > 0.5 and "SFZ_U-Sagat" or "SFZ_Sagat"
local SFZ_Balrogs = math.random() > 0.5 and "SFZ_Mike" or "SFZ_Balrog"
local SFZ_Ryus = math.random() > 0.5 and "SFZ_E-Ryu" or "SFZ_Ryu"
local SFZ_Kens = math.random() > 0.5 and "SFZ_Ken" or "SFZ_V-Ken"
local SFZ_Sakuras = math.random() > 0.5 and "SFZ_D-Sakura" or "SFZ_Sakura"
local SFZ_Charlies = math.random() > 0.5 and "SFZ_R-Charlie" or "SFZ_Charlie"
local SFZ_Cammys = math.random() > 0.5 and "SFZ_Kbee" or "SFZ_Cammy"

local function f_lifeRecovery(lifeMax, ratioLevel)
	local bonus = lifeMax * config.TurnsRecoveryBonus / 100
	local base = lifeMax * config.TurnsRecoveryBase / 100
	if ratioLevel > 0 then
		bonus = lifeMax * config.RatioRecoveryBonus / 100
		base = lifeMax * config.RatioRecoveryBase / 100
	end
	return base + main.f_round(timeremaining() / (timeremaining() + timeelapsed()) * bonus)
end

function start.f_turnsRecovery()
	if start.turnsRecoveryInit then
		return
	end
	start.turnsRecoveryInit = true
	player(winnerteam())
	for i = 1, teamsize() * 1 do
		if player(1) and win() and alive() and gamemode('worldtour') then --assign sys.debugWC if player i exists, member of winning team, alive
			if turnsRecoveryInit == false and not matchover() then
				setLife(math.min(lifemax(), life() + f_lifeRecovery(lifemax(), ratiolevel())))
			elseif turnsRecoveryInit == true or matchover() then
			setLife(10000)
			end
		end
	end
	

end

-- A S I A --
	if matchno() < 2 then
	launchStoryboard('data/Intros/1_Asia_1.def')
	end
	

--MATCH 1
-- SFAZ LOOK-AHEAD: reports this match's stage so match 0's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.
local function sfazChooseWT1() return {stage = "Stages/Dan2.def"} end
sfazAheadRegister(1, 1, sfazChooseWT1)

-- SFAZ LOOK-AHEAD: every chooser in this mode is registered HERE, before any
-- of its matches run. Registering next to each block meant match N+1 had no
-- chooser yet when match N's victory screen asked what was coming.

local function sfazChooseWT2() return {stage = "Stages/Feilong.def"} end
sfazAheadRegister(2, 2, sfazChooseWT2)

local function sfazChooseWT3() return {stage = "Stages/Mika.def"} end
sfazAheadRegister(3, 3, sfazChooseWT3)

local function sfazChooseWT4() return {stage = "Stages/Ryu3.def"} end
sfazAheadRegister(4, 4, sfazChooseWT4)

local function sfazChooseWT5() return {stage = "Stages/Honda.def"} end
sfazAheadRegister(5, 5, sfazChooseWT5)

local function sfazChooseWT6() return {stage = "Stages/Adon.def"} end
sfazAheadRegister(6, 6, sfazChooseWT6)

local function sfazChooseWT7() return {stage = nil} end
sfazAheadRegister(7, 7, sfazChooseWT7)

local function sfazChooseWT8() return {stage = "Stages/Dhalsim2.def"} end
sfazAheadRegister(8, 8, sfazChooseWT8)

local function sfazChooseWT9() return {stage = "Stages/Chunli3.def"} end
sfazAheadRegister(9, 9, sfazChooseWT9)

local function sfazChooseWT10() return {stage = "Stages/Zangief.def"} end
sfazAheadRegister(10, 10, sfazChooseWT10)

local function sfazChooseWT11() return {stage = "Stages/Killerbee.def"} end
sfazAheadRegister(11, 11, sfazChooseWT11)

local function sfazChooseWT12() return {stage = "Stages/Rose.def"} end
sfazAheadRegister(12, 12, sfazChooseWT12)

local function sfazChooseWT13() return {stage = "Stages/Vega.def"} end
sfazAheadRegister(13, 13, sfazChooseWT13)

local function sfazChooseWT14() return {stage = "Stages/London.def"} end
sfazAheadRegister(14, 14, sfazChooseWT14)

local function sfazChooseWT15() return {stage = "Stages/Birdie2.def"} end
sfazAheadRegister(15, 15, sfazChooseWT15)

local function sfazChooseWT16() return {stage = "Stages/Birdie.def"} end
sfazAheadRegister(16, 16, sfazChooseWT16)

local function sfazChooseWT17() return {stage = "Stages/Karin.def"} end
sfazAheadRegister(17, 17, sfazChooseWT17)

local function sfazChooseWT18() return {stage = nil} end
sfazAheadRegister(18, 18, sfazChooseWT18)

local function sfazChooseWT19() return {stage = nil} end
sfazAheadRegister(19, 19, sfazChooseWT19)

local function sfazChooseWT20() return {stage = nil} end
sfazAheadRegister(20, 20, sfazChooseWT20)

local function sfazChooseWT21() return {stage = "Stages/Vtol.def"} end
sfazAheadRegister(21, 21, sfazChooseWT21)

local function sfazChooseWT22() return {stage = "Stages/Cody-X.def"} end
sfazAheadRegister(22, 22, sfazChooseWT22)

local function sfazChooseWT23() return {stage = "Stages/Mexico.def"} end
sfazAheadRegister(23, 23, sfazChooseWT23)

local function sfazChooseWT24() return {stage = "Stages/Sodom-Z.def"} end
sfazAheadRegister(24, 24, sfazChooseWT24)

local function sfazChooseWT25() return {stage = "Stages/Ken.def"} end
sfazAheadRegister(25, 25, sfazChooseWT25)

local function sfazChooseWT26() return {stage = "Stages/Mike.def"} end
sfazAheadRegister(26, 26, sfazChooseWT26)

local function sfazChooseWT27() return {stage = nil} end
sfazAheadRegister(27, 27, sfazChooseWT27)

local function sfazChooseWT28() return {stage = "Stages/Ken2.def"} end
sfazAheadRegister(28, 28, sfazChooseWT28)

local function sfazChooseWT29() return {stage = nil} end
sfazAheadRegister(29, 29, sfazChooseWT29)

local function sfazChooseWT30() return {stage = "Stages/Guy2.def"} end
sfazAheadRegister(30, 30, sfazChooseWT30)

local function sfazChooseWT31() return {stage = "Stages/Rolento.def"} end
sfazAheadRegister(31, 31, sfazChooseWT31)

local function sfazChooseWT32() return {stage = "Stages/Ken3.def"} end
sfazAheadRegister(32, 32, sfazChooseWT32)

local function sfazChooseWT33() return {stage = "Stages/Africa.def"} end
sfazAheadRegister(33, 33, sfazChooseWT33)

local function sfazChooseWT34() return {stage = "Stages/Secret-Green.def"} end
sfazAheadRegister(34, 34, sfazChooseWT34)

local function sfazChooseWT35() return {stage = "Stages/Secret-Red.def"} end
sfazAheadRegister(35, 35, sfazChooseWT35)

local function sfazChooseWT36() return {stage = "Stages/Secret-Blue.def"} end
sfazAheadRegister(36, 36, sfazChooseWT36)

local function sfazChooseWT37() return {stage = "Stages/Outbacks.def"} end
sfazAheadRegister(37, 37, sfazChooseWT37)

local function sfazChooseWT38() return {stage = "Stages/Outbacks.def"} end
sfazAheadRegister(38, 38, sfazChooseWT38)

local function sfazChooseWT39() return {stage = "stages/Dolls.def"} end
sfazAheadRegister(39, 39, sfazChooseWT39)

local function sfazChooseWT40() return {stage = "stages/Shadaloo.def"} end
sfazAheadRegister(40, 40, sfazChooseWT40)


-- SFAZ EARLY VICTORY: after this mode registered its match-1 chooser, so the
-- stage emblem can announce the match about to be played.
if matchno() < 2 and type(sfazEarlyVictory) == 'function' then
	sfazEarlyVictory()
end

if matchno() == 1 then
	if type(sfazAhead) == 'function' then sfazAhead(1) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Ken", "SFZ_Sakura", "SFZ_Dan"},  
        p2numchars = 3,
		p1rounds = 1,
		p2rounds = 1,
        p2teammode = "tag",
		p1numratio = {4},
		ai = 2,
		stage = "Stages/Dan2.def"

    }
    if not ok then return end
end

	if matchno() < 3 then
	-- SFAZ: Intro2 storyboard retired - the real victory screen is shown early
	-- instead (external/mods/sfaz_earlyvictory.lua). The .def file is still on
	-- disk, just no longer launched.
	--launchStoryboard('data/Intros/1_Asia_2.def')
	end
	
--MATCH 2
-- SFAZ LOOK-AHEAD: reports this match's stage so match 1's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 2 then
	if type(sfazAhead) == 'function' then sfazAhead(2) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Karin", "SFZ_Honda"},
		p2orderselect = true,	
        p2numchars = 2,
		p1rounds = 1,
		p2rounds = 1,
        p2teammode = "simul",
		ai = 2,
		stage = "Stages/Feilong.def"			

    }
    if not ok then return end
end

	if matchno() < 4 then
	launchStoryboard('data/Intros/1_Asia_3.def')
	end

--MATCH 3
-- SFAZ LOOK-AHEAD: reports this match's stage so match 2's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 3 then
	if type(sfazAhead) == 'function' then sfazAhead(3) end
	turnsRecoveryInit = false
	local ok = launchFight{
		p2char = {"SFZ_Mika", "SFZ_Blanka", "SFZ_Dan"},  
		p2orderselect = false,
        p2numchars = 3,
		p1rounds = 1,
		p2rounds = 1,
        p2teammode = "turns",
		p2numratio = {1,2,1},
		ai = 2,
		stage = "Stages/Mika.def"

    }
    if not ok then return end
end

	if matchno() < 5 then
	launchStoryboard('data/Intros/1_Asia_4.def')
	end
	
--MATCH 4
-- SFAZ LOOK-AHEAD: reports this match's stage so match 3's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 4 then
	if type(sfazAhead) == 'function' then sfazAhead(4) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Ryu"},  
        p2numchars = 1,
		ai = 2,
        p2teammode = "single",
		stage = "Stages/Ryu3.def"		

    }
    if not ok then return end
end

	if matchno() < 6 then
	launchStoryboard('data/Intros/1_Asia_5.def')
	end

--MATCH 5 ; SPECIAL COMBO
-- SFAZ LOOK-AHEAD: reports this match's stage so match 4's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 5 then
	if type(sfazAhead) == 'function' then sfazAhead(5) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Sodom-Z"},  
        p2numchars = 1,
        p2teammode = "single",
		ai = 2,
		stage = "Stages/Honda.def"

    }
    if not ok then return end
end

	if matchno() < 7 then
	launchStoryboard('data/Intros/1_Asia_6.def')
	end

--MATCH 6
-- SFAZ LOOK-AHEAD: reports this match's stage so match 5's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 6 then
	if type(sfazAhead) == 'function' then sfazAhead(6) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Adon", "SFZ_Guy"},  
        p2numchars = 2,
		p1rounds = 1,
		p2rounds = 1,
        p2teammode = "simul",
		ai = 2,
		stage = "Stages/Adon.def"			

    }
    if not ok then return end
end

	if matchno() < 8 then
	launchStoryboard('data/Intros/1_Asia_7.def')
	end
	
--MATCH 7
-- SFAZ LOOK-AHEAD: reports this match's stage so match 6's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 7 then
	if type(sfazAhead) == 'function' then sfazAhead(7) end
	turnsRecoveryInit = false
	local ok = launchFight{
		p2char = {"SFZ_U-Sagat", "SFZ_Sagat"},  
        p2numchars = 2,
		p2orderselect = false,		
        p2teammode = "turns",
		p1rounds = 1,
		p2rounds = 1,
		p2numratio = {2,2},
		ai = 2,		
		stage = nil
    }
    if not ok then return end
end

	if matchno() < 9 then
	launchStoryboard('data/Intros/1_Asia_8.def')
	end

--MATCH 8
-- SFAZ LOOK-AHEAD: reports this match's stage so match 7's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 8 then
	if type(sfazAhead) == 'function' then sfazAhead(8) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Dhalsim"},  
        p2numchars = 1,		
        p2teammode = "single",	
		ai = 2,		
		stage = "Stages/Dhalsim2.def"	

    }
    if not ok then return end
end

	if matchno() < 10 then
	launchStoryboard('data/Intros/1_Asia_9.def')
	end

--MATCH 9
-- SFAZ LOOK-AHEAD: reports this match's stage so match 8's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 9 then
	if type(sfazAhead) == 'function' then sfazAhead(9) end
	turnsRecoveryInit = false
	local ok = launchFight{
		p2char = {SFZ_Chunlis, SFZ_Gens, "SFZ_FeiLong"},  
        p2numchars = 3,
		p2orderselect = false,		
        p2teammode = "turns",	
		p2numratio = {1,1,2},
		p1rounds = 1,
		p2rounds = 1,
		ai = 2,
		stage = "Stages/Chunli3.def"

    }
    if not ok then return end
end

	if matchno() < 11 then
	launchStoryboard('data/Intros/1_Asia_10.def')
	end

--MATCH 10 ; TARGET MIKA
-- SFAZ LOOK-AHEAD: reports this match's stage so match 9's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 10 then
	if type(sfazAhead) == 'function' then sfazAhead(10) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Mika", "SFZ_Zangief"},
		p2numchars = 2, 
		p2teammode = "simul",
		p1rounds = 1,
		p2rounds = 1,
		handicap = true,
		ai = 2,
		stage = "Stages/Zangief.def"	
	}
	if not ok then return end
end

-- E U R O P E --

	if matchno() < 12 then
	launchStoryboard('data/Intros/2_Europe_1.def')
	end
	
--MATCH 11
-- SFAZ LOOK-AHEAD: reports this match's stage so match 10's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 11 then
	if type(sfazAhead) == 'function' then sfazAhead(11) end
	turnsRecoveryInit = false
	local ok = launchFight{
		p2char = {"SFZ_Juli", "SFZ_Juni", "SFZ_Kbee"},  
        p2numchars = 3,	
        p2teammode = "turns",
		ai = 2,
		p1rounds = 1,
		p2rounds = 2,
		stage = "Stages/Killerbee.def"
    }
    if not ok then return end
end

	if matchno() < 13 then
	-- SFAZ: Intro2 storyboard retired - the real victory screen is shown early
	-- instead (external/mods/sfaz_earlyvictory.lua). The .def file is still on
	-- disk, just no longer launched.
	--launchStoryboard('data/Intros/2_Europe_2.def')
	end

--MATCH 12
-- SFAZ LOOK-AHEAD: reports this match's stage so match 11's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 12 then
	if type(sfazAhead) == 'function' then sfazAhead(12) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Rose", "SFZ_Bison"},  
        p2numchars = 2,		
        p2teammode = "tag",		
		p2orderselect = false,
		p1rounds = 1,
		p2rounds = 1,		
		ai = 2,
		stage = "Stages/Rose.def"		

    }
    if not ok then return end
end

	if matchno() < 14 then
	launchStoryboard('data/Intros/2_Europe_3.def')
	end

--MATCH 13 TARGET CAMMY
-- SFAZ LOOK-AHEAD: reports this match's stage so match 12's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 13 then
	if type(sfazAhead) == 'function' then sfazAhead(13) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Cammy", "SFZ_Vega"},
		p2orderselect = false,
		p2numchars = 2,
		p1rounds = 1,
		p2rounds = 1,
		p2teammode = "simul",
		handicap = true,
		ai = 2,
		stage = "Stages/Vega.def"
	}
	if not ok then return end
end

	if matchno() < 15 then
	launchStoryboard('data/Intros/2_Europe_4.def')
	end

--MATCH 14
-- SFAZ LOOK-AHEAD: reports this match's stage so match 13's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 14 then
	if type(sfazAhead) == 'function' then sfazAhead(14) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Mike"},
		p2numchars = 1, 
		p2teammode = "single",
		ai = 3,
		stage = "Stages/London.def"
	}
	if not ok then return end
end

	if matchno() < 16 then
	launchStoryboard('data/Intros/2_Europe_5.def')
	end

--MATCH 15
-- SFAZ LOOK-AHEAD: reports this match's stage so match 14's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 15 then
	if type(sfazAhead) == 'function' then sfazAhead(15) end
	turnsRecoveryInit = false
	local ok = launchFight{
		p2char = {"SFZ_Dhalsim", "SFZ_Vega", "SFZ_Honda"},  
        p2numchars = 3,		
        p2teammode = "turns",	
		p1rounds = 1,
		p2rounds = 1,
		p2orderselect = false,
		ai = 2,
		stage = "Stages/Birdie2.def"

    }
    if not ok then return end
end

	if matchno() < 17 then
	launchStoryboard('data/Intros/2_Europe_6.def')
	end

--MATCH 16 HYPER COMBO ATTACK
-- SFAZ LOOK-AHEAD: reports this match's stage so match 15's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 16 then
	if type(sfazAhead) == 'function' then sfazAhead(16) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Birdie"},
		p2numchars = 1, 
		p2teammode = "single",
		ai = 2,
		stage = "Stages/Birdie.def"	
	}
	if not ok then return end
end

-- S . A M E R I C A --

	if matchno() < 18 then
	launchStoryboard('data/Intros/3_SAmerica_1.def')
	end

--MATCH 17 TIME ATTACK
-- SFAZ LOOK-AHEAD: reports this match's stage so match 16's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 17 then
	if type(sfazAhead) == 'function' then sfazAhead(17) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Adon"},  
        p2numchars = 1,		
        p2teammode = "single",	
		p1rounds = 1,
		p2rounds = 1,
		ai = 1,
		time = 30,		
		stage = "Stages/Karin.def",	
		music = {"sound/Adon2.mp3"}

    }
    if not ok then return end
end

	if matchno() < 19 then
	-- SFAZ: Intro2 storyboard retired - the real victory screen is shown early
	-- instead (external/mods/sfaz_earlyvictory.lua). The .def file is still on
	-- disk, just no longer launched.
	--launchStoryboard('data/Intros/3_SAmerica_2.def')
	end

--MATCH 18 SPECIAL COMBO ATTACK
-- SFAZ LOOK-AHEAD: reports this match's stage so match 17's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 18 then
	if type(sfazAhead) == 'function' then sfazAhead(18) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_DJ"},  
        p2numchars = 1,		
        p2teammode = "single",		
		ai = 2,
        stage = nil

    }
    if not ok then return end
end

	if matchno() < 20 then
	launchStoryboard('data/Intros/3_SAmerica_3.def')
	end

--MATCH 19
-- SFAZ LOOK-AHEAD: reports this match's stage so match 18's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 19 then
	if type(sfazAhead) == 'function' then sfazAhead(19) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Charlie"},  
        p2numchars = 1,
        p2teammode = "single",
		ai = 2,
		stage = "Stages/Venezuela.def" ,
		music = {"sound/Charlie2.mp3", 255, 215877, 2792605}	

    }
    if not ok then return end
end

	if matchno() < 21 then
	launchStoryboard('data/Intros/3_SAmerica_4.def')
	end

--MATCH 20
-- SFAZ LOOK-AHEAD: reports this match's stage so match 19's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 20 then
	if type(sfazAhead) == 'function' then sfazAhead(20) end
	turnsRecoveryInit = false
	local ok = launchFight{
		p2char = {"SFZ_Blanka", "SFZ_Rose","SFZ_Guile"},  
        p2numchars = 3,		
        p2teammode = "turns",	
		p1rounds = 1,
		p2rounds = 1,
		ai = 2,
		stage = nil	

    }
    if not ok then return end
end

	if matchno() < 22 then
	launchStoryboard('data/Intros/3_SAmerica_5.def')
	end

--MATCH 21 HYPER COMBO
-- SFAZ LOOK-AHEAD: reports this match's stage so match 20's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 21 then
	if type(sfazAhead) == 'function' then sfazAhead(21) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Balrog"},  
        p2numchars = 1,		
        p2teammode = "single",	
		ai = 2,
		stage = "Stages/Vtol.def"	

    }
    if not ok then return end
end

	if matchno() < 23 then
	launchStoryboard('data/Intros/3_SAmerica_6.def')
	end

--MATCH 22
-- SFAZ LOOK-AHEAD: reports this match's stage so match 21's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 22 then
	if type(sfazAhead) == 'function' then sfazAhead(22) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Guy", SFZ_Codys},  
        p2numchars = 2,		
        p2teammode = "simul",	
		p1rounds = 1,	
		p2rounds = 1,
		p2orderselect = true,
		ai = 2,
		stage =  "Stages/Cody-X.def"	

    }
    if not ok then return end
end

-- N . A M E R I C A --
	if matchno() < 24 then
	launchStoryboard('data/Intros/4_NAmerica_1.def')
	end
	
--MATCH 23
-- SFAZ LOOK-AHEAD: reports this match's stage so match 22's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 23 then
	if type(sfazAhead) == 'function' then sfazAhead(23) end
	turnsRecoveryInit = false
	local ok = launchFight{
		p2char = {"SFZ_Birdie", "SFZ_T-Hawk", "SFZ_Zangief"},  
        p2numchars = 3,		
        p2teammode = "turns",	
		p1rounds = 1,	
		p2rounds = 1,
		p2orderselect = false,
		ai = 2,
		stage = "Stages/Mexico.def"

    }
    if not ok then return end
end

	if matchno() < 25 then
	-- SFAZ: Intro2 storyboard retired - the real victory screen is shown early
	-- instead (external/mods/sfaz_earlyvictory.lua). The .def file is still on
	-- disk, just no longer launched.
	--launchStoryboard('data/Intros/4_NAmerica_2.def')
	end

--MATCH 24
-- SFAZ LOOK-AHEAD: reports this match's stage so match 23's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 24 then
	if type(sfazAhead) == 'function' then sfazAhead(24) end
	turnsRecoveryInit = false
	local ok = launchFight{
		p2char = {SFZ_Sodoms, "SFZ_Rolento"},  
        p2numchars = 2,		
        p2teammode = "turns",	
		p2numratio = {2,2},		
		p2orderselect = true,
		p1rounds = 1,
		p2rounds = 1,
		ai = 3,
		stage = "Stages/Sodom-Z.def"			

    }
    if not ok then return end
end

	if matchno() < 26 then
	launchStoryboard('data/Intros/4_NAmerica_3.def')
	end
	
--MATCH 25
-- SFAZ LOOK-AHEAD: reports this match's stage so match 24's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 25 then
	if type(sfazAhead) == 'function' then sfazAhead(25) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Sakura", "SFZ_Karin"},  
        p2numchars = 2,		
        p2teammode = "simul",	
		p1rounds = 1,	
		p2rounds = 1,
		p2orderselect = true,
		ai = 2,
		stage = "Stages/Ken.def"

    }
    if not ok then return end
end

	if matchno() < 27 then
	launchStoryboard('data/Intros/4_NAmerica_4.def')
	end
	
--MATCH 26 TIME ATTACK
-- SFAZ LOOK-AHEAD: reports this match's stage so match 25's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 26 then
	if type(sfazAhead) == 'function' then sfazAhead(26) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Sodom-X"},  
        p2numchars = 1,		
        p2teammode = "single",	
		p1rounds = 1,
		p2rounds = 1,
		time = 30,		
		ai = 1,
		stage = "Stages/Mike.def",
		music = {"sound/Sodom.mp3"} 

    }
    if not ok then return end
end

	if matchno() < 28 then
	launchStoryboard('data/Intros/4_NAmerica_5.def')
	end
	
--MATCH 27
-- SFAZ LOOK-AHEAD: reports this match's stage so match 26's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 27 then
	if type(sfazAhead) == 'function' then sfazAhead(27) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_R-Charlie"},  
        p2numchars = 1,		
        p2teammode = "single",	
		ai = 4,		
		stage = nil	

    }
    if not ok then return end
end

	if matchno() < 29 then
	launchStoryboard('data/Intros/4_NAmerica_6.def')
	end

--MATCH 28 TARGET KARIN
-- SFAZ LOOK-AHEAD: reports this match's stage so match 27's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 28 then
	if type(sfazAhead) == 'function' then sfazAhead(28) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Karin", "SFZ_Ken"},
		p2orderselect = false,
		p2numchars = 2, 
		p2teammode = "simul",
		p1rounds = 1,
		p2rounds = 1,
		ai = 2,
		handicap = true,
		stage = "Stages/Ken2.def",
		music = {"sound/Ken2.mp3"} 
	}
	if not ok then return end
end

	if matchno() < 30 then
	launchStoryboard('data/Intros/4_NAmerica_7.def')
	end

--MATCH 29 SPECIAL COMBO ATTACK
-- SFAZ LOOK-AHEAD: reports this match's stage so match 28's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 29 then
	if type(sfazAhead) == 'function' then sfazAhead(29) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Guile"},  
        p2numchars = 1,		
        p2teammode = "single",	
		p2orderselect = false,
		ai = 2,
		stage = nil 

    }
    if not ok then return end
end

	if matchno() < 31 then
	launchStoryboard('data/Intros/4_NAmerica_8.def')
	end
	
--MATCH 30
-- SFAZ LOOK-AHEAD: reports this match's stage so match 29's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 30 then
	if type(sfazAhead) == 'function' then sfazAhead(30) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Guy", "SFZ_Chunli-Z"},  
        p2numchars = 2,		
        p2teammode = "turns",
		p1rounds = 1,	
		p2rounds = 1,		
		p2numratio = {3,1},	
		p2orderselect = true,
		ai = 2,
        stage = "Stages/Guy2.def"	
		
    }
    if not ok then return end
end

	if matchno() < 32 then
	launchStoryboard('data/Intros/4_NAmerica_9.def')
	end

--MATCH 31 TARGET ROLENTO
-- SFAZ LOOK-AHEAD: reports this match's stage so match 30's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 31 then
	if type(sfazAhead) == 'function' then sfazAhead(31) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Rolento", "SFZ_Sodom-X"},  
        p2numchars = 2,		
        p2teammode = "simul",	
		p1rounds = 1,	
		p2rounds = 1,
		p2orderselect = false,
		handicap = true,
		ai = 2,
		stage = "Stages/Rolento.def"	 

    }
    if not ok then return end
end

	if matchno() < 33 then
	launchStoryboard('data/Intros/4_NAmerica_10.def')
	end

--MATCH 32 GUARD CRUSH
-- SFAZ LOOK-AHEAD: reports this match's stage so match 31's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 32 then
	if type(sfazAhead) == 'function' then sfazAhead(32) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"chars/SFZ_Charlie/SFZ_Charlie_World"},  
        p2numchars = 1,		
        p2teammode = "single",	
		p1rounds = 1,	
		p2rounds = 1,
		p2orderselect = false,
		ai = 2,
		stage = "Stages/Ken3.def",
		music = {"sound/Charlie2.mp3", 255, 215877, 2792605}, 

    }
    if not ok then return end
end

-- A F R I C A --
	if matchno() < 34 then
	launchStoryboard('data/Intros/5_Africa_1.def')
	end
	
--MATCH 33
-- SFAZ LOOK-AHEAD: reports this match's stage so match 32's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 33 then
	if type(sfazAhead) == 'function' then sfazAhead(33) end
	turnsRecoveryInit = false
	local ok = launchFight{
		p2char = {SFZ_Gens, "SFZ_Rose", "SFZ_Akuma"},  
        p2numchars = 3,		
        p2teammode = "turns",	
		p1rounds = 1,	
		p2rounds = 1,
		p2orderselect = true,
		ai = 2,
		stage = "Stages/Africa.def",
		music1 = {"sound/Gen.mp3", 255, 76790, 2700077}, 
		music2 = {"sound/Rose2.mp3", 255, 737583, 2801776},
		music3 = {"sound/Akuma.mp3", 255, 499476, 2852071},	
	}
	if not ok then return end
end	

	if matchno() < 35 then
	-- SFAZ: Intro2 storyboard retired - the real victory screen is shown early
	-- instead (external/mods/sfaz_earlyvictory.lua). The .def file is still on
	-- disk, just no longer launched.
	--launchStoryboard('data/Intros/5_Africa_2.def')
	end

--MATCH 34
-- SFAZ LOOK-AHEAD: reports this match's stage so match 33's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 34 then
	if type(sfazAhead) == 'function' then sfazAhead(34) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Balrog", "SFZ_Vega"},
		p2orderselect = true,
		p2numchars = 2, 
		p2teammode = "simul",
		p1rounds = 1,
		p2rounds = 1,
		ai = 2,
		stage = "Stages/Secret-Green.def"
	}
	if not ok then return end
end

	if matchno() < 36 then
	launchStoryboard('data/Intros/5_Africa_3.def')
	end

--MATCH 35
-- SFAZ LOOK-AHEAD: reports this match's stage so match 34's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 35 then
	if type(sfazAhead) == 'function' then sfazAhead(35) end
	turnsRecoveryInit = false
	local ok = launchFight{
		p2char = {"SFZ_D-Sakura", "SFZ_E-Ryu", "SFZ_V-Ken"},  
        p2numchars = 3,		
        p2teammode = "turns",	
		p2numratio = {2,1,1},
		p1rounds = 1,
		p2rounds = 1,
		p2orderselect = true,
		ai = 2,
        stage = "Stages/Secret-Red.def",
		music1 = {"sound/D-Sakura.mp3", 255, 1788293, 4143390}, 
		music2 = {"sound/Ryu3.mp3", 255, 160689, 2280895},
		music3 = {"sound/Ken.mp3", 255, 1415590, 4014076},	

    }
    if not ok then return end
end

	if matchno() < 37 then
	launchStoryboard('data/Intros/5_Africa_4.def')
	end
	
--MATCH 36
-- SFAZ LOOK-AHEAD: reports this match's stage so match 35's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 36 then
	if type(sfazAhead) == 'function' then sfazAhead(36) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Adon", "SFZ_Sagat"},  
        p2numchars = 2,		
        p2teammode = "tag",	
		p1rounds = 1,
		p2rounds = 1,
		p2numratio = {1,3},	
		p2orderselect = false,
		ai = 3,		
        stage = "Stages/Secret-Blue.def",
		music = {"sound/Sagat2.mp3", 255, 2241627, 4808826},

    }
    if not ok then return end
end

-- A U S T R A L I A --
	if matchno() < 38 then
	launchStoryboard('data/Intros/6_Australia_1.def')
	end
	
--MATCH 37
-- SFAZ LOOK-AHEAD: reports this match's stage so match 36's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 37 then
	if type(sfazAhead) == 'function' then sfazAhead(37) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Akuma", "SFZ_E-Ryu"},  
        p2numchars = 2,		
        p2teammode = "tag",	
		p1rounds = 1,
		p2rounds = 1,		
		p2orderselect = true,
		ai = 3,
        stage = "Stages/Outbacks.def",		
		music = {"sound/Akuma.mp3", 255, 499476, 2852071},

    }
    if not ok then return end
end

	if matchno() < 39 then
	-- SFAZ: Intro2 storyboard retired - the real victory screen is shown early
	-- instead (external/mods/sfaz_earlyvictory.lua). The .def file is still on
	-- disk, just no longer launched.
	--launchStoryboard('data/Intros/6_Australia_2.def')
	end

--MATCH 38 THROW ATTACK
-- SFAZ LOOK-AHEAD: reports this match's stage so match 37's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 38 then
	if type(sfazAhead) == 'function' then sfazAhead(38) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Ryu"},  
        p2numchars = 1,		
		p1rounds = 1,
		p2rounds = 1,
        p2teammode = "single",			
		p2orderselect = true,
		ai = 1,
        stage = "Stages/Outbacks.def",
		music = {"sound/Ryu.mp3", 255, 1888, 2706545},
    }
    if not ok then return end
end

-- U N K N O W N --
	launchStoryboard('data/Intros/7_Shadaloo.def')

--MATCH 39
-- SFAZ LOOK-AHEAD: reports this match's stage so match 38's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 39 then
	if type(sfazAhead) == 'function' then sfazAhead(39) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_Juni", "SFZ_Juli"},
		p2orderselect = false,
		p1rounds = 1,
		p2rounds = 1,
		p2numchars = 2, 
		p2teammode = "simul",
		ai = 2,
		stage = "stages/Dolls.def",
	}
	if not ok then return end
end


--MATCH 40
-- SFAZ LOOK-AHEAD: reports this match's stage so match 39's victory
-- screen can show it. The fight below is untouched - the character list
-- and stage are still exactly what they were.

if matchno() == 40 then
	if type(sfazAhead) == 'function' then sfazAhead(40) end
	turnsRecoveryInit = true
	local ok = launchFight{
		p2char = {"SFZ_N-Bison", "SFZ_AkumaS"},
		p2numchars = 2,
		p2teammode = "tag",
		p1rounds = 1,
		p2rounds = 1,		
		ai = 4,
		stage = "stages/Shadaloo.def",
		winscreen = true,
	}
	if not ok then return end
end


setMatchNo(-1)

end