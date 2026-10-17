;Juli's Commands
;By: The Impaler
;Initial Release: 1/11/2001

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

;***************SUPER MOTIONS******************

;-|Roll|--------------------------------------------------
[Command]
name = "Roll"
command = ~D, DF, F, D, DF, F, x
time = 30

[Command]
name = "Roll"
command = ~D, DF, F, D, DF, F, y
time = 30

[Command]
name = "Roll"
command = ~D, DF, F, D, DF, F, z
time = 30

;-|Reverse Shaft Breaker|--------------------------------------------------
[Command]
name = "RSB_c"
command = ~D, DB, B, D, DB, B, c
time = 30

[Command]
name = "RSB_b"
command = ~D, DB, B, D, DB, B, b
time = 30

[Command]
name = "RSB_b"
command = ~D, DB, B, D, DB, B, c
time = 30
[Command]
name = "RSB_a"
command = ~D, DB, B, D, DB, B, a
time = 30

[Command]
name = "RSB_a"
command = ~D, DB, B, D, DB, B, b
time = 30

[Command]
name = "RSB_a"
command = ~D, DB, B, D, DB, B, c
time = 30

;-|Spin Drive Smasher|-----------------------------------------------------
[Command]
name = "SDS_c"
command = ~D, DF, F, D, DF, F, c
time = 30

[Command]
name = "SDS_b"
command = ~D, DF, F, D, DF, F, b
time = 30

[Command]
name = "SDS_b"
command = ~D, DF, F, D, DF, F, c
time = 30
[Command]
name = "SDS_a"
command = ~D, DF, F, D, DF, F, a
time = 30

[Command]
name = "SDS_a"
command = ~D, DF, F, D, DF, F, b
time = 30

[Command]
name = "SDS_a"
command = ~D, DF, F, D, DF, F, c
time = 30

;-| Special Motions |------------------------------------------------------
;-----------------
; HCF
;-|Spin Knuckle|-------------------
[Command]
name = "HCF_x"
command = ~F, DF, D, DB, B, x
time = 15

[Command]
name = "HCF_y"
command = ~F, DF, D, DB, B, y
time = 15

[Command]
name = "HCF_z"
command = ~F, DF, D, DB, B, z
time = 15

; Cannon Spike
[Command]
name = "uppercut_a"
command = ~F, D, F, a

[Command]
name = "uppercut_b"
command = ~F, D, F, b

[Command]
name = "uppercut_c"
command = ~F, D, F, c

; Spiral Arrow
;[Command]
;name = "QCF_a"
;command = ~D, DF, F, a

;[Command]
;name = "QCF_b"
;command = ~D, DF, F, b

;[Command]
;name = "QCF_c"
;command = ~D, DF, F, c

;-----------------
; Sniping Arrow
[Command]
name = "QCB_a"
command = ~D, DF, F, a

[Command]
name = "QCB_b"
command = ~D, DF, F, b

[Command]
name = "QCB_c"
command = ~D, DF, F, c
;--------------------
;Charge_Down_up
[Command]
name = "chargedownup_a"
command = ~60$D, U, a
time = 10

[Command]
name = "chargedownup_b"
command = ~60$D, U, b
time = 10

[Command]
name = "chargedownup_c"
command = ~60$D, U, c
time = 10

[Command]
name = "chargedownup_x"
command = ~60$D, U, x
time = 10

[Command]
name = "chargedownup_y"
command = ~60$D, U, y
time = 10

[Command]
name = "chargedownup_z"
command = ~60$D, U, z
time = 10

;--------------------
;Charge_Back_fwd
[Command]
name = "chargebackfwd_a"
command = ~60$B, F, a
time = 10

[Command]
name = "chargebackfwd_b"
command = ~60$B, F, b
time = 10

[Command]
name = "chargedownup_c"
command = ~60$D, U, c
time = 10

[Command]
name = "chargedownup_x"
command = ~60$D, U, x
time = 10

[Command]
name = "chargedownup_y"
command = ~60$D, U, y
time = 10

[Command]
name = "chargedownup_z"
command = ~60$D, U, z
time = 10

[Command]
name = "ESMASH"
command = ~B, F, x
time = 10

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "GREENBALLFAST"
command = ~F, F, a+b
time = 20

