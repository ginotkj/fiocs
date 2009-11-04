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
model-name=3nand1
}
C 54000 45700 1 0 0 gnd-1.sym
N 54100 46000 54100 46300 4
C 47800 48700 1 0 0 2i_nand.sym
{
T 47975 48795 5 10 1 1 0 0 1
refdes=X5
T 48875 48790 5 10 0 1 0 0 1
device=2NAND1-model
T 47800 48700 5 10 0 0 0 0 1
model-name=2nand1
}
C 45800 46600 1 0 0 2i_nand.sym
{
T 45975 46695 5 10 1 1 0 0 1
refdes=X4
T 46875 46690 5 10 0 1 0 0 1
device=2NAND1-model
T 45800 46600 5 10 0 0 0 0 1
model-name=2nand1
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
C 48700 48200 1 0 0 gnd-1.sym
N 48800 48500 48800 48800 4
C 46700 46100 1 0 0 gnd-1.sym
N 46800 46400 46800 46700 4
C 47300 40900 1 0 0 gnd-1.sym
N 47400 41200 47400 41500 4
C 54000 42300 1 0 0 gnd-1.sym
N 54100 42600 54100 42900 4
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
C 40500 49900 1 0 0 spice-subcircuit-LL-1.sym
{
T 40600 50200 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 40600 50300 5 10 1 1 0 0 1
refdes=A1
T 40600 50000 5 10 1 1 0 0 1
model-name=i-ffd
}
C 40500 49000 1 0 0 spice-model-1.sym
{
T 40600 49700 5 10 0 1 0 0 1
device=model
T 40600 49600 5 10 1 1 0 0 1
refdes=A2
T 41800 49300 5 10 1 1 0 0 1
model-name=2nand1
T 41000 49100 5 10 1 1 0 0 1
file=model/2i_nand.sch.cir
}
C 40500 48100 1 0 0 spice-model-1.sym
{
T 40600 48800 5 10 0 1 0 0 1
device=model
T 40600 48700 5 10 1 1 0 0 1
refdes=A3
T 41800 48400 5 10 1 1 0 0 1
model-name=3nand1
T 41000 48200 5 10 1 1 0 0 1
file=model/3i_nand.sch.cir
}
C 55800 43300 1 0 0 spice-subcircuit-IO-1.sym
{
T 56700 43700 5 10 0 1 0 0 1
device=spice-IO
T 56650 43550 5 10 1 1 0 0 1
refdes=P5
T 55800 43300 5 10 0 0 0 0 1
pintype=out
T 56300 43200 5 10 1 1 0 0 1
pinlabel=_q
T 55800 43300 5 10 0 0 0 0 1
pinseq=5
}
C 55800 46700 1 0 0 spice-subcircuit-IO-1.sym
{
T 56700 47100 5 10 0 1 0 0 1
device=spice-IO
T 56650 46950 5 10 1 1 0 0 1
refdes=P1
T 55800 46700 5 10 0 0 0 0 1
pintype=out
T 56300 47200 5 10 1 1 0 0 1
pinlabel=q
T 55800 46700 5 10 0 0 0 0 1
pinseq=1
}
C 54400 49600 1 90 0 spice-subcircuit-IO-1.sym
{
T 54000 50500 5 10 0 1 90 0 1
device=spice-IO
T 54150 50450 5 10 1 1 90 0 1
refdes=P2
T 54400 49600 5 10 0 0 0 0 1
pinseq=2
T 54400 49600 5 10 0 0 0 0 1
pintype=pwr
}
C 43500 44600 1 180 0 spice-subcircuit-IO-1.sym
{
T 42600 44200 5 10 0 1 180 0 1
device=spice-IO
T 42650 44350 5 10 1 1 180 0 1
refdes=P3
T 43500 44600 5 10 0 0 0 0 1
pintype=in
T 42800 44000 5 10 1 1 0 0 1
pinlabel=clck
T 43500 44600 5 10 0 0 0 0 1
pinseq=3
}
C 44300 42100 1 180 0 spice-subcircuit-IO-1.sym
{
T 43400 41700 5 10 0 1 180 0 1
device=spice-IO
T 43450 41850 5 10 1 1 180 0 1
refdes=P4
T 44300 42100 5 10 0 0 0 0 1
pintype=in
T 43700 41400 5 10 1 1 0 0 1
pinlabel=d
T 44300 42100 5 10 0 0 0 0 1
pinseq=4
}
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
