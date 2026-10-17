--;===========================================================
--; IN-GAME CHARACTER ENDINGS - the words
--;
--; The text that used to be pre-rendered sprites in each character's own .sff
--; (sprite group 7000) and played back as a fixed, gametick-paced animation.
--; external/mods/sfaz_ending_text.lua now draws these as real font text:
--; typed, word-wrapped, and paged by the player instead of by a clock.
--;
--; This file holds ONLY the words and the picture cues. The box, the font, the
--; typing speed and the fades are in the mod. The explods and the anims are in
--; the character's own .cns / .air.
--;
--;-----------------------------------------------------------
--; HOW A CHARACTER ENTRY IS PUT TOGETHER
--;-----------------------------------------------------------
--;
--;   ['SFZ_Ryu'] = {
--;       pages  = { "first screenful", "second screenful", ... },
--;       center = { 7, 8 },              -- pages to centre instead of left-align
--;       pic    = { [1] = 1, [4] = 2 },  -- page -> CHARACTER layer animelem
--;       bg     = { [1] = 1, [4] = 2 },  -- page -> BACKDROP layer animelem
--;       font   = 'sfa2_dialogue.fnt, 2, 1',   -- file, palette bank, align
--;       offset = { 0, -4 },             -- nudge the whole text box
--;   }
--;
--; FONT is optional and written in the STORYBOARD SPELLING - the same
--; "file, bank, align" triple as a storyboard .def font line:
--;
--;     font = 'sfa2_dialogue.fnt, 2, 0'
--;
--; Every field is optional; omit the whole key to take the mod's defaults.
--; A bare number is accepted as shorthand for just the bank (font = 2).
--;
--;   * BANK is a PALETTE index inside the .fnt, not a tint. It picks between
--;     colourings the font file already carries, so glyphs keep their own
--;     shading. sfa2_dialogue.fnt has 15 banks, 0-14. An out-of-range bank
--;     falls back to 0 SILENTLY, so a typo reads as "the colour did not
--;     change" rather than as an error. Same field, same meaning, as the
--;     'bank' in data/victory_quotes.lua.
--;   * ALIGN is the default for pages NOT listed in 'center' - centred pages
--;     are always centred. 0 = centre, 1 = left, -1 = right. Default 1.
--;
--; OFFSET is {x, y} in the 384x222 fight-screen space, and moves the text box
--; as a whole - the window shifts with the text, so the wrap width does not
--; change and nothing starts clipping. Use it when a character's art wants the
--; words a little higher or lower than the derived default; use it in
--; preference to editing WINDOW/BAND in the mod, which moves EVERY character.
--;
--; The KEY is the character's FOLDER name (chars/SFZ_Ryu/ -> 'SFZ_Ryu'), not
--; name() and not displayname(). Same rule as data/victory_quotes.lua, and for
--; the same reason: several characters share a display name (two of them show
--; as "AKUMA") while the folder is unique.
--;
--; PAGES are in the original order, so page 1 is the old sprite 7000,0, page 2
--; is 7000,1, and so on. That correspondence is what lets the picture cues be
--; derived rather than guessed - see below.
--;
--; CENTER lists the pages that were centred in the original art. In this game
--; the convention is consistent: spoken dialogue is left-aligned and carries a
--; speaker portrait, narration is centred and carries none. The portraits are
--; baked into the old text sprites and are NOT reproduced, so a dialogue page
--; is now plain left-aligned text.
--;
--; PIC and BG are the whole synchronisation mechanism. Each is a table of
--;     [page number] = animelem
--; meaning "when this page appears, jump that explod to this element of its
--; anim". Elements come from the page-cued copies of the ending anims - each of
--; their SHOTS starts at a known element and ends on a frame that waits, so the
--; layer holds there until the next cue. Pages with no entry leave the layer
--; alone.
--;
--; DERIVED DATA - do not hand-edit these. They are element numbers into the
--; generated cued anims, so anything that changes how those are built moves
--; them. Re-derive with tools/endings/sync_cues.py, which rewrites only these
--; lines and never touches the words.
--;
--; To CORRECT a binding, use shotpage instead - it survives regeneration:
--;
--;     shotpage = { '2:3=4' },   -- channel 2, shot 3 -> page 4
--;
--; Written in SHOT numbers, which are stable, rather than element numbers,
--; which move whenever the anims are rebuilt. Use it when the derived binding
--; is defensible but the art wants something else: Akuma's final pose lands
--; 89% through page 4, so the rule reads it as page 5's opening beat, but it
--; should be up from "I will be next..." onward.
--;
--;-----------------------------------------------------------
--; WHY THE PICTURES DO NOT FADE
--;-----------------------------------------------------------
--;
--; They used to, on the same alpha ramp as the text. It was wrong: a fading
--; layer is TRANSPARENT for those frames, and what shows through is the live
--; STAGE behind the ending - so every shot change flashed the stage. Covering
--; it permanently is not an option either, because several endings deliberately
--; want the stage seen.
--;
--; So shots cut cleanly, and the .cns spawns F9999 - the roster's own black
--; blink, 21 ticks of darken / hold / lighten - over the picture layers and
--; UNDER the F10099 frame, with the cut happening while the screen is black.
--; The mod holds the cue back FLASH_LEAD ticks to line the two up. Only a page
--; that actually CHANGES a shot flashes.
--;
--;-----------------------------------------------------------
--; AN ENDING HAS TWO ANIMATED LAYERS, NOT ONE
--;-----------------------------------------------------------
--;
--; This is the thing that is easy to miss and breaks the result badly when
--; missed. An ending is composed of layers at different sprpriorities, and at
--; least TWO of them are animated on the same clock:
--;
--;   PIC - the character layer, an anim in the character's OWN .air/.sff
--;         (7000 for Ryu, cued copy 7010)
--;   BG  - the backdrop, an F-prefixed anim out of data/fightfx.air
--;         (F15555 for Ryu, cued copy F115555)
--;
--; The backdrop is NOT static. Ryu's has exactly the same shape as his
--; character layer - two 900 tick holds then an 80 frame slide, cutting at
--; ticks 0, 900 and 1800, the same ticks. They are one sequence drawn twice:
--; the scene behind, the character in front of it. Cue only one and they drift
--; apart - the backdrop cuts early and never reaches its slide.
--;
--; Both are written out EXPLICITLY, even when the two layers happen to share
--; their cue elements (which they usually do, being a matched pair). 'bg' does
--; not fall back to 'pic': nothing here knows how many layers a character has,
--; so a fallback would invent a channel 2 for every single-layer ending and
--; point it at an explod ID that does not exist.
--;
--; Several characters animate MORE than two layers - Akuma, ChunLi, Rose, Gen,
--; Sodom and V-Ken three each, Kbee and Vega four - so channels run 1..4 and are
--; written as 'cues = { {...}, {...}, ... }' instead of pic/bg. Channel k drives
--; the explod with ID 10000+k. See SFAZ_END_CHANNELS below.
--;
--;-----------------------------------------------------------
--; WHERE THE CUE NUMBERS COME FROM - DO NOT GUESS THESE
--;-----------------------------------------------------------
--;
--; The original text anim and the picture anims ran on the SAME clock, so the
--; binding is already recorded in the .air files and can be recovered exactly.
--;
--; A shot belongs to the page that was ON SCREEN when it happened - unless it
--; happened in the last 35% of that page, in which case it is really the next
--; page's opening beat and binds forward. That is the whole rule.
--;
--; SEVERAL SHOTS ON ONE PAGE IS NORMAL, not a problem to be resolved. It means
--; the original played an animated sequence while one screenful of text sat
--; there, and those shots become a SINGLE cue whose frames run through on
--; gameticks, exactly as before. Bison's effect layer has five such shots in one
--; page. An earlier version spread them over five consecutive pages instead, and
--; because that layer draws ABOVE the character layer it covered the very art
--; those pages were about - it read as "the Shinkuu Hadouken sprites are
--; missing".
--;
--; Worked through for Ryu, from SFZ_Ryu.air:
--;
--;     picture cut   tick      lands 89% / 68% into its page -> next page
--;     7001,1           0      page 1   (starts tick 16)
--;     7001,0         900      page 4   (page 3 runs 596-936)
--;     7001,2        1800      page 7   (page 6 runs 1570-1910)
--;
--; which is the pic table below. Sanity-check it against the art rather than
--; trusting the arithmetic: cut 2 is Ryu shielding his eyes and it lands on
--; "What... the island... it's... it's disappearing!?", cut 3 is Ryu on the
--; ground and it lands on "As Akuma's island disappears so does Akuma...".
--; Both are the right moment, so the rule held here.
--;
--;-----------------------------------------------------------
--; WRITING THE TEXT
--;-----------------------------------------------------------
--;
--; * Wrapping is automatic. Only use \n where a break has to fall at one
--;   PARTICULAR word; do not pre-wrap a whole page by hand, because the box
--;   width is a tunable and hand-wrapping fights it.
--; * One string = one screenful = one button press. Do not merge two of the
--;   original pages into one string to "tidy up" - the picture cues are indexed
--;   by page number and every page after the merge would then cue early.
--; * A character with no entry here simply keeps its original sprite text and
--;   its original gametick pacing; the mod stands down and the .cns falls back.
--;   That is the intended state for every unconverted character.
--;===========================================================

