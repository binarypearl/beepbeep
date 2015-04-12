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

set_tempo(115);

my $song = join (":", <<SONG =~  /(.+)/g);

#=INTRO========================================
    $dottedquarter $EN5 -n 
    $sixteenth $EN5  -n 
    $sixteenth $EN5 -n 

    $dottedquarter $EN5 -n 
    $sixteenth $EN5 -n 
    $sixteenth $EN5 -n 

    $sixteenth $EN5  -n 
    $sixteenth $Eb5 -n 
    $sixteenth $DN5  -n 
    $sixteenth $Db5 -n 
     $sixteenth $CN5 -n 
    $sixteenth $BN4 -n 
     $sixteenth $Bb4 -n 
    $sixteenth $AN4 -n  
    $sixteenth $Ab4 -n 
    $sixteenth $GN4  -n 
    $sixteenth $Gb4 -n 
     $sixteenth $FN4 -n 
    $sixteenth $EN4 -n 
     $sixteenth $Eb4 -n 
    $sixteenth $DN4 -n  
    $sixteenth $CS4 -n 
#-----------------------------------------------
     $dottedquarter $FS5 -n 
    $sixteenth $FS5  -n 
    $sixteenth $FS5 -n 

     $dottedquarter $FS5 -n 
    $sixteenth $FS5  -n 
    $sixteenth $FS5 -n 

    $sixteenth $FS5  -n 
    $sixteenth $FN5 -n 
     $sixteenth $EN5 -n 
    $sixteenth $Eb5 -n 
     $sixteenth $DN5 -n 
    $sixteenth $Db5 -n  
    $sixteenth $CN5 -n 
    $sixteenth $BN4  -n 
    $sixteenth $Bb4 -n 
     $sixteenth $AN4 -n 
    $sixteenth $Ab4 -n 
     $sixteenth $GN4 -n 
    $sixteenth $FS4 -n  
    $sixteenth $FN4 -n 
    $sixteenth $EN4  -n 
    $sixteenth $DS4 -n 
#------------------------------------------
     $dottedquarter $GN5 -n 
    $sixteenth $GN5  -n 
    $sixteenth $GN5 -n 

     $dottedquarter $GN5 -n 
    $sixteenth $GN5  -n 
    $sixteenth $GN5 -n 

#=Intro to part  A===========================
    $sixteenth $GN4 -n 
     $sixteenth $GS4 -n 
    $sixteenth $AN4 -n  
    $sixteenth $AS4 -n 
    $sixteenth $BN4  -n 
    $sixteenth $CN5 -n 
     $sixteenth $CS5 -n 
    $sixteenth $DN5 -n 
     $sixteenth $DS5 -n 
    $sixteenth $EN5 -n  
    $sixteenth $FN5 -n 
    $sixteenth $FS5  -n 
    $sixteenth $GN5 -n 
     $sixteenth $GS5 -n 
    $sixteenth $AN5 -n 
     $sixteenth $BN5 -n 

#=Part  A===================================

    $eighth $CN6  -n 
    $eighth $BN5 -n 
    $sixteenth  $Bb5 -n 
    $sixteenth $BN5 -n 
     $sixteenth $Bb5 -n 
    $sixteenth $AN5 -n 

     $eighth $Ab5 -n 
    $eighth $GN5 -n 
     $eighth $FS5 -n 
    $eighth $GN5 -n 

     $eighth $AN5 -n 
    $eighth $Ab5 -n 
     $sixteenth $GN5 -n 
    $sixteenth $Ab5 -n  
    $sixteenth $GN5 -n 
    $sixteenth $FS5  -n 

    $eighth $FN5 -n 
    $eighth  $EN5 -n 
    $eighth $DS5 -n 
     $eighth $EN5 -n 

    $sixteenth $GN5 $longspace -n 
     $sixteenth $FN5 -n 
    $sixteenth $FN5 -n  
    $eighth $CS5 -n 
    $eighth $DN5  -n 

    $sixteenth $GN5 $longspace -n 
    $sixteenth $FN5  -n 
    $sixteenth $FN5 -n 
    $eighth  $CS5 -n 
    $eighth $DN5 -n 

     $sixteenth $BN4 -n 
    $sixteenth $CN5 -n 
     $sixteenth $CS5 -n 
    $sixteenth $DN5 -n  
    $sixteenth $DS5 -n 
    $sixteenth $EN5  -n 
    $sixteenth $FN5 -n 
     $sixteenth $FS5 -n 
    $sixteenth $GN5 -n 
     $sixteenth $GS5 -n 
    $sixteenth $AN5 -n  
    $sixteenth $BN5 -n 
    $eighth $AN5  -n 
    $eighth $GN5 -n  
