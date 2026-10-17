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
;--------------------------------------------------------------------------
;-| Super Motions |--------------------------------------------------------
;--------------------------------------------------------------------------
; The Birdie
[command]
name = "supercharge3"
command = ~50$B, F, B, F, z
time = 30
[command]
name = "supercharge2"
command = ~50$B, F, B, F, y
time = 30
[command]
name = "supercharge2"
command = ~50$B, F, B, F, z
time = 30
[command]
name = "supercharge1"
command = ~50$B, F, B, F, x
time = 30
[command]
name = "supercharge1"
command = ~50$B, F, B, F, y
time = 30
[command]
name = "supercharge1"
command = ~50$B, F, B, F, z
time = 30

; Bull Revenger
[command]
name = "2qcfp3"
command = ~D, F, ~D, F, z
time = 30
[command]
name = "2qcfp2"
command = ~D, F, ~D, F, y
time = 30
[command]
name = "2qcfp2"
command = ~D, F, ~D, F, z
time = 30
[command]
name = "2qcfp1"
command = ~D, F, ~D, F, x
time = 30
[command]
name = "2qcfp1"
command = ~D, F, ~D, F, y
time = 30
[command]
name = "2qcfp1"
command = ~D, F, ~D, F, z
time = 30

[command]
name = "2qcfk3"
command = ~D, F, ~D, F, c
time = 30
[command]
name = "2qcfk2"
command = ~D, F, ~D, F, b
time = 30
[command]
name = "2qcfk2"
command = ~D, F, ~D, F, c
time = 30
[command]
name = "2qcfk1"
command = ~D, F, ~D, F, a
time = 30
[command]
name = "2qcfk1"
command = ~D, F, ~D, F, b
time = 30
[command]
name = "2qcfk1"
command = ~D, F, ~D, F, c
time = 30

;--------------------------------------------------------------------------
;-| Special Motions |------------------------------------------------------
;--------------------------------------------------------------------------

[Command]
name = "murderx"
command = ~F,DF,D,DB,B,x
time = 20
[Command]
name = "murdery"
command = ~F,DF,D,DB,B,y
time = 20
[Command]
name = "murderz"
command = ~F,DF,D,DB,B,z
time = 20

[Command]
name = "bandita"
command = ~F,DF,D,DB,B,a
time = 20
[Command]
name = "banditb"
command = ~F,DF,D,DB,B,b
time = 20
[Command]
name = "banditc"
command = ~F,DF,D,DB,B,c
time = 20

[Command]
name = "esbull1"
command = ~50$B,F,a
time = 10
[Command]
name = "esbull2"
command = ~50$B,F, b
time = 10
[Command]
name = "esbull3"
command = ~50$B,F,c
time = 10

[Command]
name = "bull1"
command = ~50$B, F, x
time = 10
[Command]
name = "bull2"
command = ~50$B, F, y
time = 10
[Command]
name = "bull3"
command = ~50$B, F, z
time = 10

;--------------------------------------------------------------------------
;-| Double Tap |-----------------------------------------------------------
;--------------------------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;--------------------------------------------------------------------------
;-| 2/3 Button Combination |-----------------------------------------------
;--------------------------------------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+a
time = 1

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
name = "FT"
command = x+y
time = 1

[Command]
name = "FT"
command = y+z
time = 1

[Command]
name = "FT"
command = x+z
time = 1

[Command]
name = "BT"
command = a+c
time = 1

[Command]
name = "BT"
command = a+b
time = 1

[Command]
name = "BT"
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

;--------------------------------------------------------------------------
;-| Dir + Button |---------------------------------------------------------
;--------------------------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;--------------------------------------------------------------------------
;-| Single Button |---------------------------------------------------------
;--------------------------------------------------------------------------

[Command]
name = "a"
command = a
time = 1

[Command]
name = "hold_a"
command = /$a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "hold_b"
command = /$b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "hold_c"
command = /$c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "hold_x"
command = /$x
time = 1

[Command]
name = "rel_x"
command = ~x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "hold_y"
command = /$y
time = 1

[Command]
name = "rel_y"
command = ~y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "hold_z"
command = /$z
time = 1

[Command]
name = "rel_z"
command = ~z
time = 1

[Command]
name = "Shaking"
command = B, F
time = 10
[Command]
name = "Shaking"
command = F, B
time = 10

[Command]
name = "start"
command = s
time = 1