sfazEndingTexts = {

	--;-------------------------------------------------------
	--; RYU
	--; Transcribed from sprites 7000,0 - 7000,10 in SFZ_Ryu.sff.
	--; Pages 1-6 and 9 were Akuma/Ryu dialogue with a portrait;
	--; pages 7, 8, 10 and 11 were centred narration.
	--;-------------------------------------------------------
	['SFZ_Ryu'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		-- Strips 0..8 -> pages 1..9. The two strips with no face land exactly on pages
		-- 7 and 8, which are CENTER narration. Pages 10 and 11 are further narration
		-- with no strip.
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 2, [5] = 1, [6] = 1, [9] = 2 },
		pages = {
			"You possess the same power as I.",
			"When the evil intent awakens within you, then you will know.",
			"All these past battles will seem like child's play.",
			"What... the island... it's... it's disappearing!?",
			"When you have learned to summon all your inner power, find me.",
			"Then we will truly learn who is more powerful.",
			"As Akuma's island disappears so does Akuma...",
			"Leaving behind the feeling of his presence.",
			"AKUMA!!",
			"Left only with the sense of his untapped powers Akuma's words give Ryu yet another test.",
			"Ryu's journey, to be a true warrior is never ending.",
		},
		center = { 7, 8, 10, 11 },
		-- Both layers segment identically here (three shots, originally at
		-- ticks 0, 900 and 1800), so 'bg' is omitted and falls back to 'pic'.
		-- Verified, not assumed - tools/endings/pagemap.py prints both.
		--
		-- The elements are 1 / 9 / 17 and not 1 / 2 / 3 because each shot in
		-- the cued copy is preceded by 7 fade-in frames. Take these from
		-- pagemap.py's "cued elem" column; do NOT read them off the original
		-- anim.
		-- The original sprite text was a warm orange. Bank 0 is the default;
		-- change the second field to recolour without touching the artwork.
		font   = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [4] = 2, [7] = 3 },   -- layer F15555
			{ [1] = 1, [4] = 2, [7] = 3 },   -- layer 7000
		},
	},

	--;-------------------------------------------------------
	--; SAGAT
	--; Transcribed from sprites 7000,1 / 2 / 4 / 5 / 6 - NOT a
	--; contiguous run, and 7000,0 and 7000,3 are not pages at
	--; all. Take the page->sprite mapping from convert_char.py
	--; rather than assuming 0..N-1.
	--; Every page carries a Sagat portrait, so none are narration.
	--;-------------------------------------------------------
	['SFZ_Sagat'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		-- PAGE MAPPING UNVERIFIED: this ending has 5 pages but 6 text
		-- strips, so strip order does not line up with page order. The line
		-- below is the strip order as-is - check it against the words above
		-- and fix the page numbers, then uncomment.
		faces  = { [1] = 1, [2] = 1, [3] = 2, [4] = 1, [5] = 1, [6] = 1 },
		pages = {
			"I am the Champion now!... Why do I feel so hollow?",
			"Why did Ryu look at me with such pity?...",
			"Getting off here. I have things to do on my own.",
			"I'll need a stronger move than Tiger Blow next time.",
			"But I must find it on my own.",
		},
		-- Shot 4 binds to page 5, not page 4: bind_shots pulled it forward onto
		-- the page boundary, same rule as everywhere else.
font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [2] = 2, [3] = 3, [4] = 4 },   -- layer 7000
	},

	--;-------------------------------------------------------
	--; DEE JAY - all four pages are centred narration, no portraits.
	--;-------------------------------------------------------
	['SFZ_DJ'] = {
		pages = {
			"After defeating all of his opponents, Dee Jay leaves the scene with a smile after finding the challenge he was looking for.",
			"While humming a melody inspired by the events of the tournament, he comes across a record producer.",
			"In fascination, he offers Dee Jay a contract to produce his first album.",
			"Neither of them would think that in less than two years, he would be filling stadiums with thousands of his fans.",
		},
		center = { 1, 2, 3, 4 },
font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [2] = 2 },   -- layer 7002
	},

	--;-------------------------------------------------------
	--; KARIN - every page carries her portrait, so none are narration.
	--;-------------------------------------------------------
	['SFZ_Karin'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		-- page 5 added after testing: Karin speaking; this ending has only one face
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 1, [5] = 1 },
		pages = {
			"My mind feels refreshed....",
			"I won by chance. She is the better fighter.",
			"I admire her.",
			"It's not the win or loss, but the moment of the fight...",
			"That is what is important to me now!",
		},
font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [3] = 2, [4] = 3 },   -- layer F10700
	},

	--;-------------------------------------------------------
	--; JULI - a mission report, all four pages with her portrait.
	--; Juli and Juni share the backdrop F12300 (Guile uses it too),
	--; so each got its own cued copy - see convert_char.py.
	--;-------------------------------------------------------
	['SFZ_Juli'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 1 },
		pages = {
			"Mission complete. Target fighting spirit down...",
			"Subject name: Cammy White\nSubject status: ...",
			"Alive... Unable to terminate. Reason: Unknown...",
			"Reunited with Juni. Returning to base.",
		},
font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [4] = 2 },   -- layer F12300
		noflash = { 1, 2, 3, 4 },
	},

	--;-------------------------------------------------------
	--; JUNI - the mirror of Juli's report, subject Ryu instead.
	--;-------------------------------------------------------
	['SFZ_Juni'] = {
		-- Speaker portrait per page: element inside [Begin Action 7051].
		--   1 = 7050,0
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 1 },
		pages = {
			"Mission complete. Fragments collected from the subject.",
			"Subject name: Ryu\nSubject status: ...",
			"Alive... Unable to terminate. Reason: Unknown...",
			"Reunited with Juli. Returning to base.",
		},
