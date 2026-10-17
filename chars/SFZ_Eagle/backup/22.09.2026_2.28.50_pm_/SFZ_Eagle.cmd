;-| Button Remapping |-----------------------------------------------------
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 1

;-| Hyper Motions |--------------------------------------------------------
[Command]
name = "union_z"
command = ~D,DF,F,D,DF,F,z 
time = 30
[Command]
name = "union_y"
command = ~D,DF,F,D,DF,F,y 
time = 30
[Command]
name = "union_y"
command = ~D,DF,F,D,DF,F,z
time = 30
[Command]
name = "union_x"
command = ~D,DF,F,D,DF,F,x 
time = 30
[Command]
name = "union_x"
command = ~D,DF,F,D,DF,F,y
time = 30
[Command]
name = "union_x"
command = ~D,DF,F,D,DF,F,z
time = 30

[Command]
name = "mgold_z"
command = ~D,DB,B,D,DB,B,z 
time = 30
[Command]
name = "mgold_y"
command = ~D,DB,B,D,DB,B,y 
time = 30
[Command]
name = "mgold_y"
command = ~D,DB,B,D,DB,B,z
time = 30
[Command]
name = "mgold_x"
command = ~D,DB,B,D,DB,B,x 
time = 30
[Command]
name = "mgold_x"
command = ~D,DB,B,D,DB,B,y
time = 30
[Command]
name = "mgold_x"
command = ~D,DB,B,D,DB,B,z
time = 30

;-| Super Motions |--------------------------------------------------------
[Command]
name = "cbury_lp"
command = ~D,DF,F,x 
time = 20

[Command]
name = "cbury_mp"
command = ~D,DF,F,y
time = 20

[Command]
name = "cbury_sp"
command = ~D,DF,F,z 
time = 20

[Command]
name = "cbury_sp"
command = ~D,DF,F,z 
time = 20

[Command]
name = "standrewgreen_x"
command = ~F,D,DF,x
time = 20

[Command]
name = "standrewgreen_y"
command = ~F,D,DF,y
time = 20

[Command]
name = "standrewgreen_z"
command = ~F,D,DF,z
time = 20

[Command]
name = "oxfordred_a"
command = ~D,DF,F,a
time = 20

[Command]
name = "oxfordred_b"
command = ~D,DF,F,b
time = 20

[Command]
name = "oxfordred_c"
command = ~D,DF,F,c
time = 20

[Command]
name = "manchesterblack_x"
command = ~D,DB,B,x
time = 20

[Command]
name = "manchesterblack_y"
command = ~D,DB,B,y
time = 20

[Command]
name = "manchesterblack_z"
command = ~D,DB,B,z
time = 20

[Command]
name = "liverpoolwhite_a"
command = ~D,DB,B,a
time = 20

[Command]
name = "liverpoolwhite_b"
command = ~D,DB,B,b
time = 20

[Command]
name = "liverpoolwhite_c"
command = ~D,DB,B,c
time = 20

;-| Z/A Counter |----------------------------------------------------------
;----------------------------------------------------------------------
;-| Recovery |-------------------------------------------------------------
[Command]
name = "recovery" ;Required (do not remove)
command = x+a
time = 1

; SFZ Motions
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

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

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
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
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
name = "start"
command = s
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "start"
command = s

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

;===========================================================================
; Union Jack Platinum
[State -1, Level 3]
type = ChangeState
value = 3200
triggerall = command = "union_z"
triggerall = Power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
[State -1, Level 2]
type = ChangeState
value = 3100
triggerall = command = "union_y"
triggerall = Power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
[State -1, Level 1]
type = ChangeState
value = 3000
triggerall = command = "union_x"
triggerall = Power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact

;---------------------------------------------------------------------------
;Manchester Gold
[State -1, Level 3]
type = ChangeState
value = 3600
triggerall = command = "mgold_z"
triggerall = Power >= 3000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
[State -1, Level 2]
type = ChangeState
value = 3500
triggerall = command = "mgold_y"
triggerall = Power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
[State -1, Level 1]
type = ChangeState
value = 3400
triggerall = command = "mgold_x"
triggerall = Power >= 1000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact

;===========================================================================
;St. Andrew Green
[State -1, St. Andrew Green Light]
type = ChangeState
value = 1100
triggerall = command = "standrewgreen_x"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
[State -1, St. Andrew Green Medium]
type = ChangeState
value = 1110
triggerall = command = "standrewgreen_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
[State -1, St. Andrew Green Hard]
type = ChangeState
value = 1120
triggerall = command = "standrewgreen_z"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact

;Canterbury Blue Light
[State -1, Canterbury Blue Light]
type = ChangeState
value = 1001
triggerall = command = "cbury_lp"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
[State -1, Canterbury Blue Medium]
type = ChangeState
value = 1010
triggerall = command = "cbury_mp"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
[State -1, Canterbury Blue Hard]
type = ChangeState
value = 1020
triggerall = command = "cbury_sp"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact

;Oxford Red Light
[State -1, Oxford Red Light]
type = ChangeState
value = 1200
triggerall = command = "oxfordred_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
[State -1, Oxford Red Medium]
type = ChangeState
value = 1210
triggerall = command = "oxfordred_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
[State -1, Oxford Red Strong]
type = ChangeState
value = 1220
triggerall = command = "oxfordred_c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact

;Manchester Black Light
[State -1, Manchester Black Light]
type = ChangeState
value = 1300
triggerall = command = "manchesterblack_x"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
;Manchester Black Medium
[State -1, Manchester Black Medium]
type = ChangeState
value = 1310
triggerall = command = "manchesterblack_y"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
;Manchester Black Strong
[State -1, Manchester Black Strong]
type = ChangeState
value = 1320
triggerall = command = "manchesterblack_z"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact

;LiverPool White Light
[State -1, LiverPool White Light]
type = ChangeState
value = 1400
triggerall = command = "liverpoolwhite_a"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
[State -1, LiverPool White Medium]
type = ChangeState
value = 1410
triggerall = command = "liverpoolwhite_b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact
[State -1, LiverPool White Strong]
type = ChangeState
value = 1420
triggerall = command = "liverpoolwhite_c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = Stateno = 200 && Movecontact
trigger3 = Stateno = 210 && Time = [10,15]
trigger4 = Stateno = 221 && Movecontact
trigger5 = Stateno = 230 && Movecontact
trigger6 = Stateno = 251 && Movecontact
trigger7 = Stateno = 400 && Movecontact
trigger8 = Stateno = 410 && Time = [10,15]
trigger9 = Stateno = 420 && Movecontact
trigger10 = Stateno = 430 && Movecontact
trigger11 = Stateno = 440 && Movecontact

;===========================================================================
;Dash Fwd
[State -1, Dash Fwd]
type = ChangeState
value = 100
trigger1 = command = "FF"
triggerall = statetype != A
trigger1 = ctrl

;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Zero Counter (N-Mario)
[State -1]
type = ChangeState
value = 2600
triggerall = Command = "ZC"
triggerall = Power >= 1000
trigger1 = StateNo = [150,153]  
ignorhitpause = 1

;---------------------------------------------------------------------------
;Throw - Eagle Noogie
[State -1, Eagle Noogie]
type = ChangeState
value = 800
triggerall = command = "FT"
triggerall = statetype != A
trigger1 = ctrl

;Throw - Eagle Beatdown
[State -1, Eagle Beatdown]
type = ChangeState
value = 810
triggerall = command = "BT"
triggerall = statetype != A
trigger1 = ctrl

;===========================================================================
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact

[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 230 && Movecontact

[State -1, Stand Strong Punch]
type = ChangeState
value = ifelse(P2BodyDist X<=15, 221, 220)
triggerall = command = "z"  
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 210 && Time = [10,15]

[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 230 && Movecontact

[State -1, Stand Medium Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && Movecontact
trigger3 = stateno = 230 && Movecontact

[State -1, Stand Strong Kick]
type = ChangeState
value = ifelse(P2BodyDist X<=15, 251, 250)
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 240 && (Movecontact && P2BodyDist X>=15)

;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "holddown"
triggerall = command = "x"
triggerall = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && Movecontact

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = command = "holddown"
triggerall = command = "y"
triggerall = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && Movecontact
trigger3 = stateno = 430 && Movecontact

[State -1, Crouching Strong Punch]
type = ChangeState
value = 420
triggerall = command = "holddown"
triggerall = command = "z"
triggerall = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && Movecontact
trigger3 = stateno = 430 && Movecontact

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "holddown"
triggerall = command = "a"
triggerall = statetype = C
trigger1 = ctrl
trigger2 = stateno = 430 && Movecontact

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = command = "holddown"
triggerall = command = "b"
triggerall = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && Movecontact

[State -1, Crouching Strong Kick]
type = ChangeState
value = 450
triggerall = command = "holddown"
triggerall = command = "c"
triggerall = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 && Movecontact
trigger3 = stateno = 430 && Movecontact
trigger4 = stateno = 410 && Time = [10,15]

;---------------------------------------------------------------------------
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
[State -1, Jump Strong Punch]
type = ChangeState
value = 620
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
triggerall = statetype = A
trigger1 = ctrl
[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = command = "b"
triggerall = statetype = A
trigger1 = ctrl
[State -1, Jump Strong Kick]
type = ChangeState
value = 650
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl
