v 20081231 1
C 40000 40000 0 0 0 title-B.sym
C 49000 48700 1 0 0 spice-include-1.sym
{
T 49100 49000 5 10 0 1 0 0 1
device=include
T 49100 49100 5 10 1 1 0 0 1
refdes=A1
T 49500 48800 5 10 1 1 0 0 1
file=simul.cmd
}
C 45600 46400 1 0 0 2i_nand.sym
{
T 45775 46495 5 10 1 1 0 0 1
refdes=X1
T 46675 46490 5 10 1 1 0 0 1
device=2NAND1-model
T 45600 46400 5 10 0 1 0 0 1
model-name=2nand1
T 45600 46400 5 10 0 1 0 0 1
file=model/2i_nand.sch.cir
}
