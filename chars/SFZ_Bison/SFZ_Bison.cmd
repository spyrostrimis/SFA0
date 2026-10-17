;===========================================================================
;-| AI Motions |------------------------------------------------------------
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

;-| Super Motions |--------------------------------------------------------
; Super Psycho Crusher
[Command]
name = "Ultimate"
command = ~40$B, F, B, F, z
Time = 40
[Command]
name = "Crusher2"
command = ~40$B, F, B, F, y
Time = 40
[Command]
name = "Crusher2"
command = ~40$B, F, B, F, z
Time = 40
[Command]
name = "Crusher1"
command = ~40$B, F, B, F, x
Time = 40
[Command]
name = "Crusher1"
command = ~40$B, F, B, F, y
Time = 40
[Command]
name = "Crusher1"
command = ~40$B, F, B, F, z
Time = 40

; Knee Press Nightmare
[Command]
name = "Nightmare3"
command = ~40$B, F, B, F, c
Time = 40
[Command]
name = "Nightmare2"
command = ~40$B, F, B, F, b
Time = 40
[Command]
name = "Nightmare2"
command = ~40$B, F, B, F, c
Time = 40
[Command]
name = "Nightmare1"
command = ~40$B, F, B, F, a
Time = 40
[Command]
name = "Nightmare1"
command = ~40$B, F, B, F, b
Time = 40
[Command]
name = "Nightmare1"
command = ~40$B, F, B, F, c
Time = 40

;-| Special Motions |------------------------------------------------------
; Psycho Shot
[Command]
name = "Shoot_W"
command = ~40$B, F, x
Time = 20
[Command]
name = "Shoot_M"
command = ~40$B, F, y
Time = 20
[Command]
name = "Shoot_S"
command = ~40$B, F, z
Time = 20


; Teleport
[Command]
name = "Teleport_F_P"
command = ~F, D, DF, x+y+z
Time = 20
; Super Jump
[Command]
name = "Teleport_B_P"
command = ~B, D, DB, x+y+z
Time = 20
; Super Jump
[Command]
name = "Teleport_F_K"
command = ~F, D, DF, a+b+c
Time = 20
; Super Jump
[Command]
name = "Teleport_B_K"
command = ~B, D, DB, a+b+c
Time = 20

; Super Jump
[Command]
name = "Jump"
command = ~40$D, $U, x
Time = 20
[Command]
name = "Jump"
command = ~40$D, $U, y
Time = 20
[Command]
name = "Jump"
command = ~40$D, $U, z
Time = 20

; Skull Dive
[Command]
name = "Dive"
command = ~40$D, $U, a
Time = 20
[Command]
name = "Dive"
command = ~40$D, $U, b
Time = 20
[Command]
name = "Dive"
command = ~40$D, $U, c
Time = 20

; Mega Psycho Shot
[Command]
name = "M-Shoot_W"
command = ~F, B, DB, D, DF, F, x
Time = 20
[Command]
name = "M-Shoot_M"
command = ~F, B, DB, D, DF, F, y
Time = 20
[Command]
name = "M-Shoot_S"
command = ~F, B, DB, D, DF, F, z
Time = 20

; Double Knee Press
[Command]
name = "Knee_W"
command = ~40$B, F, a
Time = 20
[Command]
name = "Knee_M"
command = ~40$B, F, b
Time = 20
[Command]
name = "Knee_S"
command = ~40$B, F, c
Time = 20

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F,F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B,B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery" ;Required (do not remove)
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

[Command]
name = "Shaking"
command = B, F
time = 10
[Command]
name = "Shaking"
command = F, B
time = 10

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "fwd_z"
command = /$F,z
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
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
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

;-| Hold Button |---------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;-| Hold Dir |------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

;---------------------------------------------------------------------------
;===========================================================================
[Statedef -1]
;===========================================================================
;---------------------------------------------------------------------------
; Super Moves
;---------------------------------------------------------------------------
[State -1, Ultimate Psycho Crusher]
type = ChangeState
value = 3000
triggerall = Var(59) = 0
triggerall = command = "Ultimate"
triggerall = Power >= 3000
triggerall = statetype!= A
trigger1 = ctrl