font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [4] = 2 },   -- layer F12300
		noflash = { 1, 2, 3, 4 },
	},

	--;-------------------------------------------------------
	--; SAGAT (ULTIMATE) - pages 1-2 are Sagat, 4-5 are Bison;
	--; page 3 is centred narration with no portrait.
	--;-------------------------------------------------------
	['SFZ_U-Sagat'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		-- PAGE MAPPING UNVERIFIED: this ending has 5 pages but 6 text
		-- strips, so strip order does not line up with page order. The line
		-- below is the strip order as-is - check it against the words above
		-- and fix the page numbers, then uncomment.
		faces  = { [1] = 1, [2] = 2, [4] = 3, [5] = 3 },
		pages = {
			"I hate you Ryu! More than ever!",
			"A true warrior fights with skill, not anger!",
			"It was not over yet. He was going to take his revenge! Ryu would pay for this.",
			"Sagat give up this foolish vendetta.",
			"If you wish to be feared, you must master Psycho Power!",
		},
		center = { 3 },
		-- THREE shots, not the four the anim lists. Its third holds sprite
		-- 7000,12 for 440 ticks and no such sprite exists in SFZ_U-Sagat.sff,
		-- so that shot drew nothing - the scene appeared to vanish and Sagat
		-- then arrived from nowhere. convert_char.py filters frames with no
		-- artwork out before deriving anything, so the cue elements below
		-- already exclude it. Do not re-add it from the raw .air.
font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [4] = 2 },   -- layer 7000
	},

	--;-------------------------------------------------------
	--; CHARLIE - NINE pages, not the ten the anim implies.
	--; The text anim holds sprite 7000,9 for 200 ticks as a tenth
	--; page and NO SUCH SPRITE EXISTS in SFZ_Charlie.sff, so that
	--; page drew nothing in the original either. Left out here
	--; because a page is now a button press: keeping it would put
	--; a blank screen in front of the player that they still have
	--; to press through. tools/endings/check_pages.py finds these.
	--; Pages 1-6 are Charlie, 7 is a soldier, 8-9 are Bison.
	--;-------------------------------------------------------
	['SFZ_Charlie'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 1, [5] = 1, [6] = 1, [7] = 2, [8] = 3, [9] = 3 },
		pages = {
			"Get up! Tell me everything you know!",
			"What's your connection to the Army Brass?",
			"Who put you up to this? Talk!",
			"... What the...!?",
			"NOOO!",
			"Ahhhhhhhh...",
			"Commander Bison, should we send a unit to confirm his death?",
			"No. No one could survive that fall.",
			"Now he knows that everyone has a price.",
		},
