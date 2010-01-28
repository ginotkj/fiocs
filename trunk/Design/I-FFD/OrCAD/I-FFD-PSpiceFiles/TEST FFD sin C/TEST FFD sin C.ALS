.ALIASES
V_VDD           VDD(+=VDD -=0 ) CN @I-FFD.TEST FFD sin C(sch_1):INS57119@SOURCE.VDC.Normal(chips)
C_C1            C1(1=0 2=Y ) CN @I-FFD.TEST FFD sin C(sch_1):INS69198@ANALOG.C.Normal(chips)
V_DATO          DATO(+=DATO -=0 ) CN @I-FFD.TEST FFD sin C(sch_1):INS55694@SOURCE.VPULSE.Normal(chips)
_    NAND-3(OUT=Y IN1=X IN2=CLOCK VDD=VDD IN3=N54767 GND=0 ) CN @I-FFD.TEST FFD sin C(sch_1):NAND-3@I-FFD.S-NAND-3(sch_1)
M_NAND-3_M2          NAND-3.M2(d=NAND-3_N05674 g=CLOCK s=NAND-3_N05700 b=NAND-3_N05700 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND-3@I-FFD.S-NAND-3(sch_1):INS5550@BREAKOUT.MbreakN.Normal(chips)
M_NAND-3_M3          NAND-3.M3(d=Y g=X s=VDD b=VDD ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND-3@I-FFD.S-NAND-3(sch_1):INS5580@BREAKOUT.MbreakP.Normal(chips)
M_NAND-3_M5          NAND-3.M5(d=Y g=N54767 s=VDD b=VDD ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND-3@I-FFD.S-NAND-3(sch_1):INS5838@BREAKOUT.MbreakP.Normal(chips)
M_NAND-3_M4          NAND-3.M4(d=Y g=CLOCK s=VDD b=VDD ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND-3@I-FFD.S-NAND-3(sch_1):INS5614@BREAKOUT.MbreakP.Normal(chips)
M_NAND-3_M6          NAND-3.M6(d=NAND-3_N05700 g=N54767 s=0 b=0 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND-3@I-FFD.S-NAND-3(sch_1):INS6116@BREAKOUT.MbreakN.Normal(chips)
M_NAND-3_M1          NAND-3.M1(d=Y g=X s=NAND-3_N05674 b=NAND-3_N05674 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND-3@I-FFD.S-NAND-3(sch_1):INS5520@BREAKOUT.MbreakN.Normal(chips)
_    _(NAND-3.IN2=CLOCK)
_    _(NAND-3.OUT=Y)
_    _(NAND-3.IN1=X)
_    _(NAND-3.VDD=VDD)
_    _(VDD=VDD)
_    _(NAND-3.IN3=N54767)
_    _(NAND-3.GND=0)
_    _(GND=0)
_    NAND2(OUT=X GND=0 IN1=N54739 IN2=CLOCK VDD=VDD ) CN @I-FFD.TEST FFD sin C(sch_1):NAND1@I-FFD.S-NAND-2(sch_1)
M_NAND2_M1          NAND2.M1(d=X g=N54739 s=NAND2_N00209 b=NAND2_N00209 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND1@I-FFD.S-NAND-2(sch_1):INS30@BREAKOUT.MbreakN.Normal(chips)
M_NAND2_M2          NAND2.M2(d=NAND2_N00209 g=CLOCK s=0 b=0 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND1@I-FFD.S-NAND-2(sch_1):INS50@BREAKOUT.MbreakN.Normal(chips)
M_NAND2_M3          NAND2.M3(d=X g=N54739 s=VDD b=VDD ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND1@I-FFD.S-NAND-2(sch_1):INS83@BREAKOUT.MbreakP.Normal(chips)
M_NAND2_M4          NAND2.M4(d=X g=CLOCK s=VDD b=VDD ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND1@I-FFD.S-NAND-2(sch_1):INS103@BREAKOUT.MbreakP.Normal(chips)
R_NAND2_R1          NAND2.R1(1=N54739 2=0 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND1@I-FFD.S-NAND-2(sch_1):INS21570@ANALOG.R.Normal(chips)
R_NAND2_R2          NAND2.R2(1=CLOCK 2=0 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND1@I-FFD.S-NAND-2(sch_1):INS21632@ANALOG.R.Normal(chips)
_    _(NAND2.IN1=N54739)
_    _(NAND2.OUT=X)
_    _(NAND2.IN2=CLOCK)
_    _(NAND2.GND=0)
_    _(GND=0)
_    _(NAND2.VDD=VDD)
_    _(VDD=VDD)
V_CLOCK          CLOCK(+=CLOCK -=0 ) CN @I-FFD.TEST FFD sin C(sch_1):INS55791@SOURCE.VPULSE.Normal(chips)
_    NAND(OUT=N54739 GND=0 IN1=N54767 IN2=X VDD=VDD ) CN @I-FFD.TEST FFD sin C(sch_1):NAND@I-FFD.S-NAND-2(sch_1)
M_NAND_M1          NAND.M1(d=N54739 g=N54767 s=NAND_N00209 b=NAND_N00209 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND@I-FFD.S-NAND-2(sch_1):INS30@BREAKOUT.MbreakN.Normal(chips)
M_NAND_M2          NAND.M2(d=NAND_N00209 g=X s=0 b=0 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND@I-FFD.S-NAND-2(sch_1):INS50@BREAKOUT.MbreakN.Normal(chips)
M_NAND_M3          NAND.M3(d=N54739 g=N54767 s=VDD b=VDD ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND@I-FFD.S-NAND-2(sch_1):INS83@BREAKOUT.MbreakP.Normal(chips)
M_NAND_M4          NAND.M4(d=N54739 g=X s=VDD b=VDD ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND@I-FFD.S-NAND-2(sch_1):INS103@BREAKOUT.MbreakP.Normal(chips)
R_NAND_R1          NAND.R1(1=N54767 2=0 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND@I-FFD.S-NAND-2(sch_1):INS21570@ANALOG.R.Normal(chips)
R_NAND_R2          NAND.R2(1=X 2=0 ) CN @I-FFD.TEST FFD sin C(sch_1):NAND@I-FFD.S-NAND-2(sch_1):INS21632@ANALOG.R.Normal(chips)
_    _(NAND.IN1=N54767)
_    _(NAND.OUT=N54739)
_    _(NAND.IN2=X)
_    _(NAND.GND=0)
_    _(GND=0)
_    _(NAND.VDD=VDD)
_    _(VDD=VDD)
_    NAND1(OUT=N54767 GND=0 IN1=Y IN2=DATO VDD=VDD ) CN @I-FFD.TEST FFD sin C(sch_1):NAND0@I-FFD.S-NAND-2(sch_1)
M_NAND1_M1          NAND1.M1(d=N54767 g=Y s=NAND1_N00209 b=NAND1_N00209 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND0@I-FFD.S-NAND-2(sch_1):INS30@BREAKOUT.MbreakN.Normal(chips)
M_NAND1_M2          NAND1.M2(d=NAND1_N00209 g=DATO s=0 b=0 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND0@I-FFD.S-NAND-2(sch_1):INS50@BREAKOUT.MbreakN.Normal(chips)
M_NAND1_M3          NAND1.M3(d=N54767 g=Y s=VDD b=VDD ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND0@I-FFD.S-NAND-2(sch_1):INS83@BREAKOUT.MbreakP.Normal(chips)
M_NAND1_M4          NAND1.M4(d=N54767 g=DATO s=VDD b=VDD ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND0@I-FFD.S-NAND-2(sch_1):INS103@BREAKOUT.MbreakP.Normal(chips)
R_NAND1_R1          NAND1.R1(1=Y 2=0 ) CN @I-FFD.TEST FFD sin C(sch_1):NAND0@I-FFD.S-NAND-2(sch_1):INS21570@ANALOG.R.Normal(chips)
R_NAND1_R2          NAND1.R2(1=DATO 2=0 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND0@I-FFD.S-NAND-2(sch_1):INS21632@ANALOG.R.Normal(chips)
_    _(NAND1.IN1=Y)
_    _(NAND1.OUT=N54767)
_    _(NAND1.IN2=DATO)
_    _(NAND1.GND=0)
_    _(GND=0)
_    _(NAND1.VDD=VDD)
_    _(VDD=VDD)
_    NAND3(OUT=Q GND=0 IN1=X IN2=-Q VDD=VDD ) CN @I-FFD.TEST FFD sin C(sch_1):NAND2@I-FFD.S-NAND-2(sch_1)
M_NAND3_M1          NAND3.M1(d=Q g=X s=NAND3_N00209 b=NAND3_N00209 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND2@I-FFD.S-NAND-2(sch_1):INS30@BREAKOUT.MbreakN.Normal(chips)
M_NAND3_M2          NAND3.M2(d=NAND3_N00209 g=-Q s=0 b=0 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND2@I-FFD.S-NAND-2(sch_1):INS50@BREAKOUT.MbreakN.Normal(chips)
M_NAND3_M3          NAND3.M3(d=Q g=X s=VDD b=VDD ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND2@I-FFD.S-NAND-2(sch_1):INS83@BREAKOUT.MbreakP.Normal(chips)
M_NAND3_M4          NAND3.M4(d=Q g=-Q s=VDD b=VDD ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND2@I-FFD.S-NAND-2(sch_1):INS103@BREAKOUT.MbreakP.Normal(chips)
R_NAND3_R1          NAND3.R1(1=X 2=0 ) CN @I-FFD.TEST FFD sin C(sch_1):NAND2@I-FFD.S-NAND-2(sch_1):INS21570@ANALOG.R.Normal(chips)
R_NAND3_R2          NAND3.R2(1=-Q 2=0 ) CN @I-FFD.TEST FFD sin C(sch_1):NAND2@I-FFD.S-NAND-2(sch_1):INS21632@ANALOG.R.Normal(chips)
_    _(NAND3.IN1=X)
_    _(NAND3.OUT=Q)
_    _(NAND3.IN2=-Q)
_    _(NAND3.GND=0)
_    _(GND=0)
_    _(NAND3.VDD=VDD)
_    _(VDD=VDD)
_    NAND4(OUT=-Q GND=0 IN1=Q IN2=Y VDD=VDD ) CN @I-FFD.TEST FFD sin C(sch_1):NAND3@I-FFD.S-NAND-2(sch_1)
M_NAND4_M1          NAND4.M1(d=-Q g=Q s=NAND4_N00209 b=NAND4_N00209 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND3@I-FFD.S-NAND-2(sch_1):INS30@BREAKOUT.MbreakN.Normal(chips)
M_NAND4_M2          NAND4.M2(d=NAND4_N00209 g=Y s=0 b=0 ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND3@I-FFD.S-NAND-2(sch_1):INS50@BREAKOUT.MbreakN.Normal(chips)
M_NAND4_M3          NAND4.M3(d=-Q g=Q s=VDD b=VDD ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND3@I-FFD.S-NAND-2(sch_1):INS83@BREAKOUT.MbreakP.Normal(chips)
M_NAND4_M4          NAND4.M4(d=-Q g=Y s=VDD b=VDD ) CN @I-FFD.TEST FFD sin
+C(sch_1):NAND3@I-FFD.S-NAND-2(sch_1):INS103@BREAKOUT.MbreakP.Normal(chips)
R_NAND4_R1          NAND4.R1(1=Q 2=0 ) CN @I-FFD.TEST FFD sin C(sch_1):NAND3@I-FFD.S-NAND-2(sch_1):INS21570@ANALOG.R.Normal(chips)
R_NAND4_R2          NAND4.R2(1=Y 2=0 ) CN @I-FFD.TEST FFD sin C(sch_1):NAND3@I-FFD.S-NAND-2(sch_1):INS21632@ANALOG.R.Normal(chips)
_    _(NAND4.IN1=Q)
_    _(NAND4.OUT=-Q)
_    _(NAND4.IN2=Y)
_    _(NAND4.GND=0)
_    _(GND=0)
_    _(NAND4.VDD=VDD)
_    _(VDD=VDD)
_    _(GND=0)
_    _(VDD=VDD)
_    _(X=X)
_    _(Y=Y)
_    _(DATO=DATO)
_    _(CLOCK=CLOCK)
_    _(-Q=-Q)
_    _(Q=Q)
.ENDALIASES
