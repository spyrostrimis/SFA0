# What can be removed from `nightly_new` - tested

Two independent passes, then a live test.

1. **Static reachability.** Starting from the engine's real entry points
   (`Ikemen_GO_NEWBUILD.exe`, `save/config.ini`, and the built-in
   `data/system.base.def` / `data/fight.base.def` fallbacks), every file
   reference was followed transitively - motif -> select.def -> character defs ->
   sprites/sounds/palettes/arcadepath, stage defs -> backgrounds and BGM,
   storyboards, fonts, Lua `require`/`dofile` and quoted paths, plus the
   directory scans `main.lua` and `options.lua` do over `external/mods` and
   `external/shaders`. 1595 of 2256 files were reached.

2. **Loader trace.** NTFS last-access timestamps were snapshotted, the game was
   launched, and the tree re-stat'ed. That showed which of the 119 DLLs in
   `lib/` the process actually opens: **ten**.

3. **The live test.** Everything below in tiers 1-3 - **617 files, 1169 MB** -
   was moved out of the tree, the game was launched with stdout and stderr
   captured, and it booted, played the intro storyboard, loaded all 19 mods,
   parsed every character and stage, and reached the title screen with **zero**
   file-loading errors. Then every file was moved back and the tree verified
   byte-for-byte (1997 MB, 119 DLLs, 55 fonts, `git status` unchanged).

That test is what caught the one mistake the static pass made: `data/system.base.def`
is the fallback motif the engine merges under your `system.def`, and it names
`Open_Sans.def`, `default-3x5.def` and `f-6x9.def`. The first run failed to load
those three fonts. They are excluded below and the run was repeated clean.

**Coverage limit, stated plainly.** The live test covers boot, the intro
storyboard, the title screen, and the full character/stage preload. It does
**not** cover an actual match, an ending, the options menus or world tour - SDL
ignores injected keystrokes, so the game could not be driven further without you
at the keyboard. Tiers 1 and 2 are safe regardless. For tier 3, the evidence is
static reachability plus a clean boot, which is strong but not a played match.
Delete tier 3 with a backup, or hand this list back to me after you play through
a match and an ending and I will re-run the trace against that session.

---

## Totals

| Tier | What | Size |
|---|---|---|
| 1 | not part of the game at all | **127.8 MB** |
| 2 | unused native libraries | **169.5 MB** |
| 3 | game assets nothing references | **41.7 MB** |
| 4 | development sources (remove from a release build, keep locally) | **1.7 MB** |
| | **Removable from a shipping build (1+2+3+4)** | **340.7 MB** |
| | Safe to delete outright today (1+2+3) | **339.0 MB** |

The build is 1997 MB. Tiers 1-3 take it to about 1658 MB.


---

## Tier 1 - not part of the game at all


### Backup / snapshot copies you made while working

255 files, **114.74 MB**

