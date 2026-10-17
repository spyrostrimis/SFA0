; the cmd File.
;
; two parts: 1. command Definition and  2. state entry
; (state entry is after the commands Def section)
;
; 1. command Definition
; ---------------------
; note: the commands are case-sensitive, and so are the command names.
; the eight Directions are:
;   B, DB, D, DF, F, UF, U, UB     (all caps)
;   corresponding to back, Down-back, Down, DownforwarD, etc.
; the six buttons are:
;   a, B, c, x, y, z               (all lower case)
;   in Default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you Use a and b.
;   For 6 button characters, Use abc For kicks and xyz For punches.
;
; each [command] section Defines a command that you can Use For
; state entry, as well as in the cns File.
; the command section should look like:
;
;   [command]
;   name = some_name
;   command = the_command
;   time = time (optional -- Defaults to 15 if omitted)
;
; - some_name
;   a name to give that command. you'll Use this name to refer to
;   that command in the state entry, as well as the cns. it is case-
;   sensitive (qcb_a is not the same as qcb_a or qcb_a).
;
; - command
;   list of buttons or Directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held Down
;          egs. command = /D       ;hold the Down Direction
;               command = /DB, a   ;hold Down-back while you press a
;   tilde (~) - to Detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release Down, press FwD, then a
;          if you want to Detect "charge moves", you can specify
;          the time the key must be held Down For (in game-ticks)
;          egs. command = ~30a     ;hold a For at least 30 ticks, then release
;   Dollar ($) - Direction-only: Detect as 4-way
;          egs. command = $D       ;will Detect if D, DB or DF is held
;               command = $B       ;will Detect if B, DB or UB is held
;   plus (+) - buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   you can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF For 30 ticks, release,
;                                  ;then press a and b together
;   it's recommended that For most "motion" commads, eg. quarter-circle-fwD,
;   you start off with a "release Direction". this matches the way most
;   popular Fighting games implement their command Detection.
;
; - time (optional)
;   time allowed to Do the commanD, given in game-ticks. Defaults to 15
;   if omitted
;
; if you have two or more commands with the same name, all of them will
; work. you can Use it to allow multiple motions For the same move.
;
; some common commands examples are given below.
;
; [command] ;quarter circle Forward + x
; name = "qcf_x"
; command = ~D, DF, F, x
;
; [command] ;half circle back + a
; name = "hcb_a"
; command = ~F, DF, D, DB, B, a
;
; [command] ;two quarter circles Forward + y
; name = "2qcf_y"
; command = ~D, DF, F, D, DF, F, y
;
; [command] ;tap b rapidly
; name = "5b"
; command = B, B, B, B, b
; time = 30
;
; [command] ;charge back, then Forward + z
; name = "charge_b_f_z"
; command = ~60$B, F, z
; time = 10
; 
; [command] ;charge Down, then Up + c
; name = "charge_d_u_c"
; command = ~60$D, U, c
; time = 10
; 
;negative edge
;-| special motions |--------------------------------------------------------
[command]
name = "chargex"
command = ~40$B,F,~x
time = 10

[command]
name = "chargey"
command = ~40$B,F,~y
time = 10

[command]
name = "chargez"
command = ~40$B,F,~z
time = 10

[command]
name = "vchargex"
command = ~40$D,U,~x
time = 10

[command]
name = "vchargey"
command = ~40$D,U,~y
time = 10

[command]
name = "vchargez"
command = ~40$D,U,~z
time = 10

[command]
name = "chargea"
command = ~40$B,F,~a
time = 10

[command]
name = "chargeb"
command = ~40$B,F,~b
time = 10

[command]
name = "chargec"
command = ~40$B,F,~c
time = 10

[command]
name = "hold x"
command = /$x
time = 1

[command]
name = "hold y"
command = /$y
time = 1

[command]
name = "hold z"
command = /$z
time = 1

[command]
name = "hold a"
command = /$a
time = 1

[command]
name = "hold b"
command = /$b
time = 1

[command]
name = "hold c"
command = /$c
time = 1

[command]
name = "dp_a"
command = ~F, D, DF, ~a

