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

`beep $AN3; beep $AN3; beep $DN4; beep  $EN4; beep $GN4; beep $EN4; beep $GN4; beep $AN4`;
`beep $AN3; beep  $AN3; beep $DN4; beep $EN4; beep $GN4; beep $EN4; beep $DS4; beep $DN4`;
`beep  $AN3; beep $AN3; beep $DN4; beep $EN4; beep $GN4; beep $EN4; beep $GN4;  beep $AN4`;
`beep $CN5; beep $AN4; beep $CN5; beep $DN5; beep $DN5;  beep $CN5; beep $AN4; beep $GN4; beep $AN4`;

`beep $AN3; beep  $AN3; beep $DN4; beep $EN4; beep $GN4; beep $EN4; beep $GN4; beep $AN4`;
`beep  $AN3; beep $AN3; beep $DN4; beep $EN4; beep $GN4; beep $EN4; beep $DS4;  beep $DN4`;
`beep $AN3; beep $AN3; beep $DN4; beep $EN4; beep $GN4;  beep $EN4; beep $GN4; beep $AN4`;
`beep $CN5; beep $AN4; beep $CN5;  beep $DN5; beep $DN5; beep $CN5; beep $AN4; beep $GN4; beep $AN4`;

`beep  $DN5; beep $CN5; beep $AN4; beep $GN4; beep $AN4; beep $CN5; beep $AN4;  beep $GN4`;
`beep $DN5; beep $CN5; beep $AN4; beep $GN4; beep $AN4;  beep $CN5; beep $AN4; beep $GN4`;
`beep $DN5; beep $CN5; beep $AN4;  beep $GN4; beep $AN4; beep $CN5; beep $AN4; beep $CN5`;
`beep $DN5;  beep $CN5; beep $DN5; beep $DN5; beep $EN5; beep $DN5; beep $CN5; beep  $AN4`;

`beep $DN5; beep $CN5; beep $AN4; beep $GN4; beep $AN4;  beep $CN5; beep $AN4; beep $GN4`;
`beep $DN5; beep $CN5; beep $AN4;  beep $GN4; beep $AN4; beep $CN5; beep $AN4; beep $GN4`;
`beep $DN5;  beep $CN5; beep $AN4; beep $GN4; beep $AN4; beep $CN5; beep $AN4; beep  $CN5`;
`beep $DN5; beep $CN5; beep $DN5; beep $DN5; beep $EN5; beep  $DN5; beep $CN5; beep $AN4`;

`beep $AN3; beep $AN3; beep $DN4;  beep $EN4; beep $GN4; beep $EN4; beep $GN4; beep $AN4`;
`beep $AN3;  beep $AN3; beep $DN4; beep $EN4; beep $GN4; beep $EN4; beep $DS4; beep  $DN4`;
`beep $AN3; beep $AN3; beep $DN4; beep $EN4; beep $GN4; beep  $EN4; beep $GN4; beep $AN4`;
`beep $CN5; beep $AN4; beep $CN5; beep  $DN5; beep $DN5; beep $CN5; beep $AN4; beep $GN4; beep $AN4`;