[Command]
name = "GREENBALLSLOW"
command = ~B, B, a+b
time = 20

[Command]
name = "TELEA"
command = ~D, D, a
time = 20

[Command]
name = "TELEB"
command = ~D, D, b
time = 20

[Command]
name = "TELEX"
command = ~D, D, x
time = 20

[Command]
name = "TELEY"
command = ~D, D, y
time = 20

[Command]
name = "ACID"
command = ~F, F, b
time = 20

[Command]
name = "LOWSPEAR"       
command = F, F, a
time = 18

[Command]
name = "SPEAR"       
command = B, B, a
time = 18

[Command]
name = "AICLONETHROW"
command = ~F, F, x
time = 15

[Command]
name = "AISHADOWSLAM"
command = ~B, B, x
time = 15

[Command]
name = "FF"       ;Required (do not remove)
command = F, F
time = 15

[Command]
name = "BB"       ;Required (do not remove)
command = B, B
time = 15

;-| 2/3 Button Combination |-----------------------------------------------

; サイコチャージβ
[Command]
name = "pcb"
command = a+b+c
time = 1

[Command]
name = "recovery" ;Required (do not remove)
command = x+a
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
name = "THROW1"
command = /F,a
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
name = "fwd_b"
command = /F,b
time = 1

[Command]
name = "fwd_c"
command = a+b
time = 1

[Command]
name = "fwd_c"
command = b+c
time = 1

[Command]
name = "fwd_c"
command = a+c
time = 1

[Command]
name = "fwd_z"
command = x+y
time = 1

[Command]
name = "fwd_z"
command = y+z
time = 1

[Command]
name = "fwd_z"
command = x+z
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
name = "Roundhouse"
command = /B,y
time = 1

[Command]
name = "THROW2"
command = /B,a
time = 1

[Command]
name = "back_z"
command = /B,z
time = 1

[Command]
name = "back_c"
command = /B,c
time = 1

[Command]
name = "CLP"
command = /$D,a
time = 1

[Command]
name = "Uppercut"
command = /$D,b
time = 1

[Command]
name = "CLK"
command = /$D,x
time = 1

[Command]
name = "CHK"
command = /$D,y
time = 1

[Command]
name = "fwd_ab"
command = /F, a+b
time = 1

[Command]
name = "SLIDE"
command = /B, a+x
time = 1

[Command]
name = "parry" 
command = x+y+z
time = 30

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

;-| Hold Button |-----------------------------------------------------------
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

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd"  ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup"   ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Statedef -1]


;***********Hyper Attacks*************

;-|Roll|------------------------------------------------
[State -1]
type = ChangeState
value = 3800
triggerall = command = "Roll"
triggerall = power >= 3000 ;Level 3
triggerall = numhelper(3300) = 0
triggerall = numhelper(3310) = 0
triggerall = numhelper(3400) = 0
triggerall = numhelper(3410) = 0
triggerall = numhelper(3500) = 0
triggerall = numhelper(3510) = 0
triggerall = numhelper(3810) = 0
triggerall = numhelper(3820) = 0
triggerall = numhelper(3830) = 0
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

;-|Reverse Shaft Breaker C|------------------------------------------------
[State -1]
type = ChangeState
value = 3000
triggerall = command = "RSB_c"
triggerall = power >= 3000 ;Level 3
triggerall = numhelper(3300) = 0
triggerall = numhelper(3310) = 0
triggerall = numhelper(3400) = 0
triggerall = numhelper(3410) = 0
triggerall = numhelper(3500) = 0
triggerall = numhelper(3510) = 0
triggerall = numhelper(3810) = 0
triggerall = numhelper(3820) = 0
triggerall = numhelper(3830) = 0
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

;-|Reverse Shaft Breaker B|------------------------------------------------
[State -1]
type = ChangeState
value = 3010
triggerall = command = "RSB_b"
triggerall = power >= 2000 ;Level 2
triggerall = numhelper(3300) = 0
triggerall = numhelper(3310) = 0
triggerall = numhelper(3400) = 0
triggerall = numhelper(3410) = 0
triggerall = numhelper(3500) = 0
triggerall = numhelper(3510) = 0
triggerall = numhelper(3810) = 0
triggerall = numhelper(3820) = 0
triggerall = numhelper(3830) = 0
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208
trigger15 = movecontact = 1
trigger15 = stateno = 3121