[command]
name = "dp_b"
command = ~F, D, DF, ~b

[command]
name = "dp_c"
command = ~F, D, DF, ~c

[command]
name = "dp_x"
command = ~F, D, DF, ~x

[command]
name = "dp_y"
command = ~F, D, DF, ~y

[command]
name = "dp_z"
command = ~F, D, DF, ~z

[command]
name = "qcf_xyy"
command = ~D, DF, F, ~x+y

[command]
name = "qcf_xy"
command = ~D, DF, F, ~x+z

[command]
name = "qcf_xy"
command = ~D, DF, F, ~y+z

[command]
name = "qcf_ab"
command = ~D, DF, F, ~a+b

[command]
name = "qcf_ab"
command = ~D, DF, F, ~b+c

[command]
name = "qcf_ab"
command = ~D, DF, F, ~a+c

[command]
name = "qcb_ab"
command = ~D, DB, B, ~a+b

[command]
name = "qcb_ab"
command = ~D, DB, B, ~b+c

[command]
name = "qcb_ab"
command = ~D, DB, B, ~a+c

[command]
name = "qcb_xy"
command = ~D, DB, B, ~x+y

[command]
name = "qcb_xy"
command = ~D, DB, B, ~x+z

[command]
name = "hcb_x"
command = ~F, D, B, ~x
time = 30

[command]
name = "hcb_y"
command = ~F, D, B, ~y
time = 30

[command]
name = "hcb_z"
command = ~F, D, B, ~z
time = 30

[command]
name = "qcb_xy"
command = ~D, DB, B, ~y+z

[command]
name = "qcb_x"
command = ~D, DB, B, ~x

[command]
name = "qcb_y"
command = ~D, DB, B, ~y

[command]
name = "qcb_z"
command = ~D, DB, B, ~z

[Command]
name = "Double"
command = ~D, DF, F, c+z

[Command]
name = "tag"
command = c+z

[Command]
name = "assist"
command = b+y



;-| special motions |------------------------------------------------------

[command]
name = "qcf_x"
command = ~D, DF, F, ~x

[command]
name = "qcf_y"
command = ~D, DF, F, ~y

[command]
name = "qcf_z"
command = ~D, DF, F, ~z

[command]
name = "qcf_a"
command = ~D, DF, F, ~a

[command]
name = "qcf_b"
command = ~D, DF, F, ~b

[command]
name = "qcf_c"
command = ~D, DF, F, ~c

[command]
name = "qcb_a"
command = ~D, DB, B, ~a

[command]
name = "qcb_b"
command = ~D, DB, B, ~b

[command]
name = "qcb_c"
command = ~D, DB, B, ~c

[command]
name = "ff_x"
command = F,D,DF, ~x
time = 20

[command]
name = "ff_y"
command = F,D,DF,~y
time = 20

[command]
name = "ff_z"
command = F,D,DF, ~z
time = 20


[command]
name = "ff_a"
command = F,D,DF, ~a
time = 20

[command]
name = "ff_b"
command = F,D,DF,~b
time = 20

[command]
name = "ff_c"
command = F,D,DF, ~c
time = 20

;-| special motions |--------------------------------------------------------
[command]
name = "chargex"
command = ~40$B,F,x
time = 15

[command]
name = "chargey"
command = ~40$B,F,y
time = 15

[command]
name = "chargez"
command = ~40$B,F,z
time = 15

[command]
name = "vchargex"
command = ~40$D,U,x
time = 10

[command]
name = "vchargey"
command = ~40$D,U,y
time = 10

[command]
name = "vchargez"
command = ~40$D,U,z
time = 10

[command]
name = "chargea"
command = ~40$B,F,a
time = 15

[command]
name = "chargeb"
command = ~40$B,F,b
time = 15

[command]
name = "chargec"
command = ~40$B,F,c
time = 15

[command]
name = "hold x"
command = /$x
time = 1

[command]
name = "hold y"
command = /$y
time = 1

[command]
name = "hold z"
command = /$z
time = 1

[command]
name = "hold a"
command = /$a
time = 1

