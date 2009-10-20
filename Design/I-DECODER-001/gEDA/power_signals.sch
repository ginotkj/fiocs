v 20081231 1
C 40000 40000 0 0 0 title-B.sym
C 40200 48700 1 0 0 vdc-1.sym
{
T 40400 47750 5 10 1 1 0 0 1
refdes=V1
T 40900 49550 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 40900 49750 5 10 0 0 0 0 1
footprint=none
T 40900 47750 5 10 1 1 0 0 1
value=DC 5V
}
C 41200 48700 1 0 0 vpulse-1.sym
{
T 40400 47350 5 10 1 1 0 0 1
refdes=V2
T 41900 49550 5 10 0 0 0 0 1
device=vpulse
T 41900 49750 5 10 0 0 0 0 1
footprint=none
T 40900 47350 5 10 1 1 0 0 1
value=pulse 6 6.9 1u 500n 500n 10u 20u dc 0
}
C 43200 48700 1 0 0 vpulse-1.sym
{
T 40400 46550 5 10 1 1 0 0 1
refdes=V4
T 43900 49550 5 10 0 0 0 0 1
device=vpulse
T 43900 49750 5 10 0 0 0 0 1
footprint=none
T 40900 46550 5 10 1 1 0 0 1
value=pulse 4 4.9 1u 500n 500n 40u 80u dc 0
}
C 45200 48700 1 0 0 vpulse-1.sym
{
T 40400 45750 5 10 1 1 0 0 1
refdes=V6
T 45900 49550 5 10 0 0 0 0 1
device=vpulse
T 45900 49750 5 10 0 0 0 0 1
footprint=none
T 40900 45750 5 10 1 1 0 0 1
value=pulse 2 2.9 1u 500n 500n 160u 320u dc 0
}
C 42200 48700 1 0 0 vpulse-1.sym
{
T 40400 46950 5 10 1 1 0 0 1
refdes=V3
T 42900 49550 5 10 0 0 0 0 1
device=vpulse
T 42900 49750 5 10 0 0 0 0 1
footprint=none
T 40900 46950 5 10 1 1 0 0 1
value=pulse 5 5.9 1u 500n 500n 20u 40u dc 0
}
C 44200 48700 1 0 0 vpulse-1.sym
{
T 40400 46150 5 10 1 1 0 0 1
refdes=V5
T 44900 49550 5 10 0 0 0 0 1
device=vpulse
T 44900 49750 5 10 0 0 0 0 1
footprint=none
T 40900 46150 5 10 1 1 0 0 1
value=pulse 3 3.9 1u 500n 500n 80u 160u dc 0
}
C 47100 48700 1 0 0 vpulse-1.sym
{
T 40400 44950 5 10 1 1 0 0 1
refdes=V8
T 47800 49550 5 10 0 0 0 0 1
device=vpulse
T 47800 49750 5 10 0 0 0 0 1
footprint=none
T 40900 44950 5 10 1 1 0 0 1
value=pulse 0 0.9 1u 500n 500n 640u 1280u dc 0
}
C 46100 48700 1 0 0 vpulse-1.sym
{
T 40400 45350 5 10 1 1 0 0 1
refdes=V7
T 46800 49550 5 10 0 0 0 0 1
device=vpulse
T 46800 49750 5 10 0 0 0 0 1
footprint=none
T 40900 45350 5 10 1 1 0 0 1
value=pulse 1 1.9 1u 500n 500n 320u 640u dc 0
}
C 40400 48400 1 0 0 gnd-1.sym
C 41400 48400 1 0 0 gnd-1.sym
C 43400 48400 1 0 0 gnd-1.sym
C 45400 48400 1 0 0 gnd-1.sym
C 47300 48400 1 0 0 gnd-1.sym
C 46300 48400 1 0 0 gnd-1.sym
C 44400 48400 1 0 0 gnd-1.sym
C 42400 48400 1 0 0 gnd-1.sym
C 41600 49900 1 90 0 out-1.sym
{
T 41300 49900 5 10 0 0 90 0 1
device=OUTPUT
T 41400 50200 5 10 1 1 180 0 1
refdes=v2
}
C 40600 49900 1 90 0 out-1.sym
{
T 40300 49900 5 10 0 0 90 0 1
device=OUTPUT
T 40400 50200 5 10 1 1 180 0 1
refdes=vcc
}
C 42600 49900 1 90 0 out-1.sym
{
T 42300 49900 5 10 0 0 90 0 1
device=OUTPUT
T 42400 50200 5 10 1 1 180 0 1
refdes=v3
}
C 43600 49900 1 90 0 out-1.sym
{
T 43300 49900 5 10 0 0 90 0 1
device=OUTPUT
T 43400 50200 5 10 1 1 180 0 1
refdes=v4
}
C 44600 49900 1 90 0 out-1.sym
{
T 44300 49900 5 10 0 0 90 0 1
device=OUTPUT
T 44400 50200 5 10 1 1 180 0 1
refdes=v5
}
C 45600 49900 1 90 0 out-1.sym
{
T 45300 49900 5 10 0 0 90 0 1
device=OUTPUT
T 45400 50200 5 10 1 1 180 0 1
refdes=v6
}
C 47500 49900 1 90 0 out-1.sym
{
T 47200 49900 5 10 0 0 90 0 1
device=OUTPUT
T 47300 50200 5 10 1 1 180 0 1
refdes=v8
}
C 46500 49900 1 90 0 out-1.sym
{
T 46200 49900 5 10 0 0 90 0 1
device=OUTPUT
T 46300 50200 5 10 1 1 180 0 1
refdes=v7
}
T 51800 40900 9 10 1 0 0 0 1
Power supply and input signals
T 52100 40100 9 10 1 0 0 0 1
1
T 50500 40100 9 10 1 0 0 0 1
1
T 50100 40400 9 10 1 0 0 0 1
power_signlas.sch
T 54000 40400 9 10 1 0 0 0 1
1
T 54100 40100 9 10 1 0 0 0 1
Facundo J Ferrer
