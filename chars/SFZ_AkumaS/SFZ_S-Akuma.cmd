;=====================================================================
;-| AI section |------------------------------------------------------
;---------------------------------------------------------------------
[Command]
name = "AI_1"
command = a,a,a,a
time = 0
[Command]
name = "AI_2"
command = a,a,a,b
time = 0
[Command]
name = "AI_3"
command = a,a,a,c
time = 0
[Command]
name = "AI_4"
command = a,a,b,a
time = 0
[Command]
name = "AI_5"
command = a,a,b,b
time = 0
[Command]
name = "AI_6"
command = a,a,b,c
time = 0
[Command]
name = "AI_7"
command = a,a,c,a
time = 0
[Command]
name = "AI_8"
command = a,a,c,b
time = 0
[Command]
name = "AI_9"
command = a,a,c,c
time = 0
[Command]
name = "AI_10"
command = a,b,a,a
time = 0
[Command]
name = "AI_11"
command = a,b,a,b
time = 0
[Command]
name = "AI_12"
command = a,b,a,c
time = 0
[Command]
name = "AI_13"
command = a,b,b,a
time = 0
[Command]
name = "AI_14"
command = a,b,b,b
time = 0
[Command]
name = "AI_15"
command = a,b,b,c
time = 0
[Command]
name = "AI_16"
command = a,b,c,a
time = 0
[Command]
name = "AI_17"
command = a,b,c,b
time = 0
[Command]
name = "AI_18"
command = a,b,c,c
time = 0
[Command]
name = "AI_19"
command = a,c,a,a
time = 0
[Command]
name = "AI_20"
command = a,c,a,b
time = 0
[Command]
name = "AI_21"
command = a,c,a,c
time = 0
[Command]
name = "AI_22"
command = a,c,b,a
time = 0
[Command]
name = "AI_23"
command = a,c,b,b
time = 0
[Command]
name = "AI_24"
command = a,b,b,c
time = 0
[Command]
name = "AI_25"
command = a,c,c,a
time = 0
[Command]
name = "AI_26"
command = a,c,c,b
time = 0
[Command]
name = "AI_27"
command = a,c,c,c
time = 0
[Command]
name = "AI_28"
command = b,a,a,a
time = 0
[Command]
name = "AI_29"
command = b,a,a,b
time = 0
[Command]
name = "AI_30"
command = b,a,a,c
time = 0
[Command]
name = "AI_31"
command = b,a,b,a
time = 0
[Command]
name = "AI_32"
command = b,a,b,b
time = 0
[Command]
name = "AI_33"
command = b,a,b,c
time = 0
[Command]
name = "AI_34"
command = b,a,c,a
time = 0
[Command]
name = "AI_35"
command = b,a,c,b
time = 0
[Command]
name = "AI_36"
command = b,a,c,c
time = 0
[Command]
name = "AI_37"
command = b,b,a,a
time = 0
[Command]
name = "AI_38"
command = b,b,a,b
time = 0
[Command]
name = "AI_39"
command = b,b,a,c
time = 0
[Command]
name = "AI_40"
command = b,b,b,a
time = 0
[Command]
name = "AI_41"
command = b,b,b,b
time = 0
[Command]
name = "AI_42"
command = b,b,b,c
time = 0
[Command]
name = "AI_43"
command = b,b,c,a
time = 0
[Command]
name = "AI_44"
command = b,b,c,b
time = 0
[Command]
name = "AI_45"
command = b,b,c,c
time = 0
[Command]
name = "AI_46"
command = b,c,a,a
time = 0
[Command]
name = "AI_47"
command = b,c,a,b
time = 0
[Command]
name = "AI_48"
command = b,c,a,c
time = 0
[Command]
name = "AI_49"
command = b,c,b,a
time = 0
[Command]
name = "AI_50"
command = b,c,b,b
time = 0
;-----------

;=====================================================================
;-| Super Motions |---------------------------------------------------
;---------------------------------------------------------------------
; Misogi
[Command]
name = "msg"
command = ~F,DF,DB,B,F,DF,DB,B,a
time = 40
[Command]
name = "msg"
command = ~F,DF,DB,B,F,DF,DB,B,b
time = 40
[Command]
name = "msg"
command = ~F,DF,DB,B,F,DF,DB,B,c
time = 40

; Kongo Kokuretsuzan
[Command]
name = "konko"
command = ~B,DB,DF,B,DB,DF,F,x
time = 35
[Command]
name = "konko"
command = ~B,DB,DF,B,DB,DF,F,y
time = 35
[Command]
name = "konko"
command = ~B,DB,DF,B,DB,DF,F,z
time = 35

; Shun Goku Satsu
[Command]
name = "sgs"
command = ~x, x, F, a, z
time = 30

; Messatsu Gou Rausen
[Command]
name = "mgr3"
command = ~D,DB,B,D,DB,B,c
time = 40
[Command]
name = "mgr2"
command = ~D,DB,B,D,DB,B,b
time = 40
[Command]
name = "mgr2"
command = ~D,DB,B,D,DB,B,c
time = 40
[Command]
name = "mgr1"
command = ~D,DB,B,D,DB,B,a
time = 40
[Command]
name = "mgr1"
command = ~D,DB,B,D,DB,B,b
time = 40
[Command]
name = "mgr1"
command = ~D,DB,B,D,DB,B,c
time = 40