[command]
name = "hold b"
command = /$b
time = 1

[command]
name = "hold c"
command = /$c
time = 1

[command]
name = "dp_a"
command = ~F, D, DF, a

[command]
name = "dp_b"
command = ~F, D, DF, b

[command]
name = "dp_c"
command = ~F, D, DF, c

[command]
name = "dp_x"
command = ~F, D, DF, x

[command]
name = "dp_y"
command = ~F, D, DF, y

[command]
name = "dp_z"
command = ~F, D, DF, z

[command]
name = "qcf_xy"
command = ~D, DF, F, x+y

[command]
name = "qcf_xy"
command = ~D, DF, F, x+z

[command]
name = "qcf_xy"
command = ~D, DF, F, y+z

[command]
name = "qcf_ab"
command = ~D, DF, F, a+b

[command]
name = "qcf_ab"
command = ~D, DF, F, b+c

[command]
name = "qcf_ab"
command = ~D, DF, F, a+c

[command]
name = "qcb_ab"
command = ~D, DB, B, a+b

[command]
name = "qcb_ab"
command = ~D, DB, B, b+c

[command]
name = "qcb_ab"
command = ~D, DB, B, a+c

[command]
name = "qcb_xy"
command = ~D, DB, B, x+y

[command]
name = "qcb_xy"
command = ~D, DB, B, x+z

[command]
name = "hcb_x"
command = ~F, D, B, x
time = 30

[command]
name = "hcb_y"
command = ~F, D, B, y
time = 30

[command]
name = "hcb_z"
command = ~F, D, B, z
time = 30

[command]
name = "qcb_xy"
command = ~D, DB, B, y+z

[command]
name = "qcb_x"
command = ~D, DB, B, x

[command]
name = "qcb_y"
command = ~D, DB, B, y

[command]
name = "qcb_z"
command = ~D, DB, B, z

[Command]
name = "Double"
command = ~D, DF, F, c+z

[Command]
name = "tag"
command = c+z

[Command]
name = "assist"
command = b+y

;-| special motions |------------------------------------------------------

[command]
name = "qcf_x"
command = ~D, DF, F, x

[command]
name = "qcf_y"
command = ~D, DF, F, y

[command]
name = "qcf_z"
command = ~D, DF, F, z

[command]
name = "qcf_a"
command = ~D, DF, F, a

[command]
name = "qcf_b"
command = ~D, DF, F, b

[command]
name = "qcf_c"
command = ~D, DF, F, c

[command]
name = "qcb_a"
command = ~D, DB, B, a

[command]
name = "qcb_b"
command = ~D, DB, B, b

[command]
name = "qcb_c"
command = ~D, DB, B, c

[command]
name = "ff_x"
command = F,D,DF, x
time = 20

[command]
name = "ff_y"
command = F,D,DF,y
time = 20

[command]
name = "ff_z"
command = F,D,DF, z
time = 20


[command]
name = "ff_a"
command = F,D,DF, a
time = 20

[command]
name = "ff_b"
command = F,D,DF,b
time = 20

[command]
name = "ff_c"
command = F,D,DF, c
time = 20

;-| DoUBle tap |-----------------------------------------------------------
[command]
name = "FF"     ;required (do not remove)
command = F, F
time = 10

[command]
name = "BB"     ;required (do not remove)
command = B, B
time = 10






;-| 2/3 button combination |-----------------------------------------------

[Command]
name = "Double"
command = ~D, DF, F, c+z

[Command]
name = "tag"
command = c+z

[Command]
name = "assist"
command = b+y

;------------------------------------------------------------
[command]
name = "recovery";required (do not remove)
command = x+y
time = 1

[command]
name = "recovery";required (do not remove)
command = y+z
time = 1

[command]
name = "recovery";required (do not remove)
command = x+z
time = 1

;-| Dir + button |---------------------------------------------------------
[command]
name = "down_a"
command = /$D,a
time = 1

[command]
name = "down_b"
command = /$D,b
time = 1

;-| single button |---------------------------------------------------------
[command]
name = "a"
command = a
time = 1