[State -1, Double Knee Press Nightmare]
type = ChangeState
value = 3100
triggerall = Var(59) = 0
triggerall = command = "Nightmare3"
triggerall = Power >= 3000
triggerall = statetype!= A
trigger1 = ctrl

[State -1, Double Knee Press Nightmare]
type = ChangeState
value = 3110
triggerall = Var(59) = 0
triggerall = command = "Nightmare2"
triggerall = Power >= 2000
triggerall = statetype!= A
trigger1 = ctrl

[State -1, Double Knee Press Nightmare]
type = ChangeState
value = 3120
triggerall = Var(59) = 0
triggerall = command = "Nightmare1"
triggerall = Power >= 1000
triggerall = statetype!= A
trigger1 = ctrl


[State -1, Psycho Crusher 2]
type = ChangeState
value = 1610
triggerall = Var(59) = 0
triggerall = command = "Crusher2"
triggerall = Power >= 2000
triggerall = statetype!= A
trigger1 = ctrl

[State -1, Psycho Crusher 1]
type = ChangeState
value = 1600
triggerall = Var(59) = 0
triggerall = command = "Crusher1"
triggerall = Power >= 1000
triggerall = statetype!= A
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
; Special Moves
;---------------------------------------------------------------------------
[State -1, Mega Psycho-Shoot W]
type = ChangeState
value = 1500
triggerall = Var(59) = 0
triggerall = command = "M-Shoot_W"
triggerall = statetype!= A
trigger1 = ctrl
[State -1, Mega Psycho-Shoot M]
type = ChangeState
value = 1510
triggerall = Var(59) = 0
triggerall = command = "M-Shoot_M"
triggerall = statetype!= A
trigger1 = ctrl
[State -1, Mega Psycho-Shoot S]
type = ChangeState
value = 1520
triggerall = Var(59) = 0
triggerall = command = "M-Shoot_S"
triggerall = statetype!= A
trigger1 = ctrl

[State -1, Teleport]
type = ChangeState
value = 1400
triggerall = Var(59) = 0
triggerall = (command = "Teleport_F_P" || command = "Teleport_F_K" || command = "Teleport_B_P" || command = "Teleport_B_K" )
triggerall = statetype!= A
trigger1 = ctrl

[State -1, Jump]
type = ChangeState
value = 1300
triggerall = Var(59) = 0
triggerall = command = "Jump"
triggerall = statetype!= A
trigger1 = ctrl
trigger2 = stateno = 40

[State -1, Dive]
type = ChangeState
value = 1200
triggerall = Var(59) = 0
triggerall = command = "Dive"
triggerall = statetype!= A
trigger1 = ctrl
trigger2 = stateno = 40

[State -1, Knee W]
type = ChangeState
value = 1100
triggerall = Var(59) = 0
triggerall = command = "Knee_W"
triggerall = statetype!= A
trigger1 = ctrl
[State -1, Knee M]
type = ChangeState
value = 1110
triggerall = Var(59) = 0
triggerall = command = "Knee_M"
triggerall = statetype!= A
trigger1 = ctrl
[State -1, Knee S]
type = ChangeState
value = 1120
triggerall = Var(59) = 0
triggerall = command = "Knee_S"
triggerall = statetype!= A
trigger1 = ctrl

[State -1, Psycho-Shoot W]
type = ChangeState
value = 1000
triggerall = Var(59) = 0
triggerall = command = "Shoot_W"
triggerall = statetype!= A
trigger1 = ctrl
[State -1, Psycho-Shoot M]
type = ChangeState
value = 1010
triggerall = Var(59) = 0
triggerall = command = "Shoot_M"
triggerall = statetype!= A
trigger1 = ctrl
[State -1, Psycho-Shoot S]
type = ChangeState
value = 1020
triggerall = Var(59) = 0
triggerall = command = "Shoot_S"
triggerall = statetype!= A
trigger1 = ctrl


;---------------------------------------------------------------------------
; Run
;---------------------------------------------------------------------------
;RunFwd
[State -1]
type = ChangeState
value = 100
triggerall = Var(59) = 0
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl = 1

;RunBack
[State -1]
type = ChangeState
value = 105
triggerall = Var(59) = 0
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl = 1

