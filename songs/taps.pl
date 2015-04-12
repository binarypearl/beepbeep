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

require "$install_path/notes.pl";

close (CONFIG_FILE);

set_tempo (100);

my $song = join (":", <<SONG =~ /(.+)/g);
    $dottedeighth $GN4 -n 
    $sixteenth $GN4 -n  
    $dottedhalf $CN5 -n 
    $dottedeighth $GN4  -n 
    $sixteenth $CN5 -n 
     $dottedhalf $EN5 -n 
    $dottedeighth $GN4 -n  
    $sixteenth $CN5 -n 
    $quarter $EN5  -n 
    $dottedeighth $GN4 -n 
     $sixteenth $CN5 -n 
    $quarter $EN5 -n 
     $dottedeighth $GN4 -n 
    $sixteenth $CN5  -n 
    $dottedhalf $EN5 -n 
    $eighth $CN5  -n 
    $eighth $EN5 -n 
    $half $GN5  -n 
    $quarter $EN5 -n 
    $quarter  $CN5 -n 
    $dottedhalf $GN4 -n 
     $dottedeighth $GN4 -n 
    $sixteenth $GN4 -n  
    $whole $CN5
SONG
    `beep $song`;