[command]
name = "b"
command = b
time = 1

[command]
name = "c"
command = c
time = 1

[command]
name = "x"
command = x
time = 1

[command]
name = "y"
command = y
time = 1

[command]
name = "z"
command = z
time = 1

[command]
name = "start"
command = s
time = 1

[command]
name = "fwd"
command = F
time = 1

[command]
name = "back"
command = B
time = 1

[command]
name = "up"
command = U
time = 1

[command]
name = "down"
command = D
time = 1

;-| hold Dir |--------------------------------------------------------------
[command]
name = "hold c"
command = /$c
time = 1

[command]
name = "holdfwd";required (do not remove)
command = /$F
time = 1

[command]
name = "holdback";required (do not remove)
command = /$B
time = 1

[command]
name = "holdup" ;required (do not remove)
command = /$U
time = 1

[command]
name = "holddown";required (do not remove)
command = /$D
time = 1

[command]
name = "holddownback"
command = /$DB
time = 1

[command]
name = "holddownfwd"
command = /$DF
time = 1

[command]
name = "holdupback"
command = /$UB
time = 1

[command]
name = "holdupfwd"
command = /$UF
time = 1

[command]
name = "holddownforward"
command = /$DF
time = 1


;---------------------------------------------------------------------------
[statedef -1]




;normal controls============================================

; commands
[State -1, tag LV3]
type = ChangeState
value = 4599
triggerall = command = "Double"
triggerall = Var(51) = 1
triggerall = partner, life > 0
triggerall = stateno != 4512
triggerall = power >= 2000
trigger1 = (StateType != A) && (Ctrl = 1)
trigger2 = (stateno = [200,499]) && (StateType != A)

;[State -1, tag LV3]
;type = ChangeState
;value = 4700
;triggerall = command = "Double"
;triggerall = Var(51) = 1
;triggerall = partner, life > 0
;triggerall = power >= 2000
;trigger1 = stateno = 4512

[State -1, tag]
type = ChangeState
value = 4510
triggerall = command = "tag"
triggerall = Var(51) = 1
triggerall = partner, stateno = 4512 
triggerall = partner, life > 0
trigger1 = (StateType != A) && (Ctrl = 1)
trigger2 = (stateno = [200,499]) && (StateType != A)

[State -1, tag]
type = ChangeState
value = 4900
triggerall = command = "assist"
triggerall = Var(51) = 1
triggerall = partner, stateno = 4512 
triggerall = partner, life > 0
trigger1 = (StateType != A) && (Ctrl = 1)

; NEW !! Tag active ctrl
;[State -2, ctrl]
;type = ChangeState
;triggerall = Var(51)        ; Partner TAG mode activated
;triggerall = NumPartner
;triggerall = ID > Partner,ID
;triggerall = movetype != H
;trigger1 = partner, movetype != H
;trigger1 = partner, var(51) != 2
;trigger1 = RoundState = 2
;trigger1 = Life && Partner, Life		; Team is alive
;trigger1 = partner, stateno != [4500,4999]
;trigger1 = stateno != [4500,5999]
;value = 4511
;persistent = 0

;[State 4512, invincibility]
;type = changestate
;triggerall = roundstate = 2
;trigger1 = partner, movetype != H
;trigger1 = movetype != H
;trigger1 = pos y >= 0
;trigger1 = var(52) = 1
;value = 4511
;normal controls============================================

; commands
[State -1, tag LV3]
type = ChangeState
value = 4599
triggerall = command = "Double"
triggerall = Var(51) = 1
triggerall = partner, life > 0
triggerall = stateno != 4512
triggerall = power >= 2000
trigger1 = (StateType != A) && (Ctrl = 1)
trigger2 = (stateno = [200,499]) && (StateType != A)

[State -1, tag]
type = ChangeState
value = 4510
triggerall = command = "tag"
triggerall = Var(51) = 1
triggerall = partner, stateno = 4512 
triggerall = partner, life > 0
trigger1 = (StateType != A) && (Ctrl = 1)
trigger2 = (stateno = [200,499]) && (StateType != A)