[Command]
name = "hold_start"
command = /$s
time = 1

[Command]
name = "sjump"
command = ~D, U
time = 5

;--------------------------------------------------------------------------
;-| Hold Dir |--------------------------------------------------------------
;--------------------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;--------------------------------------------------------------------------
;==========================================================================
[Statedef -1]
;==========================================================================
;--------------------------------------------------------------------------
[State -1, Combo Reset]
type = VarSet
trigger1 = 1
var(20) = 0

[State -1, Combo Check]
type = VarSet
triggerall = StateType != A
triggerall = HitDefAttr = SC, NA
trigger1 = (StateNo = [200,299]) || (StateNo = [400,499])
trigger1 = StateNo != 200
trigger1 = StateNo != 220
trigger1 = StateNo != 230
trigger1 = StateNo != 400
trigger1 = StateNo != 420
trigger1 = StateNo != 430
var(20) = 1

;--------------------------------------------------------------------------
[State -1]
type = ChangeState
value = 3220
triggerall = Power >= 3000
triggerall = command = "2qcfp3"
triggerall = statetype != A
triggerall = !var(59)
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 3210
triggerall = Power >= 2000
triggerall = command = "2qcfp2"
triggerall = statetype != A
triggerall = !var(59)
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 3200
triggerall = Power >= 1000
triggerall = command = "2qcfp1"
triggerall = statetype != A
triggerall = !var(59)
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact

[State -1]
type = ChangeState
value = 3120
triggerall = Power >= 3000
triggerall = command = "2qcfk3"
triggerall = statetype != A
triggerall = !var(59)
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 3110
triggerall = Power >= 2000
triggerall = command = "2qcfk2"
triggerall = statetype != A
triggerall = !var(59)
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 3100
triggerall = Power >= 1000
triggerall = command = "2qcfk1"
triggerall = statetype != A
triggerall = !var(59)
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact

[State -1]
type = ChangeState
value = 3020
triggerall = Power >= 3000
triggerall = command = "supercharge3"
triggerall = statetype != A
triggerall = !var(59)
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 3010
triggerall = Power >= 2000
triggerall = command = "supercharge2"
triggerall = statetype != A
triggerall = !var(59)
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 3000
triggerall = Power >= 1000
triggerall = command = "supercharge1"
triggerall = statetype != A
triggerall = !var(59)
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact

;--------------------------------------------------------------------------
[State -1]
type = ChangeState
value = 1350
triggerall = Power >= 500
triggerall = command = "esbull1"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 1360
triggerall = Power >= 500
triggerall = command = "esbull2"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 1370
triggerall = Power >= 500
triggerall = command = "esbull3"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 1300
triggerall = command = "bull1"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 1310
triggerall = command = "bull2"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 1320
triggerall = command = "bull3"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact

[State -1]
type = ChangeState
value = 1100
triggerall = command = "bandita"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 1101
triggerall = command = "banditb"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 1102
triggerall = command = "banditc"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact

[State -1]
type = ChangeState
value = 1000
triggerall = command = "murderx"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 1001
triggerall = command = "murdery"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact
[State -1]
type = ChangeState
value = 1002
triggerall = command = "murderz"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 420 && MoveContact
trigger8 = StateNo = 430 && MoveContact

;--------------------------------------------------------------------------
; Catapulta
[State -1]
type = ChangeState
value = 850
trigger1 = command = "BT"
trigger1 = statetype = S
trigger1 = ctrl

; Cabezazos
[State -1]
type = ChangeState
value = 800
trigger1 = command = "FT"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, Air Throw]
type = ChangeState
value = 900
triggerall = command = "AT"
trigger1 = statetype = A
trigger1 = ctrl

;------------------------------
; Zero Counter
[State -1]
type = ChangeState
value = 2600
triggerall = Command = "ZC"
triggerall = p2bodydist X = [-50,50]
triggerall = Power >= 1000
triggerall = statetype != A
trigger1 = StateNo = [150,153]  
ignorhitpause = 1

;--------------------------------------------------------------------------
; Dash adelante
[State -1]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

; Dash atras
[State -1]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; D+SP
[State -1]
type = ChangeState
value = 300
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = A
trigger1 = ctrl

; SP Close
[State -1]
type = ChangeState
value = 225
triggerall = P2BodyDist X < 35
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

