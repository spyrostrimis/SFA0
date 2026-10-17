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

;---------------------

 
;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery"
command = x+a
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "fwd_b"
command = /F,b
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
name = "Shaking"
command = B, F
time = 10
[Command]
name = "Shaking"
command = F, B
time = 10

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
name = "start"
command = s
time = 1

[Command]
name = "F"
command = F
time = 1

[Command]
name = "B"
command = B
time = 1

[Command]
name = "U"
command = U
time = 1

[Command]
name = "D"
command = D
time = 1

;-| Hold Dir |--------------------------------------------------------------

[Command]
name = "holda"
command = /$a
time = 1
[Command]
name = "holdb"
command = /$b
time = 1
[Command]
name = "holdc"
command = /$c
time = 1
[Command]
name = "holdx"
command = /$x
time = 1
[Command]
name = "holdy"
command = /$y
time = 1
[Command]
name = "holdz"
command = /$z
time = 1
[Command]
name = "holds"
command = /$s
time = 1

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

[Statedef -1]






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
var(59) = 1


[State OFF]
type = VarSet
triggerall = ishometeam && teamside != 1 
triggerall = teammode = single
trigger1 = gamemode = "worldtour"
v = 59
value = 1

; ---------------------------------------------------------------------------------

; -----------------------------


[State -3]
type = ChangeState
value = 131
triggerall = var(59) = 1
triggerall = statetype != A && ctrl
triggerall = random <= 999
trigger1 = p2stateno = [430,450]

[State -3]; Guard
type = ChangeState
value = 130
triggerall = var(59) = 1
triggerall = statetype != A && ctrl
triggerall = random <= 999
trigger1 = p2statetype = S
trigger2 = p2statetype = A


[State -3]
type = ChangeState
value = 132
triggerall = var(59) = 1
trigger1 = statetype = A && ctrl
trigger1 = random <= 999