```
    24.909 MB  data/Storyboards/backup/02.08.2024_9.50.10_ös_/SFAZ_Intro.sff
    20.496 MB  Ikemen_GO_NEWBUILD.exe.bak-presurvivalnet
    14.728 MB  Ikemen_GO_NEWBUILD.exe.bak-preroom
    14.665 MB  Ikemen_GO_NEWBUILD.exe.bak-prebuild
    14.665 MB  Ikemen_GO_NEWBUILD.exe.bak-1924
     4.191 MB  chars/SFZ_Gen-X/SFZ_Gen.sff.bak
     4.190 MB  chars/SFZ_Gen-Z/SFZ_Gen.sff.bak
     0.219 MB  chars/SFZ_Vega/SFZ_Vega.cns.bak424
     0.207 MB  chars/SFZ_Vega/SFZ_Vega.cns.bak-prewinquote
     0.206 MB  chars/SFZ_Vega/SFZ_Vega.cns.bak-preending
     0.198 MB  chars/SFZ_Rose/System.cns.bak424
     0.197 MB  chars/SFZ_Zangief/SFZ_Zangief.cns.bak424
     0.196 MB  chars/SFZ_Blanka/SFZ_Blanka.cns.bak424
     0.187 MB  chars/SFZ_Rolento/SFZ_Rolento.cns.bak424
     0.186 MB  chars/SFZ_Zangief/SFZ_Zangief.cns.bak-prewinquote
     0.185 MB  chars/SFZ_Zangief/sfz_Zangief.cns.bak-preending
     0.185 MB  chars/SFZ_Blanka/SFZ_Blanka.cns.bak-prewinquote
     0.184 MB  chars/SFZ_Blanka/SFZ_Blanka.cns.bak-preending
     0.178 MB  chars/SFZ_Gen-X/SFZ_GenX.cns.bak424
     0.178 MB  chars/SFZ_Gen-X/SFZ_GenX.cns.bak-prewinquote
     0.177 MB  chars/SFZ_Gen-Z/SFZ_GenZ.cns.bak-prewinquote
     0.177 MB  chars/SFZ_Gen-Z/SFZ_GenZ.cns.bak-preending
     0.177 MB  chars/SFZ_Gen-X/SFZ_GenX.cns.bak-preending
     0.176 MB  chars/SFZ_Rolento/SFZ_Rolento.cns.bak-prewinquote
     0.175 MB  chars/SFZ_Rolento/SFZ_Rolento.cns.bak-preending
     0.174 MB  chars/SFZ_Sodom-Z/SFZ_Sodom_Z.cns.bak424
     0.174 MB  chars/SFZ_Sodom-X/SFZ_Sodom_X.cns.bak424
     0.174 MB  chars/SFZ_Cody-Z/SFZ_Cody.cns.bak424
     0.174 MB  chars/SFZ_Cody-Z/SFZ_Cody.cns.bak-prewinquote
     0.173 MB  chars/SFZ_Cody-Z/SFZ_Cody.cns.bak-preending
     0.170 MB  external/script/start.lua.bak-selectoutro
     0.169 MB  external/script/start.lua.bak-prestageorder
     0.166 MB  chars/SFZ_Cody-X/SFZ_Cody_X.cns.bak424
     0.166 MB  chars/SFZ_Cody-X/SFZ_Cody_X.cns.bak-prewinquote
     0.165 MB  chars/SFZ_Cody-X/SFZ_Cody_X.cns.bak-preending
     0.164 MB  chars/SFZ_Sodom-Z/SFZ_Sodom_Z.cns.bak-prewinquote
     0.164 MB  chars/SFZ_Sodom-X/SFZ_Sodom_X.cns.bak-prewinquote
     0.163 MB  chars/SFZ_Sodom-Z/SFZ_Sodom_Z.cns.bak-preending
     0.163 MB  chars/SFZ_Sodom-X/SFZ_Sodom_X.cns.bak-preending
     0.161 MB  chars/SFZ_Mike/SFZ_Mike.cns.bak424
     0.161 MB  chars/SFZ_E-Ryu/SFZ_E-Ryu.cns.bak424
     0.159 MB  chars/SFZ_V-Ken/SFZ_V-Ken.cns.bak424
     0.155 MB  chars/SFZ_FeiLong/SFZ_FeiLong.cns.bak424
     0.154 MB  chars/SFZ_N-Bison/SFZ_BisonII.cns.bak424
     0.152 MB  chars/SFZ_Mike/SFZ_Mike.cns.bak-prewinquote
     0.152 MB  chars/SFZ_E-Ryu/SFZ_E-Ryu.cns.bak-prewinquote
     0.152 MB  chars/SFZ_DJ/SFZ_DJ.cns.bak424
     0.151 MB  chars/SFZ_V-Ken/SFZ_V-Ken.cns.bak-prewinquote
     0.151 MB  chars/SFZ_Mike/SFZ_Mike.cns.bak-preending
     0.151 MB  chars/SFZ_E-Ryu/SFZ_E-Ryu.cns.bak-preending
     0.150 MB  chars/SFZ_V-Ken/SFZ_V-Ken.cns.bak-preending
     0.150 MB  chars/SFZ_Ken/SFZ_Ken.cns.bak424
     0.147 MB  chars/SFZ_Ryu/SFZ_Ryu.cns.bak424
     0.146 MB  chars/SFZ_N-Bison/SFZ_BisonII.cns.bak-prewinquote
     0.146 MB  chars/SFZ_FeiLong/SFZ_FeiLong.cns.bak-prewinquote
     0.145 MB  chars/SFZ_N-Bison/SFZ_BisonII.cns.bak-preending
     0.145 MB  chars/SFZ_Honda/SFZ_Honda.CNS.bak424
     0.145 MB  chars/SFZ_FeiLong/SFZ_FeiLong.cns.bak-preending
     0.143 MB  chars/SFZ_DJ/SFZ_DJ.cns.bak-prewinquote
     0.142 MB  chars/SFZ_Ken/SFZ_Ken.cns.bak-prewinquote
... and 195 more (full list in REMOVABLE_FILES_LIST.txt)
```

### Recorded replays

12 files, **11.30 MB**

```
     3.936 MB  save/replays/2026-09-05_00h53m14s.replay
     2.899 MB  save/replays/2026-08-15_15h10m03s.replay
     0.954 MB  save/replays/2026-08-15_00h46m03s.replay
     0.801 MB  save/replays/2026-08-15_00h50m58s.replay
     0.597 MB  save/replays/2026-08-15_00h43m19s.replay
     0.484 MB  save/replays/2026-08-15_15h24m24s.replay
     0.446 MB  save/replays/2026-09-05_01h11m48s.replay
     0.356 MB  save/replays/2026-09-05_01h14m09s.replay
     0.329 MB  save/replays/2026-09-05_00h49m41s.replay
     0.231 MB  save/replays/2026-08-15_00h04m58s.replay
     0.166 MB  save/replays/2026-08-15_00h07m54s.replay
     0.101 MB  save/replays/2026-08-15_00h41m38s.replay
```

### Debug logs the game wrote

53 files, **1.76 MB**