;---------------------------------------------------------------------------
; Agarres
;---------------------------------------------------------------------------
; Front Grapple
[State -1]
type = ChangeState
value = 850
triggerall = Var(59) = 0
triggerall = Command = "FT"
trigger1 = StateType = S
trigger1 = Ctrl

; Back Grapple
[State -1]
type = ChangeState
value = 800
triggerall = Var(59) = 0
triggerall = Command = "BT"
trigger1 = StateType = S
trigger1 = Ctrl

; Air Front Grapple
[State -1]
type = ChangeState
value = 900
triggerall = Var(59) = 0
triggerall = Command = "AT"
trigger1 = StateType = A
trigger1 = Ctrl

;---------------------------------------------------------------------------
; CvS/SFZ skills
;---------------------------------------------------------------------------
; Zero Counter
[State -1]
type = ChangeState
value = 2600
triggerall = Command = "ZC"
triggerall = statetype != A
triggerall = p2bodydist X = [-50,50]
triggerall = Power >= 1000
trigger1 = StateNo = [150,153]  
ignorhitpause = 1

;---------------------------------------------------------------------------
; Dir+Button
;---------------------------------------------------------------------------
[State -1]
type = ChangeState
value = 300
triggerall = Var(59) = 0
triggerall = command = "fwd_z"
triggerall = command != "holddown"
trigger1 = statetype!= A
trigger1 = ctrl

[State -1]
type = ChangeState
value = 310
triggerall = Var(59) = 0
triggerall = command = "fwd_z"
triggerall = command = "holddown"
trigger1 = statetype!= A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Closed Attacks
;---------------------------------------------------------------------------
; MPC
[State -1]
type = ChangeState
value = 215
triggerall = Var(59) = 0
triggerall = P2BodyDist X < 35
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

; SPC
[State -1]
type = ChangeState
value = 225
triggerall = Var(59) = 0
triggerall = P2BodyDist X < 35
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

; MKC
[State -1]
type = ChangeState
value = 245
triggerall = Var(59) = 0
triggerall = P2BodyDist X < 35
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

; SKC
[State -1]
type = ChangeState
value = 255
triggerall = Var(59) = 0
triggerall = P2BodyDist X < 35
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Normal Attacks
;---------------------------------------------------------------------------
; WP
[State -1]
type = ChangeState
value = 200
triggerall = Var(59) = 0
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl 

; MP
[State -1]
type = ChangeState
value = 210
triggerall = Var(59) = 0
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

; SP
[State -1]
type = ChangeState
value = 220
triggerall = Var(59) = 0
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
 
; WK
[State -1]
type = ChangeState
value = 230
triggerall = Var(59) = 0
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

; MK
[State -1]
type = ChangeState
value = 240
triggerall = Var(59) = 0
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

; SK
[State -1]
type = ChangeState
value = 250
triggerall = Var(59) = 0
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouch attack
;---------------------------------------------------------------------------
; WP
[State -1]
type = ChangeState
value = 400
triggerall = Var(59) = 0
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl 

; MP
[State -1]
type = ChangeState
value = 410
triggerall = Var(59) = 0
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl 

; SP
[State -1]
type = ChangeState
value = 420
triggerall = Var(59) = 0
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

; WK
[State -1]
type = ChangeState
value = 430
triggerall = Var(59) = 0
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

; MK
[State -1]
type = ChangeState
value = 440
triggerall = Var(59) = 0
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl 

; SK
[State -1]
type = ChangeState
value = 450
triggerall = Var(59) = 0
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl 

;---------------------------------------------------------------------------
; Air Attacks
;---------------------------------------------------------------------------
; WP
[State -1]
type = ChangeState
value = 600
triggerall = Var(59) = 0
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl 

; MP
[State -1]
type = ChangeState
value = 610
triggerall = Var(59) = 0
triggerall = command = "y"
triggerall = statetype = A
triggerall = vel x = 0
trigger1 = ctrl

; MP
[State -1]
type = ChangeState
value = 615
triggerall = Var(59) = 0
triggerall = command = "y"
triggerall = statetype = A
triggerall = vel x!= 0
trigger1 = ctrl

