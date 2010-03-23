v 20100214 2
C 40000 40000 0 0 0 title-B.sym
C 44000 48900 1 180 0 asic-pmos-1.sym
{
T 42600 48100 5 8 0 0 180 0 1
device=PMOS_TRANSISTOR
T 43200 48100 5 10 1 1 180 0 1
refdes=M1
T 43200 48300 5 8 1 1 180 0 1
model-name=pmos4
T 43200 48600 5 8 1 0 180 0 1
w=10u
T 43200 48800 5 8 1 0 180 0 1
l=0.8u
}
C 42800 46300 1 0 0 asic-nmos-1.sym
{
T 44200 47100 5 8 0 0 0 0 1
device=NMOS_TRANSISTOR
T 43600 47100 5 10 1 1 0 0 1
refdes=M3
T 43600 46900 5 8 1 1 0 0 1
model-name=nmos4
T 43600 46600 5 8 1 0 0 0 1
w=3u
T 43600 46400 5 8 1 0 0 0 1
l=0.8u
}
C 44400 47900 1 0 0 asic-pmos-1.sym
{
T 45800 48700 5 8 0 0 0 0 1
device=PMOS_TRANSISTOR
T 45200 48700 5 10 1 1 0 0 1
refdes=M2
T 45200 48500 5 8 1 1 0 0 1
model-name=pmos4
T 45200 48200 5 8 1 0 0 0 1
w=10u
T 45200 48000 5 8 1 0 0 0 1
l=0.8u
}
C 45600 47300 1 180 0 asic-nmos-1.sym
{
T 44200 46500 5 8 0 0 180 0 1
device=NMOS_TRANSISTOR
T 44800 46500 5 10 1 1 180 0 1
refdes=M4
T 44800 46700 5 8 1 1 180 0 1
model-name=nmos4
T 44800 47000 5 8 1 0 180 0 1
w=3u
T 44800 47200 5 8 1 0 180 0 1
l=0.8u
}
N 43400 47900 43400 47300 4
N 45000 47900 45000 47300 4
N 44000 48400 44400 48400 4
N 43400 47800 44200 47800 4
N 44200 47800 44200 48400 4
N 43400 48900 43400 49200 4
N 43400 46300 43400 46000 4
N 43400 46000 45000 46000 4
N 45000 46000 45000 46300 4
N 43500 46800 44900 46800 4
N 42700 48400 43300 48400 4
N 42700 48400 42700 49200 4
N 45100 48400 45700 48400 4
N 45700 48400 45700 49200 4
N 44200 45600 44200 46000 4
C 44100 44100 1 0 0 gnd-1.sym
C 44100 46500 1 0 0 gnd-1.sym
C 43600 44600 1 0 0 asic-nmos-1.sym
{
T 45000 45400 5 8 0 0 0 0 1
device=NMOS_TRANSISTOR
T 44400 45400 5 10 1 1 0 0 1
refdes=M5
T 44400 45200 5 8 1 1 0 0 1
model-name=nmos4
T 44400 44900 5 8 1 0 0 0 1
w=3u
T 44400 44700 5 8 1 0 0 0 1
l=0.8u
}
N 44200 44400 44200 44600 4
N 44800 44500 44200 44500 4
C 46800 44600 1 0 0 asic-nmos-1.sym
{
T 48200 45400 5 8 0 0 0 0 1
device=NMOS_TRANSISTOR
T 47600 45400 5 10 1 1 0 0 1
refdes=M7
T 47600 45200 5 8 1 1 0 0 1
model-name=nmos4
T 47600 44900 5 8 1 0 0 0 1
w=3u
T 47600 44700 5 8 1 0 0 0 1
l=0.8u
}
C 46800 47100 1 0 0 asic-pmos-1.sym
{
T 48200 47900 5 8 0 0 0 0 1
device=PMOS_TRANSISTOR
T 47600 47900 5 10 1 1 0 0 1
refdes=M6
T 47600 47700 5 8 1 1 0 0 1
model-name=pmos4
T 47600 47400 5 8 1 0 0 0 1
w=10u
T 47600 47200 5 8 1 0 0 0 1
l=0.8u
}
N 47400 45600 47400 47100 4
N 47400 48100 47400 49200 4
N 47500 47600 48100 47600 4
N 48100 47600 48100 49200 4
N 42700 49200 48100 49200 4
N 46800 47600 45000 47600 4
N 44300 45100 44800 45100 4
N 44800 45100 44800 44500 4
N 43600 45100 43600 45500 4
N 43600 45500 46800 45500 4
N 46800 45500 46800 45100 4
C 47300 44100 1 0 0 gnd-1.sym
N 47400 44400 47400 44600 4
N 47500 45100 48000 45100 4
N 48000 45100 48000 44500 4
N 48000 44500 47400 44500 4
N 45000 49200 45000 49500 4
N 45000 48900 45000 49200 4
T 54100 40100 9 10 1 0 0 0 1
Facundo J Ferrer
T 54000 40400 9 10 1 0 0 0 1
1
T 52200 41000 9 10 1 0 0 0 1
Comparator
T 50100 40400 9 10 1 0 0 0 1
comp46.sch
T 50500 40100 9 10 1 0 0 0 1
46
T 52100 40100 9 10 1 0 0 0 1
63
C 45400 46500 1 0 0 spice-subcircuit-IO-1.sym
{
T 46300 46900 5 10 0 1 0 0 1
device=spice-IO
T 46250 46750 5 10 1 1 0 0 1
refdes=P1
T 46100 46500 5 10 1 1 180 0 1
pinlabel=V+
}
C 43000 47100 1 180 0 spice-subcircuit-IO-1.sym
{
T 42100 46700 5 10 0 1 180 0 1
device=spice-IO
T 42150 46850 5 10 1 1 180 0 1
refdes=P2
T 43000 47100 5 10 1 1 180 0 1
pinlabel=V-
}
C 47800 46200 1 0 0 spice-subcircuit-IO-1.sym
{
T 48700 46600 5 10 0 1 0 0 1
device=spice-IO
T 48650 46450 5 10 1 1 0 0 1
refdes=P5
T 48300 46700 5 10 1 1 0 0 1
pinlabel=Vout
}
C 45300 49300 1 90 0 spice-subcircuit-IO-1.sym
{
T 44900 50200 5 10 0 1 90 0 1
device=spice-IO
T 45050 50150 5 10 1 1 90 0 1
refdes=P3
T 44600 49800 5 10 1 1 180 0 1
pinlabel=Vdd
}
C 40900 49500 1 0 0 spice-subcircuit-LL-1.sym
{
T 41000 49800 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 41000 49900 5 10 1 1 0 0 1
refdes=A1
T 41000 49600 5 10 1 1 0 0 1
model-name=comp46
}
N 47400 46500 48000 46500 4
C 43600 45400 1 180 0 spice-subcircuit-IO-1.sym
{
T 42700 45000 5 10 0 1 180 0 1
device=spice-IO
T 42750 45150 5 10 1 1 180 0 1
refdes=P4
T 42800 45400 5 10 1 1 0 0 1
pinlabel=Vbias
}
N 43400 45100 43600 45100 4