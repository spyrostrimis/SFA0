;=====================================================================
;  CMD File For "Juni"                                  Made By M.M.R.
;                                       Ver. 0.7           2001.Aug.20
;=====================================================================
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
; Definition of the Commands
;=====================================================================

;-| CPU Function |----------------------------------------------------
[Command]
name = "cpu"
command = ~D,DF, F, a
time = 1

[Command]
name = "cpu"
command = ~D,DF, F, b
time = 1

[Command]
name = "cpu"
command = ~D,DF, F, c
time = 1

[Command]
name = "cpu"
command = ~D,DB, B, a
time = 1

[Command]
name = "cpu"
command = ~D,DB, B, b
time = 1

[Command]
name = "cpu"
command = ~D,DB, B, c
time = 1

[Command]
name = "cpu"
command = ~D,DB, F, a
time = 1

[Command]
name = "cpu"
command = ~D,DB, F, b
time = 1

[Command]
name = "cpu"
command = ~D,DB, F, c
time = 1

[Command]
name = "cpu"
command = ~D,UB, F, a
time = 1

[Command]
name = "cpu"
command = ~D,UB, F, b
time = 1

[Command]
name = "cpu"
command = ~D,UB, F, c
time = 1

[Command]
name = "cpu"
command = ~D,DF, F, s
time = 1

[Command]
name = "cpu"
command = ~D,DB, B, s
time = 1

[Command]
name = "cpu"
command = ~D,UB, F, x
time = 1

[Command]
name = "cpu"
command = ~D,UB, F, y
time = 1

[Command]
name = "cpu"
command = ~D,UB, F, z
time = 1

[Command]
name = "cpu"
command = ~D,DB, F, x
time = 1

[Command]
name = "cpu"
command = ~D,DB, F, y
time = 1

[Command]
name = "cpu"
command = ~D,DB, F, z
time = 1

[Command]
name = "cpu"
command = ~D,DB, B, x
time = 1

[Command]
name = "cpu"
command = ~D,DB, B, y
time = 1

[Command]
name = "cpu"
command = ~D,DB, B, z
time = 1

[Command]
name = "cpu"
command = ~D,DF, F, x
time = 1

[Command]
name = "cpu"
command = ~D,DF, F, y
time = 1

[Command]
name = "cpu"
command = ~D,DF, F, z
time = 1


;-| Super Motions |---------------------------------------------------

;---------------------------------------------------------------------
; デスクロスダンシング
[Command]
name = "dcd"
command = x, x, F, a, z
time = 40

;---------------------------------------------------------------------
; サイコストリーク
[Command]
name = "ps_a"
command = ~40$B, F, B, F, x
time = 35

[Command]
name = "ps_b"
command = ~40$B, F, B, F, y
time = 35

[Command]
name = "ps_c"
command = ~40$B, F, B, F, z
time = 35

;---------------------------------------------------------------------
; スピンドライブスマッシャー
[Command]
name = "sds_a"
command = ~40$B, F, B, F, a
time = 35

[Command]
name = "sds_b"
command = ~40$B, F, B, F, b
time = 35

[Command]
name = "sds_c"
command = ~40$B, F, B, F, c
time = 35

;-| Special Motions |-------------------------------------------------

;---------------------------------------------------------------------
;---------------------------------------------------------------------
; Earth Slide
[Command]
name = "ed"
command = ~F,DF,DB,B,F, a
time = 30
[Command]
name = "ed"
command = ~F,DF,DB,B,F, b
time = 30
[Command]
name = "ed"
command = ~F,DF,DB,B,F, c
time = 30
[Command]
name = "ed"
command = ~F,DF,D,DB,B,F, a
time = 35
[Command]
name = "ed"
command = ~F,DF,D,DB,B,F, b
time = 35
[Command]
name = "ed"
command = ~F,DF,D,DB,B,F, c
time = 35

; スパイラルアロー
[Command]
name = "saa_a"
command = ~20$B, F, x
time = 15

[Command]
name = "saa_b"
command = ~20$B, F, y
time = 15

[Command]
name = "saa_c"
command = ~20$B, F, z
time = 15

[Command]
name = "sa_a"
command = ~60$B, F, a
time = 15

[Command]
name = "sa_b"
command = ~60$B, F, b
time = 15