font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [3] = 2, [4] = 3, [6] = 4, [7] = 5 },   -- layer 7001
	},

	--;-------------------------------------------------------
	--; CODY (X) - FIVE pages; the anim's sixth references 8000,5,
	--; which does not exist in SFZ_Cody_X.sff. See CHARLIE above.
	--;
	--; Cody-X and Cody-Z are NOT the same ending and must not share
	--; an entry: every sprite in group 8000 differs between the two
	--; files, and Cody-Z opens with a page Cody-X does not have.
	--; Checked by comparing the sprite bitmaps, not assumed.
	--;-------------------------------------------------------
	['SFZ_Cody-X'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		-- page 5 added after testing: Cody answering Guy - reported in testing
		faces  = { [1] = 2, [2] = 2, [3] = 2, [4] = 1, [5] = 2 },
		pages = {
			"Life was peaceful for a while, but I kept fighting anyway.",
			"Saying \"I can't live in peace\" would have been an easy excuse.",
			"I had no excuse, and could not bear to live any other way.",
			"Where are you going?",
			"To the underworld or to heaven, I don't know. Nobody knows...",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
	},

	--;-------------------------------------------------------
	--; CODY (Z) - the same six-page ending WITH its opening line,
	--; which is the page Cody-X lacks. Page 5 is Jessica.
	--;-------------------------------------------------------
	['SFZ_Cody-Z'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		-- page 6 added after testing: Cody answering Guy - reported in testing
		faces  = { [1] = 1, [2] = 2, [3] = 2, [4] = 2, [5] = 1, [6] = 2 },
		pages = {
			"I don't see why you can't do positive things with such skill.",
			"Life was peaceful for a while, but I kept fighting anyway.",
			"Saying \"I can't live in peace\" would have been an easy excuse.",
			"I had no excuse, and could not bear to live any other way.",
			"Where are you going?",
			"To the underworld or to heaven, I don't know. Nobody knows...",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
	},

	--;-------------------------------------------------------
	--; DAN - pages 2 and 6 are centred narration; the rest are Dan.
	--;-------------------------------------------------------
	['SFZ_Dan'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		-- page 3 added after testing: Dan speaking; this ending has only one face
		faces  = { [1] = 1, [3] = 1, [4] = 1, [5] = 1 },
		pages = {
			"I've finally avenged your death!",
			"Back in Hong Kong, Dan opens a school where he can teach his style.",
			"For you, father...",
			"People all over the world will soon know my powerful moves.",
			"What's the problem? You must focus to be a Saikyo warrior!",
			"With blind ambition, Dan pursues worldwide fame. Is this his destiny?",
		},
		center = { 2, 6 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [2] = 2, [4] = 3 },   -- layer F10400
			{ [1] = 1, [2] = 2, [4] = 3 },   -- layer 7000
		},
	},
	
	--;-------------------------------------------------------
	--; EAGLE - all pages centered around Eagle.
	--;-------------------------------------------------------
	['SFZ_Eagle'] = {
		faces  = { [4] = 1, [5] = 1 },
		pages = {
			"Eagle couldn't find someone he felt was good enough...",
			"Some were big and some were strong, but none excited him.",
			"He went back to his homeland to find his inner peace again.",
			"Maybe I need to get closer to these people.",
			"Intimately, of course.",
		},
		center = { 1, 2, 3 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		--; No cue channels. Eagle's ending is a SINGLE held frame - F15560 in
		--; data/fightfx.air, spawned once by SFZ_Eagle.cns state 18800 and never
		--; touched again - so there is no layer for a page to cue. A channel here
		--; would point ModifyExplod at an ID that nothing spawns.
	},

	--;-------------------------------------------------------
	--; SAKURA - page 2 is Ryu, page 7 is her friend, the rest are
	--; Sakura. All carry a portrait, so nothing is centred.
	--;-------------------------------------------------------
	['SFZ_Sakura'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		faces  = { [1] = 1, [2] = 2, [3] = 1, [4] = 1, [5] = 1, [6] = 1, [7] = 3, [8] = 1 },
		pages = {
			"I want to be stronger! I want to learn more! Please, be my master!",
			"I'm still learning myself. You're on your own.",
			"At least give me something to remember you by.",
			"He took it easy on me. I know it.",
			"What did he mean - \"he is still learning\"?",
			"Maybe he knows the true meaning of fight.",
			"Sakura, you've been acting strange lately. Are you o.k.?",
			"Forget it. We don't have time. We'll be late for school.",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [3] = 2, [4] = 3, [5] = 4, [7] = 5 },   -- layer 7002
	},

	--;-------------------------------------------------------
	--; GUY - pages 1-2 and 6-7 are Guy, 3-5 are Zeku (his master);
	--; pages 8 and 9 are centred narration.
	--;-------------------------------------------------------
	['SFZ_Guy'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		--   4 = 7050,3
		-- Strips 1..7 -> pages 1..7. Pages 8 and 9 are CENTER narration, no strip.
		faces  = { [1] = 1, [2] = 1, [3] = 2, [4] = 2, [5] = 2, [6] = 1, [7] = 1 },
		pages = {
			"I have finally defeated the Mad Gear Gang.",
			"This time once and for all...",
			"You have tapped the power my pupil.",
			"Remember, Bushin style is only a name.",
			"Fighting style is not something handed down, but created.",
			"Master, you once told me to be a Master,",
			"...I must overcome everything. The time has come.",
			"There is no hatred in the faces of the Master and the Disciple.",
			"Only the spirit and fighting power from facing a worthy opponent.",
		},
		center = { 8, 9 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [3] = 2, [8] = 3 },   -- layer F11100
			{ [1] = 1, [3] = 8, [8] = 9 },   -- layer 7000
		},
	},

	--;-------------------------------------------------------
	--; KEN - pages 1-4 are Ken, 5 is Ryu, 7-11 alternate Eliza and
	--; Ken, 12 is Eliza. Page 6 is centred narration.
	--;-------------------------------------------------------
	['SFZ_Ken'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 1, [5] = 2, [7] = 3, [8] = 3, [9] = 1, [10] = 1, [11] = 3, [12] = 3 },
		pages = {
			"Get up, Ryu! Your heart wasn't in it this time.",
			"This battle with Sagat really messed with your head.",
			"Here, keep this. If you lose again...",
			"...this will remind you of me and the fight.",
			"Thanks, Ken. You helped me a lot.",
			"Back in America, after a victorious match Ken meets a very pretty girl.",
			"You fight well but why do you fight?",
			"For money, fame or for the attention?",
			"There's a man I must defeat.",
			"Until that day, I won't stop.",
			"I wouldn't want to be him.",
			"By the way, I am Eliza.",
		},
		center = { 6 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [3] = 2, [4] = 3 },   -- layer F10200
			{ [1] = 1, [3] = 2, [6] = 3 },   -- layer 7000
		},
		noflash = { 4 },
	},

	--;-------------------------------------------------------
	--; BISON - pages 1-3 are Bison, 4-5 Ryu's Shinkuu Hadouken,
	--; 6-7 Bison losing, 8-12 Guile and Chun-Li. All carry a
	--; portrait, so nothing is centred.
	--;-------------------------------------------------------
	['SFZ_Bison'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		--   4 = 7050,3
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 2, [5] = 2, [6] = 1, [7] = 1, [8] = 3, [9] = 4, [10] = 4, [11] = 3, [12] = 4 },
		pages = {
			"Ryu! You are destined to be my host body!",
			"So you want ultimate strength?",
			"I can make your dreams come true!",
			"Shinkuu...",
			"Hadouken!",
			"I don't believe it! This is impossible!",
			"Nooooooo!",
			"Ryu made it! He destroyed Bison. Chun-Li, destroy the base along with all his experiments.",
			"I'm on it!",
			"The control room... Let's see what I can do.",
			"Chun-Li! Are you o.k.?",
			"Never been better. We have finally destroyed him...",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [4] = 102, [5] = 103, [6] = 104, [7] = 105, [8] = 106 },   -- layer 7001
			{ [1] = 1, [8] = 2, [9] = 3, [10] = { 4, 5, 18, 19, 20 }, [11] = 24 },   -- layer F13500
		},
	},

	--;-------------------------------------------------------
	--; ADON - all nine pages are Adon, every one with a portrait.
	--;-------------------------------------------------------
	['SFZ_Adon'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0 Adon      2 = 7050,1 Sagat
		-- Pages left out show none. Taken from which face was baked into each
		-- of the original text strips 7000,0..8.
		faces  = { [1] = 1, [2] = 1, [3] = 2, [4] = 2, [5] = 1,
		           [6] = 1, [7] = 2, [8] = 1, [9] = 2 },
		pages = {
			"Obviously there is no technique superior to Muay Thai.",
			"Anyone dares to cross my path, he shall regret it!",
			"Don't you think you get carried away, boy?",
			"I didn't use all my power against you.",
			"No wonder it has been way too easy to defeat you.",
			"So will you take me seriously from now on?",
			"In fact you just earned that right. You better not disappoint me.",
			"I have been waiting for this moment for all of my life.",
			"Be prepared for our rematch. It's not going to be easy for you",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [3] = 2, [4] = 3, [8] = 4 },   -- layer F12000
			{ [1] = 1, [3] = 2, [4] = 3, [8] = 4 },   -- layer 7002
		},
	},

	--;-------------------------------------------------------
	--; CHARLIE (RESURRECTED) - four pages, all with his portrait.
	--; Distinct from SFZ_Charlie, which is a different ending.
	--;-------------------------------------------------------
	['SFZ_R-Charlie'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 1 },
		pages = {
			"I was dead... shattered... But Gill has brought me back.",
			"We have a common cause. Put an end to Bison.",
			"We have other allies too that will help us in our cause.",
			"So get ready. We are about to begin.",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [2] = 2, [3] = { 3, 4, 5, 6 } },   -- layer F11200
			{ [1] = 1, [3] = { 2, 9, 16, 23 } },   -- layer F11201
		},
	},

	--;-------------------------------------------------------
	--; BISON II - the SAME twelve pages as SFZ_Bison, word for
	--; word. Their sprites differ in PIXELS for 8 of the 12, but
	--; that is only the portrait baked into the art (Bison vs
	--; Bison II) and portraits are not reproduced. Compared by
	--; decoding the sprites, not by looking at them.
	--;
	--; The CUE tables are its own - the anims differ - so this
	--; cannot be aliased to Bison even though the words match.
	--;-------------------------------------------------------
	['SFZ_N-Bison'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		--   4 = 7050,3
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 2, [5] = 2, [6] = 1, [7] = 1, [8] = 3, [9] = 4, [10] = 4, [11] = 3, [12] = 4 },
		pages = {
			"Ryu! You are destined to be my host body!",
			"So you want ultimate strength?",
			"I can make your dreams come true!",
			"Shinkuu...",
			"Hadouken!",
			"I don't believe it! This is impossible!",
			"Nooooooo!",
			"Ryu made it! He destroyed Bison. Chun-Li, destroy the base along with all his experiments.",
			"I'm on it!",
			"The control room... Let's see what I can do.",
			"Chun-Li! Are you o.k.?",
			"Never been better. We have finally destroyed him...",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [4] = 102, [5] = 103, [6] = 104, [7] = 105, [8] = 106 },   -- layer 7001
			{ [1] = 1, [8] = 2, [9] = 3, [10] = { 4, 5, 18, 19, 20 }, [11] = 24 },   -- layer F13500
		},
	},

	--;-------------------------------------------------------
	--; GUILE - pages 1-6 are Bison taunting, 7-10 are Guile
	--; realising who killed Charlie. Every page has a portrait.
	--;-------------------------------------------------------
	['SFZ_Guile'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		faces  = { [1] = 1, [2] = 2, [3] = 1, [4] = 1, [5] = 1, [6] = 1, [7] = 2, [8] = 2, [9] = 2, [10] = 2 },
		pages = {
			"I give you credit. You were almost like having fun.",
			"Do you really think you are going to escape?",
			"Don't you get it, punk? Nobody can lay a finger on me!",
			"Many have tried so... And payed it for their lives.",
			"Just like that fool... Nash...",
			"You should have seen his face when he realized that he was betrayed by his superiors.",
			"Charlie!... It was you...",
			"You killed him...",
			"I could have seen you behind bars but now it's rather personal...",
			"I won't rest until I avenge Charlie's death!",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [7] = 2 },   -- layer F12300
			{ [1] = 1, [8] = 2 },   -- layer 7002
		},
	},

	--;-------------------------------------------------------
	--; DHALSIM - page 1 is centred narration with no portrait;
	--; the rest are Dhalsim and the villagers.
	--;-------------------------------------------------------
	['SFZ_Dhalsim'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		faces  = { [2] = 1, [3] = 1, [4] = 2, [5] = 2, [6] = 3, [7] = 1, [8] = 3, [9] = 1 },
		pages = {
			"After returning to his village Dhalsim sinks into deep meditation.",
			"I must cleanse myself from the evil force which has taken over my mind.",
			"What good could possibly come from my damaging power?",
			"Oh, great yoga master, Dhalsim. Your victories have truely blessed us.",
			"All the people in the village thank you.",
			"My love.",
			"Have I created bad karma?",
			"On the contrary. You have made things better for all.",
			"I hope you are right. Does the end justify the means?",
		},
		center = { 1 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [4] = 2, [6] = 3 },   -- layer 12400
			{ [1] = 1, [4] = 2, [6] = 3 },   -- layer 7002
		},
	},

	--;-------------------------------------------------------
	--; ROLENTO - four pages, all with his portrait. No animated
	--; layer at all, so no cue table and no transition.
	--;-------------------------------------------------------
	['SFZ_Rolento'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 1 },
		pages = {
			"The time has come! Enough of this panty-waist politicking!",
			"We need discipline, order, strength, power.",
			"I'll make soldiers out of the whole, damn, lot of them.",
			"One day... I will bring order!",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
	},

	--;-------------------------------------------------------
	--; DARK SAKURA - pages 1-2 are Sakura with a portrait,
	--; 3-4 are centred narration.
	--;-------------------------------------------------------
	['SFZ_D-Sakura'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		faces  = { [1] = 1, [2] = 2 },
		pages = {
			"Oh no! My powers are gone! They must had been temporary due to the sunburn.",
			"Anyway, I may acquire them with enough practice!",
			"Even though she has lost her new skills she feels stronger...",
			"...believing that helping others is the greatest power.",
		},
		center = { 3, 4 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [3] = 2 },   -- layer F10301
			{ [1] = 1, [2] = 22, [3] = 23 },   -- layer 7002
		},
	},

	--;-------------------------------------------------------
	--; ZANGIEF - FOUR pages, not the eleven the anim implies.
	--; Its pages 5-11 hold sprites 7000,5 - 7000,11 and none of
	--; them exist in the .sff, so they drew nothing even before
	--; the conversion. See check_pages.py.
	--;-------------------------------------------------------
	['SFZ_Zangief'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		-- PAGE MAPPING UNVERIFIED: this ending has 4 pages but 5 text
		-- strips, so strip order does not line up with page order. The line
		-- below is the strip order as-is - check it against the words above
		-- and fix the page numbers, then uncomment.
		faces  = { [1] = 1, [2] = 1, [4] = 1 },
		pages = {
			"Ha ha ha! See?... This is the power of Mother Russia!",
			"And the wrath of my muscles!",
			"And so the Ring of Destruction Tournament is about to begin.",
			"I am the strongest wrestler in the world! Nobody can stop me!",
		},
		center = { 3 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [3] = 2 },   -- layer F11501
			{ [1] = 1, [3] = 2 },   -- layer 7001
		},
	},

	--;-------------------------------------------------------
	--; AKUMA - five pages, all with his portrait.
	--; NOT shared with SFZ_AkumaS: the two use the same .air but
	--; their page sprites differ, checked by decoding them.
	--;-------------------------------------------------------
	['SFZ_Akuma'] = {
		-- His final pose lands 89% through page 4, so the binding rule reads it
		-- as page 5's opening beat. The sentence runs across both pages though,
		-- and it should be up from "I will be next..." onward.
		shotpage = { '2:3=4' },
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		-- One face and no narration pages, so every page shows it. There are 4 strips
		-- for 5 pages because "I will be next..." / "...to die!" is one strip split.
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 1, [5] = 1 },
		pages = {
			"Worthy opponents have challenged me.",
			"Maybe this world is not as weak as I thought.",
			"I could live in this mortal place and perfect my killing power.",
			"I will be next...",
			"...to die! Ha Ha Ha!",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [2] = { 2, 3 }, [3] = { 12, 21 }, [4] = 30 },   -- layer F12200
			{ [1] = 1, [2] = 2, [4] = 3 },   -- layer 7002
			{ [1] = 1, [3] = 2 },   -- layer 7003
		},
	},

	--;-------------------------------------------------------
	--; SHIN AKUMA - the SAME ending as SFZ_Akuma, page for page.
	--; Same text anim, same five pages, same three layers with the
	--; same shot structure; only the baked-in portraits differ and
	--; those are not reproduced. Cue tables are still derived per
	--; character, since nothing guarantees the anims stay in step.
	--;-------------------------------------------------------
	['SFZ_AkumaS'] = {
		shotpage = { '2:3=4' },
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		-- Same ending, and literally the same sprite file, as SFZ_Akuma.
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 1, [5] = 1 },
		pages = {
			"Worthy opponents have challenged me.",
			"Maybe this world is not as weak as I thought.",
			"I could live in this mortal place and perfect my killing power.",
			"I will be next...",
			"...to die! Ha Ha Ha!",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [2] = { 2, 3 }, [3] = { 12, 21 }, [4] = 30 },   -- layer F12200
			{ [1] = 1, [2] = 2, [4] = 3 },   -- layer 7002
			{ [1] = 1, [3] = 2 },   -- layer 7003
		},
	},

	--;-------------------------------------------------------
	--; BIRDIE - page 3 is a centred caption on the data screen,
	--; the rest are Birdie and Bison with portraits.
	--;-------------------------------------------------------
	['SFZ_Birdie'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		faces  = { [1] = 1, [2] = 2, [4] = 1, [5] = 1 },
		pages = {
			"I'm the BEST! What do you have to say for yourself, Bison?",
			"O.k.! I will accept you as a member of Shadaloo.",
			"Shadaloo Command Center Data Room",
			"Bison, you lunatic! Now I know your secret agenda!",
			"Watch your back, mate!",
		},
		center = { 3 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [3] = 2, [4] = 3 },   -- layer F11600
	},

	--;-------------------------------------------------------
	--; FEI LONG - pages 1-3 are dialogue with portraits,
	--; 4-5 are centred narration.
	--;-------------------------------------------------------
	['SFZ_FeiLong'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		-- Strips 0..2 -> pages 1..3. Pages 4 and 5 are CENTER narration, no strip.
		faces  = { [1] = 1, [2] = 2, [3] = 2 },
		pages = {
			"If you reach the top of a mountain, climb yet another.",
			"I've never seen combos like that.",
			"I can make you a star.",
			"Now a superstar Fei Long stands the center of the spotlight.",
			"Despite his achievements, he is not yet satisfied...",
		},
		center = { 4, 5 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [2] = 2, [4] = 3 },   -- layer F11400
			{ [1] = 1, [2] = 2, [4] = 3 },   -- layer 7002
		},
	},

	--;-------------------------------------------------------
	--; VIOLENT KEN - pages 1-2 are centred narration, 3-5 are Ken.
	--;-------------------------------------------------------
	['SFZ_V-Ken'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		faces  = { [3] = 1, [4] = 1, [5] = 1 },
		pages = {
			"Ken can't believe his eyes when he sees what he has done",
			"He tries to test his powers' limit once again. But they were gone.",
			"Lucky that I didn't cause anyone get injured permanently.",
			"I've got to pump up my training and meditate.",
			"Or I won't be so lucky next time...",
		},
		center = { 1, 2 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [2] = 2, [3] = 3 },   -- layer F13000
			{ [1] = 1, [2] = 2, [3] = 3 },   -- layer 7001
		},
	},

	--;-------------------------------------------------------
	--; T-HAWK - page 2 is Julia, the rest are T-Hawk. All have
	--; portraits, so nothing is centred.
	--;-------------------------------------------------------
	['SFZ_T-Hawk'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		faces  = { [1] = 1, [2] = 2, [3] = 1, [4] = 1, [5] = 1, [6] = 1 },
		pages = {
			"The demons are gone... Now, Julia... Let's go home.",
			"Ugh... ah... Bison... Sir... Bison...",
			"Like myself, sacred blood must be running through your body.",
			"I'll save you... No matter what the cost!",
			"No one shall ever disgrace my land and people again!",
			"I swear on the honor and blood of my tribe!",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [5] = 2, [6] = 4 },   -- layer F15558
	},

	--;-------------------------------------------------------
	--; BALROG - pages 5 and 8-9 are centred captions/narration;
	--; the rest are Balrog and the boy, with portraits.
	--;-------------------------------------------------------
	['SFZ_Balrog'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 1, [6] = 1, [7] = 1 },
		pages = {
			"What the hell! Who is this boy?!",
			"Could he be a candidate for the Doll Soldiers Project?",
			"He could be worthy of me... Besides...",
			"He'd die out here...",
			"A week later...",
			"Pay attention, boy! Never hesitate before you hit!",
			"Go for it, right on!",
			"As Balrog decides to train him he waits for the right time to take action.",
			"Or could he be creating a bond with the boy?",
		},
		center = { 5, 8, 9 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [3] = 2, [5] = 3 },   -- layer 7005
	},

	--;-------------------------------------------------------
	--; E.HONDA - pages 1-3 are centred narration with no portrait,
	--; 4-6 are the rematch challenge.
	--;-------------------------------------------------------
	['SFZ_Honda'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		faces  = { [4] = 1, [5] = 2, [6] = 2 },
		pages = {
			"Travelling new places and fighting worthy opponents...",
			"Honda returns to Japan to attend a wrestlers' tournament.",
			"...to pay off old scores.",
			"Care for a round, boy?",
			"Well well... Edmond Honda... Yes, I'm here for a rematch!",
			"And I'm not gonna go easy on you this time!",
		},
		center = { 1, 2, 3 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		
		cues = {
			{ [1] = 1, [4] = 2, [6] = 3 },   -- layer F13300
			{ [1] = 1, [4] = 3, [6] = 4 },   -- layer 7001
		},
	},

	--;-------------------------------------------------------
	--; BLANKA - Dan and Blanka talking; Blanka's lines are his
	--; growls with the translation in brackets, exactly as the
	--; original art has them. Pages 8-9 are centred narration.
	--;-------------------------------------------------------
	['SFZ_Blanka'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		faces  = { [1] = 1, [2] = 2, [3] = 1, [4] = 2, [5] = 1, [6] = 2, [7] = 3 },
		pages = {
			"Jimmy, you have the guts to be my number one student!",
			"Uwo wou wow. (I told you so, Dan!)",
			"So now what's your plan?",
			"Uwo wou wow. (To go back home. Already had much fun.)",
			"So will we be meeting again, pal?",
			"Uwo wou wow. Uwhooo. (Rest assured, Dan. See you.)",
			"So Blanka returns to the depths of the jungles.",
			"He realizes that he loves the forest as much as he loves fighting.",
			"Who knows if his curiosity will draw him back to civilization.",
		},
		center = { 7, 8, 9 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [7] = 2 },   -- layer F10500
		noflash = { 1 },
	},

	--;-------------------------------------------------------
	--; MIKE (BISON'S RECRUIT) - all eleven pages carry a portrait.
	--;-------------------------------------------------------
	['SFZ_Mike'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		faces  = { [1] = 1, [2] = 2, [3] = 1, [4] = 2, [5] = 1, [6] = 1, [7] = 2, [8] = 1, [9] = 2, [10] = 2 },
		pages = {
			"Interesting...",
			"What the hell? You still alive? I'd better hit harder this time.",
			"And then what? Being a nightclub thug is such a waste of talent...",
			"Damn ... I swear I'm gonna...",
			"Calm down. I have an offer. You will make a lot of money by being my bodyguard.",
			"And well.. Maybe kill for once in a while... When necessary.",
			"Why me?",
			"You have the desire for blood. Right?",
			"I have to be ready when Bison needs me on a mission.",
			"But first I can sit back and satisfy my taste for luxury.",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [2] = 2 },   -- layer 7003
		flash = { 9 },
		noflash = { 1, 2 },
	},

	--;-------------------------------------------------------
	--; CAMMY - Bison, then Colonel Wolfman and Lita of Delta Red.
	--; Every page carries a portrait.
	--;-------------------------------------------------------
	['SFZ_Cammy'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		--   4 = 7050,3
		faces  = { [1] = 1, [2] = 2, [3] = 1, [4] = 1, [5] = 1, [6] = 2, [7] = 3, [8] = 3, [9] = 3, [10] = 2, [11] = 2, [12] = 2 },
		pages = {
			"Impossible! How could a simple doll like you could use such power!",
			"A doll? What are you talking about?",
			"After so many years of research you became my ultimate assassin.",
			"So there's nothing I can do to get you back. But you're no longer irreplaceable.",
			"Enjoy your new life, Cammy. Next time I won't hesitate to destroy you.",
			"Bison... I don't believe in your lies.",
			"Colonel, if you don't want me in the team anymore...",
			"Cammy, you are no longer that person.",
			"It was all in the past. You are one of us.",
			"Colonel, Lita... You're right. I can't let my past dictate my future.",
			"Let's go home.",
			"It's good to be back...",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [11] = 2 },   -- layer F13200
			{ [1] = 1, [7] = 2 },   -- layer 7007
		},
		flash = { 12 },
	},

	--;-------------------------------------------------------
	--; KILLER BEE - Bison and Vega over the Doll Soldiers project.
	--; Every page carries a portrait.
	--;
	--; Distinct from SFZ_Cammy despite both displaying as "CAMMY";
	--; the folder name is what keys this file. Same trap that put
	--; her win quotes under the wrong key - see victory_quotes.lua.
	--;-------------------------------------------------------
	['SFZ_Kbee'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		faces  = { [1] = 1, [2] = 2, [3] = 2, [4] = 2, [5] = 2, [6] = 2, [7] = 2, [8] = 2, [9] = 2 },
		pages = {
			"NO!!!!!",
			"Pick up her body and put it into the ship.",
			"I never imagined how strong this backup body would get.",
			"The potential of the Psycho Power is limitless.",
			"Erase all the information from her memory.",
			"There shouldn't be any trace of what she has learnt.",
			"This project has started giving favourable results.",
			"The Doll Soldiers Project has started.",
			"Start looking for new candidates.",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [3] = 2 },   -- layer F11000
			{ [1] = 1, [3] = 2 },   -- layer 7002
			{ [1] = 1, [3] = 2 },   -- layer 7001
		},
	},

	--;-------------------------------------------------------
	--; ROSE - pages 2, 5, 8 and 9 are centred narration; the rest
	--; are Rose with her portrait.
	--;-------------------------------------------------------
	['SFZ_Rose'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		-- Strips 0..6 -> pages 1..7 in order. The two strips with no face land exactly
		-- on pages 2 and 5, which are the CENTER narration pages - that alignment is
		-- the check. Pages 8 and 9 are further narration with no strip at all.
		faces  = { [1] = 1, [3] = 1, [4] = 1, [6] = 1, [7] = 1 },
		pages = {
			"Finally... It's over.",
			"Later...",
			"I have sealed his Psycho Powers forever.",
			"I think...",
			"Unable to escape her ominous feeling, Rose consults her Tarots",
			"What!? How can this be? This is the card of...",
			"There must be a mistake! It should have ended.",
			"Paralyzed with fear, she realizes she is powerless.",
			"But somebody else she sees, who has the power to end it all.",
		},
		center = { 2, 5, 8, 9 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [2] = 2, [3] = 3, [5] = 109, [6] = 169 },   -- layer F10900
			{ [1] = 1, [2] = 2, [5] = 3, [6] = 4, [7] = 36 },   -- layer 7002
		},
		noflash = { 7 },
	},

	--;-------------------------------------------------------
	--; R.MIKA - page 2 is centred narration; the rest are Mika,
	--; the announcer and Zangief.
	--;-------------------------------------------------------
	['SFZ_Mika'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		--   4 = 7050,3
		-- PAGE MAPPING UNVERIFIED: this ending has 5 pages but 11 text
		-- strips, so strip order does not line up with page order. The line
		-- below is the strip order as-is - check it against the words above
		-- and fix the page numbers, then uncomment.
		faces  = { [1] = 1, [2] = 2, [5] = 3 },
		pages = {
			"Well, that was a piece of cake!",
			"Next is the world's biggest wrestling tournament!",
			"Mika finally gets her dream match with Zangief.",
			"Without a doubt, the battle of supremacy never ends!",
			"This match will always be remembered!",
		},
		center = { 3, 4 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		pic  = { [1] = 1, [3] = 2 },   -- layer 7001
	},

	--;-------------------------------------------------------
	--; EVIL RYU - six pages, all with his portrait.
	--;-------------------------------------------------------
	['SFZ_E-Ryu'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 1, [5] = 1, [6] = 1 },
		pages = {
			"Now what a power!",
			"Satsui no hado... But how did I acquire it?",
			"Wait... I remember... Bison made this...",
			"He tried to use me as a host body. Till I got away...",
			"I can't use this power. It's far too dangerous!",
			"I must fight it!",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [2] = 2 },   -- layer F12900
			{ [1] = 1, [2] = 2, [3] = 4, [5] = 5 },   -- layer 7001
		},
	},

	--;-------------------------------------------------------
	--; SODOM (X) - pages 1-3 are centred narration, 4-7 dialogue.
	--; Read from the sheet; SFZ_Sodom-Z is the same words.
	--;-------------------------------------------------------
	['SFZ_Sodom-X'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		faces  = { [4] = 1, [5] = 1, [6] = 2, [7] = 3 },
		pages = {
			"Sodom continues his quest to revive the Mad Gear.",
			"He gathers the former gang members.",
			"Finally they all decide to reunite. Yet...",
			"Guys, the gang has a new name!",
			"It's The Gusta!",
			"Hey! What's going on?",
			"You gotta be kidding me...",
		},
		center = { 1, 2, 3 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [2] = 2, [5] = 3 },   -- layer F11300
			{ [1] = 1, [2] = 2, [4] = 3 },   -- layer F11301
			{ [1] = 1, [2] = 2, [4] = 3, [5] = 4 },   -- layer 7002
		},
	},

	--;-------------------------------------------------------
	--; SODOM (Z) - the same seven pages as SFZ_Sodom-X, checked
	--; against its own sheet rather than assumed: their page
	--; sprites differ in PIXELS, but only in the portrait art.
	--;-------------------------------------------------------
	['SFZ_Sodom-Z'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		faces  = { [4] = 1, [5] = 1, [6] = 2, [7] = 3 },
		pages = {
			"Sodom continues his quest to revive the Mad Gear.",
			"He gathers the former gang members.",
			"Finally they all decide to reunite. Yet...",
			"Guys, the gang has a new name!",
			"It's The Gusta!",
			"Hey! What's going on?",
			"You gotta be kidding me...",
		},
		center = { 1, 2, 3 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [2] = 2, [5] = 3 },   -- layer F11300
			{ [1] = 1, [2] = 2, [4] = 3 },   -- layer F11301
			{ [1] = 1, [4] = 2, [5] = 3 },   -- layer 7002
		},
	},

	--;-------------------------------------------------------
	--; VEGA - seven pages, all with a portrait.
	--;-------------------------------------------------------
	['SFZ_Vega'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		faces  = { [1] = 1, [2] = 1, [3] = 1, [4] = 2, [5] = 2, [6] = 2, [7] = 1 },
		pages = {
			"What a disgraceful battle. No emotion... No elegance...",
			"Why did I ever accept this invitation?!",
			"Now tell me before I cut you to pieces. Why did you invite me?",
			"You have the potential. But you don't use it wisely.",
			"You are secured financially. Yet dissatisfied with your life.",
			"I offer you to take your wildest dreams into a new level.",
			"I am listening...",
		},
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [3] = 2 },   -- layer F11900
			{ [1] = 1, [3] = 2 },   -- layer 7001
			{ [1] = 1, [3] = 2 },   -- layer 7002
		},
	},

	--;-------------------------------------------------------
	--; CHUN-LI (X) - page 6 is a centred caption; the rest are
	--; Bison, Chun-Li and her I-COP superior.
	--;-------------------------------------------------------
	['SFZ_ChunLi-X'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		faces  = { [1] = 1, [2] = 1, [3] = 2, [4] = 1, [5] = 2, [7] = 3, [8] = 3, [9] = 2, [10] = 2 },
		pages = {
			"Chun-Li you surprised me. Next time I'll use both hands.",
			"Unfortunately I have no time for these pretty games.",
			"I need answers. Where's my father?",
			"Oh he was amusing. Not as much as you though...",
			"You! You killed my father!",
			"Two days later. I-COP Office, China.",
			"I've read your report, Agent Li. Good work.",
			"I am sure you will go on your father's path and end Shadaloo.",
			"I'll get you Bison. Next time.",
			"This is the last time I cry... Don't worry, father.",
		},
		center = { 6 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [3] = 3, [6] = 4, [9] = 5 },   -- layer F10600
			{ [1] = 1, [6] = 2, [9] = 3, [10] = 4 },   -- layer 7004
		},
		noflash = { 10 },
	},

	--;-------------------------------------------------------
	--; CHUN-LI (Z) - the same ten pages, read from its own sheet.
	--; Their sprites differ in PIXELS but only in the portrait.
	--;-------------------------------------------------------
	['SFZ_ChunLi-Z'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		--   3 = 7050,2
		faces  = { [1] = 1, [2] = 1, [3] = 2, [4] = 1, [5] = 2, [7] = 3, [8] = 3, [9] = 2, [10] = 2 },
		pages = {
			"Chun-Li you surprised me. Next time I'll use both hands.",
			"Unfortunately I have no time for these pretty games.",
			"I need answers. Where's my father?",
			"Oh he was amusing. Not as much as you though...",
			"You! You killed my father!",
			"Two days later. I-COP Office, China.",
			"I've read your report, Agent Li. Good work.",
			"I am sure you will go on your father's path and end Shadaloo.",
			"I'll get you Bison. Next time.",
			"This is the last time I cry... Don't worry, father.",
		},
		center = { 6 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [3] = 3, [6] = 4, [9] = 5 },   -- layer F10600
			{ [1] = 1, [6] = 2, [9] = 3, [10] = 4 },   -- layer 7004
		},
		noflash = { 10 },
	},

	--;-------------------------------------------------------
	--; GEN - all FOUR variants share these eight pages.
	--;
	--; Gen-X and Gen-X1 are pixel-identical, as are Gen-Z and
	--; Gen-Z1; Gen-X and Gen-Z differ only in the portrait art,
	--; confirmed by reading both sheets rather than assuming.
	--;
	--; EIGHT pages, not the eleven the anim implies: pages 9-11
	--; hold sprites 7000,8 - 7000,10 and none exist in the .sff,
	--; so they drew nothing even before the conversion.
	--;-------------------------------------------------------
	['SFZ_Gen-X'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		faces  = { [1] = 1, [2] = 1, [5] = 2, [6] = 2, [7] = 2, [8] = 2 },
		pages = {
			"What's your problem? Finish me now!",
			"What are you waiting for?",
			"Gen leaves Akuma to his fate.",
			"What's on his mind?",
			"It would be no challenge to finish him.",
			"But then my greatest joy for my remaining days is lost.",
			"Uh...",
			"I'd rather die fighting!",
		},
		center = { 3, 4 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [4] = 2, [5] = 3 },   -- layer F11800
			{ [1] = 1, [7] = 2, [8] = 3 },   -- layer 7003
			{ [1] = 1, [4] = 2, [5] = 3 },   -- layer 7002
		},
		noflash = { 1, 2, 3, 4, 6, 7, 8 },
	},

	
	['SFZ_Gen-Z'] = {
		-- Speaker portrait per page: element inside [Begin Action 7050].
		--   1 = 7050,0
		--   2 = 7050,1
		-- The 6 strips are numbered 0,1,4,5,6,7 - and the gap at 2,3 is exactly the
		-- two CENTER narration pages 3 and 4, so strip N maps to page N+1 throughout.
		faces  = { [1] = 1, [2] = 1, [5] = 2, [6] = 2, [7] = 2, [8] = 2 },
		pages = {
			"What's your problem? Finish me now!",
			"What are you waiting for?",
			"Gen leaves Akuma to his fate.",
			"What's on his mind?",
			"It would be no challenge to finish him.",
			"But then my greatest joy for my remaining days is lost.",
			"Uh...",
			"I'd rather die fighting!",
		},
		center = { 3, 4 },
		font = 'sfa2_dialogue.fnt, 0, 1',
		offset = { 2, 9 },
		cues = {
			{ [1] = 1, [4] = 2, [5] = 3 },   -- layer F11800
			{ [1] = 1, [7] = 2, [8] = 3 },   -- layer 7003
			{ [1] = 1, [4] = 2, [5] = 3 },   -- layer 7002
		},
		noflash = { 1, 2, 3, 4, 6, 7, 8 },
	},



}

