.control
set hcopydevtype=postscript
set hcopypscolor=true
set hcopywidth=1200
set hcopyheight=500

* filetype allowed options: ascii, binary
*set filetype=binary
set filetype=ascii

set combplot

dc VDS 0 10 0.001 VGS 0 5 1

write mosfet.bin
.endc