;-|Reverse Shaft Breaker A|------------------------------------------------
[State -1]
type = ChangeState
value = 3020
triggerall = command = "RSB_a"
triggerall = power >= 1000 ;Level 1
triggerall = numhelper(3300) = 0
triggerall = numhelper(3310) = 0
triggerall = numhelper(3400) = 0
triggerall = numhelper(3410) = 0
triggerall = numhelper(3500) = 0
triggerall = numhelper(3510) = 0
triggerall = numhelper(3810) = 0
triggerall = numhelper(3820) = 0
triggerall = numhelper(3830) = 0
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208
trigger15 = movecontact = 1
trigger15 = stateno = 3121
trigger16 = movecontact = 1
trigger16 = stateno = 3111

;-|Spin Drive Smasher C|---------------------------------------------------
[State -1]
type = ChangeState
value = 3100
triggerall = command = "SDS_c"
triggerall = power >= 3000 ;Level 3
triggerall = numhelper(3300) = 0
triggerall = numhelper(3310) = 0
triggerall = numhelper(3400) = 0
triggerall = numhelper(3410) = 0
triggerall = numhelper(3500) = 0
triggerall = numhelper(3510) = 0
triggerall = numhelper(3810) = 0
triggerall = numhelper(3820) = 0
triggerall = numhelper(3830) = 0
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

;-|Spin Drive Smasher B|---------------------------------------------------
[State -1]
type = ChangeState
value = 3110
triggerall = command = "SDS_b"
triggerall = power >= 2000 ;Level 2
triggerall = numhelper(3300) = 0
triggerall = numhelper(3310) = 0
triggerall = numhelper(3400) = 0
triggerall = numhelper(3410) = 0
triggerall = numhelper(3500) = 0
triggerall = numhelper(3510) = 0
triggerall = numhelper(3810) = 0
triggerall = numhelper(3820) = 0
triggerall = numhelper(3830) = 0
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

;-|Spin Drive Smasher A|---------------------------------------------------
[State -1]
type = ChangeState
value = 3120
triggerall = command = "SDS_a"
triggerall = power >= 1000 ;Level 1
triggerall = numhelper(3300) = 0
triggerall = numhelper(3310) = 0
triggerall = numhelper(3400) = 0
triggerall = numhelper(3410) = 0
triggerall = numhelper(3500) = 0
triggerall = numhelper(3510) = 0
triggerall = numhelper(3810) = 0
triggerall = numhelper(3820) = 0
triggerall = numhelper(3830) = 0
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

;**********Special Attacks***********

[State -1]
type = ChangeState
value = 6202
triggerall = Command = "pcb"
triggerall = StateType != A
trigger1 = Ctrl = 1

;Cannon Spike
[State -1]
type = changestate
value = 1000
triggerall = command = "uppercut_a"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

[State -1]
type = changestate
value = 1005
triggerall = command = "uppercut_b"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

[State -1]
type = changestate
value = 1006
triggerall = command = "uppercut_c"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

;Spiral Arrow A
;[State -1]
;type = changestate
;value = 1100
;triggerall = command = "QCF_a"
;trigger1 = statetype = S
;trigger1 = ctrl = 1
;trigger2 = movecontact = 1 
;trigger2 = stateno = 200 
;trigger3 = movecontact = 1 
;trigger3 = stateno = 204 
;trigger4 = movecontact = 1 
;trigger4 = stateno = 201 
;trigger5 = movecontact = 1 
;trigger5 = stateno = 205 
;trigger6 = movecontact = 1 
;trigger6 = stateno = 404
;trigger7 = movecontact = 1
;trigger7 = stateno = 400 
;trigger8 = movecontact = 1 
;trigger8 = stateno = 401
;trigger9 = movecontact = 1
;trigger9 = stateno = 405
;trigger10 = movecontact = 1
;trigger10 = stateno = 203
;trigger11 = movecontact = 1
;trigger11 = stateno = 206
;trigger12 = movecontact = 1
;trigger12 = stateno = 402
;trigger13 = movecontact = 1
;trigger13 = stateno = 406
;trigger14 = movecontact = 1
;trigger14 = stateno = 208