[State -1, tag]
type = ChangeState
value = 4900
triggerall = command = "assist"
triggerall = Var(51) = 1
triggerall = partner, stateno = 4512 
triggerall = partner, life > 0
trigger1 = (StateType != A) && (Ctrl = 1)

;Framelle
[state -1,z]
type = changestate
value = 4000
triggerall = var(37) != 1
triggerall = command = "qcf_xy"
triggerall = power >= 2000 
triggerall = statetype != a
trigger1 = ctrl
trigger2 = stateno = [200,1499]
trigger2 = stateno != [800,910]



;Partonelle
[state -1,z]
type = changestate
value = 4100+(100*(statetype = a))
triggerall = stateno != 1019
triggerall = command = "qcf_ab"
triggerall = power >= 2000 
trigger1 = ctrl
trigger2 = stateno = [200,1499]
trigger2 = stateno != [800,910]

;Framelle
[state -1,z]
type = changestate
value = 3300
triggerall = var(37) != 1
triggerall = command = "qcb_xy"
triggerall = power >= 2000 
triggerall = statetype != a
trigger1 = ctrl
trigger2 = stateno = [200,1499]
trigger2 = stateno != [800,910]





;===========================================================================

[state -1, z]
type = changestate
value = 1400
triggerall = statetype = A
triggerall = command = "qcb_a"
trigger1 = ctrl
trigger2 = stateno = [600,699]
trigger2 = p2stateno != [715,717]

[state -1, z]
type = changestate
value = 1410
triggerall = statetype = A
triggerall = command = "qcb_b"
trigger1 = ctrl
trigger2 = stateno = [600,699]
trigger2 = p2stateno != [715,717]

[state -1, z]
type = changestate
value = 1420
triggerall = statetype = A
triggerall = command = "qcb_c"
trigger1 = ctrl
trigger2 = stateno = [600,699]
trigger2 = p2stateno != [715,717]

;phantoom
[state -1, phantoom]
type = changestate
value = 1200
triggerall = command = "dp_a"
triggerall = statetype != a
trigger1 = ctrl
trigger2 = stateno = [200,499]

;power Drain
[state -1, phantoom]
type = changestate
value = 1210
triggerall = statetype != a
triggerall = command = "dp_b"
trigger1 = ctrl
trigger2 = stateno = [200,499]

[state -1, phantoom]
type = changestate
value = 1220
triggerall = statetype != a
triggerall = command = "dp_c"
trigger1 = ctrl
trigger2 = stateno = [200,499]

;phantoom
[state -1, phantoom]
type = changestate
value = 1300
triggerall = command = "qcf_a"
triggerall = statetype != a
trigger1 = ctrl
trigger2 = stateno = [200,499]

;power Drain
[state -1, phantoom]
type = changestate
value = 1310
triggerall = statetype != a
triggerall = command = "qcf_b"
trigger1 = ctrl
trigger2 = stateno = [200,499]

[state -1, phantoom]
type = changestate
value = 1320
triggerall = statetype != a
triggerall = command = "qcf_c"
trigger1 = ctrl
trigger2 = stateno = [200,499]
;---------------------------------------------------------------------------

;phantoom
[state -1, phantoom]
type = changestate
value = 1000
triggerall = numexplod(1003) = 0
triggerall = command = "qcf_x"
triggerall = statetype != a
trigger1 = ctrl
trigger2 = stateno = [200,499]

;power Drain
[state -1, phantoom]
type = changestate
value = 1001
triggerall = numexplod(1003) = 0
triggerall = statetype != a
triggerall = command = "qcf_y"
trigger1 = ctrl
trigger2 = stateno = [200,499]

[state -1, phantoom]
type = changestate
value = 1002
triggerall = numexplod(1003) = 0
triggerall = statetype != a
triggerall = command = "qcf_z"
trigger1 = ctrl
trigger2 = stateno = [200,499]
;---------------------------------------------------------------------------