; Tenma Gou Zankuu
[Command]
name = "tgz_c"
command = ~D,DF,F,D,DF,F,z
time = 25
[Command]
name = "tgz_b"
command = ~D,DF,F,D,DF,F,y
time = 25
[Command]
name = "tgz_b"
command = ~D,DF,F,D,DF,F,z
time = 25
[Command]
name = "tgz_a"
command = ~D,DF,F,D,DF,F,x
time = 25
[Command]
name = "tgz_a"
command = ~D,DF,F,D,DF,F,y
time = 25
[Command]
name = "tgz_a"
command = ~D,DF,F,D,DF,F,z
time = 25

; Messatsu Gou Shouryuu
[Command]
name = "mgs_z"
command = ~D,DF,F,D,DF,F,z
time = 25
[Command]
name = "mgs_y"
command = ~D,DF,F,D,DF,F,y
time = 25
[Command]
name = "mgs_y"
command = ~D,DF,F,D,DF,F,z
time = 25
[Command]
name = "mgs_x"
command = ~D,DF,F,D,DF,F,x
time = 25
[Command]
name = "mgs_x"
command = ~D,DF,F,D,DF,F,y
time = 25
[Command]
name = "mgs_x"
command = ~D,DF,F,D,DF,F,z
time = 25

; Messatsu Gou Hadou
[Command]
name = "mgh_c"
command = ~F,DF,DB,B,F,DF,DB,B,z
time = 40
[Command]
name = "mgh_b"
command = ~F,DF,DB,B,F,DF,DB,B,y
time = 40
[Command]
name = "mgh_b"
command = ~F,DF,DB,B,F,DF,DB,B,z
time = 40
[Command]
name = "mgh_a"
command = ~F,DF,DB,B,F,DF,DB,B,x
time = 40
[Command]
name = "mgh_a"
command = ~F,DF,DB,B,F,DF,DB,B,y
time = 40
[Command]
name = "mgh_a"
command = ~F,DF,DB,B,F,DF,DB,B,z
time = 40

;---------------------------------------------------------------------
; ashura Senkuu
[Command]
name = "as_a"
command = ~F,D,DF, x+y+z
time = 25
[Command]
name = "as_b"
command = ~B,D,DB, x+y+z
time = 25
[Command]
name = "as_c"
command = ~F,D,DF, a+b+c
time = 25
[Command]
name = "as_d"
command = ~B,D,DB, a+b+c
time = 25

; Tatsumaki Zankuukyaku
[Command]
name = "tz_a"
command = ~D,DB, B, a
time = 20
[Command]
name = "tz_b"
command = ~D,DB, B, b
time = 20
[Command]
name = "tz_c"
command = ~D,DB, B, c
time = 20

; Gou shoryuken
[Command]
name = "gs_x"
command = ~F, D,DF, x
time = 25
[Command]
name = "gs_y"
command = ~F, D,DF, y
time = 25
[Command]
name = "gs_z"
command = ~F, D,DF, z
time = 25

; Shakunetsu Hadouken
[Command]
name = "sh_a"
command = ~F,DF, DB, B, x
time = 30
[Command]
name = "sh_b"
command = ~F,DF, DB, B, y
time = 30
[Command]
name = "sh_c"
command = ~F,DF, DB, B, z
time = 30

; Gou Hadouken
[Command]
name = "gh_a"
command = ~D,DF, F, x
time = 20
[Command]
name = "gh_b"
command = ~D,DF, F, y
time = 20
[Command]
name = "gh_c"
command = ~D,DF, F, z
time = 20

; Zenpou Tenshin
[Command]
name = "zt_a"
command = ~D,DB, B, x
time = 20
[Command]
name = "zt_b"
command = ~D,DB, B, y
time = 20
[Command]
name = "zt_c"
command = ~D,DB, B, z
time = 20

; Hyakki Shuu
[Command]
name = "hs_a"
command = ~F, D,DF, a
time = 25
[Command]
name = "hs_b"
command = ~F, D,DF, b
time = 25
[Command]
name = "hs_c"
command = ~F, D,DF, c
time = 25

;-| Double Tap |------------------------------------------------------
[Command]
name = "FF";Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB";Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |------------------------------------------

