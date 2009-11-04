.control
set hcopydevtype=postscript
set hcopypscolor=true
set hcopywidth=1200
set hcopyheight=500
set filetype=binary
set combplot

* op
* destroy all

* tran 100ns 800us 0
tran 1ns 220us 0

* hardcopy vins.ps v(v2) v(v3) v(v4) v(v5) v(v6) v(v7) v(v8) ylimit 0 7 xlimit 0 1.3m xlabel time ylabel volts title INPUTS
* hardcopy vout.ps v(out1) v(out2) v(out3) v(out4) v(out5)

write i-flash-01.sch.bin
.endc