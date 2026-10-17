;========================================================
;-| AI |----------------------------
;===================================
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

;=====================================================================
;  CMD File For "Zangief"                               Made By M.M.R.
;                                       Ver. 0.7           2001.Aug.30
;=====================================================================
; Final Atomic Buster
[Command]
name = "fab_a"
command = ~F,DF,DB,B,F,DF,DB,B,x
time = 40
[Command]
name = "fab_b"
command = ~F,DF,DB,B,F,DF,DB,B,y
time = 40
[Command]
name = "fab_c"
command = ~F,DF,DB,B,F,DF,DB,B,z
time = 40

;---------------------------------------------------------------------
; Ultimate Atomic Buster
[Command]
name = "Ultimate"
command = ~F,DF,DB,B,F,DF,DB,B,a
time = 40
[Command]
name = "Ultimate"
command = ~F,DF,DB,B,F,DF,DB,B,b
time = 40
[Command]
name = "Ultimate"
command = ~F,DF,DB,B,F,DF,DB,B,c
time = 40

;---------------------------------------------------------------------
[Command]
name = "Torch"
command = ~D,DF,F,D,DF,F,x
time = 40
[Command]
name = "Torch"
command = ~D,DF,F,D,DF,F,y
time = 40
[Command]
name = "Torch"
command = ~D,DF,F,D,DF,F,z
time = 40

;---------------------------------------------------------------------
; Aerial Russian Slam
[Command]
name = "ars_a"
command = ~D,DF,F,D,DF,F,a
time = 30
[Command]
name = "ars_b"
command = ~D,DF,F,D,DF,F,b
time = 30
[Command]
name = "ars_c"
command = ~D,DF,F,D,DF,F,c
time = 30

;---------------------------------------------------------------------
;-| Special Motions |-------------------------------------------------
;---------------------------------------------------------------------
; Lariat
[Command]
name = "trompo"
command = x+y+z
time = 1
[Command]
name = "q_trompo"
command = a+b+c
time = 1

;---------------------------------------------------------------------
; Screw Pile Driver
[Command]
name = "spd_a"
command = ~F,DF,DB,B,F, x
time = 30
[Command]
name = "spd_b"
command = ~F,DF,DB,B,F, y
time = 30
[Command]
name = "spd_c"
command = ~F,DF,DB,B,F, z
time = 30
[Command]
name = "spd_a"
command = ~F,DF,D,DB,B,F, x
time = 35
[Command]
name = "spd_b"
command = ~F,DF,D,DB,B,F, y
time = 35
[Command]
name = "spd_c"
command = ~F,DF,D,DB,B,F, z
time = 35

;---------------------------------------------------------------------
; Atomic Suplex
[Command]
name = "as_a"
command = ~F,DF,DB,B,F, a
time = 30
[Command]
name = "as_b"
command = ~F,DF,DB,B,F, b
time = 30
[Command]
name = "as_c"
command = ~F,DF,DB,B,F, c
time = 30
[Command]
name = "as_a"
command = ~F,DF,D,DB,B,F, a
time = 35
[Command]
name = "as_b"
command = ~F,DF,D,DB,B,F, b
time = 35
[Command]
name = "as_c"
command = ~F,DF,D,DB,B,F, c
time = 35

;---------------------------------------------------------------------
; Aletazo WWF
[Command]
name = "Aletazo_W"
command = ~F, D,DF, x
time = 25
[Command]
name = "Aletazo_M"
command = ~F, D,DF, y
time = 25
[Command]
name = "Aletazo_S"
command = ~F, D,DF, z
time = 25
;---------------------------------------------------------------------
;-| Double Tap |------------------------------------------------------
;---------------------------------------------------------------------
[Command]
name = "FF"
command = F, F
time = 10

[Command]
name = "BB";Required (do not remove)
command = B, B
time = 10

;---------------------------------------------------------------------
;-| 2/3 Button Combination |------------------------------------------
;---------------------------------------------------------------------
[Command]
name = "recovery"
command = x+a
time = 1

;---------------------------------------------------------------------
;-| Dir + Button |----------------------------------------------------
;---------------------------------------------------------------------
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

;---------------------------------------------------------------------
;------------------- Street Fighter Zero 3
;---------------------------------------------------------------------
[Command]
name = "AT"
command = x+y
time = 3
[Command]
name = "AT"
command = y+z
time = 3
[Command]
name = "AT"
command = x+z
time = 3
[Command]
name = "AT"
command = a+c
time = 3
[Command]
name = "AT"
command = a+b
time = 3
[Command]
name = "AT"
command = b+c
time = 3