--;-----------------------------------------------------------
--; LOOKUP
--;
--; Returns the entry for a character folder, or nil. nil is the signal the mod
--; uses to stand down completely, so it must stay nil rather than becoming an
--; empty table - an empty page list would blank the ending instead of leaving
--; the original sprite version alone.
--;-----------------------------------------------------------
function sfazEndingFor(folder)
	if type(folder) ~= 'string' then
		return nil
	end
	local e = sfazEndingTexts[folder]
	if type(e) ~= 'table' or type(e.pages) ~= 'table' or #e.pages == 0 then
		return nil
	end
	return e
end

--; true if page n of this entry should be centred.
--; THE SPEAKER PORTRAIT FOR PAGE n, or nil for a page that has none.
--;
--; A character declares its faces the same way it declares picture cues:
--;
--;     faces = { [1] = 1, [2] = 2, [3] = 1, [7] = 3 },
--;
--; page number -> ELEMENT inside that character's face action, 1-based. Pages
--; left out of the table show no portrait, which is what narration wants.
--;
--; The elements are the sprites cropped out of the OLD text strips - the art
--; that used to have the face baked in. data/endings/PORTRAITS_TODO.txt lists,
--; per character, every distinct face in that ending, the strip and pixel box
--; to crop it from, and the sprite number to give it. Numbering restarts at
--; 7050,0 for every character because a face is local to its own ending: an NPC
--; only ever appears in the one ending that features them, so nothing collides
--; and no shared NPC roster is needed.
--;
--; A missing table means no portraits for that ending, which is exactly how it
--; behaved before this existed.
function sfazEndingFace(entry, n)
	if type(entry) ~= 'table' or type(entry.faces) ~= 'table' then
		return nil
	end
	local v = tonumber(entry.faces[n])
	if v == nil or v < 1 then
		return nil
	end
	return v
