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
N 48600 44400 49800 44400 4
N 49800 44400 49800 43200 4
N 49800 43200 53300 43200 4
N 47600 47400 53100 47400 4
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
N 43300 44300 46000 44300 4
N 54900 47000 56000 47000 4
N 54900 43600 56000 43600 4
N 54100 49800 54100 47600 4
N 48800 50100 48800 50300 4
N 48800 50300 52400 50300 4
N 52400 48100 52400 50300 4
N 46800 48000 46800 48100 4
N 46800 48100 52400 48100 4
N 52400 48800 54100 48800 4
N 47400 45500 47400 45600 4
N 47400 45600 50400 45600 4
N 54100 44200 54100 44600 4
N 54100 44600 50400 44600 4
N 47400 42800 47400 42900 4
N 47400 42900 50400 42900 4
N 50400 42900 50400 48100 4
C 47900 48700 1 0 0 2i_nand.sym
{
T 49175 49995 5 10 1 1 0 0 1
refdes=S1
T 48175 50390 5 10 0 1 0 0 1
device=none
T 47900 48700 5 10 0 0 0 0 1
source=2i_nand.1.sch
}
C 45900 46600 1 0 0 2i_nand.sym
{
T 47175 47895 5 10 1 1 0 0 1
refdes=S2
T 46175 48290 5 10 0 1 0 0 1
device=none
T 45900 46600 5 10 0 0 0 0 1
source=2i_nand.2.sch
}
C 46500 41400 1 0 0 2i_nand.sym
{
T 47775 42695 5 10 1 1 0 0 1
refdes=S3
T 46775 43090 5 10 0 1 0 0 1
device=none
T 46500 41400 5 10 0 0 0 0 1
source=2i_nand.3.sch
}
C 53200 46200 1 0 0 2i_nand.sym
{
T 54475 47495 5 10 1 1 0 0 1
refdes=S4
T 53475 47890 5 10 0 1 0 0 1
device=none
T 53200 46200 5 10 0 0 0 0 1
source=2i_nand.4.sch
}
C 53200 42800 1 0 0 2i_nand.sym
{
T 54475 44095 5 10 1 1 0 0 1
refdes=S5
T 53475 44490 5 10 0 1 0 0 1
device=none
T 53200 42800 5 10 0 0 0 0 1
source=2i_nand.5.sch
}
C 46000 43600 1 0 0 3i_nand.sym
{
T 46595 45400 5 10 1 1 0 0 1
refdes=S6
T 46895 44000 5 10 0 1 0 0 1
device=none
T 46000 43600 5 10 0 0 0 0 1
source=3i_nand.1.sch
}
C 42700 44200 1 0 0 in-1.sym
{
T 42700 44500 5 10 0 0 0 0 1
device=INPUT
T 42700 44500 5 10 1 1 0 0 1
refdes=clck
}
C 43500 41700 1 0 0 in-1.sym
{
T 43500 42000 5 10 0 0 0 0 1
device=INPUT
T 43500 42000 5 10 1 1 0 0 1
refdes=d
}
C 54000 50400 1 270 0 in-1.sym
{
T 54300 50400 5 10 0 0 270 0 1
device=INPUT
T 54300 50400 5 10 1 1 270 0 1
refdes=Vdd
}
C 56000 46900 1 0 0 out-1.sym
{
T 56000 47200 5 10 0 0 0 0 1
device=OUTPUT
T 56000 47200 5 10 1 1 0 0 1
refdes=q
}
C 56000 43500 1 0 0 out-1.sym
{
T 56000 43800 5 10 0 0 0 0 1
device=OUTPUT
T 56000 43800 5 10 1 1 0 0 1
refdes=q~
}
