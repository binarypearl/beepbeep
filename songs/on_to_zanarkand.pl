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

set_tempo (85);

my $song = join (":",  <<SONG =~ /(.+)/g);
    $eighth $EN5 -n 
     $eighth $EN4 -n 
    $eighth $GN4 -n 
     $eighth $BN4 -n 
    $eighth $EN5 -n 
     $eighth $FS5 -n 
    $dottedhalf $GN5 -n 
     
    $eighth $DN5 -n 
    $eighth $DN4 -n 
     $eighth $FS4 -n 
    $eighth $AN4 -n 
     $eighth $DN5 -n 
    $eighth $EN5 -n 
     $dottedhalf $FS5 -n 

    $quarter $BN4 -n 
     $quarter $BN4 -n 
    $quarter $BN4 -n 
     $quarter $BN4 -n 
    $dottedquarter $AN4 -n 
     $eighth $DN5 -n 
    $dottedhalf $GN4 -n  
     
    $quarter $EN5 -n 
    $quarter $EN5 -n  
    $quarter $EN5 -n 
    $quarter $EN5 -n  
    $dottedquarter $DN5 -n 
    $eighth $GN5  -n 
    $dottedhalf $CN5 -n 
    $eighth  $FN4 -n 
    $eighth $CN4 -n 
    $eighth  $FN4 -n 
    $eighth $GN4 -n 
    $eighth  $AN4 -n 
    $eighth $CN5 -n 

     $dottedquarter $EN5 -n 
    $eighth $BN4 -n 
     $eighth $EN5 -n 
    $eighth $FS5 -n 
    
     $quarter $GN5 -n 
    $quarter $FS5 -n 
     $quarter $EN5 -n 

    $dottedquarter $DN5  -n 
    $eighth $EN5 -n 
    $quarter $DN5  -n 
    $dottedhalf $BN4 -n  
#----------------------------------------------------------
     $dottedquarter $EN5 -n 
    $eighth $BN4 -n 
     $eighth $EN5 -n 
    $eighth $FS5 -n 
    
     $quarter $GN5 -n 
    $quarter $FS5 -n 
     $quarter $GN5 -n 

    $dottedquarter $AN5  -n 
    $eighth $GN5 -n 
    $quarter $AN5  -n 
    $dottedhalf $BN5 -n 

    $dottedquarter  $EN5 -n 
    $eighth $BN4 -n 
    $eighth  $EN5 -n 
    $eighth $FS5 -n 
    
     $quarter $GN5 -n 
    $quarter $FS5 -n 
     $quarter $EN5 -n 

    $dottedquarter $DN5  -n 
    $eighth $EN5 -n 
    $quarter $DN5  -n 
    
    $half $BN4 -n  
    $eighth $GN4  -n 
    $eighth $AN4 -n 

    $quarter  $BN4 -n 
    $quarter $BN4 -n 
    $quarter  $BN4 -n 

    $quarter $BN4 -n 
     $quarter $AN4 -n 
    $quarter $DN5 -n 

     $dottedquarter $GN4 -n 
    $eighth $GN4 -n 
     $eighth $FS4 -n 
    $eighth $DN4 -n 

     $dottedhalf $EN4 -n 

    # Bass line, melody is  empty.  Might want to remove this measure
    $eighth $GN4  -n 
    $eighth $GN3 -n 
    $eighth $BN3  -n 
    $eighth $EN4 -n 
    $eighth $GN4 -n  
    $eighth $BN4 -n 

    $half $AN5 -n  
    $quarter $EN6 -n 

    $quarter $EN6  -n 
    $quarter $DN6 -n 
    $quarter $CN6  -n 

    $half $BN5 -n 
    $quarter $GN6  -n 

    $dottedhalf $GN6 -n 

     $half $BN5 -n 
    $quarter $FS6 -n 

     $dottedhalf $FS6 -n 

    $half $AN5 -n 
     $quarter $EN6 -n 
     $quarter $EN6 -n 
     $half $DS6 -n 

    # Key change.  Now in key of D
     $half $BN4 -n 
    $quarter $FS5 -n 

     $quarter $FS5 -n 
    $quarter $EN5 -n 
     $quarter $DN5 -n 

    $half $CS5 -n 
     $quarter $AN5 -n 

    $dottedhalf $AN5 -n 

     $quarter $GS5 -n 
    $quarter $EN5 -n 
     $quarter $CS5 -n 

    $half $BN4 -n 
     $quarter $FS5 -n 
    
    $dottedhalf $AN4  -n 
    $eighth $FS4 -n 
    $quarter $AN4  -n 

    $half $BN4 

SONG
    `beep $song`;