; DB+SK
[State -1]
type = ChangeState
value = 310
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = command = "holdback"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 210 && MoveContact
trigger4 = StateNo = 230 && MoveContact
trigger5 = StateNo = 400 && MoveContact
trigger6 = StateNo = 410 && MoveContact
trigger7 = StateNo = 430 && MoveContact

;---------------------------------------------------------------------------
; WP
[State -1]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 400 && MoveContact

; MP
[State -1]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

; SP
[State -1]
type = ChangeState
value = 220
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

; WK
[State -1]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

; MK
[State -1]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

; SK
[State -1]
type = ChangeState
value = 250
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; WP
[State -1]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = StateNo = 200 && MoveContact
trigger3 = StateNo = 400 && MoveContact

; MP
[State -1]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

; SP
[State -1]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = StateNo = 400 && MoveContact

; WK
[State -1]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

; MK
[State -1]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

; SK
[State -1]
type = ChangeState
value = 450
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; WP
[State -1]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

; MP
[State -1]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl

; SP
[State -1]
type = ChangeState
value = 620
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl

; WK
[State -1]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl

; MK
[State -1]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl

; SK
[State -1]
type = ChangeState
value = 650
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = !var(59)
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

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

; ------------------------------------------------------------------------

;Counter
[State -1, blocking Flag Re]
Type = VarSet
triggerall= fvar(27) != 0
trigger1 = Enemynear,ctrl || Enemynear,movetype = H || movetype = A
trigger2 = Enemynear,life <= 0 || p2bodydist X > 90 || stateno = 800
fvar(27) = 0
IgnoreHitPause = 1

[State -1, Walk Toward Enemy]
Type = ChangeState
value = 21 ; walk forward
triggerall = var(59) && roundstate = 2
triggerall = statetype != A
triggerall = ctrl
triggerall = AILevel > 1
trigger1 = p2bodydist X > 100 && p2bodydist X < 300
trigger1 = random < 700

[State -1, Walk Back]
Type = ChangeState
value = 22 
triggerall = var(59) && AILevel > 3 && roundstate = 2
triggerall = roundstate = 2
triggerall = StateType != A
triggerall = ctrl
triggerall = random <= 300
trigger1 = p2bodydist X = [90,130]


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
triggerall = Var(59) = 1
triggerall = !var(16)
triggerall = roundstate = 2
triggerall = Alive
triggerall = CanRecover
triggerall = Vel Y > -1
triggerall = Pos Y >= -40
triggerall = StateNo = 5050
trigger1 = random = [150,200]


[State -1]
type = ChangeState
value = 1002
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A && p2statetype != L
triggerall = p2statetype = S && p2movetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,30]
[State -1]
type = ChangeState
value = 1001
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A && p2statetype != L
triggerall = p2statetype = S && p2movetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,30]
[State -1]
type = ChangeState
value = 1000
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A && p2statetype != L
triggerall = p2statetype = S && p2movetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,30]

[State -1]
type = ChangeState
value = 1102
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A && p2statetype != L
triggerall = p2statetype = S && p2movetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,30]
[State -1]
type = ChangeState
value = 1101
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A && p2statetype != L
triggerall = p2statetype = S && p2movetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,30]
[State -1]
type = ChangeState
value = 1100
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A && p2statetype != L
triggerall = p2statetype = S && p2movetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,30]

[State -1]
type = ChangeState
value = 1350
triggerall = random < var(59)*60 && roundstate = 2
triggerall = statetype != A && p2statetype != L
triggerall = p2statetype = A && p2movetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [40,80]
[State -1]
type = ChangeState
value = 1360
triggerall = random < var(59)*60 && roundstate = 2
triggerall = statetype != A && p2statetype != L
triggerall = p2statetype = A && p2movetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [40,80]
[State -1]
type = ChangeState
value = 1370
triggerall = random < var(59)*60 && roundstate = 2
triggerall = statetype != A && p2statetype != L
triggerall = p2statetype = A && p2movetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [40,80]
[State -1]
type = ChangeState
value = 1320
triggerall = random < var(59)*60 && roundstate = 2
triggerall = statetype != A && p2statetype != L
triggerall = p2statetype = A && p2movetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [40,80]
[State -1]
type = ChangeState
value = 1310
triggerall = random < var(59)*60 && roundstate = 2
triggerall = statetype != A && p2statetype != L
triggerall = p2statetype = A && p2movetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [40,80]
[State -1]
type = ChangeState
value = 1300
triggerall = random < var(59)*60 && roundstate = 2
triggerall = statetype != A
triggerall = p2statetype = A && p2movetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [40,80]

