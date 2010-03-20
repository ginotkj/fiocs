v 20100214 2
C 40000 40000 0 0 0 title-B.sym
C 45200 43900 1 0 0 asic-nmos-1.sym
{
T 46600 44700 5 8 0 0 0 0 1
device=NMOS_TRANSISTOR
T 45500 44700 5 10 1 1 0 0 1
refdes=M1
T 45900 44700 5 8 1 1 0 0 1
model-name=nmos4
T 45100 44500 5 8 1 0 0 0 1
w=3u
T 45100 44200 5 8 1 0 0 0 1
l=.8u
}
C 45200 42800 1 0 0 asic-nmos-1.sym
{
T 46600 43600 5 8 0 0 0 0 1
device=NMOS_TRANSISTOR
T 45500 43600 5 10 1 1 0 0 1
refdes=M2
T 45900 43600 5 8 1 1 0 0 1
model-name=nmos4
T 45100 43400 5 8 1 0 0 0 1
w=3u
T 45100 43100 5 8 1 0 0 0 1
l=.8u
}
C 44300 46900 1 0 0 asic-pmos-1.sym
{
T 45700 47700 5 8 0 0 0 0 1
device=PMOS_TRANSISTOR
T 44600 47700 5 10 1 1 0 0 1
refdes=M3
T 45000 47700 5 8 1 1 0 0 1
model-name=pmos4
T 44100 47500 5 8 1 0 0 0 1
w=10u
T 44300 47200 5 8 1 0 0 0 1
l=.8u
}
C 46300 46900 1 0 0 asic-pmos-1.sym
{
T 47700 47700 5 8 0 0 0 0 1
device=PMOS_TRANSISTOR
T 46600 47700 5 10 1 1 0 0 1
refdes=M4
T 47000 47700 5 8 1 1 0 0 1
model-name=pmos4
T 46100 47500 5 8 1 0 0 0 1
w=10u
T 46300 47200 5 8 1 0 0 0 1
l=.8u
}
N 44900 46900 44900 46800 4
N 44900 46800 46900 46800 4
N 46900 46800 46900 46900 4
N 44900 47900 44900 48100 4
N 44900 48100 46900 48100 4
N 46900 48100 46900 47900 4
N 45800 48100 45800 48700 4
N 45800 44900 45800 46800 4
N 45800 43900 45800 43800 4
N 45800 42600 45800 42800 4
N 44300 47400 44200 47400 4
N 44200 47400 44200 44400 4
N 44200 44400 45200 44400 4
N 45200 43300 44400 43300 4
N 44400 43300 44400 45600 4
N 46300 47400 46200 47400 4
N 46200 45600 46200 47400 4
N 44400 45600 46200 45600 4
N 45000 47400 45600 47400 4
N 47600 47400 47000 47400 4
N 45900 43300 46300 43300 4
N 45900 44400 46300 44400 4
T 51700 40900 9 16 1 0 0 0 1
2-input NAND Gate
T 50000 40400 9 10 1 0 0 0 1
deco64_2inand31.sch
T 50400 40100 9 10 1 0 0 0 1
31
T 52100 40100 9 10 1 0 0 0 1
59
T 54100 40400 9 10 1 0 0 0 1
2
T 54200 40100 9 10 1 0 0 0 1
Facundo J Ferrer
N 47900 46400 45800 46400 4
N 43000 44500 44200 44500 4
N 43000 43900 44400 43900 4
N 45600 47400 45600 48500 4
N 45600 48500 45800 48500 4
N 47600 47400 47600 48500 4
N 47600 48500 45800 48500 4
N 46300 42600 46300 44400 4
C 46000 42300 1 0 0 gnd-1.sym
N 45800 42600 46300 42600 4
C 43200 44800 1 180 0 spice-subcircuit-IO-1.sym
{
T 42300 44400 5 10 0 1 180 0 1
device=spice-IO
T 42350 44550 5 10 1 1 180 0 1
refdes=P3
T 43200 44800 5 10 1 1 0 0 1
pinlabel=in1
}
C 43200 44200 1 180 0 spice-subcircuit-IO-1.sym
{
T 42300 43800 5 10 0 1 180 0 1
device=spice-IO
T 42350 43950 5 10 1 1 180 0 1
refdes=P4
T 43200 44200 5 10 1 1 0 0 1
pinlabel=in2
}
C 46100 48500 1 90 0 spice-subcircuit-IO-1.sym
{
T 45700 49400 5 10 0 1 90 0 1
device=spice-IO
T 45850 49350 5 10 1 1 90 0 1
refdes=P2
T 46100 48500 5 10 1 1 0 0 1
pinlabel=Vdd
}
C 47700 46100 1 0 0 spice-subcircuit-IO-1.sym
{
T 48600 46500 5 10 0 1 0 0 1
device=spice-IO
T 48550 46350 5 10 1 1 0 0 1
refdes=P1
T 47700 46100 5 10 1 1 0 0 1
pinlabel=out1
}
C 41200 48900 1 0 0 spice-subcircuit-LL-1.sym
{
T 41300 49200 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 41300 49300 5 10 1 1 0 0 1
refdes=A1
T 41300 49000 5 10 1 1 0 0 1
model-name=deco64_2inand31
}
