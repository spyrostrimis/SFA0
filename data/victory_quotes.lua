--;===========================================================
--; VICTORY QUOTES (in-fight win-pose banner)
--;
--; The line a character speaks over their own win pose, arcade mode, single
--; team only - shown BEFORE the vanilla motif victory screen. Old builds baked
--; each quote into a pre-rendered sprite (data/Intros' quotes were the intro
--; equivalent of the same idea); this file replaces that with real typed text,
--; the same way data/Intros/intro_texts.lua did for the character intros.
--;
--; HOW TO WRITE ONE
--;
--;   ['SFZ_Adon'] = {
--;       "You call that a fight?",
--;       "Sagat would not even blink.",
--;       "Still weak. Come back stronger.",
--;   },
--;
--; The key is the character's FOLDER NAME under chars/, exactly as it appears
--; on disk - chars/SFZ_Adon/... -> ['SFZ_Adon']. NOT the display name (several
--; characters share one, e.g. SFZ_Gen-X and SFZ_Gen-Z both report name() =
--; "Gen"), and not the Intro_*.def naming from the intro system (that one does
--; not line up cleanly with folder names either - Intro_Chun_X vs the folder
--; SFZ_ChunLi-X, Intro_GenX vs SFZ_Gen-X, etc). The folder name is the only
--; scheme with no collisions and no guessing.
--;
--; UNLIKE THE INTRO TEXT FILE: each string here is a COMPLETE, INDEPENDENT
--; quote, not a chunk of one long story. On every win, exactly ONE is chosen at
--; random and shown once - this mirrors the old system exactly (each character
--; had "anim = 9401+(random%5)", one of five pre-rendered lines picked at
--; random). A long quote word-wraps inside the box and types out letter by
--; letter; the skip button finishes the typing instantly. There is no "press
--; again for the next one" - there is nothing next, same as the old sprite
--; version which stayed on screen until the win pose ended.
--;
--; *** ONE ENTRY = ONE ALTERNATIVE QUOTE. ***
--;
--; Each comma-separated string is a SEPARATE quote competing to be chosen.
--; This is NOT how to break a line - it defines two unrelated quotes, and you
--; will only ever see one of them:
--;
--;     "The Raging Demon",           -- WRONG: quote 1 of 2
--;     "does not negotiate.",        -- WRONG: quote 2 of 2
--;
--; Lua's ".." only concatenates, so this is one quote with the words run
--; together - "DemonDoes" - and still no line break:
--;
--;     "The Raging Demon" ..         -- WRONG: no space, no break
--;     "does not negotiate.",
--;
--; TO BREAK A LINE INSIDE ONE QUOTE, use \n:
--;
--;     "The Raging Demon\ndoes not negotiate.",
--;
--; and to keep a long one readable in this file, put the \n at a join
--; and mind the spaces - ".." adds nothing of its own:
--;
--;     "The Raging Demon\n" ..
--;     "does not negotiate.",
--;
--; Wrapping is automatic, so \n is only needed where you want a break at
--; a specific word rather than wherever the box happens to run out.
--;
--; A character with no entry here simply shows no quote, exactly as if the
--; sprite version had been left undeclared.
--;
--; FONT PALETTE BANK (optional, per character)
--;
--; .fnt files carry several colour variants of the same glyphs, selected by
--; BANK - the second value in a storyboard's font line
--; ("font = sfa2_dialogue.fnt, 0, 1, ..." <- that 0). This picks between the
--; font's own palettes; it is NOT a tint applied over the top, so the letters
--; keep whatever shading and outline the font author drew.
--;
--;   ['SFZ_Akuma'] = {
--;       bank = 2,
--;       "First quote.",
--;       "Second quote.",
--;   },
--;
--; sfa2_dialogue.fnt has 15 banks (0-14), though only the low few are usually
--; distinct - its header declares "Colors = 0", which the engine clamps to 1,
--; giving 255/16 = 15 palettes. A bank the font does not have falls back to 0
--; rather than erroring, so an out-of-range value is safe but silent.
--;
--; The field is NOT one of the quotes: Lua's "#" length operator only counts
--; the array part of a table, so a named key like "bank" is invisible to the
--; random pick and cannot be selected as a line. Order does not matter either,
--; though putting it first reads better.
--;
--; Omit it and the character uses the default set in
--; external/mods/sfaz_winquote.lua (BANK).
--;
--; QUOTES need escaping for embedded quote marks: "he said \"never\"".
--;===========================================================

