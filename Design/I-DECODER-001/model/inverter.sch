v 20081231 1
C 40000 40000 0 0 0 title-B.sym
C 47600 45400 1 0 0 nmos-1.sym
{
T 48300 46200 5 10 0 0 0 0 1
device=NMOS_TRANSISTOR
T 48300 46000 5 10 1 1 0 0 1
refdes=Q1
T 48300 46400 5 10 0 0 0 0 1
symversion=0.1
T 47600 45400 5 10 0 0 0 0 1
model-name=mos_n
}
C 47600 46300 1 0 0 pmos-1.sym
{
T 48200 46500 5 10 0 0 0 0 1
device=PMOS_TRANSISTOR
T 48300 46900 5 10 1 1 0 0 1
refdes=Q2
T 47600 46300 5 10 0 0 0 0 1
model-name=mos_p
}
N 47600 45800 47500 45800 4
N 47500 46700 47600 46700 4
N 48300 46700 48400 46700 4
N 48400 45800 48300 45800 4
N 48100 47200 48100 47100 4
N 48100 45400 48100 45100 4
T 51800 40900 9 16 1 0 0 0 1
Inverter Gate
T 50100 40400 9 10 1 0 0 0 1
inverter.sch
T 50500 40100 9 10 1 0 0 0 1
1
T 52200 40100 9 10 1 0 0 0 1
1
T 54200 40400 9 10 1 0 0 0 1
1
T 54300 40100 9 10 1 0 0 0 1
Facundo J Ferrer
C 44200 47700 1 0 0 spice-subcircuit-LL-1.sym
{
T 44300 48000 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 44300 48100 5 10 1 1 0 0 1
refdes=A1
T 44300 47800 5 10 1 1 0 0 1
model-name=cmos_inverter
}
C 48900 45900 1 0 0 spice-subcircuit-IO-1.sym
{
T 49800 46300 5 10 0 1 0 0 1
device=spice-IO
T 49750 46150 5 10 1 1 0 0 1
refdes=P1
}
C 47700 46600 1 180 0 spice-subcircuit-IO-1.sym
{
T 46800 46200 5 10 0 1 180 0 1
device=spice-IO
T 46850 46350 5 10 1 1 180 0 1
refdes=P4
}
C 48400 47000 1 90 0 spice-subcircuit-IO-1.sym
{
T 48000 47900 5 10 0 1 90 0 1
device=spice-IO
T 48150 47850 5 10 1 1 90 0 1
refdes=P2
}
C 47800 45300 1 270 0 spice-subcircuit-IO-1.sym
{
T 48200 44400 5 10 0 1 270 0 1
device=spice-IO
T 48050 44450 5 10 1 1 270 0 1
refdes=P3
}
C 42900 46400 1 0 0 spice-model-1.sym
{
T 43000 47100 5 10 0 1 0 0 1
device=model
T 43000 47000 5 10 1 1 0 0 1
refdes=A2
T 44200 46700 5 10 1 1 0 0 1
model-name=mos_n
T 43400 46500 5 10 1 1 0 0 1
file=nmos.model
}
C 43000 43300 1 0 0 spice-model-1.sym
{
T 43100 44000 5 10 0 1 0 0 1
device=model
T 43100 43900 5 10 1 1 0 0 1
refdes=A3
T 44300 43600 5 10 1 1 0 0 1
model-name=mos_p
T 43500 43400 5 10 1 1 0 0 1
file=pmos.model
}
N 48400 46700 48400 47100 4
N 48400 47100 48100 47100 4
N 48400 45100 48400 45800 4
N 48400 45100 48100 45100 4
N 47500 45800 47500 46700 4
N 48100 46200 48100 46300 4
N 48100 46200 49100 46200 4