```
     1.230 MB  save/logs/sfaz_wrap_debug.txt
     0.164 MB  save/logs/sfaz_portrait_debug.txt
     0.138 MB  debug/loadStoryboard_SFAZ_Intro.txt
     0.058 MB  save/logs/sfaz_pje_probe.txt
     0.036 MB  debug/loadStoryboard_Logo.txt
     0.020 MB  debug/loadStoryboard_Start.txt
     0.017 MB  debug/t_trainingMenu.txt
     0.016 MB  save/logs/sfaz_osc.txt
     0.009 MB  save/logs/sfaz_winscreen_debug.txt
     0.009 MB  save/logs/sfaz_bgm_debug.txt
     0.007 MB  debug/t_menuMenu.txt
     0.005 MB  save/logs/sfaz_reach.txt
     0.004 MB  save/logs/sfaz_walk.txt
     0.004 MB  save/logs/hitdiag.txt
     0.003 MB  save/logs/Ikemen_2026-08-10_19-04-24.log
     0.002 MB  save/logs/sfaz_hyperlevel_debug.txt
     0.002 MB  save/logs/Ikemen_2026-08-13_10-27-33.log
     0.001 MB  save/logs/tgt.txt
     0.001 MB  save/logs/sfaz_defeated_debug.txt
     0.001 MB  save/logs/Ikemen_2026-09-02_09-59-36.log
     0.001 MB  save/logs/Ikemen_2026-08-29_19-11-23.log
     0.001 MB  save/logs/Ikemen_2026-08-28_18-54-13.log
     0.001 MB  save/logs/Ikemen_2026-08-25_20-55-27.log
     0.001 MB  save/logs/Ikemen_2026-08-24_20-54-34.log
     0.001 MB  save/logs/Ikemen_2026-08-24_20-11-22.log
     0.001 MB  save/logs/Ikemen_2026-08-24_20-10-32.log
     0.001 MB  save/logs/Ikemen_2026-08-23_20-26-46.log
     0.001 MB  save/logs/Ikemen_2026-08-21_17-00-03.log
     0.001 MB  save/logs/Ikemen_2026-08-20_21-40-40.log
     0.001 MB  save/logs/Ikemen_2026-08-19_23-47-16.log
     0.001 MB  save/logs/Ikemen_2026-08-19_23-45-39.log
     0.001 MB  save/logs/Ikemen_2026-08-19_23-21-51.log
     0.001 MB  save/logs/Ikemen_2026-08-17_01-14-20.log
     0.001 MB  save/logs/Ikemen_2026-08-15_23-57-20.log
     0.001 MB  save/logs/Ikemen_2026-08-15_20-38-06.log
     0.001 MB  save/logs/Ikemen_2026-08-15_20-37-28.log
     0.001 MB  save/logs/Ikemen_2026-08-15_20-20-08.log
     0.001 MB  save/logs/Ikemen_2026-08-15_15-52-06.log
     0.001 MB  save/logs/Ikemen_2026-08-15_15-51-20.log
     0.001 MB  save/logs/Ikemen_2026-08-15_13-06-51.log
     0.001 MB  save/logs/Ikemen_2026-08-14_22-44-03.log
     0.001 MB  save/logs/Ikemen_2026-08-10_18-34-01.log
     0.001 MB  save/logs/Ikemen_2026-08-09_23-28-01.log
     0.001 MB  save/logs/Ikemen_2026-08-09_23-02-15.log
     0.001 MB  save/logs/Ikemen_2026-08-09_22-38-33.log
     0.001 MB  save/logs/Ikemen_2026-08-09_22-38-02.log
     0.001 MB  save/logs/Ikemen_2026-08-09_22-35-59.log
     0.001 MB  save/logs/Ikemen_2026-08-09_17-26-26.log
     0.001 MB  save/logs/Ikemen_2026-08-09_17-12-55.log
     0.000 MB  save/sfaz_endingtest
     0.000 MB  save/sfaz_endinglog
     0.000 MB  save/logs/v.txt
     0.000 MB  save/logs/lay.txt
```

---

## Tier 2 - unused native libraries


### DLLs the process never loads

109 files, **169.52 MB**