[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = z+x
time = 1

[Command]
name = "recovery_b"
command = a+b
time = 1

[Command]
name = "recovery_b"
command = b+c
time = 1

[Command]
name = "recovery_b"
command = c+a
time = 1

[Command]
name = "ab"
command = a+b
time = 1

[Command]
name = "ax"
command = a+x
time = 1

[Command]
name = "by"
command = b+y
time = 1

[Command]
name = "cz"
command = c+z
time = 1

[Command]
name = "xy"
command = x+y
time = 1

[Command]
name = "xyz"
command = x+y+z
time = 1

;-| Dir + Button |----------------------------------------------------
[Command]
name = "fwd_a"
command = /F,a
time = 1

[Command]
name = "fwd_b"
command = /F,b
time = 1

[Command]
name = "fwd_c"
command = /F,c
time = 1

[Command]
name = "fwd_x"
command = /F,x
time = 1

[Command]
name = "fwd_y"
command = /F,y
time = 1

[Command]
name = "fwd_z"
command = /F,z
time = 1

[Command]
name = "back_a"
command = /B,a
time = 1

[Command]
name = "back_b"
command = /B,b
time = 1

[Command]
name = "back_c"
command = /B,c
time = 1

[Command]
name = "back_x"
command = /B,x
time = 1

[Command]
name = "back_y"
command = /B,y
time = 1

[Command]
name = "back_z"
command = /B,z
time = 1

[Command]
name = "down_b"
command = /$D, b
time = 1

;------------------- Street Fighter Zero 3
[Command]
name = "airthrow"
command = x+y
time = 3
[Command]
name = "airthrow"
command = y+z
time = 3
[Command]
name = "airthrow"
command = x+z
time = 3
[Command]
name = "airthrow"
command = a+c
time = 3
[Command]
name = "airthrow"
command = a+b
time = 3
[Command]
name = "airthrow"
command = b+c
time = 3


[Command]
name = "throw_F"
command = x+y
time = 1
[Command]
name = "throw_F"
command = y+z
time = 1
[Command]
name = "throw_F"
command = x+z
time = 1

[Command]
name = "throw_B"
command = a+c
time = 1
[Command]
name = "throw_B"
command = a+b
time = 1
[Command]
name = "throw_B"
command = b+c
time = 1

; Zero Counter
[Command]
name = "ZC"
command = /$F, b+y
time = 3

; Zero Counter
[Command]
name = "ZC"
command = /$F, c+z
time = 3

[Command]
name = "Shaking"
command = B, F
time = 10
[Command]
name = "Shaking"
command = F, B
time = 10

;-| Single Button |---------------------------------------------------
[Command]
name = "x"
command = x
time = 1

[Command]
name = "a"
command = a
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;-| Hold Button |-----------------------------------------------------
[Command]
name = "xx"
command = /x
time = 1

[Command]
name = "aa"
command = /a
time = 1

[Command]
name = "yy"
command = /y
time = 1

[Command]
name = "bb"
command = /b
time = 1

[Command]
name = "cc"
command = /c
time = 1

[Command]
name = "zz"
command = /z
time = 1

[Command]
name = "ss"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup";Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;=====================================================================
; State Entry for Commands
;=====================================================================

[Statedef -1]

;---------------------------------------------------------------------
; Super Attacks
;---------------
[State -1, Misogi]
type = ChangeState
value = 3750
triggerall = !var(59)
triggerall = Power >= 3000
triggerall = command = "msg"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact

[State -1, Kongo Kokuretsuzan]
type = ChangeState
value = 3600
triggerall = !var(59)
triggerall = Power >= 3000
triggerall = command = "konko"
triggerall = statetype = S
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact

;---------------------------------------------------------------------
[State -1, Shun Goku-Satsu]
type = ChangeState
value = 3450
triggerall = !var(59)
triggerall = Power >= 3000
triggerall = Command = "sgs"
triggerall = !StateType = A
trigger1 = StateNo = 52 || (StateNo = [200,450]) || (StateNo = [600,625])
trigger2 = Ctrl = 1

;---------------------------------------------------------------------
[State -1, TGZ]
type = ChangeState
value = 3302
triggerall = !var(59)
triggerall = StateType = A
triggerall = Ctrl = 1
triggerall = Power >= 3000
trigger1 = Command = "tgz_c"
[State -1, TGZ]
type = ChangeState
value = 3301
triggerall = !var(59)
triggerall = StateType = A
triggerall = Ctrl = 1
triggerall = Power >= 2000
trigger1 = Command = "tgz_b"
[State -1, TGZ]
type = ChangeState
value = 3300
triggerall = !var(59)
triggerall = StateType = A
triggerall = Ctrl = 1
triggerall = Power >= 1000
trigger1 = Command = "tgz_a"

;---------------------------------------------------------------------
[State -1, MGS]
type = ChangeState
value = 3270
triggerall = !var(59)
triggerall = Power >= 3000
triggerall = command = "mgs_x"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1, MGS]
type = ChangeState
value = 3260
triggerall = !var(59)
triggerall = Power >= 2000
triggerall = command = "mgs_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1, MGS]
type = ChangeState
value = 3250
triggerall = !var(59)
triggerall = Power >= 1000
triggerall = command = "mgs_z"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact

;---------------------------------------------------------------------
[State -1, MGR3]
type = ChangeState
value = 3170
triggerall = !var(59)
triggerall = Power >= 3000
triggerall = command = "mgr3"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1, MGR2]
type = ChangeState
value = 3160
triggerall = !var(59)
triggerall = Power >= 2000
triggerall = command = "mgr2"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1, MGR3]
type = ChangeState
value = 3150
triggerall = !var(59)
triggerall = Power >= 1000
triggerall = command = "mgr1"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact

;---------------------------------------------------------------------
[State -1, MGH3]
type = ChangeState
value = 3002
triggerall = !var(59)
triggerall = Power >= 3000
triggerall = command = "mgh_c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1, MGH2]
type = ChangeState
value = 3001
triggerall = !var(59)
triggerall = Power >= 2000
triggerall = command = "mgh_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1, MGH3]
type = ChangeState
value = 3000
triggerall = !var(59)
triggerall = Power >= 1000
triggerall = command = "mgh_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact

;---------------------------------------------------------------------
; Special Attacks
;-----------------
[State -1]
type = ChangeState
value = 1600
triggerall = !var(59)
triggerall = command = "as_a"
triggerall = statetype = S || statetype = C
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1]
type = ChangeState
value = 1610
triggerall = !var(59)
triggerall = command = "as_b"
triggerall = statetype = S || statetype = C
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1]
type = ChangeState
value = 1620
triggerall = !var(59)
triggerall = command = "as_c"
triggerall = statetype = S || statetype = C
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1]
type = ChangeState
value = 1630
triggerall = !var(59)
triggerall = command = "as_d"
triggerall = statetype = S || statetype = C
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact

[State -1]
type = ChangeState
value = 1500
triggerall = !var(59)
triggerall = Command = "tz_a"
triggerall = statetype = A
trigger1 = Ctrl = 1
[State -1]
type = ChangeState
value = 1501
triggerall = !var(59)
triggerall = Command = "tz_b"
triggerall = statetype = A
trigger1 = Ctrl = 1
[State -1]
type = ChangeState
value = 1502
triggerall = !var(59)
triggerall = Command = "tz_c"
triggerall = statetype = A
trigger1 = Ctrl = 1

[State -1]
type = ChangeState
value = 1400
triggerall = !var(59)
triggerall = Command = "tz_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
trigger11 = StateNo = 450 && movecontact
[State -1]
type = ChangeState
value = 1401
triggerall = !var(59)
triggerall = Command = "tz_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
trigger11 = StateNo = 450 && movecontact
[State -1]
type = ChangeState
value = 1402
triggerall = !var(59)
triggerall = Command = "tz_c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
trigger11 = StateNo = 450 && movecontact

[State -1]
type = ChangeState
value = 1300
triggerall = !var(59)
triggerall = statetype != A
triggerall = command = "gs_x" 
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1]
type = ChangeState
value = 1310
triggerall = !var(59)
triggerall = command = "gs_y" 
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1, Gou Shoryu]
type = ChangeState
value = 1320
triggerall = !var(59)
triggerall = command = "gs_z" 
triggerall = command != "holddown"
trigger1 = statetype = S && ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact

[State -1]
type = ChangeState
value = 1250
triggerall = !var(59)
triggerall = Command = "sh_a"
triggerall = NumProj = 0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1]
type = ChangeState
value = 1251
triggerall = !var(59)
triggerall = Command = "sh_b"
triggerall = NumProj = 0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1]
type = ChangeState
value = 1252
triggerall = !var(59)
triggerall = Command = "sh_c"
triggerall = NumProj = 0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact

[State -1]
type = ChangeState
value = 1150
triggerall = !var(59)
triggerall = Command = "gh_a"
triggerall = StateType = A
triggerall = NumProj = 0
trigger1 = Ctrl = 1
[State -1]
type = ChangeState
value = 1151
triggerall = !var(59)
triggerall = Command = "gh_b"
triggerall = StateType = A
triggerall = NumProj = 0
trigger1 = Ctrl = 1
[State -1]
type = ChangeState
value = 1152
triggerall = !var(59)
triggerall = Command = "gh_c"
triggerall = StateType = A
triggerall = NumProj = 0
trigger1 = Ctrl = 1

[State -1]
type = ChangeState
value = 1050
triggerall = !var(59)
triggerall = Command = "gh_a"
triggerall = NumProj = 0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1]
type = ChangeState
value = 1051
triggerall = !var(59)
triggerall = Command = "gh_b"
triggerall = NumProj = 0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1]
type = ChangeState
value = 1052
triggerall = !var(59)
triggerall = Command = "gh_c"
triggerall = NumProj = 0
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact

[State -1]
type = ChangeState
value = 1800
triggerall = !var(59)
triggerall = Command = "zt_a"
triggerall = !StateType = A
trigger1 = Ctrl = 1
[State -1]
type = ChangeState
value = 1801
triggerall = !var(59)
triggerall = Command = "zt_b"
triggerall = !StateType = A
trigger1 = Ctrl = 1
[State -1]
type = ChangeState
value = 1802
triggerall = !var(59)
triggerall = Command = "zt_c"
triggerall = !StateType = A
trigger1 = Ctrl = 1

[State -1]
type = ChangeState
value = 1700
triggerall = !var(59)
triggerall = Command = "hs_a"
triggerall = StateType != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1]
type = ChangeState
value = 1701
triggerall = !var(59)
triggerall = Command = "hs_b"
triggerall = StateType != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact
[State -1]
type = ChangeState
value = 1702
triggerall = !var(59)
triggerall = Command = "hs_c"
triggerall = StateType != A
trigger1 = ctrl
trigger2 = StateNo = 200 && movecontact
trigger3 = StateNo = 215 && movecontact
trigger4 = StateNo = 225 && movecontact
trigger5 = StateNo = 230 && movecontact
trigger6 = StateNo = 400 && movecontact
trigger7 = StateNo = 410 && movecontact
trigger8 = StateNo = 420 && movecontact
trigger9 = StateNo = 430 && movecontact
trigger10 = StateNo = 440 && movecontact

;---------------------------------------------------------------------
; Zero Counter
;--------------
[State -1]
type = ChangeState
value = 2600
triggerall = !var(59)
triggerall = Command = "ZC"
triggerall = p2bodydist X = [-50,50]
triggerall = Var(31) != -1
trigger1 = Var(31) = 0 && Power >= 1000
trigger1 = StateNo = [150,153]
trigger2 = Var(31) = 1 && Power >= 1500
trigger2 = StateNo = [150,153]

;---------------------------------------------------------------------
; Run
;--------------
; Forward
[State -1]
type = ChangeState
value = 100
triggerall = !var(59)
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger1 = StateNo != 100

