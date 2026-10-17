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

;-| Super Motions |---------------------------------------------------

; Super Motion 3
[Command]
name = "MAXIMUM"
command = ~D, DB, B, D, DB, B, x
time = 30
[Command]
name = "MAXIMUM"
command = ~D, DB, B, D, DB, B, y
time = 30
[Command]
name = "MAXIMUM"
command = ~D, DB, B, D, DB, B, z
time = 30

; Super Motion 2
[Command]
name = "Super2_S"
command = ~D, DF, F, D, DF, F, z
time = 35
[Command]
name = "Super2_M"
command = ~D, DF, F, D, DF, F, y
time = 35
[Command]
name = "Super2_M"
command = ~D, DF, F, D, DF, F, z
time = 35
[Command]
name = "Super2_W"
command = ~D, DF, F, D, DF, F, x
time = 35
[Command]
name = "Super2_W"
command = ~D, DF, F, D, DF, F, y
time = 35
[Command]
name = "Super2_W"
command = ~D, DF, F, D, DF, F, z
time = 35

[Command]
name = "ri"
command = ~50$B, F, B, F, x+y+z
time = 35

[Command]
name = "rid_c"
command = ~50$B, F, B, F, z
time = 35
[Command]
name = "rid_b"
command = ~50$B, F, B, F, y
time = 35
[Command]
name = "rid_b"
command = ~50$B, F, B, F, z
time = 35
[Command]
name = "rid_a"
command = ~50$B, F, B, F, x
time = 35
[Command]
name = "rid_a"
command = ~50$B, F, B, F, y
time = 35
[Command]
name = "rid_a"
command = ~50$B, F, B, F, z
time = 35

[Command]
name = "sm_c"
command = ~50$B, F, B, F, c
time = 35
[Command]
name = "sm_b"
command = ~50$B, F, B, F, b
time = 35
[Command]
name = "sm_b"
command = ~50$B, F, B, F, c
time = 35
[Command]
name = "sm_a"
command = ~50$B, F, B, F, a
time = 35
[Command]
name = "sm_a"
command = ~50$B, F, B, F, b
time = 35
[Command]
name = "sm_a"
command = ~50$B, F, B, F, c
time = 35

;-| Special Motions |-------------------------------------------------
[Command]
name = "Claw"
command = /D, x+a
time = 16

[Command]
name = "rcf_a"
command = ~50$B, F, x
time = 20
[Command]
name = "rcf_b"
command = ~50$B, F, y
time = 20
[Command]
name = "rcf_c"
command = ~50$B, F, z
time = 20

[Command]
name = "wj"
command = ~50$D,$U, a
time = 20
[Command]
name = "wj"
command = ~50$D,$U, b
time = 20
[Command]
name = "wj"
command = ~50$D,$U, c
time = 20

[Command]
name = "shc_a"
command = ~50$D,$U, x
time = 20
[Command]
name = "shc_b"
command = ~50$D,$U, y
time = 20
[Command]
name = "shc_c"
command = ~50$D,$U, z
time = 20

[Command]
name = "st_a"
command = ~50$B, F, a
time = 20
[Command]
name = "st_b"
command = ~50$B, F, b
time = 20
[Command]
name = "st_c"
command = ~50$B, F, c
time = 20

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
command = x+a
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

;-| Dir + Button |----------------------------------------------------
[Command]
name = "fwd_c"
command = /F,c
time = 1

[Command]
name = "down_b"
command = /$D, b
time = 1

;------------------- Street Fighter Zero 3
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

;------------------------ Balrog Only
[Command]
name = "holdupback"
command = /UB
time = 1

[Command]
name = "holdupfwd"
command = /UF
time = 1

;=====================================================================
; State Entry for Commands
;=====================================================================

[Statedef -1]

;=====================================================================
; Super Arts
;=====================================================================
[State -1]
type = ChangeState
value = 3400
triggerall = Command = "ri"
triggerall = Power >= 3000
triggerall = StateType != A
trigger1 = Ctrl
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact

[State -1]
type = ChangeState
value = 3320
triggerall = Command = "sm_c"
triggerall = Power >= 3000
triggerall = StateType != A
trigger1 = Ctrl
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact
[State -1]
type = ChangeState
value = 3310
triggerall = Command = "sm_b"
triggerall = Power >= 2000
triggerall = StateType != A
trigger1 = Ctrl
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact
[State -1]
type = ChangeState
value = 3300
triggerall = Command = "sm_a"
triggerall = Power >= 1000
triggerall = StateType != A
trigger1 = Ctrl
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact

[State -1]
type = ChangeState
value = 3200
triggerall = Command = "rid_c"
triggerall = Power >= 3000
triggerall = StateType != A
trigger1 = Ctrl
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact
[State -1]
type = ChangeState
value = 3100
triggerall = Command = "rid_b"
triggerall = Power >= 2000
triggerall = StateType != A
trigger1 = Ctrl
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact
[State -1]
type = ChangeState
value = 3000
triggerall = Command = "rid_a"
triggerall = Power >= 1000
triggerall = StateType != A
trigger1 = Ctrl
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact

;=====================================================================
; Special Arts 
;=====================================================================
[State -1, claw]
type = ChangeState
value = 29000
trigger1 = Command = "Claw"
triggerall = abs(Pos X - Helper(28000), Pos X) < 10
trigger1 = var(29) = 1
triggerall = statetype != A
trigger1 = ctrl = 1

; Salto de fe
[State -1]
type = ChangeState
value = 1100
triggerall = Command = "wj"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact

; Rodar hacia adelante
[State -1]
type = ChangeState
value = 1000
triggerall = Command = "rcf_a"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact
[State -1]
type = ChangeState
value = 1010
triggerall = Command = "rcf_b"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact
[State -1]
type = ChangeState
value = 1020
triggerall = Command = "rcf_c"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact

; Variante de Sumersault
[State -1]
type = ChangeState
value = 1300
triggerall = Command = "st_a"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact
[State -1]
type = ChangeState
value = 1310
triggerall = Command = "st_b"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact
[State -1]
type = ChangeState
value = 1320
triggerall = Command = "st_c"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact

; Torpedo
[State -1]
type = ChangeState
value = 1200
triggerall = Command = "shc_a"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact
[State -1]
type = ChangeState
value = 1260
triggerall = Command = "shc_b"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact
[State -1]
type = ChangeState
value = 1280
triggerall = Command = "shc_c"
triggerall = statetype != A
trigger1 = ctrl = 1
trigger2 = stateno = 40
trigger3 = stateno = 200 && MoveContact
trigger4 = stateno = 230 && MoveContact
trigger5 = stateno = 240 && MoveContact
trigger6 = stateno = 400 && MoveContact
trigger7 = stateno = 430 && MoveContact
trigger8 = stateno = 440 && MoveContact

;=====================================================================
; Special Attacks , Moves and so on.
;=====================================================================
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

;=====================================================================
; Basic Animation
;=====================================================================
;RunFwd
[State -1]
type = ChangeState
value = 100
triggerall = Command = "FF"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger1 = StateNo != 100

;---------------------------------------------------------------------
;RunBack
[State -1]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl = 1

;---------------------------------------------------------------------
; Grapple Attacks

[State -1]
type = ChangeState
value = 800
triggerall = StateNo != 100
triggerall = StateType = S
triggerall = Ctrl = 1
trigger1 = Command = "BT"
[State -1]
type = ChangeState
value = 850
triggerall = StateNo != 100
triggerall = StateType = S
triggerall = Ctrl = 1
trigger1 = Command = "FT"

; Air, front
[State -1]
type = ChangeState
value = 900
triggerall = StateType = A
triggerall = Ctrl = 1
trigger1 = Command = "FT"
; Air, back
[State -1]
type = ChangeState
value = 950
triggerall = StateType = A
triggerall = Ctrl = 1
trigger1 = Command = "BT"

;---------------------------------------------------------------------
; Rebote en los muros
[State -1]
type = ChangeState
value = 4300
triggerall = StateType = A
triggerall = Vel X < 0 && Pos Y <= -50 && Ctrl = 1
triggerall = BackEdgeDist <= 20
trigger1 = Command = "holdfwd" && !Command = "holddown"