```
    22.667 MB  lib/libx265-217.dll
    20.454 MB  lib/avcodec-62.dll
    11.756 MB  lib/librsvg-2-2.dll
    10.597 MB  lib/libshaderc_shared.dll
     9.424 MB  lib/libaom.dll
     7.573 MB  lib/libSvtAv1Enc-4.dll
     6.866 MB  lib/avfilter-11.dll
     6.219 MB  lib/libjxl.dll
     5.495 MB  lib/libcrypto-3-x64.dll
     4.696 MB  lib/libvpx-1.dll
     3.528 MB  lib/librav1e.dll
     3.417 MB  lib/libspirv-cross-c-shared.dll
     2.952 MB  lib/avformat-62.dll
     2.665 MB  lib/libstdc++-6.dll
     2.316 MB  lib/libgnutls-30.dll
     2.251 MB  lib/libunistring-5.dll
     2.120 MB  lib/swscale-9.dll
     2.027 MB  lib/libx264-165.dll
     1.931 MB  lib/libdav1d-7.dll
     1.914 MB  lib/libgio-2.0-0.dll
     1.595 MB  lib/libp11-kit-0.dll
     1.567 MB  lib/libglib-2.0-0.dll
     1.530 MB  lib/libharfbuzz-0.dll
     1.370 MB  lib/libdovi.dll
     1.303 MB  lib/avutil-60.dll
     1.248 MB  lib/libxml2-16.dll
     1.247 MB  lib/libcairo-2.dll
     1.237 MB  lib/libplacebo-360.dll
     1.218 MB  lib/libzstd.dll
     1.143 MB  lib/libiconv-2.dll
     0.968 MB  lib/libjpeg-8.dll
     0.895 MB  lib/ggml-base.dll
     0.854 MB  lib/libsrt.dll
     0.804 MB  lib/libLerc.dll
     0.791 MB  lib/libfreetype-6.dll
     0.788 MB  lib/libbrotlienc.dll
     0.781 MB  lib/xvidcore.dll
     0.750 MB  lib/libwebp-7.dll
     0.740 MB  lib/libpixman-1-0.dll
     0.718 MB  lib/libpcre2-8-0.dll
     0.697 MB  lib/vulkan-1.dll
     0.680 MB  lib/libgmp-10.dll
     0.637 MB  lib/libzimg-2.dll
     0.626 MB  lib/libssh.dll
     0.625 MB  lib/libtiff-6.dll
     0.580 MB  lib/libvorbisenc-2.dll
     0.533 MB  lib/libwhisper-1.dll
     0.519 MB  lib/libopenjp2-7.dll
     0.508 MB  lib/libfontconfig-1.dll
     0.500 MB  lib/libopus-0.dll
     0.481 MB  lib/libvpl-2.dll
     0.456 MB  lib/liblcms2-2.dll
     0.443 MB  lib/libzvbi-0.dll
     0.435 MB  lib/libpango-1.0-0.dll
     0.400 MB  lib/libmodplug-1.dll
     0.376 MB  lib/libgme.dll
     0.374 MB  lib/libbluray-3.dll
     0.362 MB  lib/libgdk_pixbuf-2.0-0.dll
     0.361 MB  lib/libnettle-9.dll
     0.359 MB  lib/libgobject-2.0-0.dll
... and 49 more (full list in REMOVABLE_FILES_LIST.txt)
```

---

## Tier 3 - game assets nothing references


### BGM no stage or screen names

8 files, **27.14 MB**

```
     7.205 MB  sound/training.mp3
     7.205 MB  sound/Screenpack/training.mp3
     5.154 MB  sound/Mexico.mp3
     4.084 MB  sound/Screenpack/Score2.wav
     3.095 MB  sound/Elena.mp3
     0.364 MB  sound/Screenpack/Over.wav
     0.028 MB  sound/sfz.mp3
     0.000 MB  sound/.keep
```

### Character files no def points at

104 files, **8.87 MB**

