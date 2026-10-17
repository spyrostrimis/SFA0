--;===========================================================
--; STAGE MAP MARKER POSITIONS  (GENERATED - see the note below)
--;
--; Where action 5801 - the animated "you are here" mark - is drawn on the
--; victory screen, per stage. One entry per stage, keyed by its def path in
--; lower case, value {x, y}.
--;
--; WHERE THE NUMBERS COME FROM
--;
--; Each stage's own sprite 5800,0 is the map, 384x224 with axis 0,0, drawn at
--; [SFAZ Victory Stage] offset. A single pixel of EXACTLY rgb(224,0,0) was
--; painted on each map to mark the spot, and these are those pixels' x,y in
--; sprite space - which is screen space too, because the sprite is the size of
--; the motif localcoord and its axis is its top-left corner.
--;
--; The marker had to be told apart from the stage-name text, which is drawn in
--; the SAME 224,0,0 - the test is that the marker is a single pixel with no
--; 8-neighbour of that colour, where every text pixel belongs to a glyph-sized
--; cluster. As a cross-check the text alone is 500 pixels in the Alpha maps and
--; a marked stage has 501.
--;
--; TO REGENERATE after painting a marker on a new map: the reader and scanner
--; live in the session scratchpad (sffread.py / stagemaps.py). They decode SFF
--; v1 (PCX+RLE) and v2 (RLE8) the same way src/image.go does. Or just add the
--; line by hand - x,y read off the sprite in any editor is exactly what goes
--; here.
--;
--; A stage with no entry simply gets no mark; the map still shows.
--;===========================================================

