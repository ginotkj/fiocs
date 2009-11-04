v 20081231 1
C 40000 40000 0 0 0 title-B.sym
T 52400 40900 9 10 1 0 0 0 1
Flip-Flop D
T 50500 40100 9 10 1 0 0 0 1
1
T 52000 40100 9 10 1 0 0 0 1
1
T 55100 40400 9 10 1 0 0 0 1
1
T 54500 40100 9 10 1 0 0 0 1
Facundo J Ferrer
T 50800 40400 9 10 1 0 0 0 1
i-ffd.sch
C 53100 46200 1 0 0 2i_nand.sym
{
T 53275 46295 5 10 1 1 0 0 1
refdes=X1
T 54175 46290 5 10 0 1 0 0 1
device=2NAND1-model
T 53100 46200 5 10 0 1 0 0 1
model-name=2nand1
T 53100 46200 5 10 0 1 0 0 1
file=model/2i_nand.sch.cir
}
C 46000 43600 1 0 0 3i_nand.sym
{
T 46595 45400 5 10 1 1 0 0 1
refdes=X2
T 46895 44000 5 10 0 1 0 0 1
device=3nand-model
T 46000 43600 5 10 0 0 0 0 1
file=model/3i_nand.sch.cir
T 46000 43600 5 10 0 0 0 0 1
model-name=3nand1
}
C 40900 48200 1 0 0 vdc-1.sym
{
T 41600 48850 5 10 1 1 0 0 1
refdes=V1
T 41600 49050 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 41600 49250 5 10 0 0 0 0 1
footprint=none
T 41600 48650 5 10 1 1 0 0 1
value=DC 5V
}
C 40600 43800 1 0 0 vpulse-1.sym
{
T 41300 44450 5 10 1 1 0 0 1
refdes=V2
T 41300 44650 5 10 0 0 0 0 1
device=vpulse
T 41300 44850 5 10 0 0 0 0 1
footprint=none
T 40300 43050 5 10 1 1 0 0 1
value=pulse 0 5 0u 1u 1u 7u 14u DC 0V
}
C 41000 49600 1 0 0 vcc-2.sym
C 53900 48000 1 0 0 vcc-2.sym
C 47200 45700 1 0 0 vcc-2.sym
C 41100 47600 1 0 0 gnd-1.sym
C 54000 45700 1 0 0 gnd-1.sym
C 40800 43400 1 0 0 gnd-1.sym
C 40800 40500 1 0 0 gnd-1.sym
C 55700 45500 1 0 0 gnd-1.sym
C 56000 45900 1 90 0 capacitor-1.sym
{
T 55300 46100 5 10 0 0 90 0 1
device=CAPACITOR
T 56300 46600 5 10 1 1 180 0 1
refdes=C1
T 55100 46100 5 10 0 0 90 0 1
symversion=0.1
T 56000 45900 5 10 1 1 0 0 1
value=47pF
}
C 55900 47200 1 90 0 resistor-1.sym
{
T 55500 47500 5 10 0 0 90 0 1
device=RESISTOR
T 55600 47900 5 10 1 1 180 0 1
refdes=R1
T 55900 47200 5 10 1 1 0 0 1
value=100k
}
C 55600 48200 1 0 0 vcc-2.sym
N 41200 49600 41200 49400 4
N 41200 48200 41200 47900 4
N 54100 48000 54100 47600 4
N 54900 47000 55800 47000 4
{
T 54900 47000 5 10 1 1 0 0 1
netname=out1
}
N 55800 46800 55800 47200 4
N 55800 48100 55800 48200 4
N 55800 45900 55800 45800 4
N 54100 46000 54100 46300 4
N 47400 45500 47400 45700 4
N 40900 43700 40900 43800 4
N 40900 40800 40900 41000 4
C 42100 49900 1 0 0 spice-include-1.sym
{
T 42200 50200 5 10 0 1 0 0 1
device=include
T 42200 50300 5 10 1 1 0 0 1
refdes=A1
T 42600 50000 5 10 1 1 0 0 1
file=simul.cmd
}
C 47800 48700 1 0 0 2i_nand.sym
{
T 47975 48795 5 10 1 1 0 0 1
refdes=X5
T 48875 48790 5 10 0 1 0 0 1
device=2NAND1-model
T 47800 48700 5 10 0 0 0 0 1
model-name=2nand1
T 47800 48700 5 10 0 0 0 0 1
file=model/2i_nand.sch.cir
}
C 45800 46600 1 0 0 2i_nand.sym
{
T 45975 46695 5 10 1 1 0 0 1
refdes=X4
T 46875 46690 5 10 0 1 0 0 1
device=2NAND1-model
T 45800 46600 5 10 0 0 0 0 1
model-name=2nand1
T 45800 46600 5 10 0 0 0 0 1
file=model/2i_nand.sch.cir
}
C 46400 41400 1 0 0 2i_nand.sym
{
T 46575 41495 5 10 1 1 0 0 1
refdes=X3
T 47475 41490 5 10 0 1 0 0 1
device=2NAND1-model
T 46400 41400 5 10 0 0 0 0 1
model-name=2nand1
T 46400 41400 5 10 0 0 0 0 1
file=model/2i_nand.sch.cir
}
C 53100 42800 1 0 0 2i_nand.sym
{
T 53275 42895 5 10 1 1 0 0 1
refdes=X6
T 54175 42890 5 10 0 1 0 0 1
device=2NAND1-model
T 53100 42800 5 10 0 0 0 0 1
model-name=2nand1
T 53100 42800 5 10 0 0 0 0 1
file=model/2i_nand.sch.cir
}
C 47200 43000 1 0 0 vcc-2.sym
N 47400 42800 47400 43000 4
C 46600 48200 1 0 0 vcc-2.sym
N 46800 48000 46800 48200 4
C 48600 50300 1 0 0 vcc-2.sym
N 48800 50100 48800 50300 4
C 53900 44400 1 0 0 vcc-2.sym
N 54100 44200 54100 44400 4
C 48700 48200 1 0 0 gnd-1.sym
N 48800 48500 48800 48800 4
C 46700 46100 1 0 0 gnd-1.sym
N 46800 46400 46800 46700 4
C 47300 40900 1 0 0 gnd-1.sym
N 47400 41200 47400 41500 4
C 54000 42300 1 0 0 gnd-1.sym
N 54100 42600 54100 42900 4
C 55700 42000 1 0 0 gnd-1.sym
C 56000 42400 1 90 0 capacitor-1.sym
{
T 56300 43100 5 10 1 1 180 0 1
refdes=C2
T 55300 42600 5 10 0 0 90 0 1
device=CAPACITOR
T 55100 42600 5 10 0 0 90 0 1
symversion=0.1
T 56000 42400 5 10 1 1 0 0 1
value=47pF
}
C 55900 43700 1 90 0 resistor-1.sym
{
T 55600 44400 5 10 1 1 180 0 1
refdes=R2
T 55500 44000 5 10 0 0 90 0 1
device=RESISTOR
T 55900 43700 5 10 1 1 0 0 1
value=100k
}
C 55600 44700 1 0 0 vcc-2.sym
N 55800 43300 55800 43700 4
N 55800 44600 55800 44700 4
N 55800 42400 55800 42300 4
N 54900 43600 55800 43600 4
{
T 54900 43600 5 10 1 1 0 0 1
netname=out_2
}
N 48600 44400 49800 44400 4
N 49800 44400 49800 43200 4
N 49800 43200 53300 43200 4
{
T 50700 43200 5 10 1 1 0 0 1
netname=y
}
N 47600 47400 53100 47400 4
{
T 48900 47400 5 10 1 1 0 0 1
netname=x
}
N 53100 47400 53100 47200 4
N 53100 47200 53300 47200 4
N 53300 46600 52400 46600 4
N 52400 46200 55300 44300 4
N 55300 44300 55300 43600 4
N 55300 47000 55300 46200 4
N 55300 46200 52400 44500 4
N 53300 43800 52400 43800 4
N 52400 43800 52400 44500 4
N 52400 46600 52400 46200 4
N 49600 49500 50000 49500 4
N 50000 48700 50000 49500 4
N 50000 48700 45800 48700 4
N 45800 48700 45800 47600 4
N 45800 47600 46000 47600 4
N 48000 49100 47800 49100 4
N 47800 49100 47800 47400 4
N 48000 49700 45300 49700 4
N 45300 49700 45300 43800 4
N 45300 43800 46000 43800 4
N 46000 47000 45800 47000 4
N 45800 47000 45800 44300 4
N 46000 44800 45900 44800 4
N 45900 44800 45900 45800 4
N 45900 45800 48000 45800 4
N 48000 45800 48000 47400 4
N 45800 43800 45800 43300 4
N 45800 43300 48500 43300 4
N 48500 43300 48500 42200 4
N 48500 42200 48200 42200 4
N 49200 44400 49200 43100 4
N 49200 43100 46200 43100 4
N 46200 42400 46200 43100 4
N 46200 42400 46600 42400 4
N 44100 41800 46600 41800 4
{
T 44500 41800 5 10 1 1 0 0 1
netname=d
}
N 43900 44300 46000 44300 4
{
T 43900 44300 5 10 1 1 0 0 1
netname=clck
}
N 40900 42200 40900 42500 4
N 40900 42500 44100 42500 4
N 44100 42500 44100 41800 4
N 40900 45000 40900 45500 4
N 40900 45500 43900 45500 4
N 43900 45500 43900 44300 4
C 40600 41000 1 0 0 vsin-1.sym
{
T 41300 41650 5 10 1 1 0 0 1
refdes=V3
T 41300 41850 5 10 0 0 0 0 1
device=vsin
T 41300 42050 5 10 0 0 0 0 1
footprint=none
T 41300 41450 5 10 1 1 0 0 1
value=sin 0 4 2.5k
}
