#!/bin/perl
##
## sim_analysis.pl
## 
## Made by Facundo
## Login   <facundo@faku-laptop>
## 
## Started on  Tue Dec 15 20:47:38 2009 Facundo
## ast update Sun Jan 31 19:22:41 2010 Facundo
##

use strict;
use warnings;

my $file="$ARGV[0]/flash.bin";

open FILE, "<", $file or die $!;
my @lines = <FILE>;
close(FILE);

my @num_vars = grep(/No. Variables:/, @lines);
@num_vars = split(":",$num_vars[0]);
@num_vars = split(" ",$num_vars[1]);
my $num_vars = $num_vars[0];


my @num_points = grep(/No. Points:/, @lines);
@num_points = split(":",$num_points[0]);
@num_points = split(" ",$num_points[1]);
my $num_points = $num_points[0];

my @bits = grep(/lsb/, @lines);
@bits = split(" ",$bits[0]);
my $bit_0 = $bits[0];

@bits = grep(/ssb/, @lines);
@bits = split(" ",$bits[0]);
my $bit_1 = $bits[0];

@bits = grep(/msb/, @lines);
@bits = split(" ",$bits[0]);
my $bit_2 = $bits[0];

#print "num_vars: $num_vars\n";
#print "num_points: $num_points\n";
print "bit_0: $bit_0\n";
print "bit_1: $bit_1\n";
print "bit_2: $bit_2\n";


my $values_found = 0; #es para cortar el archivo desde Values para arriba
my @data;
my $j = 0;

for (my $i = 0; $i <= $#lines ; $i++) {
    if ($lines[$i] =~ /Values:/) {
	$values_found = 1;
    }
    if ($values_found == 1) {
	unless ($lines[$i+1]) { last; }
	$data[$j] = $lines[$i+1];
	$j++;
    }
}

map(s/^ (\d+)\t(\d)/$1=$2/, @data);

my @sort_data = ();

for (my $i = 0 ; $i < $num_points ; $i++) {
    my @aux = ();
    for (my $j = 0 ; $j < $num_vars ; $j++) {
	$aux[$j] = shift(@data);
    }
    $sort_data[$i] = (\@aux);
}

my $global_success_sim = 0;
my $global_failed_sim = 0;
my @failed_points = (); #Guarda los puntos fallidos de la simulacion

#######################
my $bit0_treshold = 2.9;
my $bit1_treshold = 0;
my $bit2_treshold = 0;
#######################

for (my $i = 0 ; $i < $#sort_data ; $i++) {
    $global_success_sim = 0;
#    $global_failed_sim = 0;
    if ($sort_data[$i][$bit_0] > $bit0_treshold) { #MSB
	$global_success_sim++;
    }
    if ($sort_data[$i][$bit_1] > $bit1_treshold) { #SSB
	$global_success_sim++;
    }
    if ($sort_data[$i][$bit_2] > $bit2_treshold) { #LSB
	$global_success_sim++;
    }
    if ($global_success_sim ne 3) { 
	push(@failed_points, $i);
	$global_failed_sim++;
    }
}

print "SALIDA DE SIM ANALISIS\n";
print "sort data= $#sort_data\n";
print "global_success_sim= $global_success_sim\n";
print "global_failed= $global_failed_sim\n";
my $hola = $#sort_data * 3;
print "sort-data *3 = $hola\n";
print "chupala\n";

foreach (@failed_points) {
    print "$_\n";
}

print "nadaaa\n";

if ($global_failed_sim gt 0) {
    print "1";
} elsif ($#failed_points eq -1) {
    print "0";
} else {
    print "7";
}

#for (my $f = 0 ; $f < $#sort_data ; $f++) {
#    print "$f: $sort_data[$f][185]";
#}

exit (1);








#########################################################

#print "DATA POINTS: $#sort_data\n";

#foreach my $line (@sort_data) {
#    my @aux = ();
#    @aux = @{$line};
#    print "DATA VARS: $#aux\n"
#}

########################################################

#map(s/(\d+$)/$1:/, @data);
#print "@data\n";

#my @porq = grep(/^ \d+\t\d*/, @data);
#print @porq;


#################################################################
## Ver como este script interactua con el fail_injection y que cosas se aplican en cada uno
##

# cortar el archivo desde el principio hasta Values: (incluido)
# separar todos los puntos ($num_points) en arrays contando desde 0 hasta $num_vars
# comparar cada valor $bit_0 $bit_1 ... con sus estandares
# para los fallados, crear un archivo con toda la info
# guardar en alguna varibale el nombre del cir_xxx.cir para su posterior resimulacion en formato bin para graficar
# al finalizar todo armar tabla, zipear todo y comitear!


