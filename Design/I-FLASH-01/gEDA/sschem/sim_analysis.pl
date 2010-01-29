#!/bin/perl
#
#
#
#
#
#
#
#
#

$file="/tmp/tmp.Tn4cx506YC/flash.bin";

open FILE, "<", $file or die $!;

my @lines = <FILE>;

my @num_vars = grep(/No. Variables:/, @lines);
@num_vars = split(":",@num_vars[0]);
@num_vars = split(" ",@num_vars[1]);
my $num_vars = $num_vars[0];


my @num_points = grep(/No. Points:/, @lines);
@num_points = split(":",@num_points[0]);
@num_points = split(" ",@num_points[1]);
my $num_points = $num_points[0];

my @bits = grep(/lsb/, @lines);
@bits = split(" ",@bits[0]);
my $bit_0 = $bits[0];

@bits = grep(/ssb/, @lines);
@bits = split(" ",@bits[0]);
my $bit_1 = $bits[0];

@bits = grep(/msb/, @lines);
@bits = split(" ",@bits[0]);
my $bit_2 = $bits[0];

print "bit_0: $bit_0\n";
print "bit_1: $bit_1\n";
print "bit_2: $bit_2\n";

##
## Ver como este script interactua con el fail_injection y que cosas se aplican en cada uno
##

# cortar el archivo desde el principio hasta Values: (incluido)
# separar todos los puntos ($num_points) en arrays contando desde 0 hasta $num_vars
# comparar cada valor $bit_0 $bit_1 ... con sus estandares
# para los fallados, crear un archivo con toda la info
# guardar en alguna varibale el nombre del cir_xxx.cir para su posterior resimulacion en formato bin para graficar
# al finalizar todo armar tabla, zipear todo y comitear!


close(FILE);

