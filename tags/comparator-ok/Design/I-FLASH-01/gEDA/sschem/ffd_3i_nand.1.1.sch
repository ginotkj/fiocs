v 20081231 1
C 40000 40000 0 0 0 title-B.sym
C 46600 45300 1 0 0 asic-nmos-1.sym
{
T 48000 46100 5 8 0 0 0 0 1
device=NMOS_TRANSISTOR
T 47400 46100 5 10 1 1 0 0 1
refdes=M5
T 47400 45900 5 8 1 1 0 0 1
model-name=nmos4
T 47400 45600 5 8 1 0 0 0 1
w=3u
T 47400 45400 5 8 1 0 0 0 1
l=.8u
}
C 44400 48400 1 0 0 asic-pmos-1.sym
{
T 45800 49200 5 8 0 0 0 0 1
device=PMOS_TRANSISTOR
T 45200 49200 5 10 1 1 0 0 1
refdes=M1
T 45200 49000 5 8 1 1 0 0 1
model-name=pmos4
T 45200 48700 5 8 1 0 0 0 1
w=10u
T 45200 48500 5 8 1 0 0 0 1
l=.8u
}
C 46600 46700 1 0 0 asic-nmos-1.sym
{
T 48000 47500 5 8 0 0 0 0 1
device=NMOS_TRANSISTOR
T 47400 47500 5 10 1 1 0 0 1
refdes=M4
T 47400 47300 5 8 1 1 0 0 1
model-name=nmos4
T 47400 47000 5 8 1 0 0 0 1
w=3u
T 47400 46800 5 8 1 0 0 0 1
l=.8u
}
N 45000 49700 45000 49400 4
N 45100 48900 45700 48900 4
N 45700 48900 45700 49700 4
N 45000 48400 45000 48100 4
N 47200 47700 47200 48100 4
N 47300 47200 48000 47200 4
N 47200 46300 47200 46700 4
N 47300 45800 48000 45800 4
N 46400 47200 46400 48900 4
N 45000 48100 50800 48100 4
N 46200 47200 46600 47200 4
N 47200 49700 47200 49400 4
N 47200 48100 47200 48400 4
N 44400 48900 44400 45800 4
N 44400 45800 46600 45800 4
N 44400 46600 44100 46600 4
N 47300 48900 47900 48900 4
N 47900 48900 47900 49700 4
C 46600 48400 1 0 0 asic-pmos-1.sym
{
T 48000 49200 5 8 0 0 0 0 1
device=PMOS_TRANSISTOR
T 47400 49200 5 10 1 1 0 0 1
refdes=M2
T 47400 49000 5 8 1 1 0 0 1
model-name=pmos4
T 47400 48700 5 8 1 0 0 0 1
w=10u
T 47400 48500 5 8 1 0 0 0 1
l=.8u
}
C 49900 48400 1 0 1 asic-pmos-1.sym
{
T 48500 49200 5 8 0 0 0 6 1
device=PMOS_TRANSISTOR
T 49100 49200 5 10 1 1 0 6 1
refdes=M3
T 49100 49000 5 8 1 1 0 6 1
model-name=pmos4
T 49100 48700 5 8 1 0 0 6 1
w=10u
T 49100 48500 5 8 1 0 0 6 1
l=.8u
}
N 49300 49400 49300 49700 4
N 45000 49700 49300 49700 4
N 49200 48900 48600 48900 4
N 48600 48900 48600 49700 4
N 49300 48400 49300 48100 4
C 46600 43800 1 0 0 asic-nmos-1.sym
{
T 48000 44600 5 8 0 0 0 0 1
device=NMOS_TRANSISTOR
T 47400 44600 5 10 1 1 0 0 1
refdes=M6
T 47400 44400 5 8 1 1 0 0 1
model-name=nmos4
T 47400 44100 5 8 1 0 0 0 1
w=3u
T 47400 43900 5 8 1 0 0 0 1
l=.8u
}
N 47200 44800 47200 45300 4
N 47300 44300 48000 44300 4
N 48000 43500 48000 47200 4
N 48000 43500 47200 43500 4
N 47200 43500 47200 43800 4
N 46600 44300 46100 44300 4
N 46100 44300 46100 43000 4
N 46100 43000 50400 43000 4
N 50400 43000 50400 48900 4
N 50400 48900 49900 48900 4
C 47100 43200 1 0 0 gnd-1.sym
N 46400 48900 46600 48900 4
C 43500 46500 1 0 0 in-1.sym
{
T 43500 46800 5 10 0 0 0 0 1
device=INPUT
T 43500 46800 5 10 1 1 0 0 1
refdes=in2
}
C 45600 47100 1 0 0 in-1.sym
{
T 45600 47400 5 10 0 0 0 0 1
device=INPUT
T 45600 47400 5 10 1 1 0 0 1
refdes=in1
}
C 45500 44200 1 0 0 in-1.sym
{
T 45500 44500 5 10 0 0 0 0 1
device=INPUT
T 45500 44500 5 10 1 1 0 0 1
refdes=in3
}
C 47100 50300 1 270 0 in-1.sym
{
T 47400 50300 5 10 0 0 270 0 1
device=INPUT
T 47400 50300 5 10 1 1 270 0 1
refdes=Vdd
}
C 50800 48000 1 0 0 out-1.sym
{
T 50800 48300 5 10 0 0 0 0 1
device=OUTPUT
T 50800 48300 5 10 1 1 0 0 1
refdes=out1
}
T 52400 40900 9 10 1 0 0 0 1
3 NAND 1
T 54200 40100 9 10 1 0 0 0 1
Fabricio N Altamiranda
T 54700 40400 9 10 1 0 0 0 1
2
T 50500 40400 9 10 1 0 0 0 1
ffd_3i_nand.1.1.sch
T 50500 40100 9 10 1 0 0 0 1
1
T 52100 40100 9 10 1 0 0 0 1
1