sfazVictoryQuotes = {

	--; \n for break
	['SFZ_Akuma'] = {
		bank = 2,
     "Now stay down!",
     "This grows boring!",
     "Weaklings! Is there no one worth fighting?",
     "You are not enough even for a warm up.",
	},

	 ['SFZ_Adon'] = {
	 		bank = 2,
     "Don't worry, it's all over.",
     "I am a Muay Thai master. You are sucking gravel.",
     "Is that the best you can do?",
     "My legend starts now!",
	 },
	 
	 ['SFZ_Charlie'] = {
	 		bank = 2,
     "Your unnecessary movements are openings that lead to your defeat!",
     "Tracking a target precisely is a basic skill, critical to victory!",
     "Identify tactical inadequacies, then renew your strategy!",
     "Did I 'tick' you off? Ha! Ha!",
	 },	 
	 
	 ['SFZ_ChunLi-Z'] = {
	 		bank = 2,
     "I don't have time for amateurs!",
     "I expected better.",
     "If you're gonna fight, fight for real.",
     "Fighting ability is important... handcuffs only go so far!",
	 },	 
	 
	 ['SFZ_ChunLi-X'] = {
	 		bank = 2,
     "Please don't take it personal!",
     "Oops! Sorry if I hit you there too hard!",
     "Speed is something more important then strength!",
     "You don't have the skills to beat me!",
	 },	 
	 
	 ['SFZ_Dan'] = {
	 		bank = 2,
     "Don't even try to get up!",
     "For a loser, you did pretty well.",
     "Keep your day job!",
     "My dad could beat you, and he's dead!",
	 },	 
	 
	 ['SFZ_Dhalsim'] = {
	 		bank = 2,
     "Action brings reaction. Your fate has followed you.",
     "Don't cry. I'll let you live.",
     "I'm your master. Pain is a state of mind and I don't mind your pain.",
     "Meditate on your loss. Someday our paths will cross again.",
	 },	 
	 
	 ['SFZ_Gen-X'] = {
	 		bank = 2,
     "Ancient words of wisdom...'you suck'.",
     "I live for death...yours!",
     "Death may come when one is at their best. Never forget that.",
     "You are a big fool!",
	 },	 

	 ['SFZ_Gen-Z'] = {
	 		bank = 2,
     "We will all die. The question is when, why, and how painfully.",
     "The power within my hand is unrivaled!",
     "Someday you'll have enough courage to face me again.",
     "You fight, you lose, you die!",
	 },	 
	 ['SFZ_Guy'] = {
	 		bank = 2,
     "Don't worry, everyone loses to me!",
     "Shouldn't you be crawling to a hospital about now?",
     "You are so outclassed.",
     "You can't beat what you can't touch!",
	 },	 
	 ['SFZ_Ken'] = {
	 		bank = 2,
     "True strength is something money and credit cards cannot buy!",
     "Next time I won't be so easy on you.",
     "In the heat of battle, the blood of the true fighter runs hot!",
     "You're better then you look. Try harder.",
	 },	
	 ['SFZ_Bison'] = {
	 		bank = 2,
     "Leave my sight.",
     "You are a fool to challenge me!",
     "You cannot fight destiny. The world will be mine.",
     "You were almost entertaining.",
	 },	
	 ['SFZ_Rolento'] = {
	 		bank = 2,
     "Fear prevents learning and you've failed.",
     "Get real! Skill and strength determine the winner.",
     "It's okay, perfection is not for everyone.",
     "Let's fight again, so I can stick it to you.",
	 },		 
	 ['SFZ_Rose'] = {
	 		bank = 2,
     "Are you done?",
     "Forgive me. My fight is not with you.",
     "Power is nothing without skill.",
     "Today's lesson is over.",
	 },	
	 ['SFZ_Ryu'] = {
	 		bank = 2,
     "I look forward to our next battle.",
     "Now I'll find a better challenge!",
     "What's wrong? Why do you hold back?",
     "You fought well. I was honored.",
	 },		
	 ['SFZ_Sagat'] = {
	 		bank = 2,
     "Hatred spares no one!",
     "Do not challenge what you cannot defeat!",
     "It will take more than you to best me!",
     "I promised this scar that I would never be defeated again!",
	 },	
	 ['SFZ_U-Sagat'] = {
	 		bank = 2,
     "Accept your weakness. Never come here again.",
     "Pathetic... Will you know beg me for your worthless existence?",
     "How does it feel to have your body torn by my fist?",
     "Now who is the strongest?",
	 },		 
	 ['SFZ_Sakura'] = {
	 		bank = 2,
     "Do you have time for another beating before my next class?",
     "I'll be late for class, but it's okay! A good street fight is worth it!",
     "Did I impress you! I really hope I did!",
     "Oh, no! I was suppose to go to the mall with Kei!",
	 },	
	 ['SFZ_D-Sakura'] = {
	 		bank = 2,
     "That's it? I wanted a harder fight!",
     "Now you know, justice always prevails!",
     "Victory is mine. Get up loser so I can smack you again.",
     "Wow, that was cool, do it again!",
	 },		 
	 ['SFZ_Sodom-X'] = {
	 		bank = 2,
     "Guess I beat you pretty bad. Nothing personal.",
     "Not bad. Maybe you should work for me.",
     "You will not interfere with my plans!",
     "You're just too weak!",
	 },	
	 ['SFZ_Sodom-Z'] = {
	 		bank = 2,
     "Boku wa itchy bun desu!! (I am the best!!)",
     "Kick on see mat show! (We are good friends!)",
     "Oretachiwa mutt achy da! (We are dogs in pain!)",
     "Please don't thank me. In fact, 'Don't touch my moustache!'",
	 },	
	 ['SFZ_Zangief'] = {
	 		bank = 2,
     "Don't make me angry or I'll beat the crap out of you!",
     "Hit me again...please?",
     "Nothing can escape my furious swirling death move!",
     "Quit blocking my hits with your face!",
	 },		
	 ['SFZ_AkumaS'] = {
	 		bank = 2,
     "Fade to nothingness! You weakness disgust me!",
     "It's time for you to experience a million deaths in an instant!",
     "You are permanently crippled! Accept your defeat!",
     "To challenge me is to respect chaos, and to respect death!",
	 },		
	 ['SFZ_R-Charlie'] = {
	 		bank = 2,
     "Are you always so slow?",
     "Be all that you can be, scumbag!",
     "One more down. On with the war.",
     "You've got talent. Uncle Sam could use you.",
	 },	
	 ['SFZ_Balrog'] = {
	 		bank = 2,
	 "Get up!! I haven't punched you enough!",
     "Good and evil means nothing to me... Power is everything!",
     "I've met punching bags more fun and interesting than you!",
     "If you fight like that again, I'll bite you ear off!",
	 },		
	 ['SFZ_Mike'] = {
	 		bank = 2,
     "It was too easy! I feel guilty about getting paid for this!",
     "My fists still have your blood on them!",
     "Your face wore out my gloves! Buy me some new ones!",
     "Your teeth are everywhere! Pick them up before they get lost!",
	 },	
	 ['SFZ_Blanka'] = {
	 		bank = 2,
     "Woo.....? Wo Wo....?! (Are you okay?)",
	 "Woooooooo! Wowowoooowoow! Woow! (Let's play again sometime!)",
     "Wooooo wo? Wow! Wow! (I'm feeling great!)",
	 "WooooWoOwWow WoooWowWowWow! (It was exciting!)",
	 },	
	 ['SFZ_Cammy'] = {
	 		bank = 2,
     "Oh? Is it okay to be giving in so soon?",
     "You surrender? I accept.",
	 "Don't curse me, curse your own lack of discipline.",
     "Now you know to surrender to Delta Red!",
	 },	
	 ['SFZ_Kbee'] = {
	 		bank = 2,
     "Condition green! Motor functions operating at maximum efficiency!",
     "Data evaluated! Target exhibiting zero capability. Terminating...!",
	 "Fighting data retrieved successfully!",
     "Target destroyed! Remaining in secondary combat mode!",
	 },		 
	 ['SFZ_Cody-X'] = {
	 		bank = 2,
	 "After waiting so long, it feels good to do more than two moves!",
     "C'mon! Stand up! Don't let me down!",
	 "I don't care if your human, beast, or car! I'll take you on!",
	 "I saved a city, saved a girl, but couldn't save myself...",
	 },	
	 ['SFZ_Cody-Z'] = {
	 		bank = 2,
     "The world is full of bad guys! I have so much work ahead of me!",
     "With so much riding on my fists, this will not be my final fight!",
     "I've got a lot of time on my hands how about a rematch?",
     "Just remember!! This could happen to you again! And again!!",
	 },
	 ['SFZ_DJ'] = {
	 		bank = 2,
     "Chill out mon! Keep it real!",
     "Could you feel the rhythm of my victory? Yeah!",
     "Max out the music within your soul!",
     "Maximum rhythm! Maximum power! Yeah!",
	 },		
	 ['SFZ_Honda'] = {
	 		bank = 2,
     "Good spirit! But you should push an opponent with more force!",
     "How was my Tsuppari? Stronger than you thought?! Ga ha ha ha!",
     "Nothing is as thrilling as fighting in such a vast world!",
     "Now you have learned the meaning of Sumo! DOSUKOI!",
	 },		
	 ['SFZ_E-Ryu'] = {
	 		bank = 2,
     "Absolute destruction is the only perfection possible!",
     "I see nothing but the destruction that I create!",
     "It is too late to go back, now...",
     "There is no place for the weak to exist!",
	 },	
	 ['SFZ_FeiLong'] = {
	 		bank = 2,
     "...? Waa chaaaaaaaaa!!!",
     "A glass that is half empty is better than a full glass broken.",
     "Don't hesitate! That is the key to victory!",
     "It is not always a matter of effort, but a matter of skill!",
	 },		
	 ['SFZ_Guile'] = {
	 		bank = 2,
     "Do you want tougher training, Private?",
     "No Handcuffs!? Fighting isn't what it used to be!",
     "That was a Sonic Boom that hit you, not a tank!",
     "You're qualified for combat, but not for victory!",
	 },		
	 ['SFZ_Juli'] = {
	 		bank = 2,
     "Target eliminated! Waiting for orders.",
	 },		
	 ['SFZ_Juni'] = {
	 		bank = 2,
     "Target eliminated! Waiting for orders.",
	 },	
	 ['SFZ_Karin'] = {
	 		bank = 2,
     "How rude! You lack both manners and fighting ability!",
	 "'All you need is victory!' That is the motto of my family!",
     "You had your chance... Now it's time to pay up!",
     "To defeat an opponent is to get to know them intimately...",
	 },		 
	 ['SFZ_V-Ken'] = {
	 		bank = 2,
     "Attack me if you dare. I will crush you!",
	 "Go back! I think you left your ego on the battlefield!",
     "Don't tell me you're actually unconscience.",
     "Now you see the difference between us!",
	 },	
	 ['SFZ_N-Bison'] = {
	 		bank = 2,
     "I will CRUSH YOU!",
	 "I'm happy you are alive. You are still capable of feeling pain.",
     "The feelings of terror only prove your inferiority.",
     "Fear and respect... the supreme energy that is Psycho Power!",
	 },	
	 ['SFZ_Mika'] = {
	 		bank = 2,
     "Don't underestimate me! I believe in my dreams!",
     "I know I can do more! I was just warming up!",
     "I'll get better and better with more practice, right?!",
     "I'm learning more and more! The experience is exciting!",
	 },	
	 ['SFZ_T-Hawk'] = {
	 		bank = 2,
     "My sacred land, Thunderfoot, stay with me, always...",
     "Never defy the elements of nature!",
     "Look to the heavens for unlimited power!",
     "Look up to the sky to heal the wounds of your soul.",
	 },	
	 ['SFZ_Vega'] = {
	 		bank = 2,
     "Only I understand the pain of being too strong and beautiful!",
     "This place looks old... I know, I'll use you to paint it red!",
     "Your cries of agony... They are music to my ears!",
     "Your humiliation will only add to my beauty...",
	 },	
	 ['SFZ_Eagle'] = {
	 		bank = 2,
     "Did you enjoy my stick attacks?",
     "Joy and bliss fill my heart!",
     "Not so soon. Our playtime has just begun!",
     "Kneel before me, and devote yourself to me, your winner!",
	 },	
}

--; Nothing below this line needs editing.
function sfazVictoryQuoteFor(folderName)
	if type(folderName) ~= 'string' or sfazVictoryQuotes == nil then
		return nil
	end
	local pool = sfazVictoryQuotes[folderName]
	if type(pool) ~= 'table' or #pool == 0 then
		return nil
	end
	return pool[math.random(#pool)]
end

--; The character's "bank" field, or nil to use the mod's default.
function sfazVictoryQuoteBankFor(folderName)
	if type(folderName) ~= 'string' or sfazVictoryQuotes == nil then
		return nil
	end
	local pool = sfazVictoryQuotes[folderName]
	if type(pool) ~= 'table' then
		return nil
	end
	return tonumber(pool.bank)   -- nil if absent or malformed; caller falls back
end