;Spiral Arrow B
;[State -1]
;type = changestate
;value = 1110
;triggerall = command = "QCF_b"
;trigger1 = statetype = S
;trigger1 = ctrl = 1
;trigger2 = movecontact = 1 
;trigger2 = stateno = 200 
;trigger3 = movecontact = 1 
;trigger3 = stateno = 204 
;trigger4 = movecontact = 1 
;trigger4 = stateno = 201 
;trigger5 = movecontact = 1 
;trigger5 = stateno = 205 
;trigger6 = movecontact = 1 
;trigger6 = stateno = 404
;trigger7 = movecontact = 1
;trigger7 = stateno = 400 
;trigger8 = movecontact = 1 
;trigger8 = stateno = 401
;trigger9 = movecontact = 1
;trigger9 = stateno = 405
;trigger10 = movecontact = 1
;trigger10 = stateno = 203
;trigger11 = movecontact = 1
;trigger11 = stateno = 206
;trigger12 = movecontact = 1
;trigger12 = stateno = 402
;trigger13 = movecontact = 1
;trigger13 = stateno = 406
;trigger14 = movecontact = 1
;trigger14 = stateno = 208

;Spiral Arrow C
;[State -1]
;type = changestate
;value = 1120
;triggerall = command = "QCF_c"
;trigger1 = statetype = S
;trigger1 = ctrl = 1
;trigger2 = movecontact = 1 
;trigger2 = stateno = 200 
;trigger3 = movecontact = 1 
;trigger3 = stateno = 204 
;trigger4 = movecontact = 1 
;trigger4 = stateno = 201 
;trigger5 = movecontact = 1 
;trigger5 = stateno = 205 
;trigger6 = movecontact = 1 
;trigger6 = stateno = 404
;trigger7 = movecontact = 1
;trigger7 = stateno = 400 
;trigger8 = movecontact = 1 
;trigger8 = stateno = 401
;trigger9 = movecontact = 1
;trigger9 = stateno = 405
;trigger10 = movecontact = 1
;trigger10 = stateno = 203
;trigger11 = movecontact = 1
;trigger11 = stateno = 206
;trigger12 = movecontact = 1
;trigger12 = stateno = 402
;trigger13 = movecontact = 1
;trigger13 = stateno = 406
;trigger14 = movecontact = 1
;trigger14 = stateno = 208

;Sniping Arrow A
[State -1]
type = changestate
value = 2000
triggerall = command = "QCB_a"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

;Sniping Arrow B
[State -1]
type = changestate
value = 2010
triggerall = command = "QCB_b"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

;Sniping Arrow C
[State -1]
type = changestate
value = 2020
triggerall = command = "QCB_c"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

;Spin Knuckle x
[State -1]
type = changestate
value = 1030
triggerall = command = "HCF_x"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

;Spin Knuckle y
[State -1]
type = changestate
value = 1032
triggerall = command = "HCF_y"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

;Spin Knuckle z
[State -1]
type = changestate
value = 1033
triggerall = command = "HCF_z"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405
trigger10 = movecontact = 1
trigger10 = stateno = 203
trigger11 = movecontact = 1
trigger11 = stateno = 206
trigger12 = movecontact = 1
trigger12 = stateno = 402
trigger13 = movecontact = 1
trigger13 = stateno = 406
trigger14 = movecontact = 1
trigger14 = stateno = 208

;************Throws******************
; German Suplex
[State -1]
type = ChangeState
value = 2060
triggerall = statetype = S
triggerall = ctrl = 1
triggerall = command = "fwd_z"
trigger1 = command = "fwd_z";Near
trigger1 = p2bodydist X < 12
trigger1 = p2statetype = S
trigger1 = p2movetype != H
trigger2 = command = "fwd_z";Near
trigger2 = p2bodydist X < 12
trigger2 = p2statetype = C
trigger2 = p2movetype != H
trigger3 = command = "back_z";Near
trigger3 = p2bodydist X < 12
trigger3 = p2statetype = S
trigger3 = p2movetype != H
trigger4 = command = "back_z";Near
trigger4 = p2bodydist X < 12
trigger4 = p2statetype = C
trigger4 = p2movetype != H


