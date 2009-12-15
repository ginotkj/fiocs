.control
set hcopydevtype=postscript
set hcopypscolor=true
set hcopywidth=1200
set hcopyheight=500
set filetype=binary
set combplot

* op
* destroy all

tran 20ns 500us 0
* tran 20ns 180us 0

write flash.bin
.endc