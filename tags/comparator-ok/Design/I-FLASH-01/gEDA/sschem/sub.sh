#!/bin/bash

for i in $(seq 1 1 7)
do
    cp -v 3i_nand.sch ffd_3i_nand.$i.1.sch
    sed -i -e "s/\(TRINA\)/ffd_3i_nand\.$i\.1\.sch/" ffd_3i_nand.$i.1.sch

done

exit 0

ffd_3i_nand.1.1.sch
ffd_3i_nand.2.1.sch
ffd_3i_nand.3.1.sch
ffd_3i_nand.4.1.sch
ffd_3i_nand.5.1.sch
ffd_3i_nand.6.1.sch
ffd_3i_nand.7.1.sch


#    cp -v SUBcomp.sch SUBcomp.$i.sch
#    sed -i -e "s/\(SUBcomp\.\)/\1$i\.sch/" SUBcomp.$i.sch