```
     1.994 MB  chars/SFZ_Eagle/SF_Eagle.sff
     1.431 MB  chars/SFZ_Sakura/SFZ_Sakura1.sff
     1.357 MB  chars/SFZ_Vega/SFZ_Vega_woclaw.sff
     1.325 MB  chars/SFZ_ChunLi-X/X-ISM/X-ISM.sff
     0.984 MB  chars/SFZ_Balrog/Mike.sff
     0.459 MB  chars/SFZ_Juni/end/juniend.sff
     0.131 MB  chars/SFZ_Akuma/SFZ_Akuma1.air
     0.087 MB  chars/SFZ_Guile/Guile/pl20_u_00004.wav
     0.079 MB  chars/SFZ_Ken/Pals/Ken-N.cns
     0.079 MB  chars/SFZ_Guile/Guile/pl20_u_00019.wav
     0.066 MB  chars/SFZ_Guile/Guile/pl20_u_00018.wav
     0.060 MB  chars/SFZ_Guile/Guile/pl20_u_00023.wav
     0.048 MB  chars/SFZ_Guile/Guile/pl20_u_00024.wav
     0.047 MB  chars/SFZ_Guile/Guile/pl20_u_00022.wav
     0.047 MB  chars/SFZ_Guile/Guile/pl20_u_00000.wav
     0.046 MB  chars/SFZ_Guile/Guile/pl20_u_00010.wav
     0.045 MB  chars/SFZ_Guile/Guile/pl20_u_00011.wav
     0.042 MB  chars/SFZ_Guile/Guile/pl20_u_00008.wav
     0.038 MB  chars/SFZ_Guile/Guile/pl20_u_00020.wav
     0.036 MB  chars/SFZ_Guile/Guile/pl20_u_00021.wav
     0.035 MB  chars/SFZ_Guile/Guile/pl20_u_00017.wav
     0.033 MB  chars/SFZ_Guile/Guile/pl20_u_00012.wav
     0.033 MB  chars/SFZ_Guile/Guile/pl20_u_00005.wav
     0.033 MB  chars/SFZ_Dan/SFZ_Dan1.cmd
     0.029 MB  chars/SFZ_Guile/Guile/pl20_u_00009.wav
     0.029 MB  chars/SFZ_Cody-X/Pals_X/Template.png
     0.027 MB  chars/SFZ_Guile/Guile/pl20_u_00026.wav
     0.024 MB  chars/SFZ_Guile/Guile/pl20_u_00007.wav
     0.020 MB  chars/SFZ_Guile/Guile/pl20_u_00003.wav
     0.018 MB  chars/SFZ_T-Hawk/common/easy.cmd
     0.018 MB  chars/SFZ_Guile/Guile/pl20_u_00025.wav
     0.016 MB  chars/SFZ_Guile/Guile/pl20_u_00016.wav
     0.014 MB  chars/SFZ_Guile/Guile/pl20_u_00015.wav
     0.013 MB  chars/SFZ_Guile/Guile/pl20_u_00006.wav
     0.013 MB  chars/SFZ_Guile/Guile/pl20_u_00002.wav
     0.012 MB  chars/SFZ_Guile/Guile/pl20_u_00013.wav
     0.011 MB  chars/SFZ_Guile/Guile/pl20_u_00001.wav
     0.010 MB  chars/SFZ_Guile/Guile/pl20_u_00014.wav
     0.009 MB  chars/SFZ_Ken/Pals/Ken-S.cns
     0.004 MB  chars/SFZ_Juni/end/juniend.def
     0.003 MB  chars/SFZ_T-Hawk/common/constant.cns
     0.001 MB  chars/SFZ_Zangief/ngf.act
     0.001 MB  chars/SFZ_Zangief/Pals/ColorSeparation.act
     0.001 MB  chars/SFZ_Vega/Pals/Espa_CS.act
     0.001 MB  chars/SFZ_Vega/Pals/Custom.act
     0.001 MB  chars/SFZ_T-Hawk/common/common/sprite.sff/palette/thawk9.act
     0.001 MB  chars/SFZ_T-Hawk/common/common/sprite.sff/palette/thawk8.act
     0.001 MB  chars/SFZ_T-Hawk/common/common/sprite.sff/palette/thawk7.act
     0.001 MB  chars/SFZ_T-Hawk/common/common/sprite.sff/palette/thawk6.act
     0.001 MB  chars/SFZ_T-Hawk/common/common/sprite.sff/palette/thawk5.act
     0.001 MB  chars/SFZ_T-Hawk/common/common/sprite.sff/palette/thawk4.act
     0.001 MB  chars/SFZ_T-Hawk/common/common/sprite.sff/palette/thawk3.act
     0.001 MB  chars/SFZ_T-Hawk/common/common/sprite.sff/palette/thawk2.act
     0.001 MB  chars/SFZ_T-Hawk/common/common/sprite.sff/palette/thawk12.act
     0.001 MB  chars/SFZ_T-Hawk/common/common/sprite.sff/palette/thawk11.act
     0.001 MB  chars/SFZ_T-Hawk/common/common/sprite.sff/palette/thawk10.act
     0.001 MB  chars/SFZ_T-Hawk/common/common/sprite.sff/palette/thawk.act
     0.001 MB  chars/SFZ_Ryu/SFZ_Ryu_CPU.def
     0.001 MB  chars/SFZ_Rose/Pals/projectile palettes_15150-1.act
     0.001 MB  chars/SFZ_Rose/Pals/projectile palettes_15150-0.act
... and 44 more (full list in REMOVABLE_FILES_LIST.txt)
```

### Spare window icons (config.ini names only 3 PNGs)

18 files, **1.70 MB**

```
     0.318 MB  external/icons/Ikemen_Cylia_V2.ico
     0.305 MB  external/icons/Ikemen_Cylia.ico
     0.214 MB  external/icons/3xhumed-Mega-Games-Pack-27-Street-Fighter-II-2.ico
     0.113 MB  external/icons/ico/sfaz_96.ico
     0.107 MB  external/icons/ico/sfaz_48.ico
     0.103 MB  external/icons/ico/sfaz_256.ico
     0.103 MB  external/icons/ico/sfaz_128.ico
     0.101 MB  external/icons/ico/sfaz_64.ico
     0.100 MB  external/icons/ico/sfaz_32.ico
     0.100 MB  external/icons/ico/sfaz_16.ico
     0.058 MB  external/icons/Ikemen_V2.ico
     0.057 MB  external/icons/Ikemen.ico
     0.006 MB  external/icons/icon-src/CyliaV2/ikemen_v2.svg
     0.005 MB  external/icons/sfaz_128.png
     0.005 MB  external/icons/icon-src/Cylia/ikemen.svg
     0.002 MB  external/icons/sfaz_64.png
     0.001 MB  external/icons/sfaz_32.png
     0.001 MB  external/icons/sfaz_16.png
```

### Fonts no motif or lifebar def names

36 files, **1.09 MB**