[Command]
name = "FT_Stand"
command = x+y
time = 1

[Command]
name = "FT_Stand"
command = y+z
time = 1

[Command]
name = "FT_Stand"
command = x+z
time = 1

[Command]
name = "FT2_Stand"
command = a+c
time = 1

[Command]
name = "FT2_Stand"
command = a+b
time = 1

[Command]
name = "FT2_Stand"
command = b+c
time = 1


[Command]
name = "FT_Crouch"
command = /D,x+y
time = 1
[Command]
name = "FT2_Crouch"
command = /D,a+b
time = 1
[Command]
name = "FT_Crouch"
command = /D,x+z
time = 1
[Command]
name = "FT2_Crouch"
command = /D,c+b
time = 1
[Command]
name = "FT_Crouch"
command = /D,z+y
time = 1
[Command]
name = "FT2_Crouch"
command = /D,a+c
time = 1


; Zero Counter
[Command]
name = "ZC"
command = /$F, b+y
time = 3

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

;---------------------------------------------------------------------
;-| Single Button |---------------------------------------------------
;---------------------------------------------------------------------
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

;---------------------------------------------------------------------
;------------------------ Street Fighter Zero 3 ----------------------
;---------------------------------------------------------------------
[Command]
name = "random"
command = x
time = 1

[Command]
name = "random"
command = y
time = 1

[Command]
name = "random"
command = z
time = 1

[Command]
name = "random"
command = a
time = 1

[Command]
name = "random"
command = b
time = 1

[Command]
name = "random"
command = c
time = 1

[Command]
name = "random"
command = F
time = 1

[Command]
name = "random"
command = DF
time = 1

[Command]
name = "random"
command = D
time = 1

[Command]
name = "random"
command = DB
time = 1

[Command]
name = "random"
command = B
time = 1

[Command]
name = "random"
command = UB
time = 1

[Command]
name = "random"
command = U
time = 1

[Command]
name = "random"
command = UF
time = 1

;---------------------------------------------------------------------
;-| Hold Button |-----------------------------------------------------
;---------------------------------------------------------------------
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

;---------------------------------------------------------------------
;-| Hold Dir |--------------------------------------------------------
;---------------------------------------------------------------------
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
;=====================================================================
; Super Arts
;=====================================================================
; Ultimate Atomic Buster
[State -1]
type = ChangeState
value = 3700
triggerall = !var(59)
triggerall = StateType != A
triggerall = MoveType != H
triggerall = Power >= 3000
trigger1 = Command = "Ultimate"
trigger1 = Ctrl

; Final Atomic Buster
[State -1]
type = ChangeState
value = 3000
triggerall = !var(59)
triggerall = StateType != A
triggerall = MoveType != H
triggerall = Power >= 1000
trigger1 = Command = "fab_a"
trigger1 = Ctrl

[State -1]
type = ChangeState
value = 3100
triggerall = !var(59)
triggerall = StateType != A
triggerall = MoveType != H
triggerall = Power >= 2000
trigger1 = Command = "fab_b"
trigger1 = Ctrl

[State -1]
type = ChangeState
value = 3200
triggerall = !var(59)
triggerall = StateType != A
triggerall = MoveType != H
triggerall = Power >= 3000
trigger1 = Command = "fab_c"
trigger1 = Ctrl

;---------------------------------------------------------------------
; Aerial Russian Slam
[State -1]
type = ChangeState
value = 3300
triggerall = !var(59)
triggerall = StateType != A
triggerall = Power >= 1000
triggerall = Ctrl = 1
trigger1 = Command = "ars_a"

[State -1]
type = ChangeState
value = 3400
triggerall = !var(59)
triggerall = StateType != A
triggerall = Power >= 2000
triggerall = Ctrl = 1
trigger1 = Command = "ars_b"

[State -1]
type = ChangeState
value = 3500
triggerall = !var(59)
triggerall = StateType != A
triggerall = Power >= 3000
triggerall = Ctrl = 1
trigger1 = Command = "ars_c"

;---------------------------------------------------------------------
; Lanzallamas
[State -1]
type = ChangeState
value = 3600
triggerall = !var(59)
triggerall = StateType != A
triggerall = Power >= 1000
triggerall = Ctrl = 1
trigger1 = Command = "Torch"

;---------------------------------------------------------------------
; Ultimate Atomic Buster


;=====================================================================
; Special Arts 
;=====================================================================
; Piledrivers
[State -1]
type = ChangeState
value = 1200
triggerall = Command = "spd_a"
triggerall = StateType != A
trigger1 = Ctrl
[State -1]
type = ChangeState
value = 1230
triggerall = Command = "spd_b"
triggerall = StateType != A
trigger1 = Ctrl
[State -1]
type = ChangeState
value = 1260
triggerall = Command = "spd_c"
triggerall = StateType != A
trigger1 = Ctrl