; SP
[State -1]
type = ChangeState
value = 620
triggerall = Var(59) = 0
triggerall = command = "z"
triggerall = statetype = A
triggerall = vel x = 0
trigger1 = ctrl

; SP
[State -1]
type = ChangeState
value = 625
triggerall = Var(59) = 0
triggerall = command = "z"
triggerall = statetype = A
triggerall = vel x!= 0
trigger1 = ctrl

; WK
[State -1]
type = ChangeState
value = 630
triggerall = Var(59) = 0
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl 

; MK
[State -1]
type = ChangeState
value = 640
triggerall = Var(59) = 0
triggerall = command = "b"
triggerall = statetype = A
triggerall = vel x = 0
trigger1 = ctrl

; MK
[State -1]
type = ChangeState
value = 645
triggerall = Var(59) = 0
triggerall = command = "b"
triggerall = statetype = A
triggerall = vel x!= 0
trigger1 = ctrl

; SK
[State -1]
type = ChangeState
value = 650
triggerall = Var(59) = 0
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl 

;---------------------------------------------------------------------------
; Burla
;---------------------------------------------------------------------------
[State -1]
type = ChangeState
value = 195
triggerall = Var(59) = 0
triggerall = command = "s"
triggerall = statetype = S
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
;
;                      A . I .   S E C T I O N .
;
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
trigger1 = p2movetype = A
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

[State -1]
type = ChangeState
value = 2600
triggerall = random < var(59)*100 && random < 10 && roundstate = 2
trigger1 = statetype != A
triggerall = p2bodydist X = [-50,50]
triggerall = Power >= 1000
trigger1 = StateNo = [150,153]  
ignorhitpause = 1

;recover
[State -1,rev]
type = ChangeState
value = 5210
triggerall = Var(59) && roundstate = 2
triggerall = !var(16)
triggerall = roundstate = 2
triggerall = Alive
triggerall = CanRecover
triggerall = Vel Y > -1
triggerall = Pos Y >= -40
triggerall = StateNo = 5050
trigger1 = random = [150,200]

;---------------------------------------------------------------------------
; DMs
;-----
[State AI, Ultimate Crusher]
type = ChangeState
value = 3000
triggerall = var(59) && roundstate = 2
triggerall = (AILevel < 5 && matchno >= 10) || (AILevel >= 5 && matchno >= 5)
triggerall = p2stateno = [5030,5050]
triggerall = power = 3000
triggerall = p2bodydist X < 150 && p2bodydist X > -10 && enemy,vel y >= 0
triggerall = p2bodydist Y = [1,60]
triggerall = p2movetype = H
triggerall = ctrl && statetype != A
triggerall = random <= 999
trigger1 = p2statetype = A
trigger2 = MoveHit

[State AI, Lv2 Psycho Crusher]
type = ChangeState
value = 1610
triggerall = var(59) && roundstate = 2
triggerall = matchno < 10
triggerall = power >= 2000
triggerall = p2statetype != A
triggerall = statetype != A
triggerall = movehit
trigger1 = stateno = 300

[State AI, Lv1 Psycho Crusher]
type = ChangeState
value = 1600
triggerall = var(59) && roundstate = 2
triggerall = matchno < 10
triggerall = power >= 1000
triggerall = p2statetype != A
triggerall = statetype != A
triggerall = movehit
trigger1 = stateno = 300

;---------------------------------------------------------------------------
; Combos P1
;-----------

[State AI, WK crouch]
type = ChangeState
value = 430
triggerall = (var(59) && AILevel > 3 && Random%5=1)
triggerall = p2stateno != [5050,5121]
triggerall = roundstate = 2
triggerall = p2statetype != A
triggerall = p2statetype != C
triggerall = ctrl && statetype != A
triggerall = p2bodydist x = [0,30]
trigger1 = ctrl

[State AI, SP close]
type = ChangeState
value = 300
triggerall = var(59) && AILevel > 3 && roundstate = 2
triggerall = p2stateno != [5050,5121]
triggerall = roundstate = 2
triggerall = p2statetype != A
triggerall = ctrl && statetype != A
triggerall = p2bodydist x = [0,30]
triggerall = p2movetype = H
triggerall = statetype = S
trigger1 = ctrl

[State AI, grapple]
type = ChangeState
value = 800
triggerall = (var(59) && AILevel > 3 && Random%5=1)
triggerall = p2stateno != [5050,5121]
triggerall = roundstate = 2
triggerall = p2statetype != A
triggerall = ctrl && statetype != A
triggerall = p2bodydist x = [0,30]
trigger1 = ctrl

[State AI, Teleport]
type = ChangeState
value = 1400
triggerall = (var(59) && AILevel > 3 && Random%5=1)
triggerall = p2stateno != [5050,5121]
triggerall = roundstate = 2
triggerall = p2statetype != A
triggerall = ctrl && statetype != A
triggerall = (p2bodydist x = [0,30]) || (p2bodydist x = [150,300])
triggerall = p2movetype = A
trigger1 = ctrl

[State AI, Crouch fr Psycho Shoot S]
type = ChangeState
value = 11
triggerall = p2statetype != A
triggerall = statetype != A
trigger1 = random < var(59)*990
trigger1 = ctrl
trigger1 = p2bodydist x > 200
trigger1 = stateno != 1020
trigger1 = life > p2life
trigger1 = (Enemynear,NumProj) = 0

[State AI, Psycho Shoot S]
type = ChangeState
value = 1020
triggerall = p2statetype != A
triggerall = statetype != A
trigger1 = random < var(59)*500 && roundstate = 2
trigger1 = moveguarded
trigger1 = stateno = 300
trigger2 = NumProj = 0
trigger2 = statetype = C
trigger2 = var(59) && roundstate = 2
trigger2 = p2bodydist x > 200
trigger2 = ctrl
trigger3 = random < var(59)*10
trigger3 = stateno = 11
trigger3 = p2bodydist X > 250
trigger3 = ctrl

[State AI, Double Knee S]
type = ChangeState
value = 1120
triggerall = p2statetype != A
triggerall = statetype != A
trigger1 = random < var(59)*500 && roundstate = 2
trigger1 = moveguarded
trigger1 = stateno = 300
trigger2 = NumProj = 0
trigger2 = statetype = C
trigger2 = var(59) && roundstate = 2
trigger2 = p2bodydist x > 200
trigger2 = ctrl
trigger3 = random < var(59)*100
trigger3 = ctrl
trigger3 = p2bodydist X = [40,60]
trigger3 = p2statetype = C



[State AI, WK crouch]
type = ChangeState
value = 430
triggerall = random < var(59)*70 && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = p2statetype = S
triggerall = statetype != A
triggerall = moveguarded
triggerall = p2stateno = [120,152]
trigger1 = (stateno = 1120 || stateno = 1100)
trigger1 = animtime = 0

[State AI, WK crouch]
type = ChangeState
value = 240
triggerall = random < var(59)*70 && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = p2statetype = C
triggerall = statetype != A
triggerall = moveguarded
triggerall = p2stateno = [120,152]
trigger1 = (stateno = 1120 || stateno = 1100)
trigger1 = animtime = 0

[State AI, WK crouch]
type = ChangeState
value = 400
triggerall = random < var(59)*70 && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = p2statetype = S
triggerall = statetype != A
triggerall = moveguarded
triggerall = p2stateno = [120,152]
trigger1 = (stateno = 1120 || stateno = 1100)
trigger1 = animtime = 0

[State AI, WP crouch]
type = ChangeState
value = 210
triggerall = random < var(59)*70 && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = p2statetype = C
triggerall = statetype != A
triggerall = moveguarded
triggerall = p2stateno = [120,152]
trigger1 = (stateno = 1120 || stateno = 1100)
trigger1 = animtime = 0

[State AI, WP Close]
type = ChangeState
value = 300
triggerall = var(59) != 0 && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = p2statetype != A
triggerall = statetype != A
triggerall = movecontact
trigger1 = stateno = 430

[State AI, Jump Attack]
type = ChangeState
value = 1300
triggerall = var(59) != 0 && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = p2statetype != A
triggerall = statetype != A
triggerall = movecontact
triggerall = p2bodydist x = [0,170]
trigger1 = stateno = 430