[Command]
name = "sa_c"
command = ~60$B, F, c
time = 15

;---------------------------------------------------------------------
; キャノンスパイク
[Command]
name = "cs_a"
command = ~60$D,$U, a
time = 15

[Command]
name = "cs_b"
command = ~60$D,$U, b
time = 15

[Command]
name = "cs_c"
command = ~60$D,$U, c
time = 15


;---------------------------------------------------------------------
; キャノンストライク／マッハスライド
[Command]
name = "ms_a"
command = ~D,DF, F, a
time = 20

[Command]
name = "ms_b"
command = ~D,DF, F, b
time = 20

[Command]
name = "ms_c"
command = ~D,DF, F, c
time = 20


;-| Double Tap |------------------------------------------------------
[Command]
name = "FF";Required (do not remove)
command = F, F
time = 15

[Command]
name = "BB";Required (do not remove)
command = B, B
time = 15

;-| 2/3 Button Combination |------------------------------------------

;---------------------------------------------------------------------
; サイコチャージβ
[Command]
name = "pcb"
command = a+b+c
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

;------------------- Street Fighter Zero 3
[Command]
name = "airthrow_p"
command = x+y
time = 3
[Command]
name = "airthrow_p"
command = y+z
time = 3
[Command]
name = "airthrow_p"
command = x+z
time = 3
[Command]
name = "airthrow_k"
command = a+c
time = 3
[Command]
name = "airthrow_k"
command = a+b
time = 3
[Command]
name = "airthrow_k"
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
name = "throw_p"
command = x+y
time = 1

[Command]
name = "throw_p"
command = y+z
time = 1

[Command]
name = "throw_p"
command = x+z
time = 1

[Command]
name = "throw_k"
command = a+c
time = 1

[Command]
name = "throw_k"
command = a+b
time = 1

[Command]
name = "throw_k"
command = b+c
time = 1



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

;=====================================================================
; CPU Function
;=====================================================================
;
;=====================================================================
; Super Arts
;=====================================================================

;---------------------------------------------------------------------
; デスクロスダンシング
[State -1]
type = ChangeState
value = 3900
triggerall = Power >= 3000
triggerall = Command = "dcd"
triggerall = StateType != A
trigger1 = (StateNo = [200,500)) || StateNo = 600
trigger2 = Ctrl = 1

;---------------------------------------------------------------------
; サイコストリーク（Ｌｖ１）
[State -1]
type = ChangeState
value = 3000
triggerall = StateType != A
triggerall = Ctrl = 1
triggerall = Power >= 1000
trigger1 = Command = "ps_a"
trigger2 = Command = "ps_b" && Power < 2000
trigger3 = Command = "ps_c" && Power < 2000

;------------------------ キャンセル設定
[State -1]
type = ChangeState
value = 3000
triggerall = Power >= 1000
triggerall = StateType != A
triggerall = MoveContact
triggerall = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350
trigger1 = Command = "ps_a"
trigger2 = Command = "ps_b" && Power < 2000
trigger3 = Command = "ps_c" && Power < 2000

;---------------------------------------------------------------------
; サイコストリーク（Ｌｖ２）
[State -1]
type = ChangeState
value = 3100
triggerall = StateType != A
triggerall = Ctrl = 1
triggerall = Power >= 2000
trigger1 = Command = "ps_b"
trigger2 = Command = "ps_c" && Power < 3000

;------------------------ キャンセル設定
[State -1]
type = ChangeState
value = 3100
triggerall = Power >= 2000
triggerall = StateType != A
triggerall = MoveContact
triggerall = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350
trigger1 = Command = "ps_b"
trigger2 = Command = "ps_c" && Power < 3000

;---------------------------------------------------------------------
; サイコストリーク（Ｌｖ３）
[State -1]
type = ChangeState
value = 3200
triggerall = StateType != A
triggerall = Ctrl = 1
triggerall = Power >= 3000
trigger1 = Command = "ps_c"

;------------------------ キャンセル設定
[State -1]
type = ChangeState
value = 3200
triggerall = Power >= 3000
triggerall = StateType != A
triggerall = MoveContact
triggerall = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350
trigger1 = Command = "ps_c"