; Head Scissors
[State -1]
type = ChangeState
value = 2050
triggerall = statetype = S
triggerall = ctrl = 1
triggerall = command = "fwd_c"
trigger1 = command = "fwd_c";Near
trigger1 = p2bodydist X < 12
trigger1 = p2statetype = S
trigger1 = p2movetype != H
trigger2 = command = "fwd_c";Near
trigger2 = p2bodydist X < 12
trigger2 = p2statetype = C
trigger2 = p2movetype != H
trigger3 = command = "back_c";Near
trigger3 = p2bodydist X < 12
trigger3 = p2statetype = S
trigger3 = p2movetype != H
trigger4 = command = "back_c";Near
trigger4 = p2bodydist X < 12
trigger4 = p2statetype = C
trigger4 = p2movetype != H

;Parry
[State -1]
type = ChangeState
value = 965000
triggerall = command = "parry"
triggerall = statetype = S
trigger1 = ctrl = 0
trigger1 = stateno = [120,152]

;Parry
[State -1]
type = ChangeState
value = 965001
triggerall = command = "parry"
triggerall = statetype = C
trigger1 = ctrl = 0
trigger1 = stateno = [120,152]

;Parry
[State -1]
type = ChangeState
value = 965002
triggerall = command = "parry"
triggerall = statetype = A
trigger1 = ctrl = 0
trigger1 = stateno = [120,152]

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

;Air Throw
[State -1]
type = ChangeState
value = 900
triggerall = StateType = A
triggerall = Ctrl = 1
trigger1 = Command = "AT"

;**********Standing Attacks**********
;Jab
[State -1,6]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1
trigger4 = stateno = 404
trigger5 = movecontact = 1
trigger5 = stateno = 400 

;Strong
[State -1,7]
type = ChangeState
value = 201
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204
trigger4 = movecontact = 1
trigger4 = stateno = 404
trigger5 = movecontact = 1
trigger5 = stateno = 400 


;Fierce
[State -1,8]
type = ChangeState
value = 202
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405

;Short
[State -1,10]
type = ChangeState
value = 204
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1
trigger4 = stateno = 404
trigger5 = movecontact = 1
trigger5 = stateno = 400 

;Forward
[State -1,11]
type = ChangeState
value = 205
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1
trigger4 = stateno = 404
trigger5 = movecontact = 1
trigger5 = stateno = 400 


;Roundhouse
[State -1,12]
type = ChangeState
value = 206
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205 
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405


;******************Top Down Attacks**************
;Heel Kick
[State -1]
type = ChangeState
value = 208
triggerall = command = "fwd_b"
trigger1 = command != "holddown"
trigger1 = statetype != A
triggerall = ctrl = 1

;*****************Crouching Attacks******************
;Jab
[State -1,16]
type = Changestate
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204
trigger4 = movecontact = 1
trigger4 = stateno = 404
trigger5 = movecontact = 1
trigger5 = stateno = 400 

;Strong
[State -1,17]
type = changestate
value = 401
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204
trigger4 = movecontact = 1
trigger4 = stateno = 404
trigger5 = movecontact = 1
trigger5 = stateno = 400 

;Fierce
[State -1]
type = changestate
value = 402
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405

;Short
[State -1,19]
type = ChangeState
value = 404
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204
trigger4 = movecontact = 1
trigger4 = stateno = 404
trigger5 = movecontact = 1
trigger5 = stateno = 400 

;Forward
[State -1,19]
type = ChangeState
value = 405
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204
trigger4 = movecontact = 1
trigger4 = stateno = 404
trigger5 = movecontact = 1
trigger5 = stateno = 400 

;Roundhouse
[State -1,20]
type = ChangeState
value = 406
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = movecontact = 1 
trigger2 = stateno = 200 
trigger3 = movecontact = 1 
trigger3 = stateno = 204 
trigger4 = movecontact = 1 
trigger4 = stateno = 201 
trigger5 = movecontact = 1 
trigger5 = stateno = 205
trigger6 = movecontact = 1 
trigger6 = stateno = 404
trigger7 = movecontact = 1
trigger7 = stateno = 400 
trigger8 = movecontact = 1 
trigger8 = stateno = 401
trigger9 = movecontact = 1
trigger9 = stateno = 405 


