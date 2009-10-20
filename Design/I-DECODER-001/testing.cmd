.control
set hcopydevtype=postscript
set hcopypscolor=true
set hcopywidth=1200
set hcopyheight=500
set filetype=binary
set combplot

* op
* destroy all

* tran 10ns 200us 0
tran 10ns 1.3ms 0
* tran 1ns 5us 0

* hardcopy vins.ps v(v2) v(v3) v(v4) v(v5) v(v6) v(v7) v(v8) ylimit 0 7 xlimit 0 1.3m xlabel time ylabel volts title INPUTS
* hardcopy vi2.ps v(v2)
* hardcopy vi3.ps v(v3)
* hardcopy vi4.ps v(v4)
* hardcopy vi5.ps v(v5)
* hardcopy vi6.ps v(v6)
* hardcopy vi7.ps v(v7)
* hardcopy vi8.ps v(v8)
* hardcopy vout.ps v(out1) v(out2) v(out3) v(out4) v(out5)
* hardcopy vo1.ps v(out1)
* hardcopy vo2.ps v(out2)
* hardcopy vo3.ps v(out3)
* hardcopy vo4.ps v(out4)
* hardcopy vo5.ps v(out5)
* hardcopy inverter.ps v(v2) v(out1) ylimit 0 5 xlimit 0 200u xlabel time ylabel volts title INPUTS
* hardcopy 2nand.ps v(v2) v(v3) v(out4) ylimit 0 5 xlimit 0 200u xlabel time ylabel volts title INPUTS
* hardcopy 4nand.ps v(v2) v(v3) v(v4) v(v5) v(out3) ylimit 0 5 xlimit 0 350u xlabel time ylabel volts title INPUTS
* hardcopy 5nand.ps v(v2) v(v3) v(v4) v(v5) v(v6) v(out2) ylimit 0 5 xlimit 0 650u xlabel time ylabel volts title INPUTS
* hardcopy 7nand.ps v(v2) v(v3) v(v4) v(v5) v(v6) v(v7) v(v8) v(out5) ylimit 0 5 xlimit 0 1.3m xlabel time ylabel volts title INPUTS

write testing.bin
* print all
* plot tran v(out4) ylimit 0 7 xlimit 0 1.3m xlabel time ylabel volts title INPUTS
.endc