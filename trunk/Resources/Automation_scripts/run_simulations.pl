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
my %proj;


#############  funcion leer solo carpetas ######################
sub read_dir {
    my($local_path) = $_[0];
    my(@local_folders);
    tie my %dir, 'IO::Dir', "$local_path" or die "Could not open path $local_path\n";
    
    foreach (keys %dir) {
	if (($_ ne ".") & ($_ ne "..") & ($_ ne ".svn")) {
	    if  ($dir{$_}->mode eq "16877") { #16877 modo directorio
		push(@local_folders , $_);
	    }
	}
    }
    untie %dir;
    return \@local_folders;
}
################################################################

############### funcion determinar proyectos ###################
sub read_project {
    my($local_ref) = $_[0];
    my(@local_folders) = @{$local_ref};
    my($local_folder,@local_projects);

    foreach $local_folder (@local_folders) {
	my $new_path = $path.'/'.$local_folder;
	tie my %dir, 'IO::Dir', "$new_path";

	foreach (keys %dir) {
#	    print "carpeta: $_\n";#debug
	    if ($_ =~ /(.+)\.opj$/) {
#		print "project $1\n";#debug
		if ($1 eq $local_folder) {
#		    print "se pusheo $1\n";#debug
		    push(@local_projects , $1);
		}
	    }
	}
	untie %dir;
    }
    return \@local_projects;
}
################################################################

############### funcion leer archivos de proyectos ###################
sub read_files {
    foreach $project (@projects) {
	my $new_path = $path.'/'.$project.'/'.$project.'-PSpiceFiles';
	print "archivos spice: $new_path\n";#debug
#	tie my %dir, 'IO::Dir', "$new_path";

#	foreach (keys %dir) {
#	    print "carpeta: $_\n";#debug
#	    if ($_ =~ /(.+)\.opj$/) {
#		print "project $1\n";#debug
#		if ($1 eq $folder) {
#		    print "se pusheo $1\n";#debug
#		    push(@projects , $1);
#		}
#	    }
#	}
    }
}
################################################################


############### funcion leer archivos de proyectos ###################
sub read_schm {
    print "caca\n";
}
################################################################

my $ref = &read_dir($path); ##banner con mas informacion y opcion de logueo
@folders = @{$ref};
$ref = undef;
#print map "$_\n", @folders; ##debug the precious hash

$ref = &read_project(\@folders); ##banenr con mas informacion y opcion de logueo
@projects = @{$ref};
$ref = undef;
#print map "$_\n", @projects; ##debug the precious hash


my $num_proj = $#projects + 1;
print "Proyectos encontrads: $num_proj\n";
foreach $project (@projects) {
    print "Proyecto: $project\n"; 
}

for (my $j = 0 ; $j <= $#projects ; $j++ ) {
#    print "$j : $projects[$j]\n"; ##debug
    $proj{"P$j"} = $projects[$j];
}
#print map "$_ = $proj{$_}\n", keys %proj; ##debug the previous hash

#&read_schm; ##no implementada y pasarle el array de proyectos
#&read_files; ##terminar la creacion de hashes antes


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

#sleep(2);

#print "############################################################################################################\n";

#tie my %dir, 'IO::Dir', "..";

#while ( ($key, $value) = each(%dir) ) {
#    print "$key => $value\n";
#}

#sleep(10);

#print "############################################################################################################\n";

#foreach (keys %dir) {
#    print $_, " SIZE: " , $dir{$_}->size,"\n";
#    print $_, " UID:  " , $dir{$_}->uid,"\n";
#    print $_, " GID:  " , $dir{$_}->gid,"\n";
#    print $_, " NAME: " , $dir{$_}->name,"\n";
#    print $_, " DEV:  " , $dir{$_}->dev,"\n";
#    print "direccion: $dir{$_}\n";
#    print $_, " MODE: " , $dir{$_}->mode,"\n"; # (si es o no directorio)
#    print "************************************\n";
#print "Archivo: $_ "
#}

#############  funcion leer solo carpetas ######################
#sub read_dir {
#    print "funcion read_dir\n"; #debug
#    my $dir = IO::Dir->new("$path") or die "Could not open the dir: $path";
#    
#    print "path: $path\n"; #debug
#    if (defined $dir) {
#	while  (defined($_ = $dir->read)) {
#	    print "carpeta leida: $_\n"; #debug
#	    if (($_ ne ".") & ($_ ne "..") & ($_ ne ".svn")) {
#		push(@folders , $_);
#	    }
#	    foreach $folder (@folders) {
#		
#	    }
#	}
#
#	foreach $folder ( @folders ) {
#	my $new_dir = $dir->open("$folder");
#	print "carpeta chequeada $folder\n"; #debug
#	print "newdir: $new_dir\n"; #debug
#	if (defined $new_dir) {
#	    print "carpeta pushed $folder\n"; #debug
#	}
#	}
#    }
#}
################################################################