end

function sfazEndingCentered(entry, n)
	if type(entry) ~= 'table' or type(entry.center) ~= 'table' then
		return false
	end
	for _, v in ipairs(entry.center) do
		if v == n then
			return true
		end
	end
	return false
end

--; SFAZ_END_CHANNELS is the number of cue channels the .cns blocks implement:
--; channel k drives the explod with ID 10000 + k. Raising it means adding the
--; matching ModifyExplod/MapSet pair to every converted character, so it is a
--; shared constant rather than something the data may exceed silently.
SFAZ_END_CHANNELS = 10

--; Normalise an entry's cue tables into an array of channels.
--;
--; Three spellings are accepted, because most characters only ever need the
--; first two and 'pic'/'bg' read far better than 'cues[1]'/'cues[2]':
--;     pic  = {...}                     -> channel 1  (the character layer)
--;     bg   = {...}                     -> channel 2  (the backdrop)
--;     cues = { {...}, {...}, {...} }   -> channels 1..N, for 3+ layer endings
--; 'cues' wins outright where present; otherwise pic/bg are used, and bg falls
--; back to pic when absent (the layers are usually a matched pair - see the
--; two-layer note above).
function sfazEndingChannels(entry)
	if type(entry) ~= 'table' then
		return {}
	end
	if type(entry.cues) == 'table' and type(entry.cues[1]) == 'table' then
		return entry.cues
	end
	--; 'bg' does NOT fall back to 'pic'. It used to, on the reasoning that the
	--; two layers are usually a matched pair - but nothing here knows how many
	--; layers a character actually HAS, so the fallback invented a channel 2 for
	--; every single-layer ending and pointed it at an explod ID that does not
	--; exist. Harmless at runtime, but it made the data lie about the character.
	--; Both channels are written out explicitly by convert_char.py instead.
	local out = {}
	if type(entry.pic) == 'table' then out[1] = entry.pic end
	if type(entry.bg) == 'table' then out[2] = entry.bg end
	return out