;---------------------------------------------------------------------
; スピンドライブスマッシャー（Ｌｖ１）
[State -1]
type = ChangeState
value = 3300
triggerall = StateType != A
triggerall = Power >= 1000
triggerall = Command = "sds_a"
trigger1 = Ctrl = 1
trigger2 = StateNo = 40 && MoveType != H
trigger3 = MoveContact
trigger3 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

[State -1]
type = ChangeState
value = 3300
triggerall = StateType != A
triggerall = Power >= 1000
triggerall = Command = "sds_b" && Power < 2000
trigger1 = Ctrl = 1
trigger2 = StateNo = 40 && MoveType != H
trigger3 = MoveContact
trigger3 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

[State -1]
type = ChangeState
value = 3300
triggerall = StateType != A
triggerall = Power >= 1000
triggerall = Command = "sds_c" && Power < 2000
trigger1 = Ctrl = 1
trigger2 = StateNo = 40 && MoveType != H
trigger3 = MoveContact
trigger3 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

;---------------------------------------------------------------------
; スピンドライブスマッシャー（Ｌｖ２）
[State -1]
type = ChangeState
value = 3400
triggerall = StateType != A
triggerall = Power >= 2000
triggerall = Command = "sds_b"
trigger1 = Ctrl = 1
trigger2 = StateNo = 40 && MoveType != H
trigger3 = MoveContact
trigger3 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

[State -1]
type = ChangeState
value = 3400
triggerall = StateType != A
triggerall = Power >= 2000
triggerall = Command = "sds_c" && Power < 3000
trigger1 = Ctrl = 1
trigger2 = StateNo = 40 && MoveType != H
trigger3 = MoveContact
trigger3 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

;---------------------------------------------------------------------
; スピンドライブスマッシャー（Ｌｖ３）
[State -1]
type = ChangeState
value = 3500
triggerall = StateType != A
triggerall = Power >= 3000
triggerall = Command = "sds_c"
trigger1 = Ctrl = 1
trigger2 = StateNo = 40 && MoveType != H
trigger3 = MoveContact
trigger3 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

;---------------------------------------------------------------------
; オリジナルコンボ発動
[State -1]
type = Null;ChangeState
value = 7000 + IfElse(StateType = A,50,0)
triggerall = Command = "s"
trigger1 = Ctrl = 1

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

;=====================================================================
; Special Arts 
;=====================================================================

;---------------------------------------------------------------------
; キャノンスパイク・弱
[State -1]
type = ChangeState
value = 1200
triggerall = Command = "cs_a"
triggerall = StateType != A
trigger1 = Ctrl = 1
trigger2 = StateNo = 40
trigger2 = MoveType != H

;------------------------ キャンセル設定
[State -1]
type = ChangeState
value = 1200
triggerall = Command = "cs_a"
triggerall = StateType != A
triggerall = MoveContact
trigger1 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

;---------------------------------------------------------------------
; キャノンスパイク・中
[State -1]
type = ChangeState
value = 1250
triggerall = Command = "cs_b"
triggerall = StateType != A
trigger1 = Ctrl = 1
trigger2 = StateNo = 40
trigger2 = MoveType != H

;------------------------ キャンセル設定
[State -1]
type = ChangeState
value = 1250
triggerall = Command = "cs_b"
triggerall = StateType != A
triggerall = MoveContact
trigger1 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

;---------------------------------------------------------------------
; キャノンスパイク・強
[State -1]
type = ChangeState
value = 1270
triggerall = Command = "cs_c"
triggerall = StateType != A
trigger1 = Ctrl = 1
trigger2 = StateNo = 40
trigger2 = MoveType != H

;------------------------ キャンセル設定
[State -1]
type = ChangeState
value = 1270
triggerall = Command = "cs_c"
triggerall = StateType != A
triggerall = MoveContact
trigger1 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

;---------------------------------------------------------------------
; スパイラルアロー・弱
[State -1]
type = ChangeState
value = 1000
triggerall = Command = "sa_a"
trigger1 = Ctrl = 1
trigger1 = StateType != A

;------------------------ キャンセル設定
[State -1]
type = ChangeState
value = 1000
triggerall = Command = "sa_a"
triggerall = StateType != A
triggerall = MoveContact
trigger1 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