[State -1]
type = ChangeState
value = 4350
triggerall = StateType = A
triggerall = Vel X > 0 && Pos Y <= -50 && Ctrl = 1
triggerall = FrontEdgeDist <= 20
trigger1 = Command = "holdback" && !Command = "holddown"

;---------------------------------------------------------------------
; Dir + Button
[State -1]
type = ChangeState
value = 300
triggerall = StateType = S
triggerall = Ctrl = 1
trigger1 = Command = "fwd_c"

;---------------------------------------------------------------------
; En pie
[State -1]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = ctrl = 1
trigger1 = statetype = S

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

;---------------------------------------------------------------------
; Ataques agachado
[State -1]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

[State -1]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

[State -1]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

[State -1]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

[State -1]
type = ChangeState
value = 440
triggerall = Command = "b"
triggerall = Command = "holddown"
trigger1 = StateType = C
trigger1 = Ctrl = 1

[State -1]
type = ChangeState
value = 450
triggerall = Command = "c"
triggerall = Command = "holddown"
trigger1 = StateType = C
trigger1 = Ctrl = 1

;---------------------------------------------------------
; Ataques aereos
[State -1]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

[State -1]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

[State -1]
type = ChangeState
value = 620
triggerall = command = "z"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

[State -1]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

[State -1]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

[State -1]
type = ChangeState
value = 650
triggerall = command = "c"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

;---------------------------------------------------------------------
; Burla
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
trigger2 = p2bodydist x > 200
trigger2 = random <= 999

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

[State -1, claw]
type = ChangeState
value = 29000
triggerall = var(59) && Enemynear, NumProj = 0 && AILevel > 3
triggerall = abs(Pos X - Helper(28000), Pos X) < 50
trigger1 = var(29) = 1
triggerall = statetype != A
trigger1 = ctrl = 1

[State -1]
type = ChangeState
value = 3310
triggerall = Power >= 2000
triggerall = random < var(59)*20 && AILevel > 2
triggerall = statetype != A
triggerall = ctrl
trigger1 = p2movetype = A
trigger2 = movehit
[State -1]
type = ChangeState
value = 3300
triggerall = Power >= 1000
triggerall = random < var(59)*20 && AILevel > 2
triggerall = statetype != A
triggerall = ctrl
trigger1 = p2movetype = A
trigger2 = movehit


[State -1]
type = ChangeState
value = 3400
triggerall = Power >= 3000
triggerall = var(59) && AILevel > 5
triggerall = P2BodyDist X = [-5,30]
triggerall = statetype != A
triggerall = ctrl
trigger1 = p2movetype = A
trigger2 = movehit

[State -1]; Chain
type = ChangeState
value = 450
triggerall = random < var(59)*100 && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = statetype != A
triggerall = P2BodyDist X = [40,70]
trigger1 = ctrl
trigger1 = p2statetype = S
trigger1 = p2movetype != H

;Chain combo
[State -1]; Chain
type = ChangeState
value = 240
triggerall = random < var(59)*100 && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = statetype != A
trigger1 = ctrl
triggerall = P2BodyDist X < 40
trigger1 = p2movetype != H
[State -1, WP AI]; Chain
type = ChangeState
value = 400
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = movehit
trigger1 = stateno = 240
[State -1, WP AI]; Chain
type = ChangeState
value = 430
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = movehit
trigger1 = stateno = 400
[State -1, MP AI]; Chain
type = ChangeState
value = 440
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = movehit
trigger1 = stateno = 430
[State -1, SP AI]; Chain
type = ChangeState
value = 1000
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = movecontact
triggerall = Power <= 666
trigger1 = stateno = 440
[State -1, SP AI]; Chain
type = ChangeState
value = 1300
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = movecontact
triggerall = Power <= 666
trigger1 = stateno = 440