```
     0.102 MB  font/Open_Sans/OpenSans-Light.ttf
     0.102 MB  font/Open_Sans/OpenSans-ExtraBold.ttf
     0.101 MB  font/Open_Sans/OpenSans-SemiBold.ttf
     0.097 MB  font/Open_Sans/OpenSans-Regular2.ttf
     0.093 MB  font/Open_Sans/OpenSans-ExtraBoldItalic.ttf
     0.093 MB  font/Open_Sans/OpenSans-BoldItalic.ttf
     0.092 MB  font/Open_Sans/OpenSans-SemiBoldItalic.ttf
     0.092 MB  font/Open_Sans/OpenSans-LightItalic.ttf
     0.092 MB  font/Open_Sans/OpenSans-Italic.ttf
     0.068 MB  font/num72.sff
     0.042 MB  font/arcade.sff
     0.025 MB  font/Matchno.pcx
     0.014 MB  font/ending-2.sff
     0.012 MB  font/Open_Sans/LICENSE.txt
     0.008 MB  font/a2.pcx
     0.007 MB  font/font2.sff
     0.006 MB  font/a.pcx
     0.006 MB  font/Warning.fnt
     0.005 MB  font/default-3x5-bold.sff
     0.004 MB  font/name1.fnt
     0.004 MB  font/f-6x9f.fnt
     0.004 MB  font/f-6x9.fnt
     0.004 MB  font/f-6x8f.fnt
     0.003 MB  font/f-4x6.fnt
     0.003 MB  font/SFA2_TITLE1.FNT
     0.002 MB  font/num1.fnt
     0.001 MB  font/options.def
     0.001 MB  font/num72.def
     0.001 MB  font/mssansserif-tt36.def
     0.001 MB  font/msgothic-tt36.def
     0.001 MB  font/infofont.def
     0.001 MB  font/font2.def
     0.001 MB  font/ending-bg.def
     0.001 MB  font/default-3x5-bold.def
     0.001 MB  font/arcade.def
     0.001 MB  font/N-4X6.fnt
```

### Stage files no def points at

11 files, **1.07 MB**

```
     0.617 MB  stages/interactivestage/interactivestage.snd
     0.290 MB  stages/DJ2.sff
     0.096 MB  stages/Karin1.sff
     0.028 MB  stages/interactivestage.sff
     0.012 MB  stages/interactivestage/interactivestage.sff
     0.011 MB  stages/interactivestage.def
     0.010 MB  stages/interactivestage/interactivestage.zss
     0.004 MB  stages/DJ2.def
     0.001 MB  stages/interactivestage/interactivestagechar.def
     0.001 MB  stages/genreflection.def
     0.000 MB  stages/interactivestage/interactivestage.air
```

### data/ leftovers

28 files, **0.64 MB**

```
     0.226 MB  data/gofx/gofx.snd
     0.173 MB  data/gofx/gofx.sff
     0.060 MB  data/add004/a4b_common.zss
     0.032 MB  data/add004/system.def
     0.028 MB  data/select.sff
     0.028 MB  data/common1.cns.zss
     0.015 MB  data/add004/a4b_tagRun.zss
     0.012 MB  data/add004/zss_npp.xml
     0.012 MB  data/add004/common.const
     0.012 MB  data/Intros/Intro.def
     0.009 MB  data/player.lua
     0.005 MB  data/mugen.lua
     0.005 MB  data/add004/config.json
     0.005 MB  data/Intros/can.ffc
     0.004 MB  data/vector.lua
     0.004 MB  data/test.lua
     0.003 MB  data/indexed.frag
     0.002 MB  data/rgba.frag
     0.002 MB  data/gofx/gofx.air
     0.001 MB  data/maux.lua
     0.001 MB  data/init.lua
     0.001 MB  data/gofx1280.def
     0.001 MB  data/gofx/gofx.def
     0.001 MB  data/demo.zss
     0.000 MB  data/rgba.vert
     0.000 MB  data/indexed.vert
     0.000 MB  data/Intros/intros.cmd
     0.000 MB  data/Intros/intros.air
```

### Loose root files

6 files, **0.60 MB**

```
     0.585 MB  Street_Fighter_Alpha_Zero000.png
     0.008 MB  arcadepath/_template.lua
     0.005 MB  save/config.json
     0.002 MB  save/autolevel.save
     0.001 MB  save/AI_Rank.save
     0.000 MB  .gitignore
```

### Video no def or script names

2 files, **0.58 MB**

```
     0.579 MB  video/ik_logo.webm
     0.000 MB  video/.keep
```

### external/ leftovers

14 files, **0.04 MB**

```
     0.009 MB  external/shaders/HQ4x.frag.spv
     0.006 MB  external/shaders/HQ2x.frag.spv
     0.004 MB  external/shaders/HQ4x.vert.spv
     0.004 MB  external/shaders/HQ2x.vert.spv
     0.004 MB  external/mods/rank_DISABLED/rank.zss
     0.003 MB  external/shaders/HQ4x.frag
     0.002 MB  external/shaders/Scanline.frag.spv
     0.002 MB  external/shaders/HQ2x.frag
     0.001 MB  external/shaders/Scanline.vert.spv
     0.001 MB  external/shaders/Scanline.frag
     0.001 MB  external/shaders/HQ4x.vert
     0.001 MB  external/shaders/HQ2x.vert
     0.000 MB  external/shaders/Scanline.vert
     0.000 MB  external/mods/.keep
```