;---------------------------------------------------------------------
; スパイラルアロー・中
[State -1]
type = ChangeState
value = 1030
triggerall = Command = "sa_b"
trigger1 = Ctrl = 1
trigger1 = StateType != A

;------------------------ キャンセル設定
[State -1]
type = ChangeState
value = 1030
triggerall = Command = "sa_b"
triggerall = StateType != A
triggerall = MoveContact
trigger1 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

;---------------------------------------------------------------------
; スパイラルアロー・強
[State -1]
type = ChangeState
value = 1060
triggerall = Command = "sa_c"
trigger1 = Ctrl = 1
trigger1 = StateType != A

;------------------------ キャンセル設定
[State -1]
type = ChangeState
value = 1060
triggerall = Command = "sa_c"
triggerall = StateType != A
triggerall = MoveContact
trigger1 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

;---------------------------------------------------------------------
; エアスパイラルアロー・弱
[State -1]
type = ChangeState
value = 1100
triggerall = Command = "saa_a"
trigger1 = Ctrl = 1
trigger1 = StateType = A && Pos Y < 0

;---------------------------------------------------------------------
; エアスパイラルアロー・中
[State -1]
type = ChangeState
value = 1150
triggerall = Command = "saa_b"
trigger1 = Ctrl = 1
trigger1 = StateType = A && Pos Y < 0

;---------------------------------------------------------------------
; エアスパイラルアロー・強
[State -1]
type = ChangeState
value = 1170
triggerall = Command = "saa_c"
trigger1 = Ctrl = 1
trigger1 = StateType = A && Pos Y < 0

;---------------------------------------------------------------------
; マッハスライド・弱
[State -1]
type = ChangeState
value = 1500
triggerall = Command = "ms_a"
trigger1 = Ctrl = 1
trigger1 = StateType != A

;------------------------ キャンセル設定
[State -1]
type = ChangeState
value = 1500
triggerall = Command = "ms_a"
triggerall = StateType != A
triggerall = MoveContact
trigger1 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

;---------------------------------------------------------------------
; マッハスライド・中
[State -1]
type = ChangeState
value = 1510
triggerall = Command = "ms_b"
trigger1 = Ctrl = 1
trigger1 = StateType != A

;------------------------ キャンセル設定
[State -1]
type = ChangeState
value = 1510
triggerall = Command = "ms_b"
triggerall = StateType != A
triggerall = MoveContact
trigger1 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

;---------------------------------------------------------------------
; マッハスライド・強
[State -1]
type = ChangeState
value = 1520
triggerall = Command = "ms_c"
trigger1 = Ctrl = 1
trigger1 = StateType != A

;------------------------ キャンセル設定
[State -1]
type = ChangeState
value = 1520
triggerall = Command = "ms_c"
triggerall = StateType != A
triggerall = MoveContact
trigger1 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350


;---------------------------------------------------------------------
; マッハスライド・弱
[State -1]
type = ChangeState
value = 1600
triggerall = Command = "ed"
trigger1 = Ctrl = 1
trigger1 = StateType != A

;------------------------ キャンセル設定
[State -1]
type = ChangeState
value = 1600
triggerall = Command = "ed"
triggerall = StateType != A
triggerall = MoveContact
trigger1 = (StateNo = [200,220]) || (StateNo = [300,310]) || StateNo = 350

;=====================================================================
; Special Attacks , Moves and so on.
;=====================================================================

;---------------------------------------------------------------------
; ＺＥＲＯカウンター
[State -1]
type = ChangeState
value = 4000 + IfElse(Var(31) = 1,50,0)
triggerall = Command = "holdfwd"
triggerall = Command = "ax" || Command = "by" || Command = "cz"
triggerall = Var(31) != -1
trigger1 = Var(31) = 0 && Power >= 1000
trigger1 = StateNo = [150,153]
trigger2 = Var(31) = 1 && Power >= 1500
trigger2 = StateNo = [150,153]

;---------------------------------------------------------------------
; サイコチャージβ
[State -1]
type = ChangeState
value = 4500
triggerall = Command = "pcb"
triggerall = StateType != A
trigger1 = Ctrl = 1

;=====================================================================
; Basic Animation
;=====================================================================

;---------------------------------------------------------------------
;RunFwd
[State -1]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl = 1