; Back
[State -1]
type = ChangeState
value = 105
triggerall = !var(59)
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl = 1

;---------------------------------------------------------------------
; Grapple Attacks
;-----------------
[State -1]
type = ChangeState
value = 800
triggerall = !var(59)
triggerall = StateNo != 100
triggerall = StateType = S
triggerall = Ctrl = 1
trigger1 = Command = "throw_F"

[State -1]
type = ChangeState
value = 850
triggerall = !var(59)
triggerall = StateNo != 100
triggerall = StateType = S
triggerall = Ctrl = 1
trigger1 = Command = "throw_B"

[State -1]
type = ChangeState
value = 900
triggerall = !var(59)
triggerall = StateType = A
triggerall = Ctrl = 1
trigger1 = Command = "airthrow"

;---------------------------------------------------------------------
; Dir + Button
;--------------
; F+MP
[State -1]
type = ChangeState
value = 300
triggerall = !var(59)
triggerall = StateType = S
triggerall = Ctrl = 1
trigger1 = Command = "fwd_y"

; F+MK
[State -1]
type = ChangeState
value = 310
triggerall = !var(59)
triggerall = StateType = S
triggerall = Ctrl = 1
trigger1 = Command = "fwd_b"

; DF+MK
[State -1]
type = ChangeState
value = 320
triggerall = !var(59)
triggerall = StateType = A
triggerall = Ctrl = 1
trigger1 = Command = "down_b"
trigger1 = Vel X > 0 ;&& (Vel Y =[-1.0,1.0])

;---------------------------------------------------------------------
; Taunt
;-------
[State -1]
type = ChangeState
value = 195
triggerall = !var(59)
triggerall = Command = "s"
trigger1 = StateType = S
trigger1 = Ctrl = 1

;---------------------------------------------------------------------
; Normal Attacks
;----------------
; WP
[State -1]
type = ChangeState
value = 200
triggerall = !var(59)
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = ctrl = 1
trigger1 = statetype = S
trigger2 = StateNo = 200 && MoveContact

; MP
[State -1]
type = ChangeState
value = IfElse(P2BodyDist X > 32,210,215)
triggerall = !var(59)
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1

; SP
[State -1]
type = ChangeState
value = IfElse(P2BodyDist X > 37,220,225)
triggerall = !var(59)
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1

; WK
[State -1]
type = ChangeState
value = IfElse(P2BodyDist X > 28,230,235)
triggerall = !var(59)
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = ctrl = 1
trigger1 = statetype = S
trigger2 = StateNo = 200 && MoveContact

; MK
[State -1]
type = ChangeState
value = IfElse(P2BodyDist X > 28,240,245)
triggerall = !var(59)
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = ctrl = 1
trigger1 = statetype = S

; SK
[State -1]
type = ChangeState
value = IfElse(P2BodyDist X > 24,250,255)
triggerall = !var(59)
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1

;---------------------------------------------------------------------
; Crouching Attacks
;-------------------
; WP
[State -1]
type = ChangeState
value = 400
triggerall = !var(59)
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 235 && MoveContact
trigger4 = StateNo = 400 && MoveContact

; MP
[State -1]
type = ChangeState
value = 410
triggerall = !var(59)
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

; SP
[State -1]
type = ChangeState
value = 420
triggerall = !var(59)
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

; WK
[State -1]
type = ChangeState
value = 430
triggerall = !var(59)
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 235 && MoveContact
trigger4 = StateNo = 400 && MoveContact
trigger5 = StateNo = 430 && MoveContact

; MK
[State -1]
type = ChangeState
value = 440
triggerall = !var(59)
triggerall = Command = "b"
triggerall = Command = "holddown"
trigger1 = StateType = C
trigger1 = Ctrl = 1
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 235 && MoveContact
trigger4 = StateNo = 400 && MoveContact
trigger5 = StateNo = 430 && MoveContact

; SK
[State -1]
type = ChangeState
value = 450
triggerall = !var(59)
triggerall = Command = "c"
triggerall = Command = "holddown"
trigger1 = StateType = C
trigger1 = Ctrl = 1
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 235 && MoveContact
trigger4 = StateNo = 400 && MoveContact
trigger5 = StateNo = 430 && MoveContact
trigger6 = StateNo = 440 && MoveContact

;---------------------------------------------------------------------
; Jumping Attacks
;-----------------
; WP
[State -1]
type = ChangeState
value = 600
triggerall = !var(59)
triggerall = command = "x"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

; MP
[State -1]
type = ChangeState
value = 610
triggerall = !var(59)
triggerall = command = "y"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

; SP
[State -1]
type = ChangeState
value = 620
triggerall = !var(59)
triggerall = command = "z"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

; WK
[State -1]
type = ChangeState
value = 630
triggerall = !var(59)
triggerall = command = "a"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

; MK
[State -1]
type = ChangeState
value = 640
triggerall = !var(59)
triggerall = command = "b"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

; SK
[State -1]
type = ChangeState
value = 650
triggerall = !var(59)
triggerall = command = "c"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