---

## Tier 4 - development sources (remove from a release build, keep locally)


### Notes and documentation - keep for development

29 files, **1.18 MB**

```
     0.555 MB  script go files.txt
     0.243 MB  SFAZ_SESSION_HANDOVER.md
     0.079 MB  UNUSED_ASSETS_CHARS.txt
     0.053 MB  UNUSED_ASSETS_REPORT.md
     0.050 MB  MIGRATION_NOTES.md
     0.044 MB  chars/SFZ_ChunLi-Z/04_SuperCombos_bckp.txt
     0.041 MB  REMOVABLE_FILES_LIST.txt
     0.029 MB  REMOVABLE_FILES_REPORT.md
     0.026 MB  data/endings/PORTRAITS_TODO.txt
     0.011 MB  SFAZ_BUILD_GUIDE.md
     0.007 MB  win icons.txt
     0.005 MB  UNUSED_ASSETS_STAGES.txt
     0.004 MB  data/add004/mm2_stateno.txt
     0.004 MB  chars/SFZ_Juni/ReadMe_J.txt
     0.004 MB  README.md
     0.003 MB  external/mods/rank_DISABLED/hitdiag-after-guard.txt
     0.003 MB  data/codex_from_GPT.md
     0.003 MB  chars/SFZ_Juni/ReadMe.txt
     0.003 MB  chars/SFZ_Juli/history.txt
     0.002 MB  chars/SFZ_Juli/juli.txt
     0.001 MB  external/mods/rank_DISABLED/targetdump.lua.txt
     0.001 MB  external/mods/rank_DISABLED/targetdump-sample.txt
     0.001 MB  external/mods/rank_DISABLED/hitdiag.lua.txt
     0.001 MB  external/mods/rank_DISABLED/hitdiag-sample.txt
     0.001 MB  external/mods/rank_DISABLED/birdie-projscanner-guard.txt
     0.001 MB  external/mods/rank_DISABLED/README.txt
     0.001 MB  data/add004/Install.txt
     0.001 MB  data/add004/HowToSetAssistEtc.txt
     0.000 MB  chars/SFZ_Juni/end/juniend.txt
```

### Authoring tools (python) - keep for development

40 files, **0.37 MB**

```
     0.036 MB  tools/endings/__pycache__/convert_char.cpython-313.pyc
     0.033 MB  tools/endings/convert_char.py
     0.027 MB  tools/endings/__pycache__/convert_cns.cpython-313.pyc
     0.026 MB  tools/endings/convert_cns.py
     0.015 MB  tools/endings/__pycache__/survey_endings.cpython-313.pyc
     0.014 MB  tools/endings/anim_segments.py
     0.014 MB  tools/endings/__pycache__/make_script.cpython-313.pyc
     0.013 MB  tools/endings/__pycache__/classify.cpython-313.pyc
     0.013 MB  tools/endings/__pycache__/anim_segments.cpython-313.pyc
     0.011 MB  tools/endings/make_script.py
     0.010 MB  tools/endings/survey_endings.py
     0.009 MB  tools/endings/sim_ending.lua
     0.009 MB  tools/endings/__pycache__/apply.cpython-313.pyc
     0.008 MB  tools/endings/classify.py
     0.008 MB  tools/endings/__pycache__/sync_cues.cpython-313.pyc
     0.008 MB  tools/endings/__pycache__/sff_extract.cpython-313.pyc
     0.008 MB  tools/endings/__pycache__/make_cue_anim.cpython-313.pyc
     0.008 MB  tools/endings/__pycache__/lint_lua_tables.cpython-313.pyc
     0.007 MB  tools/endings/make_cue_anim.py
     0.007 MB  tools/endings/__pycache__/insert_air.cpython-313.pyc
     0.007 MB  tools/endings/__pycache__/check_layers.cpython-313.pyc
     0.007 MB  tools/endings/README.md
     0.006 MB  tools/endings/sync_cues.py
     0.006 MB  tools/endings/lint_lua_tables.py
     0.006 MB  tools/endings/insert_air.py
     0.006 MB  tools/endings/apply.py
     0.005 MB  tools/endings/test_endings.lua
     0.005 MB  tools/endings/stack.py
     0.005 MB  tools/endings/shots_sheet.py
     0.005 MB  tools/endings/sff_extract.py
     0.005 MB  tools/endings/pagemap.py
     0.004 MB  tools/endings/verify.py
     0.004 MB  tools/endings/survey_fx.py
     0.003 MB  tools/endings/test_winquotes.lua
     0.003 MB  tools/endings/sheet.py
     0.003 MB  tools/endings/clean_generated.py
     0.003 MB  tools/endings/check_pages.py
     0.003 MB  tools/endings/check_layers.py
     0.002 MB  tools/endings/check_keys.py
     0.000 MB  tools/endings/sim_skipall.lua
```

