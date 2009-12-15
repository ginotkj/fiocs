v 20081231 1
C 40000 40000 0 0 0 title-B.sym
C 41000 49100 1 0 0 comparador.sym
{
T 42175 50095 5 10 0 1 0 0 1
device=none
T 41975 50095 5 10 1 1 0 0 1
refdes=SC7
T 41000 49100 5 10 0 0 0 0 1
source=comp.7.sch
}
C 41000 47700 1 0 0 comparador.sym
{
T 42175 48695 5 10 0 1 0 0 1
device=none
T 41975 48695 5 10 1 1 0 0 1
refdes=SC6
T 41000 47700 5 10 0 0 0 0 1
source=comp.6.sch
}
C 41000 46300 1 0 0 comparador.sym
{
T 42175 47295 5 10 0 1 0 0 1
device=none
T 41975 47295 5 10 1 1 0 0 1
refdes=SC5
T 41000 46300 5 10 0 0 0 0 1
source=comp.5.sch
}
C 41000 44900 1 0 0 comparador.sym
{
T 42175 45895 5 10 0 1 0 0 1
device=none
T 41975 45895 5 10 1 1 0 0 1
refdes=SC4
T 41000 44900 5 10 0 0 0 0 1
source=comp.4.sch
}
C 41000 43500 1 0 0 comparador.sym
{
T 42175 44495 5 10 0 1 0 0 1
device=none
T 41975 44495 5 10 1 1 0 0 1
refdes=SC3
T 41000 43500 5 10 0 0 0 0 1
source=comp.3.sch
}
C 41000 42100 1 0 0 comparador.sym
{
T 42175 43095 5 10 0 1 0 0 1
device=none
T 41975 43095 5 10 1 1 0 0 1
refdes=SC2
T 41000 42100 5 10 0 0 0 0 1
source=comp.2.sch
}
C 41000 40700 1 0 0 comparador.sym
{
T 42175 41695 5 10 0 1 0 0 1
device=none
T 41975 41695 5 10 1 1 0 0 1
refdes=SC1
T 41000 40700 5 10 0 0 0 0 1
source=comp.1.sch
}
C 40700 40500 1 90 0 resistor-1.sym
{
T 40300 40800 5 10 0 0 90 0 1
device=RESISTOR
T 40400 40700 5 10 1 1 90 0 1
refdes=R1
T 40700 40500 5 10 0 0 0 0 1
value=5k
}
C 40700 41900 1 90 0 resistor-1.sym
{
T 40300 42200 5 10 0 0 90 0 1
device=RESISTOR
T 40400 42100 5 10 1 1 90 0 1
refdes=R2
T 40700 41900 5 10 0 0 0 0 1
value=10k
}
C 40700 43300 1 90 0 resistor-1.sym
{
T 40300 43600 5 10 0 0 90 0 1
device=RESISTOR
T 40400 43500 5 10 1 1 90 0 1
refdes=R3
T 40700 43300 5 10 0 0 0 0 1
value=10k
}
C 40700 44700 1 90 0 resistor-1.sym
{
T 40300 45000 5 10 0 0 90 0 1
device=RESISTOR
T 40400 44900 5 10 1 1 90 0 1
refdes=R4
T 40700 44700 5 10 0 0 0 0 1
value=10k
}
C 40700 46100 1 90 0 resistor-1.sym
{
T 40300 46400 5 10 0 0 90 0 1
device=RESISTOR
T 40400 46300 5 10 1 1 90 0 1
refdes=R5
T 40700 46100 5 10 0 0 0 0 1
value=10k
}
C 40700 47500 1 90 0 resistor-1.sym
{
T 40300 47800 5 10 0 0 90 0 1
device=RESISTOR
T 40400 47700 5 10 1 1 90 0 1
refdes=R6
T 40700 47500 5 10 0 0 0 0 1
value=10k
}
C 40700 48900 1 90 0 resistor-1.sym
{
T 40300 49200 5 10 0 0 90 0 1
device=RESISTOR
T 40400 49100 5 10 1 1 90 0 1
refdes=R7
T 40700 48900 5 10 0 0 0 0 1
value=10k
}
C 40700 50200 1 90 0 resistor-1.sym
{
T 40300 50500 5 10 0 0 90 0 1
device=RESISTOR
T 40400 50400 5 10 1 1 90 0 1
refdes=R8
T 40700 50200 5 10 0 1 0 0 1
value=5k
}
N 40600 41400 40600 41900 4
N 41000 41600 40600 41600 4
{
T 41000 41600 5 10 0 0 0 0 1
netname=t1
}
N 40600 43300 40600 42800 4
N 41000 43000 40600 43000 4
{
T 41000 43000 5 10 0 0 0 0 1
netname=t2
}
N 40600 44700 40600 44200 4
N 41000 44400 40600 44400 4
{
T 41000 44400 5 10 0 0 0 0 1
netname=t3
}
N 40600 46100 40600 45600 4
N 41000 45800 40600 45800 4
{
T 41000 45800 5 10 0 0 0 0 1
netname=t4
}
N 40600 47500 40600 47000 4
N 41000 47200 40600 47200 4
{
T 41000 47200 5 10 0 0 0 0 1
netname=t5
}
N 40600 48900 40600 48400 4
N 41000 48600 40600 48600 4
{
T 41000 48600 5 10 0 0 0 0 1
netname=t6
}
N 40600 50200 40600 49800 4
N 41000 50000 40600 50000 4
{
T 41000 50000 5 10 0 0 0 0 1
netname=t7
}
N 41000 49400 40900 49400 4
N 40900 48000 41000 48000 4
N 40900 46600 41000 46600 4
N 40900 45200 41000 45200 4
N 40900 43800 41000 43800 4
N 41000 42400 40900 42400 4
N 40900 41000 40900 49400 4
N 40900 41000 41000 41000 4
N 41500 49100 42500 49100 4
N 42500 40700 42500 49100 4
N 41500 42100 42500 42100 4
N 41500 43500 42500 43500 4
N 41500 44900 42500 44900 4
N 41500 46300 42500 46300 4
N 41500 47700 42500 47700 4
N 41500 41900 42600 41900 4
N 42600 50300 41500 50300 4
N 41500 48900 42600 48900 4
N 41500 47500 42600 47500 4
N 41500 46100 42600 46100 4
N 41500 44700 42600 44700 4
N 41500 43300 42600 43300 4
C 42000 40000 1 90 0 vdc-1.sym
{
T 41100 39950 5 10 1 1 180 0 1
refdes=V1
T 41150 40700 5 10 0 0 90 0 1
device=VOLTAGE_SOURCE
T 40950 40700 5 10 0 0 90 0 1
footprint=none
T 41800 39950 5 10 1 1 180 0 1
value=DC 1V
}
C 42000 40600 1 270 0 vdc-1.sym
{
T 42200 39750 5 10 1 1 0 0 1
refdes=V2
T 42850 39900 5 10 0 0 270 0 1
device=VOLTAGE_SOURCE
T 43050 39900 5 10 0 0 270 0 1
footprint=none
T 42500 39750 5 10 1 1 0 0 1
value=DC 1V
}
N 40800 40300 40600 40300 4
N 40600 40300 40600 40500 4
N 42000 40300 42000 39800 4
C 41900 39500 1 0 0 gnd-1.sym
N 41500 40700 43200 40700 4
N 43200 40700 43200 40300 4
C 43900 52100 1 90 0 vdc-1.sym
{
T 43250 52800 5 10 1 1 90 0 1
refdes=V3
T 43050 52800 5 10 0 0 90 0 1
device=VOLTAGE_SOURCE
T 42850 52800 5 10 0 0 90 0 1
footprint=none
T 43450 52800 5 10 1 1 90 0 1
value=DC 3.3V
}
C 38500 49900 1 0 0 vdc-1.sym
{
T 39200 50550 5 10 1 1 0 0 1
refdes=V5
T 39200 50750 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 39200 50950 5 10 0 0 0 0 1
footprint=none
T 39200 50350 5 10 1 1 0 0 1
value=DC 3V
}
N 38800 51100 38800 51200 4
N 38800 51200 40600 51200 4
N 40600 51200 40600 51100 4
N 42600 41900 42600 52400 4
N 38500 48700 38500 48800 4
N 38500 48800 40900 48800 4
{
T 38500 48800 5 10 1 0 0 0 1
netname=vin
}
C 38400 47100 1 0 0 gnd-1.sym
C 38700 49500 1 0 0 gnd-1.sym
C 44100 51400 1 0 0 gnd-1.sym
N 38800 49800 38800 49900 4
N 38500 47500 38500 47400 4
T 51700 40900 9 14 1 0 0 0 1
4-bit Flash converter
T 54000 40100 9 10 1 0 0 0 1
Facundo J Ferrer
T 54000 40400 9 10 1 0 0 0 1
2
T 50000 40400 9 10 1 0 0 0 1
flash.sch
T 50400 40100 9 10 1 0 0 0 1
1
T 52000 40100 9 10 1 0 0 0 1
8
C 54900 49900 1 0 0 spice-model-1.sym
{
T 55000 50600 5 10 0 1 0 0 1
device=model
T 55000 50500 5 10 1 1 0 0 1
refdes=A1
T 56200 50200 5 10 1 1 0 0 1
model-name=nmos4
T 55400 50000 5 10 1 1 0 0 1
file=nmos4.model
}
C 54900 49000 1 0 0 spice-model-1.sym
{
T 55000 49700 5 10 0 1 0 0 1
device=model
T 55000 49600 5 10 1 1 0 0 1
refdes=A2
T 56200 49300 5 10 1 1 0 0 1
model-name=pmos4
T 55400 49100 5 10 1 1 0 0 1
file=pmos4.model
}
C 54900 48300 1 0 0 spice-include-1.sym
{
T 55000 48600 5 10 0 1 0 0 1
device=include
T 55000 48700 5 10 1 1 0 0 1
refdes=A3
T 55400 48400 5 10 1 1 0 0 1
file=flash.cmd
}
C 44200 40900 1 0 0 flipflop.sym
{
T 45495 41700 5 10 1 1 0 0 1
refdes=SF1
T 45095 42900 5 10 0 1 0 0 1
device=none
T 44200 40900 5 10 0 0 0 0 1
source=ffd.1.sch
}
C 44200 42300 1 0 0 flipflop.sym
{
T 45495 43100 5 10 1 1 0 0 1
refdes=SF2
T 45095 44300 5 10 0 1 0 0 1
device=none
T 44200 42300 5 10 0 0 0 0 1
source=ffd.2.sch
}
C 44200 43700 1 0 0 flipflop.sym
{
T 45495 44500 5 10 1 1 0 0 1
refdes=SF3
T 45095 45700 5 10 0 1 0 0 1
device=none
T 44200 43700 5 10 0 0 0 0 1
source=ffd.3.sch
}
C 44200 45100 1 0 0 flipflop.sym
{
T 45495 45900 5 10 1 1 0 0 1
refdes=SF4
T 45095 47100 5 10 0 1 0 0 1
device=none
T 44200 45100 5 10 0 0 0 0 1
source=ffd.4.sch
}
C 44200 46500 1 0 0 flipflop.sym
{
T 45495 47300 5 10 1 1 0 0 1
refdes=SF5
T 45095 48500 5 10 0 1 0 0 1
device=none
T 44200 46500 5 10 0 0 0 0 1
source=ffd.5.sch
}
C 44200 47900 1 0 0 flipflop.sym
{
T 45495 48700 5 10 1 1 0 0 1
refdes=SF6
T 45095 49900 5 10 0 1 0 0 1
device=none
T 44200 47900 5 10 0 0 0 0 1
source=ffd.6.sch
}
C 44200 49300 1 0 0 flipflop.sym
{
T 45495 50100 5 10 1 1 0 0 1
refdes=SF7
T 45095 51300 5 10 0 1 0 0 1
device=none
T 44200 49300 5 10 0 0 0 0 1
source=ffd.7.sch
}
N 42300 49700 44400 49700 4
{
T 42300 49700 5 10 1 0 0 0 1
netname=c7
}
N 42300 48300 44400 48300 4
{
T 42300 48300 5 10 1 0 0 0 1
netname=c6
}
N 42300 45500 44400 45500 4
{
T 42300 45500 5 10 1 0 0 0 1
netname=c4
}
N 42300 46900 44400 46900 4
{
T 42300 46900 5 10 1 0 0 0 1
netname=c5
}
N 42300 44100 44400 44100 4
{
T 42300 44100 5 10 1 0 0 0 1
netname=c3
}
N 42300 42700 44400 42700 4
{
T 42300 42700 5 10 1 0 0 0 1
netname=c2
}
N 42300 41300 44400 41300 4
{
T 42300 41300 5 10 1 0 0 0 1
netname=c1
}
N 43900 52400 44200 52400 4
N 44200 51700 44200 52400 4
N 44400 49400 44200 49400 4
N 44200 48000 44400 48000 4
N 44200 46600 44400 46600 4
N 44200 45200 44400 45200 4
N 44200 43800 44400 43800 4
N 44200 42400 44400 42400 4
N 44200 41000 44200 49400 4
{
T 43500 41600 5 10 1 0 0 0 1
netname=clock
}
N 44200 41000 44400 41000 4
N 45200 41800 45200 41900 4
N 45200 41900 44000 41900 4
N 44000 43300 45200 43300 4
N 45200 43300 45200 43200 4
N 44000 44700 45200 44700 4
N 45200 44700 45200 44600 4
N 44000 46100 45200 46100 4
N 45200 46100 45200 46000 4
N 44000 47500 45200 47500 4
N 45200 47500 45200 47400 4
N 44000 48900 45200 48900 4
N 45200 48900 45200 48800 4
N 44000 41900 44000 50300 4
N 45200 50300 45200 50200 4
C 43900 39800 1 0 0 vpulse-1.sym
{
T 44600 40450 5 10 1 1 0 0 1
refdes=V6
T 44600 40650 5 10 0 0 0 0 1
device=vpulse
T 44600 40850 5 10 0 0 0 0 1
footprint=none
T 44600 40250 5 10 1 1 0 0 1
value=pulse 0 3.3 0 .1u .1u 1u 2u DC 0
}
C 44100 39400 1 0 0 gnd-1.sym
N 44200 39800 44200 39700 4
C 47900 43900 1 0 0 deco8.sym
{
T 49275 47000 5 10 1 1 0 0 1
refdes=SD1
T 50075 47400 5 10 0 0 0 0 1
device=none
T 47900 43900 5 10 0 0 0 0 1
source=deco8.sch
}
N 46000 45500 48000 45500 4
N 46000 45200 46100 45200 4
N 46100 45200 46100 45300 4
N 46100 45300 48000 45300 4
N 46000 44100 46200 44100 4
N 46200 44100 46200 45100 4
N 46200 45100 48000 45100 4
N 46000 43800 46300 43800 4
N 46300 43800 46300 44900 4
N 46300 44900 48000 44900 4
N 48000 44700 46400 44700 4
N 46400 44700 46400 42700 4
N 46400 42700 46000 42700 4
N 48000 44500 46500 44500 4
N 46500 44500 46500 42400 4
N 46500 42400 46000 42400 4
N 48000 44300 46600 44300 4
N 46600 44300 46600 41300 4
N 46600 41300 46000 41300 4
N 46000 41000 46700 41000 4
N 46700 41000 46700 44100 4
N 46700 44100 48000 44100 4
N 46000 46600 46200 46600 4
N 46200 46600 46200 45700 4
N 46200 45700 48000 45700 4
N 48000 45900 46300 45900 4
N 46300 45900 46300 46900 4
N 46300 46900 46000 46900 4
N 48000 46100 46400 46100 4
N 46400 46100 46400 48000 4
N 46400 48000 46000 48000 4
N 46000 48300 46500 48300 4
N 46500 48300 46500 46300 4
N 46500 46300 48000 46300 4
N 48000 46500 46600 46500 4
N 46600 46500 46600 49400 4
N 46600 49400 46000 49400 4
N 46000 49700 46700 49700 4
N 46700 49700 46700 46700 4
N 46700 46700 48000 46700 4
C 51300 46600 1 90 0 resistor-1.sym
{
T 50900 46900 5 10 0 0 90 0 1
device=RESISTOR
T 51000 46800 5 10 1 1 90 0 1
refdes=R9
T 51300 46600 5 10 1 1 0 0 1
value=10Meg
}
C 52100 46600 1 90 0 resistor-1.sym
{
T 51700 46900 5 10 0 0 90 0 1
device=RESISTOR
T 51800 46800 5 10 1 1 90 0 1
refdes=R10
T 52100 46600 5 10 1 1 0 0 1
value=10Meg
}
C 52900 46600 1 90 0 resistor-1.sym
{
T 52500 46900 5 10 0 0 90 0 1
device=RESISTOR
T 52600 46800 5 10 1 1 90 0 1
refdes=R11
T 52900 46600 5 10 1 1 0 0 1
value=10Meg
}
C 51400 43700 1 90 0 capacitor-1.sym
{
T 50700 43900 5 10 0 0 90 0 1
device=CAPACITOR
T 50900 43900 5 10 1 1 90 0 1
refdes=C1
T 50500 43900 5 10 0 0 90 0 1
symversion=0.1
T 51400 43700 5 10 1 1 0 0 1
value=47pF
}
C 52200 43700 1 90 0 capacitor-1.sym
{
T 51500 43900 5 10 0 0 90 0 1
device=CAPACITOR
T 51700 43900 5 10 1 1 90 0 1
refdes=C2
T 51300 43900 5 10 0 0 90 0 1
symversion=0.1
T 52200 43700 5 10 1 1 0 0 1
value=47pF
}
C 53000 43700 1 90 0 capacitor-1.sym
{
T 52300 43900 5 10 0 0 90 0 1
device=CAPACITOR
T 52500 43900 5 10 1 1 90 0 1
refdes=C3
T 52100 43900 5 10 0 0 90 0 1
symversion=0.1
T 53000 43700 5 10 1 1 0 0 1
value=47pF
}
C 52700 43200 1 0 0 gnd-1.sym
C 51900 43200 1 0 0 gnd-1.sym
C 51100 43200 1 0 0 gnd-1.sym
N 42600 50300 48800 50300 4
N 48800 50300 48800 47100 4
N 48800 47700 52800 47700 4
N 52800 47700 52800 47500 4
N 52000 47700 52000 47500 4
N 51200 47700 51200 47500 4
N 51200 46600 51200 44600 4
N 52000 46600 52000 44600 4
N 52800 46600 52800 44600 4
N 52800 43700 52800 43500 4
N 52000 43500 52000 43700 4
N 51200 43500 51200 43700 4
N 49700 46100 52800 46100 4
{
T 49700 46100 5 10 1 0 0 0 1
netname=msb
}
N 49700 45500 52000 45500 4
{
T 49700 45500 5 10 1 0 0 0 1
netname=ssb
}
N 49700 44900 51200 44900 4
{
T 49700 44900 5 10 1 0 0 0 1
netname=lsb
}
C 38200 47500 1 0 0 vsin-1.sym
{
T 38900 48150 5 10 1 1 0 0 1
refdes=V4
T 38900 48350 5 10 0 0 0 0 1
device=vsin
T 38900 48550 5 10 0 0 0 0 1
footprint=none
T 38900 47950 5 10 1 1 0 0 1
value=sin 0.7 2.5 1k 0 DC
}
N 42600 52400 42700 52400 4