;---------------------------------------------------------------------------
;===========================================================================
;---------------------------------------------------------------------------
;                         A I   S E C T I O N .
;---------------------------------------------------------------------------
;===========================================================================
;---------------------------------------------------------------------------
[State -3]
type = Varset
triggerall = !var(59) ; Check the AI flag
trigger1 = alive
trigger1 = stateno < 5500
trigger1 = command = "AI_1" || command = "AI_2" || command = "AI_3" || command = "AI_4" || command = "AI_5"
trigger2 = command = "AI_6" || command = "AI_7" || command = "AI_8" || command = "AI_9" || command = "AI_10"
trigger3 = command = "AI_11" || command = "AI_12" || command = "AI_13" || command = "AI_14" || command = "AI_15"
trigger4 = command = "AI_16" || command = "AI_17" || command = "AI_18" || command = "AI_19" || command = "AI_20"
trigger5 = command = "AI_21" || command = "AI_22" || command = "AI_23" || command = "AI_24" || command = "AI_25"
trigger6 = command = "AI_26" || command = "AI_27" || command = "AI_28" || command = "AI_29" || command = "AI_30"
trigger7 = command = "AI_31" || command = "AI_32" || command = "AI_33" || command = "AI_34" || command = "AI_35"
trigger8 = command = "AI_36" || command = "AI_37" || command = "AI_38" || command = "AI_39" || command = "AI_40"
trigger9 = command = "AI_41" || command = "AI_42" || command = "AI_43" || command = "AI_44" || command = "AI_45"
trigger10 = command = "AI_46" || command = "AI_47" || command = "AI_48" || command = "AI_49" || command = "AI_50"
var(58) = 1

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 8
var(59) = var(58)

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 7
trigger1 = p2movetype != A
var(59) = random < var(58)*950

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 6
trigger1 = p2movetype != A
var(59) = random < var(58)*900

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 5
trigger1 = p2movetype != A
var(59) = random < var(58)*850

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 4
trigger1 = p2movetype != A
var(59) = random < var(58)*800

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 3
trigger1 = p2movetype != A
var(59) = random < var(58)*750

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 2
trigger1 = p2movetype != A
var(59) = random < var(58)*700

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 1
trigger1 = p2movetype != A
var(59) = random < var(58)*650

; ---------------------------------------------------------------------------------
;Counter
[State -1, blocking Flag]
Type = VarSet
triggerall = fvar(27) = 0
triggerall = roundstate = 2
trigger1 = (stateno = [4000,4199])
fvar(27) = 1
IgnoreHitPause = 1

;Counter
[State -1, blocking Flag Re]
Type = VarSet
triggerall= fvar(27) != 0
trigger1 = Enemynear,ctrl || Enemynear,movetype = H || movetype = A
trigger2 = Enemynear,life <= 0 || p2bodydist X > 90 || stateno = 800
fvar(27) = 0
IgnoreHitPause = 1


[State -1, Nomal Jump]
Type = ChangeState
value = 42
triggerall = Var(59)
triggerall = roundstate = 2
triggerall = StateType != A
triggerall = ctrl || stateno = 16 || stateno = 21 || stateno = 22 || (stateno = 100 && animelemtime(2) >1) || stateno = 101
triggerall = !inguarddist
trigger1 = EnemyNear,movetype != H || EnemyNear,stateno = [120,159]
trigger1 = P2BodyDist X = [85,100]
trigger1 = random <= 20

;recover
[State -1,rev]
type = ChangeState
value = 5210
triggerall = Var(59)
triggerall = !var(16)
triggerall = roundstate = 2
triggerall = Alive
triggerall = CanRecover
triggerall = Vel Y > -1
triggerall = Pos Y >= -40
triggerall = StateNo = 5050
trigger1 = random = [150,200]

; Zero Counter
[State -1,AI-Common1]
type = ChangeState
value = 2600
triggerall = var(59)
triggerall = movetype !=h
trigger1 = var(7) > 0 && stateno = [150,152]
Triggerall = Facing != Enemynear,Facing
triggerall = Enemynear,Vel X > 1
trigger1 = enemy,movetype = A && !Enemy,Numproj
trigger1 = Gethitvar(Hitshaketime) < 2 && P2dist X = [5,25]
trigger1 = Random < Var(59)*5
trigger2 = Enemynear,Movetype = A && Enemynear,Hitdefattr = SCA,HA,SP
trigger2 = Gethitvar(Hitshaketime) < 5 && Enemynear,Ctrl = 0 && P2dist X = [0,25]
trigger2 = Random < Var(59)*25

[State AI, Barrier S]
type = ChangeState
value = 3750
triggerall = var(59) < var(59)*10 && roundstate = 2
triggerall = Power >= 3000
triggerall = AILevel > 3 && roundstate = 2
triggerall = random <= 190
triggerall = p2bodydist x > 150
trigger1 = ctrl && enemynear,NumProj && statetype != A && random = [20,300]
trigger2 = inguarddist = [0,220]
trigger2 = ctrl && enemynear,NumProj && statetype != A

[State -1, Instant Hell Murder]
type = ChangeState
value = 3450
triggerall = random < var(59)*20 && roundstate = 2
triggerall = Power >= 3000
triggerall = statetype != A
trigger1 = StateNo = 52 || (StateNo = [200,255]) || (StateNo = [400,450]) || Ctrl
trigger1 = stateno = 410 && movehit || p2statetype != A && enemynear,HitDefAttr = SCA, HA,HT,HP && p2bodydist X = [-5,100]

; Messatsu Gou Hadou
[State -1]
type = ChangeState
value = 3002
triggerall = random < var(59)*100 && roundstate = 2
triggerall = Power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2statetype != C && p2statetype != L
trigger1 = enemynear,HitDefAttr = SCA, HA,HT,HP
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2bodydist Y = [-80,0]

