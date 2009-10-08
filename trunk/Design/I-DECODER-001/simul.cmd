.control
set hcopydevtype=postscript
set hcopypscolor=true
set hcopywidth=1000
set hcopyheight=600

op
destroy all

tran 1ns 500us

hardcopy vout.ps v(vout) v(vin)

* PLOT TRAN v(vout)
.endc