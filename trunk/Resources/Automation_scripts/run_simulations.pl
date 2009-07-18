#!/usr/bin/perl
#
# Automated frontend to do huge amount of simulations with ngspice
#
# Author:
#        Facundo J. Ferrer <facundo.j.ferrer@gmail.com>
#

use IO::Dir;
use strict;

#function for tieed hash. The value of each key is a call to a File::stat function and each of
# the following attributtes could be used:
#namely, dev, ino, mode, nlink, uid, gid, rdev, size, atime, mtime, ctime, blksize, and blocks.


my $path = shift (@ARGV);
my @folders;
my $folder;
my @projects;
my $project;

#############  funcion leer solo carpetas ######################
sub read_dir {
    print "funcion read_dir\n"; #debug
    my $dir = IO::Dir->new("$path") or die "Could not open the dir: $path";
    
    print "path: $path\n"; #debug
    if (defined $dir) {
	while  (defined($_ = $dir->read)) {
	    print "carpeta leida: $_\n"; #debug
	    if (($_ ne ".") & ($_ ne "..") & ($_ ne ".svn")) {
		push(@folders , $_);
	    }
#	    foreach $folder (@folders) {
#		
#	    }
	}

#	foreach $folder ( @folders ) {
#	my $new_dir = $dir->open("$folder");
#	print "carpeta chequeada $folder\n"; #debug
#	print "newdir: $new_dir\n"; #debug
#	if (defined $new_dir) {
#	    print "carpeta pushed $folder\n"; #debug
#	}
#	}
    }
}
################################################################

#############  funcion leer solo carpetas ######################
sub read_dir_2 {
    tie my %dir, 'IO::Dir', "$path" or die "Could not open path $path\n";
    
    foreach (keys %dir) {
	if (($_ ne ".") & ($_ ne "..") & ($_ ne ".svn")) {
	    if  ($dir{$_}->mode eq "16877") { #16877 modo directorio
		push(@folders , $_);
	    }
	}
    }
    untie %dir;
}
################################################################

############### funcion determinar proyectos ###################
sub read_project {
    foreach $folder (@folders) {
	my $new_path = $path.'/'.$folder;
	tie my %dir, 'IO::Dir', "$new_path";

	foreach (keys %dir) {
#	    print "carpeta: $_\n";#debug
	    if ($_ =~ /(.+)\.opj$/) {
#		print "project $1\n";#debug
		if ($1 eq $folder) {
#		    print "se pusheo $1\n";#debug
		    push(@projects , $1);
		}
	    }
	}
    }
}
################################################################

#&read_dir;
&read_dir_2;
&read_project;

my $num_proj = $#projects + 1;
print "Proyectos encontrads: $num_proj\n";
foreach $project (@projects) {
    print "Proyecto: $project\n";
}


exit 1;

my $d = IO::Dir->new("..");
if (defined $d) {
    while (defined($_ = $d->read)) {
	print "Sin rewind\n";
	print "DIR: $_\n";
	print "Tell: ";
	print $d->tell;
	print "\n";
#	print "Seek: ";
#	print $d->seek();
#	print "\n";
	print "OPEN: ";
	print $d;
	print " el nuevo d: ";
	$d->close;
	my $h = $d->open("../run_simulations.pl");
	if (defined $h) { print "Is a directory!!!\n"; } else { print "FUNCKING!!!\n" }      
	$h = $d->open("../../");
	if (defined $h) { print "Is a directory!!!\n"; }
	print $d;
	print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
	print "H: $h";
	print "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n";
	while (defined($_ = $d->read)){
	    print "Nuevo dir: $_ \n";
	    print ;
	    print "\n";
	    print "*****************\n";
	}
	$d->close;
	sleep(1);
    }
    sleep(1);
    $d->rewind;
    while (defined($_ = $d->read)) {
	print "con rewind $_\n";
	print "DIR: $_\n";
	print $d->tell;
	print "\n";
    }
    undef $d;
}

sleep(2);

print "############################################################################################################\n";

tie my %dir, 'IO::Dir', "..";

#while ( ($key, $value) = each(%dir) ) {
#    print "$key => $value\n";
#}

#sleep(10);

print "############################################################################################################\n";

foreach (keys %dir) {
#    print $_, " SIZE: " , $dir{$_}->size,"\n";
#    print $_, " UID:  " , $dir{$_}->uid,"\n";
#    print $_, " GID:  " , $dir{$_}->gid,"\n";
#    print $_, " NAME: " , $dir{$_}->name,"\n";
#    print $_, " DEV:  " , $dir{$_}->dev,"\n";
    print "direccion: $dir{$_}\n";
    print $_, " MODE: " , $dir{$_}->mode,"\n"; # (si es o no directorio)
    print "************************************\n";
#print "Archivo: $_ "
}