;---------------------------------------------------------------------
; Aerial Slam
[State -1]
type = ChangeState
value = 1300
triggerall = !var(59)
triggerall = Command = "as_a"
triggerall = StateType != A
trigger1 = Ctrl
[State -1]
type = ChangeState
value = 1340
triggerall = !var(59)
triggerall = Command = "as_b"
triggerall = StateType != A
trigger1 = Ctrl
[State -1]
type = ChangeState
value = 1370
triggerall = !var(59)
triggerall = Command = "as_c"
triggerall = StateType != A
trigger1 = Ctrl

;---------------------------------------------------------------------
; Aletazo Wrestler
[State -1]
type = ChangeState
value = 1100
triggerall = StateType != A
triggerall = Command = "Aletazo_W"
trigger1 = Ctrl = 1
[State -1]
type = ChangeState
value = 1110
triggerall = StateType != A
triggerall = Command = "Aletazo_M"
trigger1 = Ctrl = 1
[State -1]
type = ChangeState
value = 1120
triggerall = StateType != A
triggerall = Command = "Aletazo_S"
trigger1 = Ctrl = 1

;---------------------------------------------------------------------
; Trompo humano (Golpes)
[State -1]
type = ChangeState
value = 1000
triggerall = !var(59)
triggerall = StateType != A
triggerall = Command = "trompo"
trigger1 = Ctrl = 1

;-------------------------
; Trompo humano (Patadas)
[State -1]
type = ChangeState
value = 1050
triggerall = !var(59)
triggerall = StateType != A
triggerall = Command = "q_trompo"
trigger1 = Ctrl = 1

;=====================================================================
; Zero Counter
;=====================================================================
[State -1]
type = ChangeState
value = 2600
triggerall = Command = "ZC"
triggerall = p2bodydist X = [-50,50]
triggerall = Power >= 1000
triggerall = statetype != A
trigger1 = StateNo = [150,153]  
ignorhitpause = 1

;=====================================================================
; Basic Animation
;=====================================================================
; Forward
[State -1]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger1 = StateNo != 100

; Back
[State -1]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl = 1

;=====================================================================
; Basic Throws
;=====================================================================
; Standing Throws
[State -1]
type = ChangeState
value = 800
triggerall = !var(59)
triggerall = StateNo != 100
triggerall = StateType = S
triggerall = Ctrl = 1
trigger1 = Command = "FT2_Stand"
[State -1]
type = ChangeState
value = 825
triggerall = !var(59)
triggerall = StateNo != 100
triggerall = StateType = S
triggerall = Ctrl = 1
trigger1 = Command = "FT_Stand"

; Crouching Throws
[State -1]
type = ChangeState
value = 850
triggerall = !var(59)
triggerall = StateNo != 100
triggerall = StateType = C
triggerall = Ctrl = 1
trigger1 = Command = "FT_Crouch"
[State -1]
type = ChangeState
value = 875
triggerall = !var(59)
triggerall = StateNo != 100
triggerall = StateType = C
triggerall = Ctrl = 1
trigger1 = Command = "FT2_Crouch"

; Air Throws
[State -1]
type = ChangeState
value = 900
triggerall = !var(59)
triggerall = StateType = A
triggerall = Ctrl = 1
trigger1 = Command = "AT"

;=====================================================================
; Dir + Button
;=====================================================================
[State -1]
type = ChangeState
value = 310
triggerall = Command = "z"
triggerall = Command = "holdfwd"
trigger1 = StateType = S
trigger1 = Ctrl = 1

[State -1]
type = ChangeState
value = 300
triggerall = Command = "z"
triggerall = Command = "holddown"
trigger1 = StateType = A
trigger1 = Ctrl = 1
trigger1 = Vel X!= 0

;=====================================================================
; Standing Attacks
;=====================================================================
[State -1]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = ctrl = 1
trigger1 = statetype = S
trigger2 = StateNo = 300 && Time >= 8

[State -1]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1

[State -1]
type = ChangeState
value = 220
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1

[State -1]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = ctrl = 1
trigger1 = statetype = S
trigger2 = StateNo = 300 && Time >= 8

[State -1]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = ctrl = 1
trigger1 = statetype = S

[State -1]
type = ChangeState
value = 250
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1

;=====================================================================
; Crouch Attacks
;=====================================================================
[State -1]
type = ChangeState
value = 400
triggerall = command = "x"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = StateNo = 400 && Time >= 6

