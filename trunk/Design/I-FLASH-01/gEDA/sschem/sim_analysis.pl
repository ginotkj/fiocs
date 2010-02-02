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
use Convert::SciEng;

my $file="$ARGV[0]/flash.bin";

open FILE, "<", $file or die $!;
my @lines = <FILE>;
close(FILE);

###########################  SUBRUTINAS  ###############################
sub expand {
    my $n = shift;
    $n = chomp($n);
        return $n unless $n =~ /^(.*)e([-+]?)(.*)$/;
    my ($num, $sign, $exp) = ($1, $2, $3);
    my $sig = $sign eq '-' ? "." . ($exp - 1 + length $num) : '';
    return sprintf "%${sig}f", $n;
}

sub expand2 {
    my @result;
    for my $i (0 .. $#_) {
        my $string_in = $_[$i];
        $string_in =~ /(-?\d.\d+)e(.\d+)/;
        my ($const, $expon) = ($1, $2);
        $result[$i] = ($const * 10 ** $expon);
    }
    return @result;
}

########################################################################

my @num_vars = grep(/No. Variables:/, @lines);
@num_vars = split(":",$num_vars[0]);
@num_vars = split(" ",$num_vars[1]);
my $num_vars = $num_vars[0];

my @num_points = grep(/No. Points:/, @lines);
@num_points = split(":",$num_points[0]);
@num_points = split(" ",$num_points[1]);
my $num_points = $num_points[0];

my @bits = grep(/v\(15\)/, @lines); #DEBUG
#my @bits = grep(/lsb/, @lines);
@bits = split(" ",$bits[0]);
my $bit_0 = $bits[0];

@bits = grep(/v\(16\)/, @lines); #DEBUG
#@bits = grep(/ssb/, @lines);
@bits = split(" ",$bits[0]);
my $bit_1 = $bits[0];

@bits = grep(/v\(18\)/, @lines); #DEBUG
#@bits = grep(/msb/, @lines);
@bits = split(" ",$bits[0]);
my $bit_2 = $bits[0];

#print "num_vars: $num_vars\n"; #DEBUG
#print "num_points: $num_points\n"; #DEBUG
#print "bit_0: $bit_0\n"; #DEBUG
#print "bit_1: $bit_1\n"; #DEBUG
#ggprint "bit_2: $bit_2\n"; #DEBUG


my $values_found = 0; #es para cortar el archivo desde Values para arriba
my @data;
my $j = 0;

#for (my $i = 0; $i <= $#lines ; $i++) {
#    if ($lines[$i] =~ /Values:/) {
#	$values_found = 1;
#    }
#    if ($values_found == 1) {
#	unless ($lines[$i+1]) { last; }
#	$data[$j] = $lines[$i+1];
#	$j++;
#    }
#}

my $removed = 0;
for (my $i = 210; $i <= $#lines ; $i++) {
    if ($lines[$i] !~ /\d+/) {
	$removed++;
    } else {
	$data[$j] = $lines[$i];
	$j++;
    }
}

#print "el tamño de data es $#data\n"; #DEBUG
#for (my $i = 0; $i <= $#data ; $i++) { #DEBUG
#    print "data= $data[$i]"; #DEBUG
#} #DEBUG

#exit(3); #DEBUG

map(s/^ (\d+)\t(\d)/$1=$2/, @data);

my @sort_data = ();

for (my $i = 0 ; $i < $num_points ; $i++) {
    my @aux = ();
    for (my $j = 0 ; $j < $num_vars ; $j++) {
	$aux[$j] = shift(@data);
    }
    $sort_data[$i] = (\@aux);
}

my $global_failed_sim = 0;
my $global_success_sim = 0;
my @failed_points = (); #Guarda los puntos fallidos de la simulacion
my @success_points = (); #Guarda los puntos exitosos de la simulacion

#######################
my $bit0_treshold = 0;
my $bit1_treshold = 0;
my $bit2_treshold = 0;
#######################

my $decimal = Convert::SciEng->new('si');


for (my $i = 0 ; $i < 10 ; $i++) {  #DEBUG
#for (my $i = 0 ; $i < $#sort_data ; $i++) {
    my $local_success_sim = 0;
#    $global_failed_sim = 0; #DEBUG

    

#    print "BIT 0 -- $sort_data[$i][$bit_0]"; #DEBUG
#    print "BIT 1 -- $sort_data[$i][$bit_1]"; #DEBUG
#    print "BIT 2 -- $sort_data[$i][$bit_2]"; #DEBUG

    $sort_data[$i][$bit_0] = $decimal->fix($sort_data[$i][$bit_0]);
    $sort_data[$i][$bit_1] = $decimal->fix($sort_data[$i][$bit_1]);
    $sort_data[$i][$bit_2] = $decimal->fix($sort_data[$i][$bit_2]);

#    print "BIT 0 D-- $sort_data[$i][$bit_0]\n"; #DEBUG
#    print "BIT 1 D-- $sort_data[$i][$bit_1]\n"; #DEBUG
#    print "BIT 2 D-- $sort_data[$i][$bit_2]\n"; #DEBUG

    $sort_data[$i][$bit_0] = $decimal->unfix($sort_data[$i][$bit_0]);
    $sort_data[$i][$bit_1] = $decimal->unfix($sort_data[$i][$bit_1]);
    $sort_data[$i][$bit_2] = $decimal->unfix($sort_data[$i][$bit_2]);

#    print "BIT 0 SC-- $sort_data[$i][$bit_0]\n"; #DEBUG
#    print "BIT 1 SC-- $sort_data[$i][$bit_1]\n"; #DEBUG
#    print "BIT 2 SC-- $sort_data[$i][$bit_2]\n"; #DEBUG

    if ($sort_data[$i][$bit_0] > $bit0_treshold) { #MSB
	$local_success_sim++;
    }
    
    if ($sort_data[$i][$bit_1] > $bit1_treshold) { #SSB
	$local_success_sim++;
    }

    if ($sort_data[$i][$bit_2] > $bit2_treshold) { #LSB
	$local_success_sim++;
    }

    if ($local_success_sim ne 3) { 
	push(@failed_points, $i);
	$global_failed_sim++;
    } else {
	push(@success_points, $i);
	$global_success_sim++;
    }

#    $i = $#sort_data; #DEBUG
}

