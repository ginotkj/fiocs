v 20100214 2
C 40000 40000 0 0 0 title-B.sym
N 47500 45600 47500 46900 4
N 48200 46900 48400 46900 4
T 51800 40900 9 16 1 0 0 0 1
Inverter Gate
T 50100 40400 9 10 1 0 0 0 1
deco64_inv6.sch
T 50500 40100 9 10 1 0 0 0 1
6
T 52200 40100 9 10 1 0 0 0 1
8
T 54200 40400 9 10 1 0 0 0 1
1
T 54300 40100 9 10 1 0 0 0 1
Facundo J Ferrer
N 48400 46900 48400 47400 4
N 48400 47400 48100 47400 4
N 48400 44700 48100 44700 4
N 48100 46200 49100 46200 4
C 47500 45100 1 0 0 asic-nmos-1.sym
{
T 48900 45900 5 8 0 0 0 0 1
device=NMOS_TRANSISTOR
T 47700 45100 5 10 1 1 0 0 1
refdes=M2
T 48300 45700 5 8 1 1 0 0 1
model-name=nmos180
T 48300 45400 5 8 1 0 0 0 1
w=.18u
T 48300 45200 5 8 1 0 0 0 1
l=.18u
}
C 47500 46400 1 0 0 asic-pmos-1.sym
{
T 48900 47200 5 8 0 0 0 0 1
device=PMOS_TRANSISTOR
T 47800 47200 5 10 1 1 0 0 1
refdes=M1
T 48600 47100 5 8 1 1 0 0 1
model-name=pmos180
T 48300 46700 5 8 1 0 0 0 1
w=.2u
T 48300 46500 5 8 1 0 0 0 1
l=.18u
}
N 48100 46100 48100 46400 4
N 48400 44700 48400 45600 4
N 48400 45600 48200 45600 4
N 48100 44700 48100 45100 4
N 48100 47500 48100 47400 4
C 48100 44400 1 0 0 gnd-1.sym
C 45000 47300 1 0 0 spice-subcircuit-LL-1.sym
{
T 45100 47600 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 45100 47700 5 10 1 1 0 0 1
refdes=A1
T 45100 47400 5 10 1 1 0 0 1
model-name=deco64_inv6
}
C 47700 46500 1 180 0 spice-subcircuit-IO-1.sym
{
T 46800 46100 5 10 0 1 180 0 1
device=spice-IO
T 46850 46250 5 10 1 1 180 0 1
refdes=P3
T 47200 46500 5 10 1 1 0 0 1
pinlabel=in1
}
C 48400 47300 1 90 0 spice-subcircuit-IO-1.sym
{
T 48000 48200 5 10 0 1 90 0 1
device=spice-IO
T 48150 48150 5 10 1 1 90 0 1
refdes=P2
T 48400 47300 5 10 1 1 0 0 1
pinlabel=Vdd
}
C 48900 45900 1 0 0 spice-subcircuit-IO-1.sym
{
T 49800 46300 5 10 0 1 0 0 1
device=spice-IO
T 49750 46150 5 10 1 1 0 0 1
refdes=P1
T 48900 45900 5 10 1 1 0 0 1
pinlabel=out1
}
