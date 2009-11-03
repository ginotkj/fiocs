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
C 50600 47800 1 0 0 spice-subcircuit-IO-1.sym
{
T 51500 48200 5 10 0 1 0 0 1
device=spice-IO
T 51450 48050 5 10 1 1 0 0 1
refdes=P1
}
C 47500 49500 1 90 0 spice-subcircuit-IO-1.sym
{
T 47100 50400 5 10 0 1 90 0 1
device=spice-IO
T 47250 50350 5 10 1 1 90 0 1
refdes=P2
}
C 46400 47500 1 180 0 spice-subcircuit-IO-1.sym
{
T 45500 47100 5 10 0 1 180 0 1
device=spice-IO
T 45550 47250 5 10 1 1 180 0 1
refdes=P3
}
C 44400 46300 1 0 0 spice-subcircuit-IO-1.sym
{
T 45300 46700 5 10 0 1 0 0 1
device=spice-IO
T 45250 46550 5 10 1 1 0 0 1
refdes=P4
}
N 45000 48100 50800 48100 4
N 46200 47200 46600 47200 4
N 47200 49700 47200 49400 4
N 47200 48100 47200 48400 4
N 44400 48900 44400 45800 4
N 44400 45800 46600 45800 4
N 44400 46600 44600 46600 4
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
C 49900 49400 1 180 0 asic-pmos-1.sym
{
T 48500 48600 5 8 0 0 180 0 1
device=PMOS_TRANSISTOR
T 49100 48600 5 10 1 1 180 0 1
refdes=M3
T 49100 48800 5 8 1 1 180 0 1
model-name=pmos4
T 49100 49100 5 8 1 0 180 0 1
w=10u
T 49100 49300 5 8 1 0 180 0 1
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
C 46300 44600 1 180 0 spice-subcircuit-IO-1.sym
{
T 45400 44200 5 10 0 1 180 0 1
device=spice-IO
T 45450 44350 5 10 1 1 180 0 1
refdes=P5
}
N 46400 48900 46600 48900 4
C 41000 49000 1 0 0 spice-subcircuit-LL-1.sym
{
T 41100 49300 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 41100 49400 5 10 1 1 0 0 1
refdes=A1
T 41100 49100 5 10 1 1 0 0 1
model-name=3nand1
}
C 41000 47400 1 0 0 spice-model-1.sym
{
T 41100 48100 5 10 0 1 0 0 1
device=model
T 41100 48000 5 10 1 1 0 0 1
refdes=A2
T 42300 47700 5 10 1 1 0 0 1
model-name=nmos4
T 41500 47500 5 10 1 1 0 0 1
file=../model/nmos4.model
}
C 40900 45800 1 0 0 spice-model-1.sym
{
T 41000 46500 5 10 0 1 0 0 1
device=model
T 41000 46400 5 10 1 1 0 0 1
refdes=A3
T 42200 46100 5 10 1 1 0 0 1
model-name=pmos4
T 41400 45900 5 10 1 1 0 0 1
file=../model/pmos4.model
}