return {
['stages/adon.def'] = {126, 91},
	['stages/adon2.def'] = {127, 91},
	['stages/africa.def'] = {161, 153},
	['stages/balrog.def'] = {170, 80},
	['stages/birdie.def'] = {150, 66},
	['stages/birdie2.def'] = {181, 57},
	['stages/blanka.def'] = {238, 121},
	['stages/buddhaevening.def'] = {152, 101},
	['stages/buddhanight.def'] = {152, 100},
	['stages/charlie.def'] = {212, 70},
	['stages/charlie2.def'] = {231, 58},
	['stages/chunli.def'] = {162, 77},
	['stages/chunli2.def'] = {167, 75},
	['stages/chunli3.def'] = {157, 67},
	['stages/cody-x.def'] = {217, 98},
	['stages/cody-z.def'] = {156, 76},
	['stages/dan.def'] = {265, 43},
	['stages/dan2.def'] = {263, 37},
	['stages/dhalsim.def'] = {233, 130},
	['stages/dhalsim2.def'] = {230, 130},
	['stages/dj.def'] = {232, 96},
	['stages/feilong.def'] = {251, 33},
	['stages/gen.def'] = {173, 80},
	['stages/gen2.def'] = {263, 38},
	['stages/gokuento.def'] = {229, 74},
	['stages/guile.def'] = {175, 61},
	['stages/guy.def'] = {157, 75},
	['stages/guy2.def'] = {159, 76},
	['stages/honda.def'] = {220, 73},
	['stages/honda2.def'] = {218, 74},
	['stages/honda3.def'] = {218, 74},
	['stages/karin.def'] = {223, 80},
	['stages/karin2.def'] = {208, 55},
	['stages/ken.def'] = {153, 88},
	['stages/ken2.def'] = {165, 85},
	['stages/ken3.def'] = {183, 84},
	['stages/killerbee.def'] = {198, 87},
	['stages/killerbee2.def'] = {198, 87},
	['stages/london.def'] = {168, 69},
	['stages/mexico.def'] = {193, 92},
	['stages/mika.def'] = {219, 84},
	['stages/mike.def'] = {200, 59},
	['stages/onifangyellow.def'] = {225, 82},
	['stages/outbacks.def'] = {207, 153},
	['stages/rolento.def'] = {232, 70},
	['stages/rolento2.def'] = {238, 65},
	['stages/rose.def'] = {181, 81},
	['stages/rose2.def'] = {181, 82},
	['stages/rose3.def'] = {187, 87},
	['stages/ryu.def'] = {206, 79},
	['stages/ryu2.def'] = {206, 79},
	['stages/ryu3.def'] = {205, 82},
	['stages/sagat.def'] = {148, 100},
	['stages/sagat2.def'] = {145, 98},
	['stages/sakura.def'] = {213, 76},
	['stages/sakura2.def'] = {208, 55},
	['stages/sodom-x.def'] = {194, 85},
	['stages/sodom-z.def'] = {193, 84},
	['stages/vega.def'] = {163, 77},
	['stages/venezuela.def'] = {251, 101},
	['stages/vtol.def'] = {259, 123},
	['stages/zangief.def'] = {178, 94},
	['stages/zangief2.def'] = {198, 79},

	-- Boss variants. Same map sprite as the stage they are paired with
	-- (verified by comparing each def's spr= file), so they reuse its
	-- coordinates rather than being measured again.
	['stages/_boss-adon.def'] = {126, 91},
	['stages/_boss-adon2.def'] = {127, 91},
	['stages/_boss-africa.def'] = {161, 153},
	['stages/_boss-akuma2.def'] = {225, 82},
	['stages/_boss-balrog.def'] = {170, 80},
	['stages/_boss-birdie.def'] = {150, 66},
	['stages/_boss-birdie2.def'] = {181, 57},
	['stages/_boss-blanka.def'] = {238, 121},
	['stages/_boss-buddha.def'] = {152, 100},
	['stages/_boss-cammy.def'] = {168, 69},
	['stages/_boss-charlie.def'] = {212, 70},
	['stages/_boss-charlie2.def'] = {231, 58},
	['stages/_boss-chunli.def'] = {162, 77},
	['stages/_boss-chunli2.def'] = {167, 75},
	['stages/_boss-chunli3.def'] = {157, 67},
	['stages/_boss-cody-x.def'] = {217, 98},
	['stages/_boss-cody-z.def'] = {156, 76},
	['stages/_boss-dan.def'] = {265, 43},
	['stages/_boss-dan2.def'] = {263, 37},
	['stages/_boss-dhalsim.def'] = {233, 130},
	['stages/_boss-dhalsim2.def'] = {230, 130},
	['stages/_boss-gen.def'] = {173, 80},
	['stages/_boss-gen2.def'] = {263, 38},
	['stages/_boss-gokuento.def'] = {229, 74},
	['stages/_boss-guile.def'] = {175, 61},
	['stages/_boss-guy.def'] = {157, 75},
	['stages/_boss-guy2.def'] = {159, 76},
	['stages/_boss-honda.def'] = {220, 73},
	['stages/_boss-honda2.def'] = {218, 74},
	['stages/_boss-honda3.def'] = {218, 74},
	['stages/_boss-karin.def'] = {223, 80},
	['stages/_boss-karin2.def'] = {208, 55},
	['stages/_boss-ken.def'] = {153, 88},
	['stages/_boss-ken2.def'] = {165, 85},
	['stages/_boss-ken3.def'] = {183, 84},
	['stages/_boss-killerbee.def'] = {198, 87},
	['stages/_boss-mika.def'] = {219, 84},
	['stages/_boss-mike.def'] = {200, 59},
	['stages/_boss-outbacks.def'] = {207, 153},
	['stages/_boss-rolento.def'] = {232, 70},
	['stages/_boss-rolento2.def'] = {238, 65},
	['stages/_boss-rose.def'] = {181, 81},
	['stages/_boss-rose2.def'] = {181, 82},
	['stages/_boss-ryu.def'] = {206, 79},
	['stages/_boss-ryu2.def'] = {206, 79},
	['stages/_boss-ryu3.def'] = {205, 82},
	['stages/_boss-sagat.def'] = {148, 100},
	['stages/_boss-sagat2.def'] = {145, 98},
	['stages/_boss-sakura.def'] = {213, 76},
	['stages/_boss-sakura2.def'] = {208, 55},
	['stages/_boss-sodom-x.def'] = {194, 85},
	['stages/_boss-sodom-z.def'] = {193, 84},
	['stages/_boss-vega.def'] = {163, 77},
	['stages/_boss-venezuela.def'] = {251, 101},
	['stages/_boss-vtol.def'] = {259, 123},
	['stages/_boss-zangief.def'] = {178, 94},
	['stages/_boss-zangief2.def'] = {198, 79},
}
