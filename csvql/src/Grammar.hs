{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,255) ([49152,10239,16,32768,0,0,0,0,0,0,0,0,0,0,0,256,0,0,224,256,0,0,0,0,0,0,0,0,32,0,0,0,64,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,8,0,0,8192,0,2048,0,0,0,8192,0,0,0,8192,0,0,0,0,0,0,0,32768,0,0,128,0,0,32752,258,0,8,0,0,0,0,0,2944,1024,0,0,2252,448,16,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,256,0,4480,1,0,0,0,0,0,0,8192,0,2048,0,52224,49160,4097,0,0,0,0,0,0,0,8192,0,0,0,16384,0,16376,129,0,4,32752,258,0,8,65504,516,0,16,65472,1033,0,32,65504,2067,0,64,0,0,0,0,0,1024,0,0,0,2048,0,0,0,4096,0,0,0,0,0,0,57344,1279,2,4096,49152,2559,4,8192,0,0,0,2016,0,0,24608,0,0,0,0,0,0,0,31744,16128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1126,224,8,0,2252,448,16,0,0,0,0,0,0,0,0,0,0,2,0,0,0,8192,0,0,0,0,0,0,8960,2,0,0,0,1984,0,0,35840,8,0,0,0,0,0,0,0,49216,0,0,0,0,0,0,0,2,0,0,32768,281,56,2,0,563,112,4,0,51200,7,0,0,2188,0,0,0,4376,0,0,0,8752,0,0,0,17504,0,0,0,35008,0,0,0,0,33264,0,0,4096,0,1024,0,0,0,0,0,0,0,0,0,0,24608,0,0,0,15936,8064,0,24576,68,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,128,0,28672,32768,0,0,57344,0,1,0,0,0,0,0,0,1984,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,57344,0,0,0,49152,1,0,0,32768,3,0,0,0,7,0,0,0,14,0,0,0,0,0,0,0,0,0,64512,16543,0,512,0,28672,32768,1,0,2048,0,0,0,8960,2,0,0,0,0,0,0,0,3968,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Prog","Expr","Query","CsvExpr","Cols","ColItem","Col","Conds","Cond","MathExpr","Operation","csv","query","import","print","asc","desc","select","reform","update","write","note","unique","err","id","arity","if","'->'","dollar","int","x","'++'","'--'","'('","')'","'['","']'","'+'","'-'","'/'","'*'","'%'","'&&'","'||'","'!'","true","false","','","'.'","'|'","';'","'!='","'=='","'>='","'<='","'<'","'>'","'='","word","fileName","var","%eof"]
        bit_start = st Prelude.* 65
        bit_end = (st Prelude.+ 1) Prelude.* 65
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..64]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (15) = happyShift action_6
action_0 (16) = happyShift action_7
action_0 (17) = happyShift action_8
action_0 (18) = happyShift action_9
action_0 (19) = happyShift action_10
action_0 (20) = happyShift action_11
action_0 (21) = happyShift action_12
action_0 (22) = happyShift action_13
action_0 (23) = happyShift action_14
action_0 (24) = happyShift action_15
action_0 (25) = happyShift action_16
action_0 (26) = happyShift action_17
action_0 (27) = happyShift action_18
action_0 (30) = happyShift action_19
action_0 (37) = happyShift action_20
action_0 (64) = happyShift action_21
action_0 (4) = happyGoto action_2
action_0 (5) = happyGoto action_3
action_0 (6) = happyGoto action_4
action_0 (7) = happyGoto action_5
action_0 _ = happyReduce_1

action_1 _ = happyFail (happyExpListPerState 1)

action_2 (65) = happyAccept
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (54) = happyShift action_39
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (34) = happyShift action_35
action_4 (35) = happyShift action_36
action_4 (36) = happyShift action_37
action_4 (53) = happyShift action_38
action_4 _ = happyReduce_6

action_5 _ = happyReduce_7

action_6 (64) = happyShift action_34
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (64) = happyShift action_33
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (63) = happyShift action_32
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_14

action_10 _ = happyReduce_11

action_11 _ = happyReduce_12

action_12 (37) = happyShift action_31
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (39) = happyShift action_30
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (32) = happyShift action_28
action_14 (62) = happyShift action_29
action_14 (10) = happyGoto action_27
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (63) = happyShift action_26
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (62) = happyShift action_25
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_20

action_18 (62) = happyShift action_24
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (37) = happyShift action_23
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (17) = happyShift action_8
action_20 (18) = happyShift action_9
action_20 (19) = happyShift action_10
action_20 (20) = happyShift action_11
action_20 (21) = happyShift action_12
action_20 (22) = happyShift action_13
action_20 (23) = happyShift action_14
action_20 (24) = happyShift action_15
action_20 (25) = happyShift action_16
action_20 (26) = happyShift action_17
action_20 (27) = happyShift action_18
action_20 (30) = happyShift action_19
action_20 (37) = happyShift action_20
action_20 (64) = happyShift action_21
action_20 (6) = happyGoto action_22
action_20 (7) = happyGoto action_5
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_17

action_22 (34) = happyShift action_35
action_22 (35) = happyShift action_36
action_22 (36) = happyShift action_37
action_22 (38) = happyShift action_66
action_22 (53) = happyShift action_38
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (28) = happyShift action_51
action_23 (29) = happyShift action_52
action_23 (32) = happyShift action_28
action_23 (33) = happyShift action_53
action_23 (37) = happyShift action_54
action_23 (48) = happyShift action_55
action_23 (49) = happyShift action_56
action_23 (50) = happyShift action_57
action_23 (62) = happyShift action_29
action_23 (10) = happyGoto action_47
action_23 (11) = happyGoto action_65
action_23 (12) = happyGoto action_49
action_23 (13) = happyGoto action_50
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_21

action_25 _ = happyReduce_19

action_26 _ = happyReduce_18

action_27 (32) = happyShift action_28
action_27 (62) = happyShift action_29
action_27 (10) = happyGoto action_64
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (28) = happyShift action_51
action_28 (29) = happyShift action_52
action_28 (33) = happyShift action_53
action_28 (37) = happyShift action_63
action_28 (13) = happyGoto action_62
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_31

action_30 (32) = happyShift action_61
action_30 (62) = happyShift action_29
action_30 (8) = happyGoto action_58
action_30 (9) = happyGoto action_59
action_30 (10) = happyGoto action_60
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (28) = happyShift action_51
action_31 (29) = happyShift action_52
action_31 (32) = happyShift action_28
action_31 (33) = happyShift action_53
action_31 (37) = happyShift action_54
action_31 (48) = happyShift action_55
action_31 (49) = happyShift action_56
action_31 (50) = happyShift action_57
action_31 (62) = happyShift action_29
action_31 (10) = happyGoto action_47
action_31 (11) = happyGoto action_48
action_31 (12) = happyGoto action_49
action_31 (13) = happyGoto action_50
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_10

action_33 (61) = happyShift action_46
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (61) = happyShift action_45
action_34 _ = happyReduce_4

action_35 (17) = happyShift action_8
action_35 (18) = happyShift action_9
action_35 (19) = happyShift action_10
action_35 (20) = happyShift action_11
action_35 (21) = happyShift action_12
action_35 (22) = happyShift action_13
action_35 (23) = happyShift action_14
action_35 (24) = happyShift action_15
action_35 (25) = happyShift action_16
action_35 (26) = happyShift action_17
action_35 (27) = happyShift action_18
action_35 (30) = happyShift action_19
action_35 (37) = happyShift action_20
action_35 (64) = happyShift action_21
action_35 (6) = happyGoto action_44
action_35 (7) = happyGoto action_5
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (17) = happyShift action_8
action_36 (18) = happyShift action_9
action_36 (19) = happyShift action_10
action_36 (20) = happyShift action_11
action_36 (21) = happyShift action_12
action_36 (22) = happyShift action_13
action_36 (23) = happyShift action_14
action_36 (24) = happyShift action_15
action_36 (25) = happyShift action_16
action_36 (26) = happyShift action_17
action_36 (27) = happyShift action_18
action_36 (30) = happyShift action_19
action_36 (37) = happyShift action_20
action_36 (64) = happyShift action_21
action_36 (6) = happyGoto action_43
action_36 (7) = happyGoto action_5
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (17) = happyShift action_8
action_37 (18) = happyShift action_9
action_37 (19) = happyShift action_10
action_37 (20) = happyShift action_11
action_37 (21) = happyShift action_12
action_37 (22) = happyShift action_13
action_37 (23) = happyShift action_14
action_37 (24) = happyShift action_15
action_37 (25) = happyShift action_16
action_37 (26) = happyShift action_17
action_37 (27) = happyShift action_18
action_37 (30) = happyShift action_19
action_37 (37) = happyShift action_20
action_37 (64) = happyShift action_21
action_37 (6) = happyGoto action_42
action_37 (7) = happyGoto action_5
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (17) = happyShift action_8
action_38 (18) = happyShift action_9
action_38 (19) = happyShift action_10
action_38 (20) = happyShift action_11
action_38 (21) = happyShift action_12
action_38 (22) = happyShift action_13
action_38 (23) = happyShift action_14
action_38 (24) = happyShift action_15
action_38 (25) = happyShift action_16
action_38 (26) = happyShift action_17
action_38 (27) = happyShift action_18
action_38 (30) = happyShift action_19
action_38 (37) = happyShift action_20
action_38 (64) = happyShift action_21
action_38 (6) = happyGoto action_41
action_38 (7) = happyGoto action_5
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (15) = happyShift action_6
action_39 (16) = happyShift action_7
action_39 (17) = happyShift action_8
action_39 (18) = happyShift action_9
action_39 (19) = happyShift action_10
action_39 (20) = happyShift action_11
action_39 (21) = happyShift action_12
action_39 (22) = happyShift action_13
action_39 (23) = happyShift action_14
action_39 (24) = happyShift action_15
action_39 (25) = happyShift action_16
action_39 (26) = happyShift action_17
action_39 (27) = happyShift action_18
action_39 (30) = happyShift action_19
action_39 (37) = happyShift action_20
action_39 (64) = happyShift action_21
action_39 (4) = happyGoto action_40
action_39 (5) = happyGoto action_3
action_39 (6) = happyGoto action_4
action_39 (7) = happyGoto action_5
action_39 _ = happyReduce_1

action_40 _ = happyReduce_2

action_41 (34) = happyShift action_35
action_41 _ = happyReduce_8

action_42 (34) = happyShift action_35
action_42 _ = happyReduce_25

action_43 (34) = happyShift action_35
action_43 _ = happyReduce_24

action_44 _ = happyReduce_23

action_45 (17) = happyShift action_8
action_45 (18) = happyShift action_9
action_45 (19) = happyShift action_10
action_45 (20) = happyShift action_11
action_45 (21) = happyShift action_12
action_45 (22) = happyShift action_13
action_45 (23) = happyShift action_14
action_45 (24) = happyShift action_15
action_45 (25) = happyShift action_16
action_45 (26) = happyShift action_17
action_45 (27) = happyShift action_18
action_45 (30) = happyShift action_19
action_45 (37) = happyShift action_20
action_45 (64) = happyShift action_21
action_45 (6) = happyGoto action_92
action_45 (7) = happyGoto action_5
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (17) = happyShift action_8
action_46 (18) = happyShift action_9
action_46 (19) = happyShift action_10
action_46 (20) = happyShift action_11
action_46 (21) = happyShift action_12
action_46 (22) = happyShift action_13
action_46 (23) = happyShift action_14
action_46 (24) = happyShift action_15
action_46 (25) = happyShift action_16
action_46 (26) = happyShift action_17
action_46 (27) = happyShift action_18
action_46 (30) = happyShift action_19
action_46 (37) = happyShift action_20
action_46 (64) = happyShift action_21
action_46 (6) = happyGoto action_91
action_46 (7) = happyGoto action_5
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (55) = happyShift action_83
action_47 (56) = happyShift action_84
action_47 (57) = happyShift action_85
action_47 (58) = happyShift action_86
action_47 (59) = happyShift action_87
action_47 (60) = happyShift action_88
action_47 (14) = happyGoto action_90
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (38) = happyShift action_89
action_48 (46) = happyShift action_68
action_48 (47) = happyShift action_69
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_32

action_50 (41) = happyShift action_71
action_50 (42) = happyShift action_72
action_50 (43) = happyShift action_73
action_50 (44) = happyShift action_74
action_50 (45) = happyShift action_75
action_50 (55) = happyShift action_83
action_50 (56) = happyShift action_84
action_50 (57) = happyShift action_85
action_50 (58) = happyShift action_86
action_50 (59) = happyShift action_87
action_50 (60) = happyShift action_88
action_50 (14) = happyGoto action_82
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_42

action_52 _ = happyReduce_41

action_53 _ = happyReduce_43

action_54 (28) = happyShift action_51
action_54 (29) = happyShift action_52
action_54 (32) = happyShift action_28
action_54 (33) = happyShift action_53
action_54 (37) = happyShift action_54
action_54 (48) = happyShift action_55
action_54 (49) = happyShift action_56
action_54 (50) = happyShift action_57
action_54 (62) = happyShift action_29
action_54 (10) = happyGoto action_47
action_54 (11) = happyGoto action_80
action_54 (12) = happyGoto action_49
action_54 (13) = happyGoto action_81
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (28) = happyShift action_51
action_55 (29) = happyShift action_52
action_55 (32) = happyShift action_28
action_55 (33) = happyShift action_53
action_55 (37) = happyShift action_54
action_55 (48) = happyShift action_55
action_55 (49) = happyShift action_56
action_55 (50) = happyShift action_57
action_55 (62) = happyShift action_29
action_55 (10) = happyGoto action_47
action_55 (11) = happyGoto action_79
action_55 (12) = happyGoto action_49
action_55 (13) = happyGoto action_50
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_39

action_57 _ = happyReduce_40

action_58 (40) = happyShift action_78
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (51) = happyShift action_77
action_59 _ = happyReduce_26

action_60 _ = happyReduce_28

action_61 (28) = happyShift action_51
action_61 (29) = happyShift action_52
action_61 (33) = happyShift action_53
action_61 (37) = happyShift action_63
action_61 (13) = happyGoto action_76
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (41) = happyShift action_71
action_62 (42) = happyShift action_72
action_62 (43) = happyShift action_73
action_62 (44) = happyShift action_74
action_62 (45) = happyShift action_75
action_62 _ = happyReduce_30

action_63 (28) = happyShift action_51
action_63 (29) = happyShift action_52
action_63 (33) = happyShift action_53
action_63 (37) = happyShift action_63
action_63 (13) = happyGoto action_70
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_16

action_65 (38) = happyShift action_67
action_65 (46) = happyShift action_68
action_65 (47) = happyShift action_69
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_9

action_67 (31) = happyShift action_106
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (28) = happyShift action_51
action_68 (29) = happyShift action_52
action_68 (32) = happyShift action_28
action_68 (33) = happyShift action_53
action_68 (37) = happyShift action_54
action_68 (48) = happyShift action_55
action_68 (49) = happyShift action_56
action_68 (50) = happyShift action_57
action_68 (62) = happyShift action_29
action_68 (10) = happyGoto action_47
action_68 (11) = happyGoto action_105
action_68 (12) = happyGoto action_49
action_68 (13) = happyGoto action_50
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (28) = happyShift action_51
action_69 (29) = happyShift action_52
action_69 (32) = happyShift action_28
action_69 (33) = happyShift action_53
action_69 (37) = happyShift action_54
action_69 (48) = happyShift action_55
action_69 (49) = happyShift action_56
action_69 (50) = happyShift action_57
action_69 (62) = happyShift action_29
action_69 (10) = happyGoto action_47
action_69 (11) = happyGoto action_104
action_69 (12) = happyGoto action_49
action_69 (13) = happyGoto action_50
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (38) = happyShift action_95
action_70 (41) = happyShift action_71
action_70 (42) = happyShift action_72
action_70 (43) = happyShift action_73
action_70 (44) = happyShift action_74
action_70 (45) = happyShift action_75
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (28) = happyShift action_51
action_71 (29) = happyShift action_52
action_71 (33) = happyShift action_53
action_71 (37) = happyShift action_63
action_71 (13) = happyGoto action_103
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (28) = happyShift action_51
action_72 (29) = happyShift action_52
action_72 (33) = happyShift action_53
action_72 (37) = happyShift action_63
action_72 (13) = happyGoto action_102
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (28) = happyShift action_51
action_73 (29) = happyShift action_52
action_73 (33) = happyShift action_53
action_73 (37) = happyShift action_63
action_73 (13) = happyGoto action_101
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (28) = happyShift action_51
action_74 (29) = happyShift action_52
action_74 (33) = happyShift action_53
action_74 (37) = happyShift action_63
action_74 (13) = happyGoto action_100
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (28) = happyShift action_51
action_75 (29) = happyShift action_52
action_75 (33) = happyShift action_53
action_75 (37) = happyShift action_63
action_75 (13) = happyGoto action_99
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (41) = happyShift action_71
action_76 (42) = happyShift action_72
action_76 (43) = happyShift action_73
action_76 (44) = happyShift action_74
action_76 (45) = happyShift action_75
action_76 (52) = happyShift action_98
action_76 _ = happyReduce_30

action_77 (32) = happyShift action_61
action_77 (62) = happyShift action_29
action_77 (8) = happyGoto action_97
action_77 (9) = happyGoto action_59
action_77 (10) = happyGoto action_60
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_13

action_79 _ = happyReduce_33

action_80 (38) = happyShift action_96
action_80 (46) = happyShift action_68
action_80 (47) = happyShift action_69
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (38) = happyShift action_95
action_81 (41) = happyShift action_71
action_81 (42) = happyShift action_72
action_81 (43) = happyShift action_73
action_81 (44) = happyShift action_74
action_81 (45) = happyShift action_75
action_81 (55) = happyShift action_83
action_81 (56) = happyShift action_84
action_81 (57) = happyShift action_85
action_81 (58) = happyShift action_86
action_81 (59) = happyShift action_87
action_81 (60) = happyShift action_88
action_81 (14) = happyGoto action_82
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (28) = happyShift action_51
action_82 (29) = happyShift action_52
action_82 (33) = happyShift action_53
action_82 (37) = happyShift action_63
action_82 (13) = happyGoto action_94
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_51

action_84 _ = happyReduce_50

action_85 _ = happyReduce_54

action_86 _ = happyReduce_55

action_87 _ = happyReduce_52

action_88 _ = happyReduce_53

action_89 _ = happyReduce_15

action_90 (32) = happyShift action_28
action_90 (62) = happyShift action_29
action_90 (10) = happyGoto action_93
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (34) = happyShift action_35
action_91 (35) = happyShift action_36
action_91 (36) = happyShift action_37
action_91 (53) = happyShift action_38
action_91 _ = happyReduce_5

action_92 (34) = happyShift action_35
action_92 (35) = happyShift action_36
action_92 (36) = happyShift action_37
action_92 (53) = happyShift action_38
action_92 _ = happyReduce_3

action_93 _ = happyReduce_37

action_94 (41) = happyShift action_71
action_94 (42) = happyShift action_72
action_94 (43) = happyShift action_73
action_94 (44) = happyShift action_74
action_94 (45) = happyShift action_75
action_94 _ = happyReduce_38

action_95 _ = happyReduce_49

action_96 _ = happyReduce_36

action_97 _ = happyReduce_27

action_98 (52) = happyShift action_108
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (43) = happyShift action_73
action_99 (44) = happyShift action_74
action_99 (45) = happyShift action_75
action_99 _ = happyReduce_48

action_100 (43) = happyShift action_73
action_100 (44) = happyShift action_74
action_100 (45) = happyShift action_75
action_100 _ = happyReduce_47

action_101 (43) = happyShift action_73
action_101 (44) = happyShift action_74
action_101 (45) = happyShift action_75
action_101 _ = happyReduce_46

action_102 (43) = happyShift action_73
action_102 (44) = happyShift action_74
action_102 (45) = happyShift action_75
action_102 _ = happyReduce_45

action_103 (43) = happyShift action_73
action_103 (44) = happyShift action_74
action_103 (45) = happyShift action_75
action_103 _ = happyReduce_44

action_104 _ = happyReduce_35

action_105 _ = happyReduce_34

action_106 (17) = happyShift action_8
action_106 (18) = happyShift action_9
action_106 (19) = happyShift action_10
action_106 (20) = happyShift action_11
action_106 (21) = happyShift action_12
action_106 (22) = happyShift action_13
action_106 (23) = happyShift action_14
action_106 (24) = happyShift action_15
action_106 (25) = happyShift action_16
action_106 (26) = happyShift action_17
action_106 (27) = happyShift action_18
action_106 (30) = happyShift action_19
action_106 (37) = happyShift action_20
action_106 (64) = happyShift action_21
action_106 (6) = happyGoto action_107
action_106 (7) = happyGoto action_5
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (34) = happyShift action_35
action_107 (35) = happyShift action_36
action_107 (36) = happyShift action_37
action_107 (53) = happyShift action_38
action_107 (54) = happyShift action_110
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (32) = happyShift action_109
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (28) = happyShift action_51
action_109 (29) = happyShift action_52
action_109 (33) = happyShift action_53
action_109 (37) = happyShift action_63
action_109 (13) = happyGoto action_111
action_109 _ = happyFail (happyExpListPerState 109)

action_110 _ = happyReduce_22

action_111 (41) = happyShift action_71
action_111 (42) = happyShift action_72
action_111 (43) = happyShift action_73
action_111 (44) = happyShift action_74
action_111 (45) = happyShift action_75
action_111 _ = happyReduce_29

happyReduce_1 = happySpecReduce_0  4 happyReduction_1
happyReduction_1  =  HappyAbsSyn4
		 ([]
	)

happyReduce_2 = happySpecReduce_3  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1 : happy_var_3
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Init happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 (HappyTerminal (TokenVar _ happy_var_2))
	_
	 =  HappyAbsSyn5
		 (UnInit happy_var_2
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 4 5 happyReduction_5
happyReduction_5 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Method happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_1  5 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Expression happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (PipeEnd happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (PipeLine happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  7 happyReduction_10
happyReduction_10 (HappyTerminal (TokenFileName _ happy_var_2))
	_
	 =  HappyAbsSyn7
		 (Import happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  7 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn7
		 (Asc
	)

happyReduce_12 = happySpecReduce_1  7 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn7
		 (Desc
	)

happyReduce_13 = happyReduce 4 7 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Reform happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_1  7 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn7
		 (Print
	)

happyReduce_15 = happyReduce 4 7 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Select happy_var_3
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_3  7 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Update happy_var_2 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  7 happyReduction_17
happyReduction_17 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn7
		 (VarName happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  7 happyReduction_18
happyReduction_18 (HappyTerminal (TokenFileName _ happy_var_2))
	_
	 =  HappyAbsSyn7
		 (Write happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  7 happyReduction_19
happyReduction_19 (HappyTerminal (TokenString _ happy_var_2))
	_
	 =  HappyAbsSyn7
		 (Note happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  7 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn7
		 (Unique
	)

happyReduce_21 = happySpecReduce_2  7 happyReduction_21
happyReduction_21 (HappyTerminal (TokenString _ happy_var_2))
	_
	 =  HappyAbsSyn7
		 (Error happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happyReduce 7 7 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (If happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_3  7 happyReduction_23
happyReduction_23 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (FullBinary (Cross happy_var_1 happy_var_3)
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  7 happyReduction_24
happyReduction_24 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (FullBinary (Union happy_var_1 happy_var_3)
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  7 happyReduction_25
happyReduction_25 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (FullBinary (Diff happy_var_1 happy_var_3)
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  8 happyReduction_26
happyReduction_26 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  8 happyReduction_27
happyReduction_27 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  9 happyReduction_28
happyReduction_28 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (Column happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happyReduce 6 9 happyReduction_29
happyReduction_29 ((HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Range happy_var_2 happy_var_6
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_2  10 happyReduction_30
happyReduction_30 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Index happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  10 happyReduction_31
happyReduction_31 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn10
		 (Filler happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  11 happyReduction_32
happyReduction_32 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (Single happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  11 happyReduction_33
happyReduction_33 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Neg happy_var_2
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  11 happyReduction_34
happyReduction_34 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (And happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  11 happyReduction_35
happyReduction_35 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Or happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  11 happyReduction_36
happyReduction_36 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  12 happyReduction_37
happyReduction_37 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn12
		 (ColCond happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  12 happyReduction_38
happyReduction_38 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (NumCond happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  12 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn12
		 (Boolean True
	)

happyReduce_40 = happySpecReduce_1  12 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn12
		 (Boolean False
	)

happyReduce_41 = happySpecReduce_1  13 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn13
		 (ContextArity
	)

happyReduce_42 = happySpecReduce_1  13 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn13
		 (Id
	)

happyReduce_43 = happySpecReduce_1  13 happyReduction_43
happyReduction_43 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn13
		 (Number happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  13 happyReduction_44
happyReduction_44 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Calc happy_var_1 Add happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  13 happyReduction_45
happyReduction_45 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Calc happy_var_1 Subs happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  13 happyReduction_46
happyReduction_46 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Calc happy_var_1 Div happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  13 happyReduction_47
happyReduction_47 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Calc happy_var_1 Mul happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  13 happyReduction_48
happyReduction_48 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Calc happy_var_1 Mod happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  13 happyReduction_49
happyReduction_49 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  14 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn14
		 (Equal
	)

happyReduce_51 = happySpecReduce_1  14 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn14
		 (NotEqual
	)

happyReduce_52 = happySpecReduce_1  14 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn14
		 (Less
	)

happyReduce_53 = happySpecReduce_1  14 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn14
		 (Greater
	)

happyReduce_54 = happySpecReduce_1  14 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn14
		 (GreaterEqual
	)

happyReduce_55 = happySpecReduce_1  14 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn14
		 (LessEqual
	)

happyNewToken action sts stk [] =
	action 65 65 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenCSV _ -> cont 15;
	TokenQuery _ -> cont 16;
	TokenImport _ -> cont 17;
	TokenPrint _ -> cont 18;
	TokenAsc _ -> cont 19;
	TokenDesc _ -> cont 20;
	TokenSelect _ -> cont 21;
	TokenReform _ -> cont 22;
	TokenUpdate _ -> cont 23;
	TokenWrite _ -> cont 24;
	TokenNote _ -> cont 25;
	TokenUnique _ -> cont 26;
	TokenError _ -> cont 27;
	TokenId _ -> cont 28;
	TokenArity _ -> cont 29;
	TokenIf _ -> cont 30;
	TokenThen _ -> cont 31;
	TokenDollar _ -> cont 32;
	TokenInt _ happy_dollar_dollar -> cont 33;
	TokenCross _ -> cont 34;
	TokenUnion _ -> cont 35;
	TokenDiff _ -> cont 36;
	TokenLParen _ -> cont 37;
	TokenRParen _ -> cont 38;
	TokenLSquare _ -> cont 39;
	TokenRSquare _ -> cont 40;
	TokenAdd _ -> cont 41;
	TokenSubs _ -> cont 42;
	TokenDiv _ -> cont 43;
	TokenMul _ -> cont 44;
	TokenMod _ -> cont 45;
	TokenAnd _ -> cont 46;
	TokenOr _ -> cont 47;
	TokenNeg _ -> cont 48;
	TokenTrue _ -> cont 49;
	TokenFalse _ -> cont 50;
	TokenComma _ -> cont 51;
	TokenDot _ -> cont 52;
	TokenPipe _ -> cont 53;
	TokenEndLine _ -> cont 54;
	TokenNotEq _ -> cont 55;
	TokenEq _ -> cont 56;
	TokenGreaterEq _ -> cont 57;
	TokenLessEq _ -> cont 58;
	TokenLess _ -> cont 59;
	TokenGreater _ -> cont 60;
	TokenAssignment _ -> cont 61;
	TokenString _ happy_dollar_dollar -> cont 62;
	TokenFileName _ happy_dollar_dollar -> cont 63;
	TokenVar _ happy_dollar_dollar -> cont 64;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 65 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


-- dollar MathExpr '.' '.' dollar MathExpr ',' Cols {$1 : $3}
mirrorOperation Less = Greater
mirrorOperation Greater = Less
mirrorOperation LessEqual = GreaterEqual
mirrorOperation GreaterEqual = LessEqual
mirrorOperation o = o
 
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError ((TokenCSV al):_)        = printError "a 'csv' declaration" al
parseError ((TokenQuery al):_)      = printError "a 'query' declaration" al
parseError ((TokenImport al):_)     = printError "an 'import' statement" al
parseError ((TokenPrint al):_)      = printError "a 'print' statement" al
parseError ((TokenAsc al):_)        = printError "an 'asc' statement" al
parseError ((TokenDesc al):_)       = printError "a 'desc' statement" al
parseError ((TokenSelect al):_)     = printError "a 'select' statement" al
parseError ((TokenReform al):_)     = printError "a 'reform' statement" al
parseError ((TokenUpdate al):_)     = printError "an 'update' statement" al
parseError ((TokenWrite al):_)      = printError "a 'write' statement" al
parseError ((TokenNote al):_)      = printError "a 'note' statement" al
parseError ((TokenUnique al):_)      = printError "a 'unique' statement" al
parseError ((TokenError al):_)      = printError "an 'error' statement" al
parseError ((TokenId al):_)      = printError "an 'id' statement" al
parseError ((TokenArity al):_)      = printError "an 'arity' statement" al
parseError ((TokenIf al):_)         = printError "an 'if' statement" al
parseError ((TokenThen al):_)       = printError "a '->' notation" al
parseError ((TokenDollar al):_)     = printError "a '$' notation" al
parseError ((TokenInt al i):_)      = printError ("a number " ++ show i) al
parseError ((TokenAssignment al):_) = printError "an assignment '='" al
parseError ((TokenCross al):_)      = printError "a cartesian product 'x'" al
parseError ((TokenUnion al):_)      = printError "a union '++'" al
parseError ((TokenDiff al):_)       = printError "a diff '--'" al
parseError ((TokenLParen al):_)     = printError "a '('" al
parseError ((TokenRParen al):_)     = printError "a ')'" al
parseError ((TokenLSquare al):_)    = printError "a '['" al
parseError ((TokenRSquare al):_)    = printError "a ']'" al
parseError ((TokenAdd al):_)        = printError "an addition '+'" al
parseError ((TokenSubs al):_)       = printError "a substraction '-'" al
parseError ((TokenDiv al):_)        = printError "a division '/'" al
parseError ((TokenMul al):_)        = printError "a multiplication '*'" al
parseError ((TokenMod al):_)        = printError "a modulo operator '%'" al
parseError ((TokenAnd al):_)        = printError "an AND '&&'" al
parseError ((TokenOr al):_)         = printError "an OR '||'" al
parseError ((TokenNeg al):_)        = printError "a negation '!'" al
parseError ((TokenTrue al):_)       = printError "a 'true' statement" al
parseError ((TokenFalse al):_)      = printError "a 'false' statement" al
parseError ((TokenComma al):_)      = printError "a comma ','" al
parseError ((TokenDot al):_)        = printError "a dot '.'" al
parseError ((TokenPipe al):_)       = printError "a pipe '|'" al
parseError ((TokenEndLine al):_)    = printError "a semicolon ';" al
parseError ((TokenNotEq al):_)      = printError "a not-equal '!=' operator" al
parseError ((TokenEq al):_)         = printError "an equal '==' operator" al
parseError ((TokenLessEq al):_)     = printError "a less-or-equal '<=' operator" al
parseError ((TokenGreaterEq al):_)  = printError "a greater-or-equal '>=' operator" al
parseError ((TokenLess al):_)       = printError "a less '<' operator" al
parseError ((TokenGreater al):_)    = printError "a greater '>' operator" al
parseError ((TokenString al s):_)   = printError ("a string " ++ s) al
parseError ((TokenFileName al s):_) = printError ("a file name " ++ s) al
parseError ((TokenVar al s):_)      = printError ("a variable " ++ s) al

printError :: [Char] -> AlexPosn -> a
printError m (AlexPn _ line col) = error $ concat [ "Wasn't Expecting ", m, " (at: line ", show line, " , column ", show col, ")"]


-- A program is a sequence of terms. Terms are separated by ';'
-- data Prog = ProgEnd | Term Expr | Terms Expr Prog deriving Show
type Prog = [Expr]
               

data Expr = UnInit String       -- Uninitialised var declaration
          | Init String Query   -- Initialised var declaration
          | Method String Query -- Method declaration
          | Expression Query    -- A query
          deriving Show


data Query = PipeEnd CsvExpr       -- single statement, which returns a CSV 
           | PipeLine Query Query  -- sequence of pipes, separated by "|". Ends with a "PipeEnd"
           deriving Show


-- A CSV Expr is an expression which takes a CSV as input (if any) and returns a new CSV
data CsvExpr = Import String 
             | Asc 
             | Desc 
             | Reform Cols 
             | Print 
             | Select Conds 
             | Update Col Col 
             | VarName String 
             | Write String 
             | Note String
             | Unique
             | Error String
             | If Conds Query 
             | FullBinary (Binary Query Query)
             deriving Show


-- Binary operations between two CSVs
data Binary a b = Cross a b  -- Cartessian (Cross) Product
                | Diff a b   -- Difference
                | Union a b  -- Union
                deriving Show


type Cols = [ColItem]
data ColItem = Column Col | Range MathExpr MathExpr deriving Show
data Col = Index MathExpr | Filler String deriving Show 


data Conds = Single Cond | Neg Conds | And Conds Conds | Or Conds Conds deriving Show
data Cond = ColCond Col Operation Col  | NumCond MathExpr Operation MathExpr | Boolean Bool  deriving Show
data Operation = Equal | NotEqual | Less | Greater | LessEqual | GreaterEqual deriving Show


data MathOperation = Add | Subs | Mul | Div | Mod deriving Show
data MathExpr = ContextArity | Id | Number Int | Calc MathExpr MathOperation MathExpr deriving Show
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