;---------------------------------------------------------------------------
; Attack
;-------
[State AI, WK Crouch]
type = ChangeState
value = 430
triggerall = random < var(59)*70 && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = p2stateno != [5050,5121]
triggerall = roundstate = 2
triggerall = p2statetype != C
triggerall = p2statetype != A
triggerall = ctrl && statetype != A
triggerall = p2bodydist x = [0,30]
triggerall = statetype = S
trigger1 = ctrl

[State AI, Psycho Shoot W]
type = ChangeState
value = 1000
triggerall = var(59) != 0
triggerall = numprojID(1600) = 0
triggerall = random <= 350
triggerall = p2stateno = 5120
triggerall = ctrl && statetype != A
triggerall = p2bodydist x = [30,120]
trigger1 = ctrl

[State AI, Psycho Shoot S]
type = ChangeState
value = 1020
triggerall = var(59) != 0
triggerall = numprojID(1600) = 0
triggerall = random <= 350
triggerall = p2stateno = 5120
triggerall = ctrl && statetype != A
triggerall = p2bodydist x = [200,400]
trigger1 = ctrl

[State AI, Jump Attack]
type = ChangeState
value = 1200
triggerall = var(59) != 0
triggerall = p2statetype != A
triggerall = RoundState = 2
triggerall = random <= 400
triggerall = p2bodydist x = [200,400]
trigger1 = ctrl && enemynear,NumProj && statetype != A && random = [20,300]
trigger2 = inguarddist = [90,120]
trigger2 = ctrl && enemynear,NumProj && statetype != A

[State -1,AI-Common1]
type = ChangeState
value = 1300
triggerall = random < var(59)*30
triggerall = p2statetype != A
triggerall = p2stateno != [5030,5120]
triggerall = stateno != 1200 && statetype = S && ctrl
trigger1 = p2bodydist x > 100 &&  p2movetype != A
trigger2 = P2StateNo > 5000
trigger2 = P2bodyDist X = [18,45]
trigger2 = Ctrl

[State AI, Skull Dive Attack]
type = ChangeState
value = 1310
triggerall = var(59) != 0
triggerall = RoundState = 2
trigger1 = stateno = 1300 && Vel Y >= 0 && Pos Y < -50

[State -1, Psycho-Shoot W]
type = ChangeState
value = 1000
triggerall = var(59) != 0
triggerall = Statetype = S && !Numproj
trigger1 = Ctrl
trigger1 = P2bodydist X = [50,120]
trigger1 = Random < Var(59)*1


[State -1,AI-Common1]
type = ChangeState
value = 1200
triggerall = random < var(59)*30
triggerall = p2statetype != A
triggerall = p2stateno != [5030,5120]
triggerall = stateno != 1200 && statetype = S && ctrl
trigger1 = p2bodydist x > 100 &&  p2movetype != A
trigger2 = P2StateNo > 5000
trigger2 = P2bodyDist X != [18,45]
trigger2 = Ctrl

;--------------
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


[State -1]
type = ChangeState
value = 310
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [50,120]
trigger1 = p2stateno = [152,153]

[State -1]
type = ChangeState
value = 225
triggerall = var(59) && roundstate = 2
triggerall = P2BodyDist X <= 25
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist Y < -30
[State -1]
type = ChangeState
value = 420
triggerall = var(59) && roundstate = 2
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist X = [26,30]
trigger1 = p2bodydist Y < -30
[State -1]
type = ChangeState
value = 205
triggerall = var(59) && roundstate = 2 && teammode = single
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
trigger1 = p2bodydist X = [26,60]
trigger1 = p2bodydist Y = [-70,20]
[State -1]
type = ChangeState
value = 430
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [-5,40]
trigger1 = p2movetype != H || p2bodydist X < 40
trigger1 = p2stateno != [150,153]
[State -1]
type = ChangeState
value = 440
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2stateno != [152,153]
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
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2bodydist Y = [0,70]
trigger1 = p2statetype = A
[State -1]
type = ChangeState
value = 630
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
trigger1 = p2bodydist X = [-5,80]
trigger1 = p2bodydist Y = [0,110]
trigger1 = p2statetype = A

;===========================================================================
;                                                   E N D   O F   F I L E .
;===========================================================================