[State -1]
type = ChangeState
value = 3220
triggerall = random < var(59)*100 && roundstate = 2 && AILevel > 5
triggerall = Power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X > 170
trigger1 = p2statetype != L
trigger1 = p2movetype != A
[State -1]
type = ChangeState
value = 3110
triggerall = random < var(59)*100 && roundstate = 2 && AILevel > 5
triggerall = Power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X > 100
trigger1 = p2statetype != L
trigger1 = p2movetype != A
[State -1]
type = ChangeState
value = 3100
triggerall = random < var(59)*100 && roundstate = 2 && AILevel > 5
triggerall = Power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X > 80
trigger1 = p2statetype != L
trigger1 = p2movetype != A

[State -1]
type = ChangeState
value = 3020
triggerall = random < var(59)*100 && roundstate = 2 && AILevel > 5
triggerall = Power >= 3000
triggerall = statetype != A
trigger1 = p2bodydist X < 100
trigger1 = movehit && stateno < 700
[State -1]
type = ChangeState
value = 3010
triggerall = random < var(59)*100 && roundstate = 2 && AILevel > 5
triggerall = Power >= 2000
triggerall = statetype != A
trigger1 = p2bodydist X < 100
trigger1 = movehit && stateno < 700
[State -1]
type = ChangeState
value = 3000
triggerall = random < var(59)*100 && roundstate = 2 && AILevel > 5
triggerall = Power >= 1000
triggerall = statetype != A
trigger1 = p2bodydist X < 100
trigger1 = movehit && stateno < 700

[State -1]
type = ChangeState
value = 310
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = statetype != A
triggerall = ctrl
triggerall = p2bodydist X = [60,100]
trigger1 = random < 100
trigger2 = p2stateno = [152,153]

[State -1]
type = ChangeState
value = 220
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = statetype != A
triggerall = ctrl
triggerall = p2bodydist X = [50,90]
trigger1 = random < 100
trigger2 = p2stateno = [152,153]

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
value = 225
triggerall = var(59) && roundstate = 2
triggerall = P2BodyDist X <= 25
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = S
[State -1]
type = ChangeState
value = 420
triggerall = var(59) && roundstate = 2
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist X = [26,60]
trigger1 = p2bodydist Y < -30
[State -1]
type = ChangeState
value = 205
triggerall = var(59) && roundstate = 2
triggerall = P2BodyDist X <= 25
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist Y = [-70,20]
[State -1]
type = ChangeState
value = 200
triggerall = var(59) && roundstate = 2
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype = A
trigger1 = p2bodydist X = [26,40]
trigger1 = p2bodydist Y = [-70,20]
[State -1]
type = ChangeState
value = 430
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2movetype != H || p2bodydist X < 40
trigger1 = p2stateno != [150,153]
trigger1 = random < 100
[State -1]
type = ChangeState
value = 440
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [50,90]
trigger1 = p2stateno != [152,153]
trigger1 = random < 100
[State -1]
type = ChangeState
value = 600
triggerall = var(59) && roundstate = 2
triggerall = statetype = A
trigger1 = ctrl 
trigger1 = Vel X != 0
trigger1 = p2statetype = A
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2bodydist Y = [-70,60]
[State -1]
type = ChangeState
value = 620
triggerall = var(59) && roundstate = 2
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,80]
trigger1 = p2bodydist Y = [0,70]
trigger1 = p2statetype = A
[State -1]
type = ChangeState
value = 635
triggerall = var(59) && roundstate = 2
triggerall = statetype = A
trigger1 = ctrl 
trigger1 = p2bodydist X = [-5,20]
trigger1 = p2bodydist Y = [-60,100]
trigger1 = p2statetype = A
[State -1]
type = ChangeState
value = 640
triggerall = var(59) && roundstate = 2
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2bodydist X = [-5,30]
trigger1 = p2bodydist Y = [-90,0]
[State -1]
type = ChangeState
value = 650
triggerall = var(59) && roundstate = 2
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,110]
trigger1 = p2bodydist Y = [0,80]
trigger1 = p2statetype = A || vel Y > 0

;==========================================================================
; E N D   O F   F I L E .
;==========================================================================