;---------------------------------------------------------------------
;RunBack
[State -1]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl = 1

;=====================================================================
; Basic Throws
;=====================================================================

;---------------------------------------------------------------------
; フーリガンスープレックス（Ｐ通常投げ）
[State -1]
type = ChangeState
value = 800
triggerall = StateNo != 100
triggerall = StateType = S
triggerall = Ctrl = 1
trigger1 = Command = "throw_p"

;---------------------------------------------------------------------
; フランケンシュタイナー（Ｋ通常投げ）
[State -1]
type = ChangeState
value = 850
triggerall = StateNo != 100
triggerall = StateType = S
triggerall = Ctrl = 1
trigger1 = Command = "throw_k"

;---------------------------------------------------------------------
; フライングネックハント（Ｐ空中投げ）
[State -1]
type = ChangeState
value = 900
triggerall = StateType = A
triggerall = Ctrl = 1
trigger1 = Command = "airthrow_p"

;---------------------------------------------------------------------
; エアフランケンシュタイナー（Ｋ空中投げ）
[State -1]
type = ChangeState
value = 950
triggerall = StateType = A
triggerall = Ctrl = 1
trigger1 = Command = "airthrow_k"

;=====================================================================
; Dir + Button
;=====================================================================

;---------------------------------------------------------------------
; フォーリングアーク（→＋中Ｋ）
[State -1]
type = ChangeState
value = 600
triggerall = Command = "fwd_b"
triggerall = Command != "holddown"
trigger1 = Ctrl = 1
trigger1 = StateType = S

;=====================================================================
; Taunts
;=====================================================================

;---------------------------------------------------------------------
; 挑発
[State -1]
type = ChangeState
value = 195
triggerall = !var(59)
triggerall = Command = "s"
trigger1 = StateType = S
trigger1 = Ctrl = 1

;=====================================================================
; Basic Arts
;=====================================================================

;---------------------------------------------------------------------
; 弱パンチ
[State -1]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = ctrl = 1
trigger1 = statetype = S
trigger2 = StateNo = 200 && Time >= 10
trigger3 = StateNo = 215 && Time >= 10
trigger4 = StateNo = 300 && Time >= 9
trigger5 = StateNo = 350 && Time >= 9

;---------------------------------------------------------------------
; 中パンチ
[State -1]
type = ChangeState
value = 205
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1

;---------------------------------------------------------------------
; 強パンチ
[State -1]
type = ChangeState
value = 210
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1

;---------------------------------------------------------------------
; 弱キック
[State -1]
type = ChangeState
value = 215
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = ctrl = 1
trigger1 = statetype = S
trigger2 = StateNo = 200 && Time >= 10
trigger3 = StateNo = 215 && Time >= 10
trigger4 = StateNo = 300 && Time >= 9
trigger5 = StateNo = 350 && Time >= 9

;---------------------------------------------------------------------
; 中キック
[State -1]
type = ChangeState
value = 220
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = ctrl = 1
trigger1 = statetype = S

;---------------------------------------------------------------------
; 強キック
[State -1]
type = ChangeState
value = 225
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl = 1

;---------------------------------------------------------------------
; しゃがみ弱パンチ
[State -1]
type = ChangeState
value = 300
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = StateNo = 200 && Time >= 10
trigger3 = StateNo = 215 && Time >= 10
trigger4 = StateNo = 300 && Time >= 9
trigger5 = StateNo = 350 && Time >= 9

;---------------------------------------------------------------------
; しゃがみ中パンチ
[State -1]
type = ChangeState
value = 310
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

;---------------------------------------------------------------------
; しゃがみ強パンチ
[State -1]
type = ChangeState
value = 320
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

;---------------------------------------------------------------------
; しゃがみ弱キック
[State -1]
type = ChangeState
value = 350
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1
trigger2 = StateNo = 200 && Time >= 10
trigger3 = StateNo = 215 && Time >= 10
trigger4 = StateNo = 300 && Time >= 9
trigger5 = StateNo = 350 && Time >= 9

;---------------------------------------------------------------------
; しゃがみ中キック
[State -1]
type = ChangeState
value = 360
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

;---------------------------------------------------------------------
; しゃがみ強キック
[State -1]
type = ChangeState
value = 370
triggerall = command = "c"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl = 1

