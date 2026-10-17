--;===========================================================
--; CHARACTER INTRO TEXTS
--;
--; Every character intro's story text lives here, and nowhere else. The .def
--; files carry only the LAYOUT (where the box is, which font, how fast it
--; types); this file carries the words.
--;
--; HOW TO WRITE ONE
--;
--;   ['Intro_Adon'] = {
--;       "First chunk. Two or three sentences, whatever fits the box.",
--;       "Second chunk, shown after the player presses a button.",
--;       "Third chunk.",
--;   },
--;
--; The key is the .def FILENAME without its extension, case-insensitive:
--; data/Intros/Intro_Adon.def  ->  ['Intro_Adon'].
--;
--; Each string is one CHUNK - one screenful. They are shown one at a time, in
--; order, and the player moves through them with the skip button:
--;
--;   press once   finish typing the chunk that is currently appearing
--;   press again  move on to the next chunk
--;   last chunk   one more press ends the scene
--;
--; So chunk length does not have to be timed by hand. Write as many or as few
--; as the character needs - up to SLOTS (see sfaz_intro_text.lua). A character
--; with no entry here simply shows no text, exactly as before.
--;
--; LINE BREAKS are automatic: the layer's textwindow wraps the text. Use \n
--; only where you want a deliberate break.
--;
--; QUOTES inside the text need escaping: "he said \"no\"".
--;===========================================================

sfazIntroTexts = {

	--; DEMO - placeholder wording, not real lore. Replace it. Deleting the whole
	--; entry turns Adon's intro text off again.
	['Intro_Adon'] = {
	     "Adon, Sagat's former student, is a ferocious fighter in the field.",
		 "He has recently decided to attend the World Warrior Tournament.",
		 "He wants to test his skills and prove his worth.",
		 "This is a perfect chance to stop staying under Sagat's shadow.",
	},


	['Intro_Akuma'] = {
	     "Akuma... The Raging Demon... The supreme master of the fist.",
		 "This lone warrior has mastered the evil force, Satsui no Hadou.",
		 "He seeks for challengers with enough potential to kill.",
		 "He desires to battle them without mercy.",
	 },

	['Intro_Balrog'] = {
	     "Balrog is M. Bison's number-one henchman.",
		 "He has orders to guard The Doll Soldiers Project HQ.",
		 "Amazed by the dolls' superpowers, he starts questioning...",
		 "...his duty and loyalty to M. Bison.",
	 },

	['Intro_Birdie'] = {
	     "Birdie is a low riding thug who wants to join Shadaloo.",
		 "He has decided to find its secret base to prove his worth.",
		 "He could become a mere henchman or maybe even more.",
		 "",
	 },

	['Intro_Bison'] = {
	     "M. Bison is the leader of the secret organization 'Shadaloo'.",
		 "His psycho power is about to exceed his body's limits.",
		 "To push the power further he needs a new host body.",
		 "Having seen Ryu's power, he got obsessed with capturing him.",
	 },

	['Intro_Blanka'] = {
	     "Jimmy lived as he pleased, deep within the jungle of the Amazon.",
		 "Once, he saved the life of Dan, and they have become friends.",
		 "One day he unwittingly hitched a ride on a grocer's truck.",
		 "Curious and excited, Blanka now ventures into the outside world.",
	 },

	['Intro_Cammy'] = {
	     "Cammy manages to set herself free out of M. Bison's control.",
		 "She blames herself for having taken lives while serving M. Bison.",
		 "Now, she is looking for answers and remember what she has done.",
		 "She starts seeking M. Bison, not knowing what lies ahead.",
	 },

	['Intro_Charlie'] = {
	     "Charlie is a First Lieutenant of the American Air Force.",
		 "His inquiries of drug activity all pointed back to Shadaloo.",
		 "He gathered his comrades to form a strike team.",
		 "He aims to end the corruption and punish the man responsible.",
	 },

	['Intro_Chun_X'] = {
	     "As an I-COP agent, Chun-li has been assigned to a new case.",
		 "Her father, who used to work on the case, has gone missing.",
		 "All clues have led her to an organization, called Shadaloo.",
		 "She hopes to find her father before it is too late.",
	 },

	['Intro_Chun_Z'] = {
	     "As an I-COP agent, Chun-li has been assigned to a new case.",
		 "Her father, who used to work on the case, has gone missing.",
		 "All clues have led her to an organization, called Shadaloo.",
		 "She hopes to find her father before it is too late.",
	 },

	['Intro_Cody-X'] = {
	     "Cody used to be a hero famous for saving Metro City.",
		 "Bored with the peaceful life, he kept fighting day and night.",
		 "He ended up in jail due to the havoc he created.",
		 "Breaking out of prison, he seeks new things that could satisfy him.",
	 },

	['Intro_Cody-Z'] = {
	     "Cody used to be a hero famous for saving Metro City.",
		 "Bored with the peaceful life, he kept fighting day and night.",
		 "He ended up in jail due to the havoc he created.",
		 "Breaking out of prison, he seeks new things that could satisfy him.",
	 },

	['Intro_D-Sakura'] = {
	     "Sakura has finally convinced Ryu to acommpany him on a trip.",
		 "She will practice with Ryu while having some vacation.",
		 "Training under the sun, she starts to feel a strange power.",
		 "She decides to revisit her rivals to test her new moves.",
	 },

	['Intro_DJ'] = {
	     "Dee Jay, the Southern Comet is a kickboxer who fights to the beat.",
		 "This cheerful fighter quickly rose to become a world champion.",
		 "To rise to the top, he pounds the world, looking for challengers.",
		 "",
	 },

	['Intro_Dan'] = {
	     "Years ago Dan Hibiki's father was killed by Sagat during a combat.",
		 "Dan trained Shotokan, but was expelled bacuse of his obduracy.",
		 "One day he heard that Sagat was attending a tournament.",
		 "Despite his lack of training he signed up to avenge his father.",
	
	 },

	['Intro_Dhalsim'] = {
	     "Dhalsim, the yoga master, fights for his family and the poor.",
		 "The increasingly evil energy has forced him to decide...",
		 "...that one day he will renounce the root of his power.",
		 "He hopes he can act in time.",
	 },
	 
	['Intro_Eagle'] = {
	     "As the No.1 bouncer in the UK, Eagle is a master stick fighter.",
		 "He loves the excitement that comes from a tough battle.",
		 "And so, Eagle decides to travel the world...",
		 "",
	 },

	['Intro_E-Ryu'] = {
	     "The Satsui no Hadou power in Ryu threatens to overcome his being.",
		 "This invasive art is too powerful to resist.",
		 "Ryu agonizes, knowing that he can no longer control himself.",
	 },

	['Intro_FeiLong'] = {
	     "Fei Long is a youthful talented action star from Hong Kong.",
		 "He is the master of his own unique style of Kung Fu.",
		 "Although he has landed minor roles, a few consider his talents.",
		 "Being peniless, he seeks a good street fight to hone his skills.",
	 },

	['Intro_GenX'] = {
	     "Gen is a wily assassin who uses legendary fighting techniques.",
		 "He keeps doing bloody battles even though he is ill.",
		 "What he desires now more than anything is a death match.",
		 "He searches for a worthy foe who could actually kill him.",
	 },

	['Intro_GenZ'] = {
	     "Gen is a wily assassin who uses legendary fighting techniques.",
		 "He keeps doing bloody battles even though he is ill.",
		 "What he desires now more than anything is a death match.",
		 "He searches for a worthy foe who could actually kill him.",
	 },

	['Intro_Guile'] = {
	     "Guile, an ace air force pilot, received an order one day.",
		 "'COMMANDER CHARLIE IS MISSING. FIND HIM AND BRING HIM BACK.'",
		 "In the hard rain, Guile rushes to the heliport...",
		 "...not knowing the hardships that await him.",
	 },

	['Intro_Guy'] = {
	     "Guy is a ninja from Metro City, where he is known as a hero.",
		 "His combat style, Bushin, has been used by Master Zeku.",
		 "For Guy, the tournaments mean nothing.",
		 "His dream is to become the 39th master of the Bushin style.",
	 },

	['Intro_Honda'] = {
	     "Edmond Honda is the strongest Sumo Grandmaster, or 'Rikishi'.",
		 "He is so powerful that no other Rikishi can compete with him.",
		 "He is encouraged to find worthy rivals and test his Sumo power.",
	 },

	['Intro_Juli'] = {
	     "Enhanced soldiers are created by Shadaloo's demonic tecnhology.",
		 "Juli, one of these soldiers, receives an order from Bison.",
		 "'Find and destroy the enhanced soldier named Cammy!'",
	 },

	['Intro_Juni'] = {
	     "Enhanced soldiers are created by Shadaloo's demonic tecnhology.",
		 "Juni, one of these soldiers, receives an order from Bison.",
		 "'Pursue a warrior named Ryu and collect his data sample.'",
	 },

	['Intro_KBee'] = {
	     "Cammy was captured and brainwashed during her strike on Shadaloo.",
		 "As a product of biotech, she now works as M. Bison's assassin.",
		 "Her orders are now to destroy all strong fighters she faces...",
		 "...and help M. Bison form new alliances.",
	 },

	 ['Intro_Karin'] = {
		 "Karin is the only daughter of the famous businessman, Mr. Kanzuki.",
		 "Her life has been an escalation of unstoppable triumphs.",
		 "Yet one day, a young woman managed to beat her in a battle.",
		 "Now her only goal is to find her and challenge her once more.",
	 },

	 ['Intro_Ken'] = {
	     "Ken Masters, Ryu's eternal rival.",
		 "His title of 'US Martial Arts Champion' proves his strength.",
		 "Yet his mind has become unsound. His friend's focus urges him.",
		 "He wants to discover his potential just beyond his fist.",
	 },

	['Intro_Mika'] = {
	     "Mika is making her debut as a pro wrestler.",
		 "She thought of the perfect promo that will make her a star.",
		 "She makes her first step to fight famous street fighters...",
		 "...and become the 'Star of the Ring'.",
	 },

	['Intro_Mike'] = {
	     "Mike is a heawyweight boxer known with his aggressive attitude.",
		 "Being bankrupt, he has begun to compete in undergorund leagues.",
		 "Armed with the world's strongest punches, his ambition continues.",
		 "",
	 },

	['Intro_N-Bison'] = {
	     "M. Bison is the leader of the secret organization 'Shadaloo'.",
		 "His psycho power is about to exceed his body's limits.",
		 "To push the power further he needs a new host body.",
		 "Having seen Ryu's power, he got obsessed with capturing him.",
	 },

	['Intro_R-Charlie'] = {
	     "Charlie was pushed off of the cliff by M. Bison in Venezuella.",
		 "His dead body was found by a mysterious cult, Illuminati.",
		 "Their advanced technology has brought Charlie back.",
		 "He is recruiting back his team and destroy M. Bison for good.",
	 },

	['Intro_Rolento'] = {
	     "Rolento, a twisted patriot, aims to found his own utopian nation.",
		 "After the disband of the Mad Gear Gang, he began to wander.",
		 "He is hoping to find new like-minded allies.",
	 },

	['Intro_Rose'] = {
	     "Member of a secret cult, Rose has mastered the art of soul power.",
		 "Recently, she has forseen that a big catastrophe is near...",
		 "...from the hands of M. Bison who shares the same powers with her.",
		 "She aims to destroy M.Bison at the cost of her life.",
	 },

	['Intro_Ryu'] = {
	     "Ryu is a man following the path to become a true martial artist.",
		 "With Ken he has trained Shotokan  style under Master Gouken.",
		 "Fighting is his purpose, but he queries if he has a greater destiny.",
		 "He decides to set off to find answers to his questions.",
	 },

	['Intro_Sagat'] = {
	     "Known as the Emperor of Muay Thai, Sagat has made a name.",
		 "The scar upon his chest serves as a reminder of his defeat to Ryu.",
		 "He has been fighting for vengeance alone ever since.",
		 "But he has begun to realize that the power of hatred is limited.",
	 },

	['Intro_Sakura'] = {
	     "Sakura Kasugano is a young girl who is fascinated by fighting.",
		 "'What is a street fighter?' She asked herself one day.",
		 "I want to see Ryu, and fight him! I want to hear his answer!",
		 "She is ready to face new opponents and reunions.",
	 },

	['Intro_ShinAkuma'] = {
	     "Shin Akuma... The Raging Demon... The supreme master of the fist.",
		 "He has mastered the ultimate for of the evil force, Satsui no Hadou.",
		 "He seeks for challengers with enough potential to kill.",
		 "He desires to battle them without mercy.",
	 },

	['Intro_Sodom_X'] = {
	     "Sodom, an admirer of Japanese culture, counts himself as one.",
		 "He has lost his purpose when his gang has been destroyed.",
		 "Not long ago, he regained motivation to form a new gang.",
		 "He is looking for nre fighters that could join his cause.",
	 },

	['Intro_Sodom_Z'] = {
	     "Sodom, an admirer of Japanese culture, counts himself as one.",
		 "He has lost his purpose when his gang has been destroyed.",
		 "Not long ago, he regained motivation to form a new gang.",
		 "He is looking for nre fighters that could join his cause.",
	 },

	['Intro_T-Hawk'] = {
	     "T. Hawk is the greatest warrior of the proud Thunderfoot tribe.",
		 "Recently many villagers have disappeared mysteriously.",
		 "Sensing something odd, he leaves his village to save his people.",
	 },

	['Intro_U-Sagat'] = {
	     "Known as the Emperor of Muay Thai, Sagat has made a name.",
		 "The strength of his blows have helped him to earn his title.",
		 "His left eye was scarred by Go Hibiki during a fight.",
		 "With the tournament ahead, he aims to preserve his superiority.",
	 },

	['Intro_V-Ken'] = {
	     "After M. Bison fails to control Ryu, he comes up with a new plan.",
		 "He aims to grab Ryu's attention by injecting Ken the psycho power.",
		 "Ken becomes unable to fight the psycho power, becoming violent.",
	 },

	['Intro_Vega'] = {
	     "Vega is a masked noble with blood red eyes of insanity.",
		 "This Spanish Ninja is known with his obsession to beauty.",
		 "Growing sick of cage fights he starts seeking for new opponents.",
		 "His life starts changing as he receives a mysterious invitation.",
	 },

	['Intro_Zangief'] = {
	     "Zangief, is a national hero in mother Russia.",
		 "His victories has brought him the name, the Red Cyclone.",
		 "He has been commissioned to fight against world champions...",
		 "...and show everyone the true power of his nation.",
	 },

}

--; Nothing below this line needs editing.
--; The lookup is case-insensitive so 'intro_adon' and 'Intro_Adon' both work.
function sfazIntroTextsFor(defName)
	if type(defName) ~= 'string' or sfazIntroTexts == nil then
		return nil
	end
	local want = defName:lower()
	for k, v in pairs(sfazIntroTexts) do
		if type(k) == 'string' and k:lower() == want and type(v) == 'table' then
			return v
		end
	end
	return nil
end