#print "SALIDA DE SIM ANALISIS\n"; #DEBUG
#print "sort data= $#sort_data\n"; #DEBUG
#print "global_success= $global_success_sim\n"; #DEBUG
#print "global_failed= $global_failed_sim\n"; #DEBUG

#exit(4); #DEBUG

for (my $f = 0 ; $f < $#sort_data ; $f++) {
    map(chomp,$sort_data[$f][$bit_0]);
    map(chomp,$sort_data[$f][$bit_1]);
    map(chomp,$sort_data[$f][$bit_2]);
}

for (my $f = 0 ; $f <= $#sort_data ; $f++) {
#    print "$failed_points[$f] | "; #DEBUG

    $sort_data[$f][$bit_0] = $sort_data[$f][$bit_0] + 0;
#    print "$sort_data[$f][$bit_0] | "; #DEBUG
#    print "$bit0_treshold | "; #DEBUG
    $sort_data[$f][$bit_1] = $sort_data[$f][$bit_1] + 0;
#    print "$sort_data[$f][$bit_1] | "; #DEBUG
#    print "$bit1_treshold | "; #DEBUG
    $sort_data[$f][$bit_2] = $sort_data[$f][$bit_2] + 0;
#    print "$sort_data[$f][$bit_2] | "; #DEBUG
#    print "$bit2_treshold\n"; #DEBUG
}

#print "nadaaa\n"; #DEBUG

if ($global_failed_sim gt 0) {
    print "1";
} elsif ($#failed_points eq -1) {
    print "0";
} else {
    print "7";
}

#for (my $f = 0 ; $f < $#sort_data ; $f++) { #DEBUG
#    print "$f: $sort_data[$f][185]"; #DEBUG
#} #DEBUG


exit (1);






######################################################### #DEBUG
 #DEBUG
#print "DATA POINTS: $#sort_data\n"; #DEBUG
 #DEBUG
#foreach my $line (@sort_data) { #DEBUG
#    my @aux = (); #DEBUG
#    @aux = @{$line}; #DEBUG
#    print "DATA VARS: $#aux\n" #DEBUG
#} #DEBUG
 #DEBUG
######################################################## #DEBUG #DEBUG
 #DEBUG
#my $glob_aux = 0; #DEBUG
#for (my $f = 0 ; $f <= $#success_points ; $f++) { #DEBUG
#    print "$success_points[$f] | "; #DEBUG
#    $sort_data[$f][$bit_0] = $sort_data[$f][$bit_0] + 0; #DEBUG
#    print "$sort_data[$f][$bit_0] | "; #DEBUG
#    print "$bit0_treshold | "; #DEBUG
 #DEBUG
#    $sort_data[$f][$bit_1] = $sort_data[$f][$bit_1] + 0; #DEBUG
#    print "$sort_data[$f][$bit_1] | "; #DEBUG #DEBUG
#    print "$bit1_treshold | "; #DEBUG
 #DEBUG
#    $sort_data[$f][$bit_2] = $sort_data[$f][$bit_2] + 0; #DEBUG
#    print "$sort_data[$f][$bit_2] | "; #DEBUG
#    print "$bit2_treshold\n"; #DEBUG
#} #DEBUG
 #DEBUG
######################################################## #DEBUG
 #DEBUG
#map(s/(\d+$)/$1:/, @data); #DEBUG #DEBUG
#print "@data\n"; #DEBUG
 #DEBUG
#my @porq = grep(/^ \d+\t\d*/, @data); #DEBUG
#print @porq; #DEBUG
 #DEBUG
 #DEBUG
################################################################# #DEBUG
## Ver como este script interactua con el fail_injection y que cosas se aplican en cada uno #DEBUG
## #DEBUG
 #DEBUG #DEBUG
# cortar el archivo desde el principio hasta Values: (incluido) #DEBUG
# separar todos los puntos ($num_points) en arrays contando desde 0 hasta $num_vars #DEBUG
# comparar cada valor $bit_0 $bit_1 ... con sus estandares #DEBUG
# para los fallados, crear un archivo con toda la info #DEBUG
# guardar en alguna varibale el nombre del cir_xxx.cir para su posterior resimulacion en formato bin para graficar #DEBUG
# al finalizar todo armar tabla, zipear todo y comitear! #DEBUG
 #DEBUG