### Ending timeline sources - keep for development

46 files, **0.11 MB**

```
     0.003 MB  data/endings/scripts/SFZ_Sodom-X.lua
     0.003 MB  data/endings/scripts/SFZ_Rose.lua
     0.003 MB  data/endings/scripts/SFZ_R-Charlie.lua
     0.003 MB  data/endings/scripts/SFZ_N-Bison.lua
     0.003 MB  data/endings/scripts/SFZ_Mike.lua
     0.003 MB  data/endings/scripts/SFZ_Honda.lua
     0.003 MB  data/endings/scripts/SFZ_Gen-Z.lua
     0.003 MB  data/endings/scripts/SFZ_Gen-X.lua
     0.003 MB  data/endings/scripts/SFZ_ChunLi-Z.lua
     0.003 MB  data/endings/scripts/SFZ_ChunLi-X.lua
     0.003 MB  data/endings/scripts/SFZ_Cammy.lua
     0.003 MB  data/endings/scripts/SFZ_Blanka.lua
     0.003 MB  data/endings/scripts/SFZ_Bison.lua
     0.003 MB  data/endings/scripts/SFZ_AkumaS.lua
     0.003 MB  data/endings/scripts/SFZ_Akuma.lua
     0.002 MB  data/endings/scripts/SFZ_Zangief.lua
     0.002 MB  data/endings/scripts/SFZ_Vega.lua
     0.002 MB  data/endings/scripts/SFZ_V-Ken.lua
     0.002 MB  data/endings/scripts/SFZ_U-Sagat.lua
     0.002 MB  data/endings/scripts/SFZ_T-Hawk.lua
     0.002 MB  data/endings/scripts/SFZ_Sodom-Z.lua
     0.002 MB  data/endings/scripts/SFZ_Sakura.lua
     0.002 MB  data/endings/scripts/SFZ_Sagat.lua
     0.002 MB  data/endings/scripts/SFZ_Ryu.lua
     0.002 MB  data/endings/scripts/SFZ_Rolento.lua
     0.002 MB  data/endings/scripts/SFZ_Mika.lua
     0.002 MB  data/endings/scripts/SFZ_Ken.lua
     0.002 MB  data/endings/scripts/SFZ_Kbee.lua
     0.002 MB  data/endings/scripts/SFZ_Karin.lua
     0.002 MB  data/endings/scripts/SFZ_Juni.lua
     0.002 MB  data/endings/scripts/SFZ_Juli.lua
     0.002 MB  data/endings/scripts/SFZ_Guy.lua
     0.002 MB  data/endings/scripts/SFZ_Guile.lua
     0.002 MB  data/endings/scripts/SFZ_FeiLong.lua
     0.002 MB  data/endings/scripts/SFZ_Eagle.lua
     0.002 MB  data/endings/scripts/SFZ_E-Ryu.lua
     0.002 MB  data/endings/scripts/SFZ_Dhalsim.lua
     0.002 MB  data/endings/scripts/SFZ_Dan.lua
     0.002 MB  data/endings/scripts/SFZ_DJ.lua
     0.002 MB  data/endings/scripts/SFZ_D-Sakura.lua
     0.002 MB  data/endings/scripts/SFZ_Cody-Z.lua
     0.002 MB  data/endings/scripts/SFZ_Cody-X.lua
     0.002 MB  data/endings/scripts/SFZ_Charlie.lua
     0.002 MB  data/endings/scripts/SFZ_Birdie.lua
     0.002 MB  data/endings/scripts/SFZ_Balrog.lua
     0.002 MB  data/endings/scripts/SFZ_Adon.lua
```

---

## The ten DLLs that must stay

```
SDL2.dll  avcodec-61.dll  avformat-61.dll  avutil-59.dll  avfilter-10.dll
avdevice-61.dll  swscale-8.dll  swresample-5.dll  libxmp.dll  libwinpthread-1.dll
```

`lib/` carries two whole generations of FFmpeg. The engine links the **61/59/8/10/5**
series; the **62/60/9/11** series and everything that exists only to support it
(`libx265`, `libaom`, `libSvtAv1Enc`, `librav1e`, `libvpx`, `libjxl`, `libdav1d`,
`librsvg`, `libcairo`, `libharfbuzz`, `libglib`, the GnuTLS/OpenSSL stack,
`libshaderc`, `ggml-*`) is never opened. That is MSYS2 `bin` overspill from
whatever built the exe, not a dependency of it.

## Not in any list above, worth knowing

* `data/common.snd` is 385.91 MB, of which 375 MB is 34 uncompressed PCM ending
  themes. All are referenced, so none is removable - but resampling them to
  22050 Hz mono in place cuts that to about 94 MB with no script changes. That is
  the single biggest remaining lever and it is bigger than tier 3.
* `save/config.ini`, `save/stats.json`, `external/mods/*.lua`,
  `external/shaders/*` and `data/endings/scripts/*` were deliberately protected
  during the test. The mods and shaders are picked up by directory scans, so a
  file being unreferenced there does not mean it is unused.