[State -1]
type = ChangeState
value = 3001
triggerall = random < var(59)*100 && roundstate = 2
triggerall = Power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2statetype != C && p2statetype != L
trigger1 = enemynear,HitDefAttr = SCA, HA,HT,HP
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2bodydist Y = [-80,0]

[State -1]
type = ChangeState
value = 3000
triggerall = random < var(59)*100 && roundstate = 2
triggerall = Power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2statetype != C && p2statetype != L
trigger1 = enemynear,HitDefAttr = SCA, HA,HT,HP
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2bodydist Y = [-80,0]

; S Gou Shoryu
[State -1]
type = ChangeState
value = 1320
triggerall = var(59) && roundstate = 2
triggerall = statetype != A && Movehit
triggerall = random <= 999
trigger1 = stateno = 225
trigger2 = stateno = 420

; W Gou Shoryu
[State -1]
type = ChangeState
value = 1300
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [0,50]
trigger1 = p2bodydist Y < -80

[State -1]; Burla
type = ChangeState
value = 195
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X > 280
trigger1 = p2movetype != A
trigger1 = random = [0,10]

[State -1]; Normal
type = ChangeState
value = 850
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2statetype != A && p2statetype != L && p2stateno != 3410
trigger1 = p2bodydist X = [-5,10]


; Asura Senkuu
[State -1]
type = ChangeState
value = 1600
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A
trigger1 = StateNo = 195 && animtime = 0
[State -1,AI-Common1]
type = ChangeState
value = 1610
triggerall = var(59) != 0
triggerall = statetype != A && (ctrl)
triggerall = p2bodydist x <= 40  && backedgebodydist > 60 && random <= 100
trigger1 = NumEnemy =1
trigger1 = p2statetype = L ||p2stateno = 5120
trigger2 = NumEnemy =2
trigger2 = enemy,statetype = L ||enemy,stateno = 5120 ||enemy(1),statetype = L ||enemy(1),stateno = 5120

; SP
[State -1]
type = ChangeState
value = IfElse(P2BodyDist X > 37,220,225)
triggerall = random < var(59)*80 && roundstate = 2
triggerall = P2BodyDist X <= 25
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist Y < -30

[State -1]
type = ChangeState
value = 3650
triggerall = var(59)
triggerall = Power >= 3000
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist X = [26,30]
trigger1 = p2bodydist Y < -30

; SP crouch
[State -1]
type = ChangeState
value = 420
triggerall = random < var(59)*100 && roundstate = 2
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist X = [26,30]
trigger1 = p2bodydist Y < -30

[State -1]; WP air
type = ChangeState
value = 1152
triggerall = random < var(59)*100 && roundstate = 2
triggerall = random <= 70
triggerall = p2bodydist x = [30,200]
triggerall = statetype = A
trigger1 = ctrl

[State -1]; Chain
type = ChangeState
value = 200
triggerall = random < var(59)*100
triggerall = P2BodyDist X <= 20
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = S
trigger1 = p2movetype != H
trigger2 = stateno = 1110 && Animtime = 0
trigger3 = stateno = 1120 && Animtime = 0

[State -1]; Chain
type = ChangeState
value = 400
triggerall = random < var(59)*100
triggerall = P2BodyDist X <= 20
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = C
trigger1 = p2movetype != H
trigger2 = stateno = 1110 && Animtime = 0
trigger3 = stateno = 1120 && Animtime = 0

[State -1, WP AI]; Chain
type = ChangeState
value = 430
triggerall = var(59) > 2
triggerall = p2statetype != A
triggerall = statetype != A
triggerall = movecontact
triggerall = random <= 299
trigger1 = stateno = 310
trigger2 = stateno = 400
trigger3 = stateno = 200
[State -1, MP AI]; Chain
type = ChangeState
value = 440
triggerall = var(59) > 2
triggerall = p2statetype != A
triggerall = movecontact
triggerall = random <= 299
trigger1 = stateno = 430

[State -1, SP AI]; Chain critical
type = ChangeState
value = 1402
triggerall = var(59) > 2
triggerall = p2statetype != A
triggerall = movehit
triggerall = random <= 599
trigger1 = stateno = 440
trigger2 = stateno = 1110 && Animtime = 0
trigger3 = stateno = 1120 && Animtime = 0

[State -1, SP AI]; Chain critical
type = ChangeState
value = 1300
triggerall = var(59) > 2
triggerall = p2statetype != A
triggerall = movehit
triggerall = random <= 199
trigger1 = stateno = 440
trigger2 = stateno = 1110 && Animtime = 0
trigger3 = stateno = 1120 && Animtime = 0

[State -1, SP AI]; Chain
type = ChangeState
value = 1610
triggerall = var(59) > 2
triggerall = Power <= 1000
triggerall = p2statetype != A
triggerall = moveguarded
triggerall = random <= 199
trigger1 = stateno = 440

[State -1, SP AI]; Chain
type = ChangeState
value = 1252
triggerall = var(59) > 2
triggerall = Power >= 1000
triggerall = p2statetype != A
triggerall = moveguarded
triggerall = random <= 599
trigger1 = stateno = 440

