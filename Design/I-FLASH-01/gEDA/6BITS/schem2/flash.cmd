.control
set hcopydevtype=postscript
set hcopypscolor=true
set hcopywidth=1200
set hcopyheight=500

* filetype allowed options: ascii, binary
*set filetype=binary
set filetype=ascii

set combplot

op
* destroy all

* 2MHz de clock
*tran 2ns 2us 0
tran 2ns 2000ns 0

write flash.bin
.endc

.print tran v(1)
* esto es necesario para que el exit code sea 0 en caso exitoso