#=Part  A2==========================================
    $eighth $CN6  -n 
    $eighth $BN5 -n 
    $sixteenth  $Bb5 -n 
    $sixteenth $BN5 -n 
     $sixteenth $Bb5 -n 
    $sixteenth $AN5 -n 

     $eighth $Ab5 -n 
    $eighth $GN5 -n 
     $eighth $FS5 -n 
    $eighth $GN5 -n 

     $eighth $AN5 -n 
    $eighth $Ab5 -n 
     $sixteenth $GN5 -n 
    $sixteenth $Ab5 -n  
    $sixteenth $GN5 -n 
    $sixteenth $FS5  -n 

    $eighth $FN5 -n 
    $eighth  $EN5 -n 
    $eighth $DS5 -n 
     $eighth $EN5 -n 

# Ending 1
    $eighth $DS5  -n 
    $sixteenth $DS5 -n 
     $sixteenth $DS5 -n 
    $eighth $FS5 -n 
     $eighth $BN4 -n 

    $sixteenth $GN5  -n 
    $sixteenth $AN5 -n 
    $sixteenth $GN5  -n 
    $sixteenth $FS5 -n 
    $eighth  $EN5 -n 
    $eighth $BN4 -n 

     $eighth $BN5 -n 
    $sixteenth $BN5 -n 
     $sixteenth $BN5 -n 
    $eighth $BN5 -n 
     $eighth $BN5 -n 

    $sixteenth $BN5  -n 
    $sixteenth $BN5 -n 
    $sixteenth $BN5  -n 
    $sixteenth $BN5 -n 
     $sixteenth $BN5 -n 
    $sixteenth $BN5 -n 
     $eighth $BN5 -n 

#=Part  A===================================

    $eighth $CN6  -n 
    $eighth $BN5 -n 
    $sixteenth  $Bb5 -n 
    $sixteenth $BN5 -n 
     $sixteenth $Bb5 -n 
    $sixteenth $AN5 -n 

     $eighth $Ab5 -n 
    $eighth $GN5 -n 
     $eighth $FS5 -n 
    $eighth $GN5 -n 

     $eighth $AN5 -n 
    $eighth $Ab5 -n 
     $sixteenth $GN5 -n 
    $sixteenth $Ab5 -n  
    $sixteenth $GN5 -n 
    $sixteenth $FS5  -n 

    $eighth $FN5 -n 
    $eighth  $EN5 -n 
    $eighth $DS5 -n 
     $eighth $EN5 -n 

    $sixteenth $GN5 $longspace -n 
     $sixteenth $FN5 -n 
    $sixteenth $FN5 -n  
    $eighth $CS5 -n 
    $eighth $DN5  -n 

    $sixteenth $GN5 $longspace -n 
    $sixteenth $FN5  -n 
    $sixteenth $FN5 -n 
    $eighth  $CS5 -n 
    $eighth $DN5 -n 
     $sixteenth $BN4 -n 
    $sixteenth $CN5 -n 
     $sixteenth $CS5 -n 
    $sixteenth $DN5 -n  
    $sixteenth $DS5 -n 
    $sixteenth $EN5  -n 
    $sixteenth $FN5 -n 
     $sixteenth $FS5 -n 
    $sixteenth $GN5 -n 
     $sixteenth $GS5 -n 
    $sixteenth $AN5 -n  
    $sixteenth $BN5 -n 
    $eighth $AN5  -n 
    $eighth $GN5 -n 
#=Part  A2==========================================
    $eighth $CN6  -n 
    $eighth $BN5 -n 
    $sixteenth  $Bb5 -n 
    $sixteenth $BN5 -n 
     $sixteenth $Bb5 -n 
    $sixteenth $AN5 -n 

     $eighth $Ab5 -n 
    $eighth $GN5 -n 
     $eighth $FS5 -n 
    $eighth $GN5 -n 

     $eighth $AN5 -n 
    $eighth $Ab5 -n 
     $sixteenth $GN5 -n 
    $sixteenth $Ab5 -n  
    $sixteenth $GN5 -n 
    $sixteenth $FS5  -n 

    $eighth $FN5 -n 
    $eighth  $EN5 -n 
    $eighth $DS5 -n 
     $eighth $EN5 -n 

#=Ending 2
    $eighth $DN5  -n 
    $sixteenth $DN5 -n 
     $sixteenth $DN5 -n 
    $eighth $AN5 -n 
     $eighth $DN5 -n 
    
    $eighth $Eb5  -n 
    $sixteenth $Eb5 -n 
    $sixteenth $Eb5  -n 
    $quarter $Bb5 -n 

     $sixteenth $BN5 -n 
    $sixteenth $DN6 -n 
     $sixteenth $CS6 -n 
    $sixteenth $CN6 -n  
    $eighth $BN5 -n 
    $eighth $AN5  -n 
    
    $eighth $GN5 
SONG
    `beep $song`;