; S Gou Hadou MvC
[State -1]
type = ChangeState
value = 1050
triggerall = gamemode != "watch" && Numpartner < 1 && (p2name != "Rose" || (p2name = "Rose" && p2, Numproj = 1))
triggerall = EnemyNear, NumProjID(3800) = 0 && EnemyNear, NumProjID(3100) = 0 && EnemyNear, NumProjID(3900) = 0 && EnemyNear, NumProjID(3000) = 0 && EnemyNear, NumProjID(3001) = 0 && EnemyNear, NumProjID(3002) = 0
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A
triggerall = NumProj = 0
trigger1 = ctrl
trigger1 = p2statetype != A
trigger1 = p2bodydist X > 200

[State -1]
type = ChangeState
value = 3450
triggerall = random < var(59)*15 && roundstate = 2
triggerall = Power >= 3000
trigger1 = stateno = 440

[State -1]
type = ChangeState
value = 3120
triggerall = random < var(59)*50 && roundstate = 2
triggerall = Power >= 3000
trigger1 = StateNo = 1410 && animtime = 0

[State -1]; Chain
type = ChangeState
value = 3600
triggerall = random < var(59)*100 && roundstate = 2
triggerall = Power >= 3000
trigger1 = StateNo = 430 && animtime = 0
[State -1]
type = ChangeState
value = 3001
triggerall = var(59) && roundstate = 2
triggerall = Power >= 2000
trigger1 = StateNo = 1410 && animtime = 0

[State -3]; Guard
type = ChangeState
value = 130
triggerall = var(59)
triggerall = statetype != A && ctrl
trigger1 = inguarddist
trigger1 = p2statetype != C
trigger2 = EnemyNear, NumProj || ProjContact = 1
trigger2 = random < 1000
[State -3]
type = ChangeState
value = 131
triggerall = var(59)
triggerall = inguarddist
triggerall = statetype != A && ctrl
trigger1 = p2statetype = C
trigger2 = EnemyNear, NumProj || ProjContact = 1
trigger2 = random < 1000
[State -3]
type = ChangeState
value = 132
triggerall = var(59)
triggerall = statetype = A && ctrl
trigger1 = inguarddist
trigger2 = EnemyNear, NumProj || ProjContact = 1
trigger2 = random < 1000

[State -1]
type = ChangeState
value = 310
triggerall = var(59) && roundstate = 2
triggerall = statetype != A
trigger1 = p2statetype = C && p2statetype != L && p2stateno != 3410
triggerall = p2bodydist X = [-5,50]
triggerall = p2movetype != H 
triggerall = p2stateno != [150,153]
trigger1 = ctrl
[State -1]
type = ChangeState
value = 430
triggerall = var(59) && roundstate = 2
triggerall = statetype != A
trigger1 = p2statetype = S && p2statetype != L && p2stateno != 3410
triggerall = p2bodydist X = [-5,50]
triggerall = p2movetype != H 
triggerall = p2stateno != [150,153]
trigger1 = ctrl
[State -1]
type = ChangeState
value = 440
triggerall = var(59) && roundstate = 2
triggerall = statetype != A
trigger1 = p2statetype =S && p2statetype != L && p2stateno != 3410
triggerall = p2bodydist X = [-5,60]
triggerall = p2stateno != [152,153]
trigger1 = ctrl 
[State -1]
type = ChangeState
value = 310
triggerall = var(59) && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [0,120]
trigger1 = p2stateno = [152,153]
[State -1]
type = ChangeState
value = 225
triggerall = var(59) && roundstate = 2
triggerall = P2BodyDist X <= 25
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist Y < -30
[State -1]
type = ChangeState
value = 420
triggerall = var(59) && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype != H
trigger1 = p2bodydist X = [26,30]
trigger1 = p2bodydist Y < -30
[State -1]
type = ChangeState
value = 200
triggerall = var(59) && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype = A
trigger1 = p2bodydist X = [26,60]
trigger1 = p2bodydist Y = [-70,20]
[State -1]
type = ChangeState
value = 600
triggerall = var(59) && roundstate = 2
triggerall = statetype = A
trigger1 = ctrl 
trigger1 = Vel X != 0
trigger1 = p2statetype != S
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2bodydist Y = [-70,60]
[State -1]
type = ChangeState
value = 620
triggerall = var(59) && roundstate = 2
triggerall = Vel X = 0
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2bodydist Y = [0,70]
trigger1 = p2statetype = A || vel Y > 0
[State -1]
type = ChangeState
value = 630
triggerall = var(59) && roundstate = 2
triggerall = statetype = A
trigger1 = ctrl 
trigger1 = p2bodydist X = [-5,20]
trigger1 = p2bodydist Y = [-60,100]
trigger1 = p2statetype = A || vel Y > 0
[State -1]
type = ChangeState
value = 640
triggerall = var(59) && roundstate = 2
triggerall = Vel X = 0
triggerall = statetype = A
triggerall = ctrl
trigger1 = p2statetype = C
trigger1 = p2bodydist X = [-5,30]
trigger1 = p2bodydist Y = [-90,0]
trigger2 = p2bodydist X = [-5,70]
trigger2 = p2bodydist Y = [-40,90]
trigger2 = p2statetype = A || vel Y > 0
[State -1]
type = ChangeState
value = 650
triggerall = var(59) && roundstate = 2
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,80]
trigger1 = p2bodydist Y = [0,110]
trigger1 = p2statetype = A || vel Y > 0
;===========================================================================
;                                                   E N D   O F   F I L E .
;===========================================================================