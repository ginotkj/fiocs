v 20081231 1
C 40100 39900 0 0 0 title-B.sym
C 40700 47400 1 0 0 vdc-1.sym
{
T 41400 48050 5 10 1 1 0 0 1
refdes=V1
T 41400 48250 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 41400 48450 5 10 0 0 0 0 1
footprint=none
T 41400 47850 5 10 1 1 0 0 1
value=DC 5V
}
C 54600 49900 1 0 0 spice-include-1.sym
{
T 54700 50200 5 10 0 1 0 0 1
device=include
T 54700 50300 5 10 1 1 0 0 1
refdes=A1
T 55100 50000 5 10 1 1 0 0 1
file=simul.cmd
}
C 52300 42800 1 0 0 2i_nand.sym
{
T 52475 42895 5 10 1 1 0 0 1
refdes=X4
T 53375 42890 5 10 1 1 0 0 1
device=2NAND1-model
T 52300 42800 5 10 0 0 0 0 1
model-name=2nand1
T 52300 42800 5 10 0 0 0 0 1
file=model/2i_nand.sch.cir
}
C 51600 46400 1 180 0 4i_nand.sym
{
T 50525 46310 5 10 1 1 180 0 1
device=4NAND1-model
T 51600 46400 5 10 0 0 0 0 1
model-name=4nand1
T 51600 46400 5 10 0 0 0 0 1
file=model/4i_nand.sch.cir
}
C 53300 50000 1 180 0 5i_nand.sym
{
T 53300 50000 5 10 0 0 0 0 1
model-name=5nand1
T 53300 50000 5 10 0 0 0 0 1
file=model/5i_nand.sch.cir
}
C 43700 42200 1 0 0 7i_nand.sym
{
T 43875 42295 5 10 1 1 0 0 1
refdes=X5
T 44775 42290 5 10 1 1 0 0 1
device=7NAND1-model
T 43700 42200 5 10 0 0 0 0 1
model-name=7nand1
T 43700 42200 5 10 0 0 0 0 1
file=model/7i_nand.sch.cir
}
C 40900 47100 1 0 0 gnd-1.sym
C 40800 48600 1 0 0 vcc-2.sym
C 44500 47700 1 90 0 capacitor-1.sym
{
T 43800 47900 5 10 0 0 90 0 1
device=CAPACITOR
T 44000 47900 5 10 1 1 90 0 1
refdes=C1
T 43600 47900 5 10 0 0 90 0 1
symversion=0.1
T 44500 47700 5 10 1 1 0 0 1
value=47pF
}
C 46100 47700 1 90 0 capacitor-1.sym
{
T 45400 47900 5 10 0 0 90 0 1
device=CAPACITOR
T 45600 47900 5 10 1 1 90 0 1
refdes=C3
T 45200 47900 5 10 0 0 90 0 1
symversion=0.1
T 46100 47700 5 10 1 1 0 0 1
value=47pF
}
C 45300 47700 1 90 0 capacitor-1.sym
{
T 44600 47900 5 10 0 0 90 0 1
device=CAPACITOR
T 44800 47900 5 10 1 1 90 0 1
refdes=C2
T 44400 47900 5 10 0 0 90 0 1
symversion=0.1
T 45300 47700 5 10 1 1 0 0 1
value=47pF
}
N 45900 47700 44300 47700 4
C 40800 48600 1 0 0 vcc-2.sym
C 44200 50000 1 270 0 input-2.sym
{
T 44400 50000 5 10 1 0 270 0 1
net=OUT1:1
T 44900 49400 5 10 0 0 270 0 1
device=none
T 44300 49500 5 10 1 1 270 7 1
value=INPUT
}
C 45000 50000 1 270 0 input-2.sym
{
T 45200 50000 5 10 1 0 270 0 1
net=OUT2:1
T 45700 49400 5 10 0 0 270 0 1
device=none
T 45100 49500 5 10 1 1 270 7 1
value=INPUT
}
C 45800 50000 1 270 0 input-2.sym
{
T 46000 50000 5 10 1 0 270 0 1
net=OUT3:1
T 46500 49400 5 10 0 0 270 0 1
device=none
T 45900 49500 5 10 1 1 270 7 1
value=INPUT
}