end

--; Every animelem channel `ch` steps through on page n, in shot order, or nil.
--;
--; A page's entry is normally a single number - one cue, held until the page
--; turns. A STEPPED page (tools/endings/make_cue_anim.group_shots) instead
--; holds a LIST, one animelem per shot, and the mod walks it a button press at
--; a time so a page carrying several separate pictures cannot be skipped past
--; with one press. Both shapes are returned as a list here so callers have one
--; thing to handle.
function sfazEndingSteps(entry, ch, n)
	local chans = sfazEndingChannels(entry)
	local t = chans[ch]
	if type(t) ~= 'table' then
		return nil
	end
	local v = t[n]
	if type(v) == 'number' then
		return { v }
	end
	if type(v) ~= 'table' then
		return nil
	end
	local out = {}
	for _, x in ipairs(v) do
		if type(x) == 'number' then
			out[#out + 1] = x
		end
	end
	if #out == 0 then
		return nil
	end
	return out
end

--; The animelem channel `ch` cues on page n, or nil for "leave it alone".
--; On a stepped page this is the FIRST shot - the rest come from
--; sfazEndingSteps. Kept a number so older callers still work.
function sfazEndingCue(entry, ch, n)
	local steps = sfazEndingSteps(entry, ch, n)
	if steps == nil then
		return nil
	end
	return steps[1]
end

--; Kept so anything written against the older two-channel API still resolves.
--; True if page n should NOT play the black transition.
--;
--; DERIVED like the cue tables - sync_cues.py writes it, do not hand-edit. A
--; page lands here when the only thing it changes is a layer going BLANK. The
--; blink exists to hide a CUT between two pictures; when the target is blank
--; there is nothing to hide and it reads as a black flash over a disappearance.
--; That is what made Ken blink between "keep this, if you lose again" and
--; "this will remind you".
--;
--; A blank shot is still CUED - the layer really does clear, and for Bison that
--; is a story beat (his layer empties on "Ryu made it! He destroyed Bison").
--; Only the transition is suppressed.
function sfazEndingNoFlash(entry, n)
	if type(entry) ~= 'table' or type(entry.noflash) ~= 'table' then
		return false
	end
	for _, v in ipairs(entry.noflash) do
		if v == n then
			return true
		end
	end
	return false
end

--; True if page n must play the black transition even though no CUE moves on it.
--;
--; The mod starts the transition when a cue CHANGES. A scene change made by an
--; ELEMENT - an explod the .cns gates on sfaz_end_page - is invisible to it, so
--; the picture cuts with no blink. Cammy's page 12 is the clear case: the
--; helicopter leaves on page 11 and London simply pops in over it on 12.
--;
--; Opt-in per page from data/endings/scripts/<CHAR>.lua, because whether an
--; element change WANTS a blink is a judgement about the art - clearing a small
--; overlay does not. The mirror image of noflash above.
function sfazEndingFlash(entry, n)
	if type(entry) ~= 'table' or type(entry.flash) ~= 'table' then
		return false
	end
	for _, v in ipairs(entry.flash) do
		if v == n then
			return true
		end
	end
	return false
end

function sfazEndingPic(entry, n)
	return sfazEndingCue(entry, 1, n)
end

function sfazEndingBg(entry, n)
	return sfazEndingCue(entry, 2, n)
end
