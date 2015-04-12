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

set_tempo(106);

my $song = join (":", <<SONG =~ /(.+)/g);
	# Part A
	$sixteenth $EN6 -n 
	$sixteenth $CN6 -n 
	$sixteenth $AN5 -n 
	$sixteenth $FN6 -n 

	$sixteenth $CN6 -n 
	$sixteenth $AN5 -n 
	$sixteenth $FS6 -n 
	$sixteenth $CN6 -n 

	$sixteenth $AN5 -n 
	$sixteenth $FN6 -n 
	$sixteenth $CN6 -n 
	$sixteenth $AN5 -n 
	
	$sixteenth $EN6 -n 
	$sixteenth $CN6 -n 
	$sixteenth $BN5 -n 
	$sixteenth $DN6 -n  

	
	$sixteenth $EN6 -n 
	$sixteenth $CN6 -n 
	$sixteenth $AN5 -n 
	$sixteenth $FN6 -n 

	$sixteenth $CN6 -n 
	$sixteenth $AN5 -n 
	$sixteenth $FS6 -n 
	$sixteenth $CN6 -n 

	$sixteenth $AN5 -n 
	$sixteenth $FN6 -n 
	$sixteenth $CN6 -n 
	$sixteenth $AN5 -n 
	
	$sixteenth $EN6 -n 
	$sixteenth $CN6 -n 
	$sixteenth $BN5 -n 
	$sixteenth $DN6 -n  
	
 
	$sixteenth $EN6 -n 
	$sixteenth $CN6 -n 
	$sixteenth $AN5 -n 
	$sixteenth $FN6 -n 

	$sixteenth $CN6 -n 
	$sixteenth $AN5 -n 
	$sixteenth $FS6 -n 
	$sixteenth $CN6 -n 

	$sixteenth $AN5 -n 
	$sixteenth $FN6 -n 
	$sixteenth $CN6 -n 
	$sixteenth $AN5 -n 
	
	$sixteenth $EN6 -n 
	$sixteenth $CN6 -n 
	$sixteenth $BN5 -n 
	$sixteenth $DN6 -n  

	
	$sixteenth $EN6 -n 
	$sixteenth $CN6 -n 
	$sixteenth $AN5 -n 
	$sixteenth $FN6 -n 

	$sixteenth $CN6 -n 
	$sixteenth $AN5 -n 
	$sixteenth $FS6 -n 
	$sixteenth $CN6 -n 

	$sixteenth $AN5 -n 
	$sixteenth $FN6 -n 
	$sixteenth $CN6 -n 
	$sixteenth $AN5 -n 
	
	$sixteenth $EN6 -n 
	$sixteenth $CN6 -n 
	$sixteenth $BN5 -n 
	$sixteenth $DN6 -n 


	$eighth $AN5 -n 
	$eighth $EN6 -n 
	$sixteenth $DN6 -n 
	$eighth $CN6 -n 
	
	$eighth $BN5 -n 
	$sixteenth $CN6 -n 
	$eighth $DN6 -n 
	$eighth $BN5 -n 
	$eighth $GN5 -n 

	$quarter $AN4 -n  
	$quarter $BN4 -n  
	$quarter $CN5 -n  
	$quarter $EN5 -n 


	$eighth $AN5 -n 
	$eighth $EN6 -n 
	$sixteenth $DN6 -n 
	$eighth $CN6 -n 
	
	$eighth $BN5 -n 
	$sixteenth $CN6 -n 
	$eighth $DN6 -n 
	$eighth $BN5 -n 
	$eighth $GN5 -n 

	$eighth $AN4 $sixteenth_rest -n  
	$sixteenth $AN4 $eighth_rest -n  
	$eighth $AN4 $sixteenth_rest -n  
	$sixteenth $AN4 $eighth_rest -n  
	$eighth $AN4 -n  
	$eighth $GN4 -n 

	$eighth $AN4 $sixteenth_rest -n  
	$sixteenth $AN4 $eighth_rest -n  
	$eighth $AN4 $sixteenth_rest -n  
	$sixteenth $AN4 $eighth_rest -n  
	$eighth $AN4 -n  
	$eighth $GN4 -n 


	# Part B
	$sixteenth $EN5 -n 
	$sixteenth $AN5 -n 
	$sixteenth $BN5 -n 
	$sixteenth $CN6 -n 
	$sixteenth $BN5 -n 
	$sixteenth $AN5 -n 
	$sixteenth $EN5 -n 
	$sixteenth $CN5 -n 
 
	$eighth $BN4 -n 
	$sixteenth $CN5 -n 
	$eighth $AN4 -n 
	$sixteenth $CN5 -n 
	$sixteenth $BN4 -n 
	$sixteenth $CN5 -n 

	
	$eighth $DN5 -n 
	$sixteenth $EN5 -n 
	$eighth $CN5 -n 
	$sixteenth $EN5 -n 
	$sixteenth $DN5 -n 
	$sixteenth $EN5 -n 
	$sixteenth $FN5 -n 
	$sixteenth $BN4 -n 
	$sixteenth $CN5 -n 
	$sixteenth $FN5 -n 
	$sixteenth $AN5 -n 
	$sixteenth $DN5 -n 
	$sixteenth $GS5 -n 
	$sixteenth $AN5 -n 


	$sixteenth $AN5 -n 
	$sixteenth $EN5 -n 
	$sixteenth $CN6 -n 
	$sixteenth $BN5 -n 
	$sixteenth $AN5 -n 
	$sixteenth $EN5 -n 
	$sixteenth $CN5 -n 
	$sixteenth $AN4 -n 
 
	$eighth $BN4 -n 
	$sixteenth $CN5 -n 
	$eighth $AN4 -n 
	$sixteenth $CN5 -n 
	$sixteenth $BN4 -n 
	$sixteenth $CN5 -n 

	$eighth $DN5 -n 
	$sixteenth $EN5 -n 
	$eighth $CN5 -n 
	$sixteenth $EN5 -n 
	$sixteenth $DN5 -n 
	$sixteenth $EN5 -n 
	$sixteenth $FN5 -n 
	$sixteenth $DN5 -n 
	$sixteenth $GN5 -n 
	$sixteenth $EN5 -n 
	$sixteenth $AN5 -n 
	$sixteenth $FN5 -n 
	$sixteenth $BN5 -n 
	$sixteenth $GS5 -n 


	# Part C
	$dottedquarter $FN6 $supper_small -n 
	$eighth $CN6 $supper_small -n 
	$dottedeighth $BN5 $supper_small -n 
	$dottedeighth $CN6 $supper_small -n 
	$eighth $DN6 $supper_small -n 

	$dottedeighth $EN6 -n 
	$dottedeighth $FN6 -n 
	$eighth $GN6 -n 
	$quarter $CN6 -n 
	$dottedeighth $BN5 -n 
	$half $AN5 $super_smal -n 
	
	$dottedeighth $FN6 -n 
	$eighth $CN6 -n 
	$dottedeighth $BN5 -n 
	$dottedeighth $AN5 -n 
	$eighth $GN5 -n 
	$half_slide_eighth $AN5 -n 

	$eighth $BN5 -n 
	$eighth $CN6 -n 
	$eighth $EN6 -n 

	$dottedquarter $FN6 -n 
	$eighth $CN6 -n 
	$dottedeighth $BN5 -n 
	$dottedeighth $CN6 -n 
	$eighth $DN6 -n 
	
	$dottedeighth $EN6 -n 
	$dottedeighth $FN6 -n 
	$eighth $GN6 -n 
	$dottedeighth $FS6 -n 
	$dottedeighth $GN6 -n 
	$eighth $AN6 -n 

	$half_slide_sixteenth $CN7 -n 
	$sixteenth $AN6 -n  
	$sixteenth $GN6 -n  
	$sixteenth $FN6 -n  
	$sixteenth $CN6 -n  
	$sixteenth $AN5 -n  
	$sixteenth $GN5 -n  
	$sixteenth $FN5 -n 

	$whole $CN5 -n 
	
	$dottedeighth $BN4 -n 
	$dottedeighth $DN5 -n 
	$eighth $BN4 -n 
	$dottedeighth $DN5 -n 
	$dottedeighth $GN5 -n 
	$eighth $AN5 -n 

	$dottedeighth $EN5 -n 
	$dottedeighth $GN5 -n 
	$eighth $EN5 $small_space -n 
	$sixteenth $FN5 -n 
	$sixteenth $EN5 -n 
	$sixteenth $DN5 -n 
	$sixteenth $CN5 -n 
	$sixteenth $BN4 -n 
	$sixteenth $AN4 -n 
	$sixteenth $GS4 
SONG
  my $i = 1;
  while ($i <= 2) {
    `beep $song`;
     $i++;
  }

