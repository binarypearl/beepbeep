#!/usr/bin/perl

# This code is copyright (C) Shaun Miller, 2011
#
# This code may distributed only under the terms of the GNU Public License 
# which can be found at http://www.gnu.org/copyleft or in the file COPYING 
# supplied with this code.
#
# This code is not distributed with warranties of any kind, including implied
# warranties of merchantability or fitness for a particular use. 

open (CONFIG_FILE, "/etc/beepbeep.conf");

my @records = <CONFIG_FILE>;
my $record = "";

foreach $record (@records) {
        chomp ($record);

        if ($record =~ m/^(install_path)(=)(.*)/) {
                $install_path = $3;
                $install_path =~ tr/\"//d;
        }
}

close (CONFIG_FILE);

require "$install_path/notes.pl";

set_tempo (115);

my $song = join (":", <<SONG =~ /(.+)/g);
	$half $FN5 -n 
	$sixteenth $GS5 -n 
	$sixteenth $AS5 -n 
	$dottedeighth $CN6 -n 
	$half $FN5 -n 

	$eighth $AS5 -n 
	$eighth $CN6 -n 
	$eighth $CS6 -n 
	$eighth $CN6 -n 
	$half $AS5 -n 

	$sixteenth $AS5 -n 
	$sixteenth $CN6 -n 
	$dottedeighth $CS6 -n 
	$half $FN5 -n 

	$eighth $GS5 -n 
	$eighth $AS5 -n 
	$eighth $CN6 -n 
	$eighth $AS5 -n 
	$eighth $GS5 -n 
	$eighth $AS5 

SONG
	`beep $song`;