;phantoom
[state -1, phantoom]
type = changestate
value = 1100
triggerall = command = "qcb_x" || command = "qcb_y" || command = "qcb_z"
triggerall = statetype != a
trigger1 = ctrl
trigger2 = stateno = [200,499]
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;����
[state -1, z]
type = changestate
value = 800 + (statetype = a)
triggerall = (command = "y") || (command = "z")
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd" && (statetype = s)
trigger1 = p2bodydist x < 3
trigger1 = (p2statetype = s) || (p2statetype = c)
trigger1 = p2movetype != h
trigger2 = command = "holdback" && (statetype = s)
trigger2 = p2bodydist x < 5
trigger2 = (p2statetype = s) || (p2statetype = c)
trigger2 = p2movetype != h
trigger3 = command = "holdfwd" && (statetype = a)
trigger3 = p2bodydist x < 3
trigger3 = p2statetype = a
trigger4 = command = "holdback" && (statetype = a)
trigger4 = p2bodydist x < 5
trigger4 = p2statetype = a 
trigger5 = command = "holdback" && (statetype = s)
trigger5 = p2bodydist x < 5
trigger5 = (p2statetype = s) || (p2statetype = c)

[state -1, kung Fu throw]
type = changestate
value = 850
triggerall = var(40) = 0
triggerall = (command = "b") || (command = "c")
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd" && (statetype = s)
trigger1 = p2bodydist x < 3
trigger1 = p2statetype != A
trigger1 = p2movetype != h
trigger2 = command = "holdback" && (statetype = s)
trigger2 = p2bodydist x < 5
trigger2 = p2statetype != A
trigger2 = p2movetype != h
trigger3 = command = "holdfwd" && (statetype = s)
trigger3 = p2bodydist x < 3
trigger3 = p2statetype != A
trigger3 = p2stateno = 1110
trigger4 = command = "holdback" && (statetype = s)
trigger4 = p2bodydist x < 5
trigger4 = p2statetype != A




;===========================================================================
;jump strong kick
;[state -1]
;type = changestate
;value = 40
;triggerall = command = "abc"
;trigger1 = statetype != a
;trigger1 = ctrl
;trigger2 = stateno = [230,270]
;trigger2 = time < 1
;---------------------------------------------------------------------------
;stand light punch
[state -1]
type = changestate
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = s
trigger1 = ctrl

;---------------------------------------------------------------------------
;stand medium punch

[state -1]
type = changestate
value = 211
triggerall = stateno != [100,106]
triggerall = command = "y" 
triggerall = command = "holdfwd" || command = "holdback"
triggerall = command != "holddown"
trigger1 = statetype = s
trigger1 = ctrl

[state -1]
type = changestate
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = s
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = 400) && movecontact
trigger5 = (stateno = 430) && movecontact
trigger6 = stateno = [100,106]

;---------------------------------------------------------------------------
;stand strong punch
[state -1]
type = changestate
value = 220
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = s
trigger1 = ctrl && stateno != [100,106]
trigger2 = (stateno = [200,210]) && movecontact
trigger3 = (stateno = [230,240]) && movecontact
trigger4 = (stateno = [400,410]) && movecontact
trigger5 = (stateno = [430,440]) && movecontact
trigger6 = (stateno = [100,106]) && command != "holdfwd"
;---------------------------------------------------------------------------
;stand light kick
[state -1]
type = changestate
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = s
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 400) && movecontact
;---------------------------------------------------------------------------
;standing strong kick

[state -1]
type = changestate
value = 241
triggerall = stateno != [100,106]
triggerall = command = "b" 
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = s
trigger1 = ctrl

[state -1]
type = changestate
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = s && command != "holdfwd"
trigger1 = ctrl
trigger1 = stateno != [100,101]
trigger2 = (stateno = [200,210]) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = [400,410]) && movecontact
trigger5 = (stateno = 430) && movecontact
trigger6 = stateno = [100,101]

;---------------------------------------------------------------------------
;standing strong kick
[state -1]
type = changestate
value = 250
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = s
trigger1 = ctrl
trigger2 = (stateno = [200,220]) && movecontact
trigger3 = (stateno = [230,240]) && movecontact
trigger4 = (stateno = [400,420]) && movecontact
trigger5 = (stateno = [430,440]) && movecontact
;---------------------------------------------------------------------------
;taunt
;����
[state -1, taunt]
type = changestate
value = 195
triggerall = command = "start"
trigger1 = statetype != a
trigger1 = ctrl