;---------------------------------------------------------------------
; ジャンプ弱パンチ
[State -1]
type = ChangeState
value = 500
triggerall = command = "x"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

;---------------------------------------------------------------------
; ジャンプ中パンチ
[State -1]
type = ChangeState
value = 510
triggerall = command = "y"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

;---------------------------------------------------------------------
; ジャンプ強パンチ
[State -1]
type = ChangeState
value = 520
triggerall = command = "z"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

;---------------------------------------------------------------------
; ジャンプ弱キック
[State -1]
type = ChangeState
value = 530
triggerall = command = "a"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

;---------------------------------------------------------------------
; ジャンプ中キック
[State -1]
type = ChangeState
value = 540
triggerall = command = "b"
triggerall = statetype = A
triggerall = ctrl = 1
trigger1 = StateNo != 105

;---------------------------------------------------------------------
; ジャンプ強キック
[State -1]
type = ChangeState
value = 550
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
var(59) = 10

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
var(59) = 8

[State -3]
type = Varset
triggerall = !var(59) ; Check the AI flag
trigger1 = alive
trigger1 = stateno < 5500
trigger1 = command = "AI_1" || command = "AI_2" || command = "AI_3" || command = "AI_4"
trigger2 = command = "AI_6" || command = "AI_7" || command = "AI_8" || command = "AI_9"
trigger3 = command = "AI_11" || command = "AI_12" || command = "AI_13" || command = "AI_14"
trigger4 = command = "AI_16" || command = "AI_17" || command = "AI_18" || command = "AI_19"
var(59) = 6

[State -3]
type = Varset
triggerall = !var(59) ; Check the AI flag
trigger1 = alive
trigger1 = stateno < 5500
trigger1 = command = "AI_1" || command = "AI_2" || command = "AI_3"
trigger2 = command = "AI_6" || command = "AI_7" || command = "AI_8"
trigger3 = command = "AI_11" || command = "AI_12" || command = "AI_13"
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
value = 210
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = P2BodyDist X <= 25
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist Y < -30
[State -1]
type = ChangeState
value = 320
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
trigger1 = statetype != A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist X = [26,30]
trigger1 = p2bodydist Y < -30
[State -1]
type = ChangeState
value = 205
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = P2BodyDist X <= 25
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype = A
trigger1 = p2movetype = H
trigger1 = p2bodydist Y = [-70,20]
[State -1]
type = ChangeState
value = 210
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
value = 200
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype = A
trigger1 = p2bodydist X = [26,60]
trigger1 = p2bodydist Y = [-70,20]
[State -1]
type = ChangeState
value = 350
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
value = 360
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
trigger1 = statetype != A
trigger1 = ctrl 
trigger1 = p2statetype != A && p2statetype != L
trigger1 = p2bodydist X = [-5,70]
trigger1 = p2stateno != [152,153]
trigger1 = random < 150
[State -1]
type = ChangeState
value = 500
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = statetype = A
trigger1 = ctrl 
trigger1 = Vel X != 0
trigger1 = p2statetype = A
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2bodydist Y = [-70,60]
[State -1]
type = ChangeState
value = 510
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = statetype = A
trigger1 = ctrl 
trigger1 = p2bodydist X = [-5,20]
trigger1 = p2bodydist Y = [-60,100]
trigger1 = p2statetype = A
[State -1]
type = ChangeState
value = 520
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,50]
trigger1 = p2bodydist Y = [0,70]
trigger1 = p2statetype = A
[State -1]
type = ChangeState
value = 530
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = statetype = A
trigger1 = ctrl 
trigger1 = p2bodydist X = [-5,20]
trigger1 = p2bodydist Y = [-60,100]
trigger1 = p2statetype = A
[State -1]
type = ChangeState
value = 540
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2statetype = A
trigger1 = p2bodydist X = [-5,30]
trigger1 = p2bodydist Y = [-90,0]
[State -1]
type = ChangeState
value = 550
triggerall = random < var(59)*100 && roundstate = 2  && AILevel > 2
triggerall = statetype = A
trigger1 = ctrl
trigger1 = p2bodydist X = [-5,80]
trigger1 = p2bodydist Y = [0,110]
trigger1 = p2statetype = A