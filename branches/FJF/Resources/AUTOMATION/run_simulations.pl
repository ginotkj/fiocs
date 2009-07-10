#!/usr/bin/perl
#
# Automated frontend to do huge amount of simulations
#
# Author:
#        Facundo J. Ferrer <facundo.j.ferrer@gmail.com>
#

use IO::Dir;
use strict;

#function for tieed hash. The value of each key is a call to a File::stat function and each of
# the following attributtes could be used:
#namely, dev, ino, mode, nlink, uid, gid, rdev, size, atime, mtime, ctime, blksize, and blocks.

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
	my $h = $d->open("../../");
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

#while ( my ($key, $value) = each(%dir) ) {
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