;---------------------------------------------------------------------------
;crouching light punch
[state -1, crouching light punch]
type = changestate
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype != a
trigger1 = ctrl

;---------------------------------------------------------------------------
;crouching medium punch
[state -1, crouching medium punch]
type = changestate
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != a
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = 400) && movecontact
trigger5 = (stateno = 430) && movecontact
;---------------------------------------------------------------------------
;crouching strong punch
[state -1, crouching strong punch]
type = changestate
value = 420
triggerall = command = "z"
triggerall = command = "holddown" && command != "holdfwd"
trigger1 = statetype != a
trigger1 = ctrl
trigger2 = (stateno = [200,210]) && movecontact
trigger3 = (stateno = [230,240]) && movecontact
trigger4 = (stateno = [400,410]) && movecontact
trigger5 = (stateno = [430,440]) && movecontact

[state -1, crouching strong punch]
type = changestate
value = 421
triggerall = command = "z"
triggerall = command = "holddown" && command = "holdfwd"
trigger1 = statetype != a
trigger1 = ctrl
trigger2 = (stateno = [200,210]) && movecontact
trigger3 = (stateno = [230,240]) && movecontact
trigger4 = (stateno = [400,410]) && movecontact
trigger5 = (stateno = [430,440]) && movecontact

;---------------------------------------------------------------------------
;crouching light kick
[state -1, crouching light kick]
type = changestate
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype != a
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 400) && movecontact

;---------------------------------------------------------------------------
;crouching medium kick
[state -1, crouching medium kick]
type = changestate
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype != a
trigger1 = ctrl
trigger2 = (stateno = [200,210]) && movecontact
trigger3 = (stateno = 230) && movecontact
trigger4 = (stateno = [400,410]) && movecontact
trigger5 = (stateno = 430) && movecontact
;---------------------------------------------------------------------------
;crouching strong kick
[state -1, crouching strong kick]
type = changestate
value = 450
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype != a
trigger1 = ctrl
trigger2 = (stateno = [200,220]) && movecontact
trigger3 = (stateno = [230,240]) && movecontact
trigger4 = (stateno = [400,420]) && movecontact
trigger5 = (stateno = [430,440]) && movecontact
;---------------------------------------------------------------------------

;jump light punch
[state -1]
type = changestate
value = 600
triggerall = command = "x"
trigger1 = statetype = a
trigger1 = ctrl

;---------------------------------------------------------------------------
;jump medium punch
[state -1]
type = changestate
value = 610
triggerall = command = "y"
trigger1 = statetype = a
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact
trigger3 = (stateno = 630) && movecontact

;---------------------------------------------------------------------------
;jump strong punch
[state -1]
type = changestate
value = 620
triggerall = command = "z"
trigger1 = statetype = a
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact
trigger3 = (stateno = 610) && movecontact
trigger4 = (stateno = 630) && movecontact
trigger5 = (stateno = 640) && movecontact

;---------------------------------------------------------------------------
;jump light kick
[state -1]
type = changestate
value = 630
triggerall = command = "a"
trigger1 = statetype = a
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact
;---------------------------------------------------------------------------
;jump medium kick
[state -1]
type = changestate
value = 640
triggerall = command = "b"
trigger1 = statetype = a
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact
trigger3 = (stateno = 610) && movecontact
trigger4 = (stateno = 630) && movecontact
;---------------------------------------------------------------------------
;jump strong kick
[state -1]
type = changestate
value = 650
triggerall = command = "c"
trigger1 = statetype = a
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact
trigger3 = (stateno = 610) && movecontact
trigger4 = (stateno = 630) && movecontact
trigger5 = (stateno = 640) && movecontact


[State -1, Taunt]
type = changestate
value = 195
triggerall = (command = "start")
triggerall = statetype = S
triggerall = var(5) = 0
trigger1 = ctrl