[State -1]
type = ChangeState
value = 410
triggerall = command = "y"
trigger1 = statetype = C
trigger1 = ctrl = 1

[State -1]
type = ChangeState
value = 420
triggerall = command = "z"
trigger1 = statetype = C
trigger1 = ctrl = 1

[State -1]
type = ChangeState
value = 430
triggerall = command = "a"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = StateNo = 400 && Time >= 8

[State -1]
type = ChangeState
value = 440
triggerall = Command = "b"
trigger1 = StateType = C
trigger1 = Ctrl = 1

[State -1]
type = ChangeState
value = 450
triggerall = Command = "c"
trigger1 = StateType = C
trigger1 = Ctrl = 1

;=====================================================================
; Jumping Attacks
;=====================================================================
[State -1]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl 

[State -1]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl 

[State -1]
type = ChangeState
value = 620
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl 

[State -1]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl 

[State -1]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = statetype = A
trigger1 = ctrl 

[State -1]
type = ChangeState
value = 650
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl

;=====================================================================
; Taunts
;=====================================================================
[State -1]
type = ChangeState
value = 195
triggerall = !var(59)
triggerall = Command = "s"
trigger1 = StateType = S
trigger1 = Ctrl = 1


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
var(59) = random < var(58)*900

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 6
trigger1 = p2movetype != A
var(59) = random < var(58)*800

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 5
trigger1 = p2movetype != A
var(59) = random < var(58)*750

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 4
trigger1 = p2movetype != A
var(59) = random < var(58)*700

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 3
trigger1 = p2movetype != A
var(59) = random < var(58)*600

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 2
trigger1 = p2movetype != A
var(59) = random < var(58)*500

[State -2, ScaleVar59]
type = VarSet
trigger1 = AILevel = 1
trigger1 = p2movetype != A
var(59) = random < var(58)*400

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

[State -3]; Guard
type = ChangeState
value = 130
triggerall = var(59)
triggerall = p2statetype != C
triggerall = inguarddist
trigger1 = statetype != A && ctrl
[State -3]
type = ChangeState
value = 131
triggerall = var(59)
triggerall = p2statetype = C
triggerall = inguarddist
trigger1 = statetype != A && ctrl
[State -3]
type = ChangeState
value = 132
triggerall = var(59)
triggerall = inguarddist
trigger1 = statetype = A && ctrl


[State -1, Nomal Jump]
Type = ChangeState
value = 42
triggerall = Var(59)
triggerall = roundstate = 2
triggerall = StateType != A
trigger1 = Enemynear, Parentdist x < 40
trigger1 = Enemynear, NumProj = 1
trigger1 = random < 999
trigger1 = ctrl

[State -1, Walk Fwd]
Type = ChangeState
value = 21
triggerall = var(59)
triggerall = roundstate = 2
triggerall = StateType != A
triggerall = ctrl
triggerall = p2bodydist X > 30
triggerall = random <= 999
trigger1 = p2statetype = L
trigger2 = Enemynear, Anim = 21

[State -1, Hop Back]
Type = ChangeState
value = 250
triggerall = var(59)
triggerall = roundstate = 2
triggerall = StateType != A
triggerall = ctrl
triggerall = p2bodydist X < 80
triggerall = random <= 500
trigger1 = p2statetype = A

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


[State -1] ;spinning punch
type = ChangeState
value = 1000
triggerall = random < var(59)*100 && roundstate = 2
triggerall = p2statetype = A
triggerall = statetype != A
triggerall = ctrl
trigger1 = p2statetype = A
trigger1 = p2bodydist X = [90,110]
trigger1 = random <= 500
trigger2 = p2bodydist X < 60
trigger2 = p2stateno = [600,699]
trigger2 = random <= 900

[State -1] ;Aletazo punch
type = ChangeState
value = 1120
triggerall = random < var(59)*100 && roundstate = 2
triggerall = p2statetype != L
triggerall = statetype != A
triggerall = ctrl
trigger1 = p2bodydist X = [150,220]
trigger1 = random < 500
trigger2 = EnemyNear, Anim = 20 || p2stateno = 42
trigger2 = random < 999

[State -1] ;screw pile driver
type = ChangeState
value = 1260
triggerall = AILevel > 3 && roundstate = 2
triggerall = p2statetype != A && p2statetype != L
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [0,30]

[State -1] ;aerial slam
type = ChangeState
value = 1370
triggerall = AILevel > 3 && roundstate = 2
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A
triggerall = p2statetype != A && p2statetype != L
trigger1 = ctrl
trigger1 = p2bodydist X = [0,30]