[State -1]
type = ChangeState
value = 1020
triggerall = random < var(59)*100
triggerall = statetype != A
trigger1 = random < 50
trigger1 = EnemyNear, life < 1000
trigger1 = ctrl
trigger1 = p2bodydist X = [70, 100]
[State -1]
type = ChangeState
value = 1010
triggerall = random < var(59)*100
triggerall = statetype != A
trigger1 = random < 50
trigger1 = EnemyNear, life < 1000
trigger1 = ctrl
trigger1 = p2bodydist X = [70, 100]
[State -1]
type = ChangeState
value = 1000
triggerall = random < var(59)*100
triggerall = statetype != A
trigger1 = random < 50
trigger1 = EnemyNear, life < 1000
trigger1 = ctrl
trigger1 = p2bodydist X = [70, 100]

[State -1]
type = ChangeState
value = 1320
triggerall = random < var(59)*100 && AILevel > 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5, 60]
trigger1 = p2movetype = A
[State -1]
type = ChangeState
value = 1310
triggerall = random < var(59)*100 && AILevel > 3 && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5, 60]
trigger1 = p2movetype = A
[State -1]
type = ChangeState
value = 1300
triggerall = random < var(59)*100 && AILevel > 3 && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5, 60]
trigger1 = p2movetype = A

[State -1]
type = ChangeState
value = 1200
triggerall = random < var(59)*20
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2bodydist X  > 60
trigger1 = p2bodydist Y < 0
trigger1 = random <= 300


[State -1]
type = ChangeState
value = 1400
triggerall = StageVar(info.name) = "Requena Spiral Tower - Spain" || StageVar(info.name) = "Vega Boss"
triggerall = p2life < 300
triggerall = random < var(59)*10
triggerall = statetype != A
trigger1 = ctrl
trigger1 = random <= 999
[State -1] ;chain
type = ChangeState
value = 1160
triggerall = var(59)
triggerall = p2bodydist X = [-5, 60]
triggerall = random <= 999
trigger1 = StageVar(info.name) = "Requena Spiral Tower - Spain" || StageVar(info.name) = "Vega Boss"
trigger1 = (stateno = 1125 || stateno = 1130) && Time = 40

[State -1, Throw_1]
type = ChangeState
value = 800
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [-5,10]

[State -1, Throw_2]
type = ChangeState
value = 900
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [-5,10]

[State -1, AirThrow_1]
type = ChangeState
value = 950
triggerall = random < var(59)*100 && roundstate = 2
triggerall = statetype != A
trigger1 = ctrl
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [-5,10]



[State -1, AI Run Fwd]
type = ChangeState
value = 100
triggerall = (var(59) = 1)
triggerall = stateno != 20 && stateno != 100
trigger1 = (p2movetype != A) && statetype != A && ctrl
trigger1 = (p2bodydist x = [40,150]) ;&& (p2bodydist y = [-100,0])
trigger1 = random < 700 && enemy,vel x <= 0 

[State -1, AI Run Bwd]
type = ChangeState
value = 105
triggerall = var(59) = 1
triggerall = StateType != A
triggerall = !isHelper
triggerall = enemynear,movetype != A
triggerall = StateNo != [100,106]
triggerall = roundstate = 2
triggerall = alive = 1
triggerall = enemynear,alive != 0
triggerall = Ctrl
trigger1 = enemynear,stateno != 5200
trigger1 = enemynear,statetype = l
trigger1 = p2bodydist X < 10
trigger1 = backedgebodydist > 10
trigger2 = enemynear,hitdefattr = sca,ht,nt,st || enemynear,hitdefattr = a,at
trigger2 = p2bodydist X < 50

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
value = 300
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
trigger1 = statetype != A
trigger1 = p2statetype != C
trigger1 = ctrl
trigger1 = p2bodydist X = [50,90]

[State -1]
type = ChangeState
value = 230
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
value = 210
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
trigger1 = p2bodydist X = [26,60]
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
[State -1]
type = ChangeState
value = 440
triggerall = var(59) && AILevel > 3 && roundstate = 2 && teammode = single
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
triggerall = var(59) && roundstate = 2
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,80]
trigger1 = p2bodydist Y = [0,110]
trigger1 = p2statetype = A || vel Y > 0