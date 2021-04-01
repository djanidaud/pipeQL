{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,214) ([57344,16575,0,256,0,0,0,0,0,0,0,0,0,4096,0,0,56,0,0,0,0,0,0,0,0,16,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,256,0,0,2048,0,256,0,0,0,4,0,16,0,49152,16575,0,256,0,0,0,0,32768,3,0,0,8192,2048,0,16384,70,16398,0,0,0,0,0,32,0,4,0,1,0,0,0,0,0,0,8,0,1,25600,57348,1024,0,0,0,0,0,0,8192,0,767,1,1024,64512,1035,0,16,12272,16,16384,49152,16575,0,256,65408,258,0,4,0,0,0,0,512,0,0,0,8,0,0,8192,0,0,0,128,0,0,12272,16,16384,0,0,32768,31,0,512,6,0,0,0,0,0,0,57375,7,49088,64,0,1,0,0,0,0,1124,224,4,36864,32785,4099,0,0,0,0,0,0,0,0,0,32,0,0,0,1024,0,0,0,0,0,0,0,0,0,2048,24,0,0,0,0,0,256,0,0,0,281,56,1,25600,57348,1024,0,128,0,16,0,0,0,0,0,0,0,0,2048,24,0,0,7968,2016,0,14336,0,0,0,273,0,0,17408,4,0,0,4368,0,0,16384,68,0,0,4352,1,0,0,1092,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,4,0,14,0,0,0,0,0,0,49152,1,0,17408,4,0,0,0,28,0,0,28672,0,0,0,448,0,0,0,7,0,0,7936,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,767,1,1024,0,896,1024,0,0,7968,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Prog","Expr","Query","CsvExpr","Cols","Col","Conds","Cond","MathExpr","Operation","csv","import","print","asc","desc","select","reform","update","write","arity","if","'->'","dollar","int","x","'++'","'--'","'('","')'","'['","']'","'+'","'-'","'/'","'*'","'%'","'&&'","'||'","'!'","true","false","','","'|'","';'","'!='","'=='","'>='","'<='","'<'","'>'","'='","word","fileName","var","%eof"]
        bit_start = st Prelude.* 58
        bit_end = (st Prelude.+ 1) Prelude.* 58
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..57]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (14) = happyShift action_6
action_0 (15) = happyShift action_7
action_0 (16) = happyShift action_8
action_0 (17) = happyShift action_9
action_0 (18) = happyShift action_10
action_0 (19) = happyShift action_11
action_0 (20) = happyShift action_12
action_0 (21) = happyShift action_13
action_0 (22) = happyShift action_14
action_0 (24) = happyShift action_15
action_0 (31) = happyShift action_16
action_0 (57) = happyShift action_17
action_0 (4) = happyGoto action_2
action_0 (5) = happyGoto action_3
action_0 (6) = happyGoto action_4
action_0 (7) = happyGoto action_5
action_0 _ = happyReduce_1

action_1 _ = happyFail (happyExpListPerState 1)

action_2 (58) = happyAccept
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (47) = happyShift action_33
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (28) = happyShift action_30
action_4 (29) = happyShift action_31
action_4 (30) = happyShift action_32
action_4 _ = happyReduce_5

action_5 (46) = happyShift action_29
action_5 _ = happyReduce_6

action_6 (57) = happyShift action_28
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (56) = happyShift action_27
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_12

action_9 _ = happyReduce_9

action_10 _ = happyReduce_10

action_11 (31) = happyShift action_26
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (33) = happyShift action_25
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (26) = happyShift action_23
action_13 (55) = happyShift action_24
action_13 (9) = happyGoto action_22
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (55) = happyShift action_21
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (31) = happyShift action_20
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (15) = happyShift action_7
action_16 (16) = happyShift action_8
action_16 (17) = happyShift action_9
action_16 (18) = happyShift action_10
action_16 (19) = happyShift action_11
action_16 (20) = happyShift action_12
action_16 (21) = happyShift action_13
action_16 (22) = happyShift action_14
action_16 (24) = happyShift action_15
action_16 (31) = happyShift action_16
action_16 (57) = happyShift action_17
action_16 (6) = happyGoto action_18
action_16 (7) = happyGoto action_19
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_15

action_18 (28) = happyShift action_30
action_18 (29) = happyShift action_31
action_18 (30) = happyShift action_32
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (32) = happyShift action_55
action_19 (46) = happyShift action_29
action_19 _ = happyReduce_6

action_20 (23) = happyShift action_44
action_20 (26) = happyShift action_23
action_20 (27) = happyShift action_45
action_20 (31) = happyShift action_46
action_20 (42) = happyShift action_47
action_20 (43) = happyShift action_48
action_20 (44) = happyShift action_49
action_20 (55) = happyShift action_24
action_20 (9) = happyGoto action_40
action_20 (10) = happyGoto action_54
action_20 (11) = happyGoto action_42
action_20 (12) = happyGoto action_43
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_16

action_22 (26) = happyShift action_23
action_22 (55) = happyShift action_24
action_22 (9) = happyGoto action_53
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (27) = happyShift action_52
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_25

action_25 (26) = happyShift action_23
action_25 (55) = happyShift action_24
action_25 (8) = happyGoto action_50
action_25 (9) = happyGoto action_51
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (23) = happyShift action_44
action_26 (26) = happyShift action_23
action_26 (27) = happyShift action_45
action_26 (31) = happyShift action_46
action_26 (42) = happyShift action_47
action_26 (43) = happyShift action_48
action_26 (44) = happyShift action_49
action_26 (55) = happyShift action_24
action_26 (9) = happyGoto action_40
action_26 (10) = happyGoto action_41
action_26 (11) = happyGoto action_42
action_26 (12) = happyGoto action_43
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_8

action_28 (54) = happyShift action_39
action_28 _ = happyReduce_4

action_29 (15) = happyShift action_7
action_29 (16) = happyShift action_8
action_29 (17) = happyShift action_9
action_29 (18) = happyShift action_10
action_29 (19) = happyShift action_11
action_29 (20) = happyShift action_12
action_29 (21) = happyShift action_13
action_29 (22) = happyShift action_14
action_29 (24) = happyShift action_15
action_29 (31) = happyShift action_16
action_29 (57) = happyShift action_17
action_29 (6) = happyGoto action_38
action_29 (7) = happyGoto action_5
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (15) = happyShift action_7
action_30 (16) = happyShift action_8
action_30 (17) = happyShift action_9
action_30 (18) = happyShift action_10
action_30 (19) = happyShift action_11
action_30 (20) = happyShift action_12
action_30 (21) = happyShift action_13
action_30 (22) = happyShift action_14
action_30 (24) = happyShift action_15
action_30 (31) = happyShift action_16
action_30 (57) = happyShift action_17
action_30 (6) = happyGoto action_37
action_30 (7) = happyGoto action_5
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (15) = happyShift action_7
action_31 (16) = happyShift action_8
action_31 (17) = happyShift action_9
action_31 (18) = happyShift action_10
action_31 (19) = happyShift action_11
action_31 (20) = happyShift action_12
action_31 (21) = happyShift action_13
action_31 (22) = happyShift action_14
action_31 (24) = happyShift action_15
action_31 (31) = happyShift action_16
action_31 (57) = happyShift action_17
action_31 (6) = happyGoto action_36
action_31 (7) = happyGoto action_5
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (15) = happyShift action_7
action_32 (16) = happyShift action_8
action_32 (17) = happyShift action_9
action_32 (18) = happyShift action_10
action_32 (19) = happyShift action_11
action_32 (20) = happyShift action_12
action_32 (21) = happyShift action_13
action_32 (22) = happyShift action_14
action_32 (24) = happyShift action_15
action_32 (31) = happyShift action_16
action_32 (57) = happyShift action_17
action_32 (6) = happyGoto action_35
action_32 (7) = happyGoto action_5
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (14) = happyShift action_6
action_33 (15) = happyShift action_7
action_33 (16) = happyShift action_8
action_33 (17) = happyShift action_9
action_33 (18) = happyShift action_10
action_33 (19) = happyShift action_11
action_33 (20) = happyShift action_12
action_33 (21) = happyShift action_13
action_33 (22) = happyShift action_14
action_33 (24) = happyShift action_15
action_33 (31) = happyShift action_16
action_33 (57) = happyShift action_17
action_33 (4) = happyGoto action_34
action_33 (5) = happyGoto action_3
action_33 (6) = happyGoto action_4
action_33 (7) = happyGoto action_5
action_33 _ = happyReduce_1

action_34 _ = happyReduce_2

action_35 (28) = happyShift action_30
action_35 _ = happyReduce_21

action_36 (28) = happyShift action_30
action_36 _ = happyReduce_20

action_37 (28) = happyShift action_30
action_37 _ = happyReduce_19

action_38 (28) = happyShift action_30
action_38 _ = happyReduce_7

action_39 (15) = happyShift action_7
action_39 (16) = happyShift action_8
action_39 (17) = happyShift action_9
action_39 (18) = happyShift action_10
action_39 (19) = happyShift action_11
action_39 (20) = happyShift action_12
action_39 (21) = happyShift action_13
action_39 (22) = happyShift action_14
action_39 (24) = happyShift action_15
action_39 (31) = happyShift action_16
action_39 (57) = happyShift action_17
action_39 (6) = happyGoto action_79
action_39 (7) = happyGoto action_5
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (48) = happyShift action_71
action_40 (49) = happyShift action_72
action_40 (50) = happyShift action_73
action_40 (51) = happyShift action_74
action_40 (52) = happyShift action_75
action_40 (53) = happyShift action_76
action_40 (13) = happyGoto action_78
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (32) = happyShift action_77
action_41 (40) = happyShift action_57
action_41 (41) = happyShift action_58
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_26

action_43 (35) = happyShift action_66
action_43 (36) = happyShift action_67
action_43 (37) = happyShift action_68
action_43 (38) = happyShift action_69
action_43 (39) = happyShift action_70
action_43 (48) = happyShift action_71
action_43 (49) = happyShift action_72
action_43 (50) = happyShift action_73
action_43 (51) = happyShift action_74
action_43 (52) = happyShift action_75
action_43 (53) = happyShift action_76
action_43 (13) = happyGoto action_65
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (15) = happyShift action_7
action_44 (16) = happyShift action_8
action_44 (17) = happyShift action_9
action_44 (18) = happyShift action_10
action_44 (19) = happyShift action_11
action_44 (20) = happyShift action_12
action_44 (21) = happyShift action_13
action_44 (22) = happyShift action_14
action_44 (24) = happyShift action_15
action_44 (31) = happyShift action_16
action_44 (57) = happyShift action_17
action_44 (6) = happyGoto action_64
action_44 (7) = happyGoto action_5
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_36

action_46 (23) = happyShift action_44
action_46 (26) = happyShift action_23
action_46 (27) = happyShift action_45
action_46 (31) = happyShift action_46
action_46 (42) = happyShift action_47
action_46 (43) = happyShift action_48
action_46 (44) = happyShift action_49
action_46 (55) = happyShift action_24
action_46 (9) = happyGoto action_40
action_46 (10) = happyGoto action_62
action_46 (11) = happyGoto action_42
action_46 (12) = happyGoto action_63
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (23) = happyShift action_44
action_47 (26) = happyShift action_23
action_47 (27) = happyShift action_45
action_47 (31) = happyShift action_46
action_47 (42) = happyShift action_47
action_47 (43) = happyShift action_48
action_47 (44) = happyShift action_49
action_47 (55) = happyShift action_24
action_47 (9) = happyGoto action_40
action_47 (10) = happyGoto action_61
action_47 (11) = happyGoto action_42
action_47 (12) = happyGoto action_43
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_33

action_49 _ = happyReduce_34

action_50 (34) = happyShift action_60
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (45) = happyShift action_59
action_51 _ = happyReduce_22

action_52 _ = happyReduce_24

action_53 _ = happyReduce_14

action_54 (32) = happyShift action_56
action_54 (40) = happyShift action_57
action_54 (41) = happyShift action_58
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_18

action_56 (25) = happyShift action_93
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (23) = happyShift action_44
action_57 (26) = happyShift action_23
action_57 (27) = happyShift action_45
action_57 (31) = happyShift action_46
action_57 (42) = happyShift action_47
action_57 (43) = happyShift action_48
action_57 (44) = happyShift action_49
action_57 (55) = happyShift action_24
action_57 (9) = happyGoto action_40
action_57 (10) = happyGoto action_92
action_57 (11) = happyGoto action_42
action_57 (12) = happyGoto action_43
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (23) = happyShift action_44
action_58 (26) = happyShift action_23
action_58 (27) = happyShift action_45
action_58 (31) = happyShift action_46
action_58 (42) = happyShift action_47
action_58 (43) = happyShift action_48
action_58 (44) = happyShift action_49
action_58 (55) = happyShift action_24
action_58 (9) = happyGoto action_40
action_58 (10) = happyGoto action_91
action_58 (11) = happyGoto action_42
action_58 (12) = happyGoto action_43
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (26) = happyShift action_23
action_59 (55) = happyShift action_24
action_59 (8) = happyGoto action_90
action_59 (9) = happyGoto action_51
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_11

action_61 _ = happyReduce_27

action_62 (32) = happyShift action_89
action_62 (40) = happyShift action_57
action_62 (41) = happyShift action_58
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (32) = happyShift action_88
action_63 (35) = happyShift action_66
action_63 (36) = happyShift action_67
action_63 (37) = happyShift action_68
action_63 (38) = happyShift action_69
action_63 (39) = happyShift action_70
action_63 (48) = happyShift action_71
action_63 (49) = happyShift action_72
action_63 (50) = happyShift action_73
action_63 (51) = happyShift action_74
action_63 (52) = happyShift action_75
action_63 (53) = happyShift action_76
action_63 (13) = happyGoto action_65
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (28) = happyShift action_30
action_64 (29) = happyShift action_31
action_64 (30) = happyShift action_32
action_64 _ = happyReduce_35

action_65 (23) = happyShift action_44
action_65 (27) = happyShift action_45
action_65 (31) = happyShift action_82
action_65 (12) = happyGoto action_87
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (23) = happyShift action_44
action_66 (27) = happyShift action_45
action_66 (31) = happyShift action_82
action_66 (12) = happyGoto action_86
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (23) = happyShift action_44
action_67 (27) = happyShift action_45
action_67 (31) = happyShift action_82
action_67 (12) = happyGoto action_85
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (23) = happyShift action_44
action_68 (27) = happyShift action_45
action_68 (31) = happyShift action_82
action_68 (12) = happyGoto action_84
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (23) = happyShift action_44
action_69 (27) = happyShift action_45
action_69 (31) = happyShift action_82
action_69 (12) = happyGoto action_83
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (23) = happyShift action_44
action_70 (27) = happyShift action_45
action_70 (31) = happyShift action_82
action_70 (12) = happyGoto action_81
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_44

action_72 _ = happyReduce_43

action_73 _ = happyReduce_47

action_74 _ = happyReduce_48

action_75 _ = happyReduce_45

action_76 _ = happyReduce_46

action_77 _ = happyReduce_13

action_78 (26) = happyShift action_23
action_78 (55) = happyShift action_24
action_78 (9) = happyGoto action_80
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (28) = happyShift action_30
action_79 (29) = happyShift action_31
action_79 (30) = happyShift action_32
action_79 _ = happyReduce_3

action_80 _ = happyReduce_31

action_81 (37) = happyShift action_68
action_81 (38) = happyShift action_69
action_81 (39) = happyShift action_70
action_81 _ = happyReduce_41

action_82 (23) = happyShift action_44
action_82 (27) = happyShift action_45
action_82 (31) = happyShift action_82
action_82 (12) = happyGoto action_95
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (37) = happyShift action_68
action_83 (38) = happyShift action_69
action_83 (39) = happyShift action_70
action_83 _ = happyReduce_40

action_84 (37) = happyShift action_68
action_84 (38) = happyShift action_69
action_84 (39) = happyShift action_70
action_84 _ = happyReduce_39

action_85 (37) = happyShift action_68
action_85 (38) = happyShift action_69
action_85 (39) = happyShift action_70
action_85 _ = happyReduce_38

action_86 (37) = happyShift action_68
action_86 (38) = happyShift action_69
action_86 (39) = happyShift action_70
action_86 _ = happyReduce_37

action_87 (35) = happyShift action_66
action_87 (36) = happyShift action_67
action_87 (37) = happyShift action_68
action_87 (38) = happyShift action_69
action_87 (39) = happyShift action_70
action_87 _ = happyReduce_32

action_88 _ = happyReduce_42

action_89 _ = happyReduce_30

action_90 _ = happyReduce_23

action_91 _ = happyReduce_29

action_92 _ = happyReduce_28

action_93 (15) = happyShift action_7
action_93 (16) = happyShift action_8
action_93 (17) = happyShift action_9
action_93 (18) = happyShift action_10
action_93 (19) = happyShift action_11
action_93 (20) = happyShift action_12
action_93 (21) = happyShift action_13
action_93 (22) = happyShift action_14
action_93 (24) = happyShift action_15
action_93 (31) = happyShift action_16
action_93 (57) = happyShift action_17
action_93 (6) = happyGoto action_94
action_93 (7) = happyGoto action_5
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (28) = happyShift action_30
action_94 (29) = happyShift action_31
action_94 (30) = happyShift action_32
action_94 (47) = happyShift action_96
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (32) = happyShift action_88
action_95 (35) = happyShift action_66
action_95 (36) = happyShift action_67
action_95 (37) = happyShift action_68
action_95 (38) = happyShift action_69
action_95 (39) = happyShift action_70
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_17

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

happyReduce_5 = happySpecReduce_1  5 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Expression happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (PipeEnd happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (PipeLine happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  7 happyReduction_8
happyReduction_8 (HappyTerminal (TokenFileName _ happy_var_2))
	_
	 =  HappyAbsSyn7
		 (Import happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn7
		 (Asc
	)

happyReduce_10 = happySpecReduce_1  7 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn7
		 (Desc
	)

happyReduce_11 = happyReduce 4 7 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Reform happy_var_3
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_1  7 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn7
		 (Print
	)

happyReduce_13 = happyReduce 4 7 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Select happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_3  7 happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Update happy_var_2 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  7 happyReduction_15
happyReduction_15 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn7
		 (VarName happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  7 happyReduction_16
happyReduction_16 (HappyTerminal (TokenString _ happy_var_2))
	_
	 =  HappyAbsSyn7
		 (Write happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 7 7 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (If happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_3  7 happyReduction_18
happyReduction_18 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  7 happyReduction_19
happyReduction_19 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (FullBinary (Cross happy_var_1 happy_var_3)
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  7 happyReduction_20
happyReduction_20 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (FullBinary (Union happy_var_1 happy_var_3)
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  7 happyReduction_21
happyReduction_21 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (FullBinary (Diff happy_var_1 happy_var_3)
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  8 happyReduction_22
happyReduction_22 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  8 happyReduction_23
happyReduction_23 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  9 happyReduction_24
happyReduction_24 (HappyTerminal (TokenInt _ happy_var_2))
	_
	 =  HappyAbsSyn9
		 (Index happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  9 happyReduction_25
happyReduction_25 (HappyTerminal (TokenString _ happy_var_1))
	 =  HappyAbsSyn9
		 (Filler happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  10 happyReduction_26
happyReduction_26 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Single happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  10 happyReduction_27
happyReduction_27 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Neg happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  10 happyReduction_28
happyReduction_28 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (And happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  10 happyReduction_29
happyReduction_29 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Or happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  10 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  11 happyReduction_31
happyReduction_31 (HappyAbsSyn9  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn11
		 (ColCond happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  11 happyReduction_32
happyReduction_32 (HappyAbsSyn12  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (NumCond happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  11 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn11
		 (Boolean True
	)

happyReduce_34 = happySpecReduce_1  11 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn11
		 (Boolean False
	)

happyReduce_35 = happySpecReduce_2  12 happyReduction_35
happyReduction_35 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Arity happy_var_2
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  12 happyReduction_36
happyReduction_36 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn12
		 (Number happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  12 happyReduction_37
happyReduction_37 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (Calc happy_var_1 Add happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  12 happyReduction_38
happyReduction_38 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (Calc happy_var_1 Subs happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  12 happyReduction_39
happyReduction_39 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (Calc happy_var_1 Div happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  12 happyReduction_40
happyReduction_40 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (Calc happy_var_1 Mul happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  12 happyReduction_41
happyReduction_41 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (Calc happy_var_1 Mod happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  12 happyReduction_42
happyReduction_42 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (happy_var_2
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  13 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn13
		 (Equal
	)

happyReduce_44 = happySpecReduce_1  13 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn13
		 (NotEqual
	)

happyReduce_45 = happySpecReduce_1  13 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn13
		 (Less
	)

happyReduce_46 = happySpecReduce_1  13 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn13
		 (Greater
	)

happyReduce_47 = happySpecReduce_1  13 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn13
		 (GreaterEqual
	)

happyReduce_48 = happySpecReduce_1  13 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn13
		 (LessEqual
	)

happyNewToken action sts stk [] =
	action 58 58 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenCSV _ -> cont 14;
	TokenImport _ -> cont 15;
	TokenPrint _ -> cont 16;
	TokenAsc _ -> cont 17;
	TokenDesc _ -> cont 18;
	TokenSelect _ -> cont 19;
	TokenReform _ -> cont 20;
	TokenUpdate _ -> cont 21;
	TokenWrite _ -> cont 22;
	TokenArity _ -> cont 23;
	TokenIf _ -> cont 24;
	TokenThen _ -> cont 25;
	TokenDollar _ -> cont 26;
	TokenInt _ happy_dollar_dollar -> cont 27;
	TokenCross _ -> cont 28;
	TokenUnion _ -> cont 29;
	TokenDiff _ -> cont 30;
	TokenLParen _ -> cont 31;
	TokenRParen _ -> cont 32;
	TokenLSquare _ -> cont 33;
	TokenRSquare _ -> cont 34;
	TokenAdd _ -> cont 35;
	TokenSubs _ -> cont 36;
	TokenDiv _ -> cont 37;
	TokenMul _ -> cont 38;
	TokenMod _ -> cont 39;
	TokenAnd _ -> cont 40;
	TokenOr _ -> cont 41;
	TokenNeg _ -> cont 42;
	TokenTrue _ -> cont 43;
	TokenFalse _ -> cont 44;
	TokenComma _ -> cont 45;
	TokenPipe _ -> cont 46;
	TokenEndLine _ -> cont 47;
	TokenNotEq _ -> cont 48;
	TokenEq _ -> cont 49;
	TokenGreaterEq _ -> cont 50;
	TokenLessEq _ -> cont 51;
	TokenLess _ -> cont 52;
	TokenGreater _ -> cont 53;
	TokenAssignment _ -> cont 54;
	TokenString _ happy_dollar_dollar -> cont 55;
	TokenFileName _ happy_dollar_dollar -> cont 56;
	TokenVar _ happy_dollar_dollar -> cont 57;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 58 tk tks = happyError' (tks, explist)
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


parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError ((TokenCSV al):_)        = printError "a 'csv' declaration" al
parseError ((TokenImport al):_)     = printError "an 'import' statement" al
parseError ((TokenPrint al):_)      = printError "a 'print' statement" al
parseError ((TokenAsc al):_)        = printError "an 'asc' statement" al
parseError ((TokenDesc al):_)       = printError "a 'desc' statement" al
parseError ((TokenSelect al):_)     = printError "a 'select' statement" al
parseError ((TokenReform al):_)     = printError "a 'reform' statement" al
parseError ((TokenUpdate al):_)     = printError "an 'update' statement" al
parseError ((TokenWrite al):_)      = printError "a 'write' statement" al
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
               
data Expr = UnInit String     -- Uninitialised var declaration
          | Init String Query -- Initialised var declaration
          | Expression Query  -- A query
          deriving Show

data Query = PipeEnd CsvExpr       -- single statement, which returns a CSV 
           | PipeLine CsvExpr Query -- sequence of pipes, separated by "|". Ends with a "PipeEnd"
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
             | If Conds Query 
             | FullBinary (Binary Query Query)
             deriving Show


-- Binary operations between two CSVs
data Binary a b = Cross a b  -- Cartessian (Cross) Product
                | Diff a b   -- Difference
                | Union a b  -- Union
                | Inter a b  -- Intersection
                deriving Show


data Col = Index Int | Filler String deriving Show
type Cols = [Col]

data Conds = Single Cond | Neg Conds | And Conds Conds | Or Conds Conds deriving Show
data Cond = ColCond Col Operation Col  | NumCond MathExpr Operation MathExpr | Boolean Bool  deriving Show
data Operation = Equal | NotEqual | Less | Greater | LessEqual | GreaterEqual deriving Show

data MathOperation = Add | Subs | Mul | Div | Mod deriving Show
data MathExpr = Arity Query | Number Int | Calc MathExpr MathOperation MathExpr deriving Show
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