; Final Atomic Buster
[State -1]
type = ChangeState
value = 3700
triggerall = AILevel > 5 && roundstate = 2
triggerall = random < var(59)*80 && roundstate = 2
triggerall = Power >= 3000 && p2bodydist X > 200
triggerall = statetype != A
triggerall = p2statetype != L
triggerall = EnemyNear, Pos Y > -20 && EnemyNear, Pos Y < 0
trigger1 = ctrl

[State -1]
type = ChangeState
value = 3000
triggerall = Power >= 1000
triggerall = p2statetype != A && p2statetype != L
triggerall = random < var(59)*100 && AILevel > 3 && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [0,30]
[State -1]
type = ChangeState
value = 3100
triggerall = Power >= 2000
triggerall = p2statetype != A && p2statetype != L
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [0,30]
[State -1]
type = ChangeState
value = 3200
triggerall = Power >= 3000
triggerall = p2statetype != A && p2statetype != L
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [0,30]

; Aerial Russian Slam
[State -1]
type = ChangeState
value = 3300
triggerall = random < var(59)*50 && AILevel > 3 && roundstate = 2
triggerall = Power >= 3000
triggerall = p2statetype = A && p2statetype != L
triggerall = p2stateno < 600
triggerall = p2bodydist y < -60
triggerall = p2bodydist X = [-5,70]
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2life < 1000
[State -1]
type = ChangeState
value = 3400
triggerall = random < var(59)*50 && roundstate = 2
triggerall = Power >= 2000
triggerall = p2statetype = A && p2statetype != L
triggerall = p2stateno < 600
triggerall = p2bodydist y < -60
triggerall = p2bodydist X = [-5,60]
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2life < 1000
[State -1]
type = ChangeState
value = 3500
triggerall = random < var(59)*50 && roundstate = 2
triggerall = Power >= 1000
triggerall = p2statetype = A && p2statetype != L
triggerall = p2stateno < 600
triggerall = p2bodydist y < -60
triggerall = p2bodydist X = [-5,50]
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2life < 1000

; flame
[State -1]
type = ChangeState
value = 3600
triggerall = random < var(59)*10 && roundstate = 2
triggerall = StateType != A
triggerall = Power >= 1000
triggerall = p2bodydist X > 150 && p2bodydist X < 250
trigger1 = EnemyNear, Pos Y > -20 && EnemyNear, Pos Y < 0
trigger1 = Ctrl


[State -1]
type = ChangeState
value = 240
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [30,70]
trigger1 = p2stateno = [1000,1999]
trigger1 = random < 500

[State -1]
type = ChangeState
value = 220
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [30,70]
trigger1 = p2stateno = [1000,1999]
trigger1 = random < 500

[State -1]
type = ChangeState
value = 210
triggerall = random < var(59)*100 && roundstate = 2
triggerall = P2BodyDist X <= 25
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist Y < -30
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
[State -1]
type = ChangeState
value = 410
triggerall = random < var(59)*100 && roundstate = 2
triggerall = P2BodyDist X <= 25
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist Y = [-70,20]
[State -1]
type = ChangeState
value = 200
triggerall = random < var(59)*100 && roundstate = 2
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype = A
trigger1 = p2bodydist X = [26,60]
trigger1 = p2bodydist Y = [-70,20]
[State -1]
type = ChangeState
value = 430
triggerall = random < var(59)*100 && AILevel > 3 && roundstate = 2 && teammode = single
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [-5,30]
trigger1 = p2movetype != H || p2bodydist X < 30
trigger1 = p2stateno != [150,153]
[State -1]
type = ChangeState
value = 440
triggerall = random < var(59)*100 && AILevel > 3 && roundstate = 2 && teammode = single
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [-5,70]
trigger1 = p2stateno != [152,153]
[State -1]
type = ChangeState
value = 600
triggerall = var(59) && roundstate = 2
triggerall = statetype = A
trigger1 = ctrl 
trigger1 = Vel X != 0
trigger1 = p2statetype = A || vel Y > 0
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2bodydist Y = [-70,60]
[State -1]
type = ChangeState
value = 620
triggerall = var(59) && roundstate = 2
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
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2statetype = A || vel Y > 0
trigger1 = p2bodydist X = [-5,30]
trigger1 = p2bodydist Y = [-90,0]
[State -1]
type = ChangeState
value = 650
triggerall = var(59) && AILevel > 3 && roundstate = 2
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,80]
trigger1 = p2bodydist Y = [0,110]
trigger1 = p2statetype = A || vel Y > 0