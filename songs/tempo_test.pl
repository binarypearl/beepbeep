#!/usr/bin/perl

require "/usr/local/public/projects/beep/notes.pl";

# Set 
set_tempo(130);

my $song = join (":", <<SONG =~  /(.+)/g);
    $quarter $CN4 $quarter_rest -n 
    $quarter $CN4 $quarter_rest 

SONG
while (1) {
    `beep $song`;
}