;**************Jumping Attacks***************
;Jab
[State -1,21]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl = 1

;Strong
[State -1,23]
type = ChangeState
value = 601
trigger1 = command = "y"
trigger1 = statetype = A
trigger1 = ctrl = 1

;Fierce
[State -1,24]
type = ChangeState
value = 602
trigger1 = command = "z"
trigger1 = statetype = A
trigger1 = ctrl = 1

;Short
[State -1]
type = ChangeState
value = 604
trigger1 = command = "a"
trigger1 = statetype = A
trigger1 = ctrl = 1

;Forward
[State -1]
type = ChangeState
value = 605
trigger1 = command = "b"
trigger1 = statetype = A
trigger1 = ctrl = 1

;Roundhouse
[State -1]
type = ChangeState
value = 606
trigger1 = command = "c"
trigger1 = statetype = A
trigger1 = ctrl = 1

[State -1,Overhead Throw]
type = ChangeState
value = 800
trigger1 = command = "c"
triggerall = P2bodydist X < 5
triggerall = P2statetype != A
triggerall = p2statetype = S
triggerall = ctrl = 1
triggerall = statetype = S

[State -1, Taunt]
type = changestate
value = 195
triggerall = command = "s"
triggerall = !var(59)
trigger1 = ctrl = 1
trigger1 = statetype = S
trigger1 = statetype != A

[State -1, Back Dash]
type = changestate
value = 100
triggerall = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl = 1

[State -1, Back Dash]
type = changestate
value = 105
triggerall = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl = 1

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
var(59) = 10

[State -3]
type = Varset
triggerall = !var(59) ; Check the AI flag
trigger1 = alive
trigger1 = stateno < 5500
trigger1 = command = "AI_1" || command = "AI_2" || command = "AI_3" || command = "AI_4" || command = "AI_5"
trigger2 = command = "AI_6" || command = "AI_7" || command = "AI_8" || command = "AI_9" || command = "AI_10"
trigger3 = command = "AI_11" || command = "AI_12" || command = "AI_13" || command = "AI_14" || command = "AI_15"
var(59) = 8

[State -3]
type = Varset
triggerall = !var(59) ; Check the AI flag
trigger1 = alive
trigger1 = stateno < 5500
trigger1 = command = "AI_1" || command = "AI_2" || command = "AI_3" || command = "AI_4"
trigger2 = command = "AI_6" || command = "AI_7" || command = "AI_8" || command = "AI_9"
trigger3 = command = "AI_11" || command = "AI_12" || command = "AI_13" || command = "AI_14"
var(59) = 6

[State -3]
type = Varset
triggerall = !var(59) ; Check the AI flag
trigger1 = alive
trigger1 = stateno < 5500
trigger1 = command = "AI_1" || command = "AI_2" || command = "AI_3"
trigger2 = command = "AI_6" || command = "AI_7" || command = "AI_8"
var(59) = 5

[State -3]
type = Varset
triggerall = !var(59) ; Check the AI flag
trigger1 = alive
trigger1 = stateno < 5500
trigger1 = command = "AI_1" || command = "AI_2"
trigger2 = command = "AI_6"
var(59) = 4

[State -3]
type = Varset
triggerall = !var(59) ; Check the AI flag
trigger1 = alive
trigger1 = stateno < 5500
trigger1 = command = "AI_1" || command = "AI_2"
var(59) = 3

[State -3]
type = Varset
triggerall = !var(59) ; Check the AI flag
trigger1 = alive
trigger1 = stateno < 5500
trigger1 = command = "AI_1"
var(59) = 2

[State OFF]
type = VarSet
triggerall = ishometeam && teamside != 1 
trigger1 = roundstate>2
trigger2 = !alive
trigger3 = stateno = 5500
trigger4 = AILevel = 1
v = 59
value = 0
ignorehitpause = 1
persistent = 1

[State OFF]
type = VarSet
triggerall = ishometeam && teamside != 1 
triggerall = teammode = simul
triggerall = gamemode = "survival"
trigger1 = AILevel = 2 || AILevel = 3 || AILevel = 4
v = 59
value = 2

[State OFF]
type = VarSet
triggerall = ishometeam && teamside != 1 
triggerall = teammode = single
triggerall = gamemode != "survival"
trigger1 = matchno = [1,4] && (AILevel = 5 || AILevel = 6 || AILevel = 7)
trigger2 = matchno = 10 && (AILevel = 2 || AILevel = 3)
v = 59
value = 3

[State OFF]
type = VarSet
triggerall = ishometeam && teamside != 1 
triggerall = teammode = simul
triggerall = gamemode = "survival"
trigger1 = AILevel = 5 || AILevel = 6
v = 59
value = 4

[State OFF]
type = VarSet
triggerall = ishometeam && teamside != 1 
triggerall = teammode = simul
triggerall = gamemode = "survival"
trigger1 = AILevel = 7 || AILevel = 8
v = 59
value = 5

[State OFF]
type = VarSet
triggerall = ishometeam && teamside != 1 
triggerall = teammode = single
triggerall = gamemode != "survival"
trigger1 = (matchno = [5,9] && (AILevel = 5 || AILevel = 6 || AILevel = 7)) || (matchno = 10 && (AILevel = 1 || AILevel = 2 || AILevel = 3))
v = 59
value = 6

[State OFF]
type = VarSet
triggerall = ishometeam && teamside != 1 
triggerall = teammode = single
triggerall = gamemode != "survival"
trigger1 = matchno = 10 && (AILevel = 5 || AILevel = 6 || AILevel = 7)
v = 59
value = 8

[State OFF]
type = VarSet
triggerall = ishometeam && teamside != 1 
triggerall = teammode = single
triggerall = gamemode != "survival"
trigger1 = matchno < 10 && AILevel = 8
v = 59
value = 9

[State OFF]
type = VarSet
triggerall = ishometeam && teamside != 1 
triggerall = teammode = single
triggerall = gamemode != "survival"
trigger1 = matchno = 10 && AILevel = 8
v = 59
value = 10

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

[State -1]
type = ChangeState
value = 206
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = P2BodyDist X <= 25
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist Y < -30
[State -1]
type = ChangeState
value = 402
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist X = [26,30]
trigger1 = p2bodydist Y < -30
[State -1]
type = ChangeState
value = 204
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2movetype != H || p2bodydist X < 40
trigger1 = p2stateno != [150,153] && AILevel > 2
trigger1 = random < 150
[State -1]
type = ChangeState
value = 401
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2movetype != H || p2bodydist X < 40
trigger1 = p2stateno != [150,153] && AILevel > 2
trigger1 = random < 150
[State -1]
type = ChangeState
value = 201
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = P2BodyDist X <= 25
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist Y = [-70,20]
trigger1 = random < 150
[State -1]
type = ChangeState
value = 200
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype = A
trigger1 = p2bodydist X = [26,60]
trigger1 = p2bodydist Y = [-70,20]
trigger1 = random < 150
[State -1]
type = ChangeState
value = 404
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2movetype != H || p2bodydist X < 40
trigger1 = p2stateno != [150,153] && AILevel > 2
trigger1 = random < 150
[State -1]
type = ChangeState
value = 405
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [-5,70]
trigger1 = p2stateno != [152,153]
trigger1 = random < 150
[State -1]
type = ChangeState
value = 600
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = statetype = A
trigger1 = ctrl 
trigger1 = Vel X != 0
trigger1 = p2statetype = A
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2bodydist Y = [-70,60]
[State -1]
type = ChangeState
value = 602
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2bodydist Y = [0,70]
trigger1 = p2statetype = A
[State -1]
type = ChangeState
value = 604
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = statetype = A
trigger1 = ctrl 
trigger1 = p2bodydist X = [-5,20]
trigger1 = p2bodydist Y = [-60,100]
trigger1 = p2statetype = A
[State -1]
type = ChangeState
value = 605
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2bodydist X = [-5,30]
trigger1 = p2bodydist Y = [-90,0]
[State -1]
type = ChangeState
value = 606
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,80]
trigger1 = p2bodydist Y = [0,110]
trigger1 = p2statetype = A