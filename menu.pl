#!/usr/bin/perl

use  strict;

# menu.pl : A menu and CLI based script to play songs through a PC speaker.
#           This scripted intended to be called by the beepbeep script, as eventually
#           I want beepbeep to be a frontend using the screen command to generate a 
#           multi/split screen interface.  menu.pl would then fill up one of the screens.
#           However for now, beepbeep really just calls this script anyway. 
#
#
# This code is copyright (C) Shaun Miller, 2011
#
# This code may distributed only under the terms of the GNU Public License 
# which can be found at http://www.gnu.org/copyleft or in the file COPYING 
# supplied with this code.
#
# This code is not distributed with warranties of any kind, including implied
# warranties of merchantability or fitness for a particular use. 
#
# 
# Versions:
#	0.01 - SMM - 03/21/2010
#		Contains 4 songs.  The first is original, the 2nd and 3rd are covers, and the 4th (taps) was taken from 
#        	a forum in  ubuntuforums.org; where I learned some of the details to make the other songs.
#	0.02 - SMM - 03/22/2010
#		Added exit statement on CLI
#	0.03 - SMM - 03/29/2010
#		Bug fix to not display menu if -s called
#	0.04 - SMM - 01/01/2011
#		Adding intro to Final Count Down
#	0.05 - SMM - 04/26/2011
#		Intro to final count down not finished.  Instead, going to to work on a genre-based menu system.
#	0.06 - SMM - 05/14/2011
#		FF VI Decicivise Battle created
#		Songs separated into their own files
#		Genre based menu system put into place
#	0.07 - SMM - 06/07/2011
#		Adding the CLI feature back in
#	0.08 - SMM - 06/24/2011
#		Adding in --help flag

use Getopt::Long;

my $version =  "0.08";
my $version_flag = "";

my $genre_user_input = "";
my $user_input = "";
my $song_requested = "";
my $song_list_flag = "";

our $install_path = "";
my $song_path = "";

my @beepconf_records = ();
my $beepconf_record = "";

my @song_files = ();
my $song_file = "";

my $help_flag = "";

# Counter to help determine which number to give to the CLI
my $i = 1;

# Similar counter to $i, to be used in the actual determiniation of which song to play
my $j = 1;

# First let's read /etc/beepbeep.conf to the path where the songs are stored
open (BEEPCONF, "/etc/beepbeep.conf") or die "Sorry can't open /etc/beepbeep.conf\n";

@beepconf_records = <BEEPCONF>;

foreach $beepconf_record (@beepconf_records) {
	chomp ($beepconf_record);

	if ($beepconf_record =~ m/(song_path)(=)(.*)/) {
		$song_path = $3;
		$song_path =~ tr/\"//d;
	}
}

GetOptions (
    "song:s" =>  \$song_requested,
    "list" => \$song_list_flag,
    "version" => \$version_flag,
    "help" => \$help_flag,
);

if ($version_flag) {
    system  ("clear");
    print "beepbeep: $version\n";
    exit 0;
}

if ($song_list_flag) {
	@song_files = `ls -1 $song_path/`;

	exit_beep();	
}

if ($help_flag) {
	system ("clear");

	print "To run beepbeep:\n\n";
	
	print "beepbeep\n";
	print "\tRun the beepbeep menu-based interface\n\n";

	print "beepbeep -l\n";
	print "\tPrint a list of songs that you can play through the CLI\n\n";

	print "beepbeep -s N\n";
	print "\tPlay a song, and then exit.  Never enter the menu.  This is intended for scripting.\n";
	print "\tN is the number that is associated with the song from beepbeep -l\n";
	print "\tNote:  The space after the the -s must be present.\n\n";

	print "beepbeep -h\n";
	print "\tPrints this help message\n\n";

	exit 0;
}

# Just to be safe
# I think perl needs a chompall() function if it doesn't have one already.
chomp ($song_requested);

while  (1) {
	# For command line arguments?  Will work on this later
	if ($song_requested) {
		@song_files = `ls -1 $song_path/`;
		cli_play_song();

		exit_beep();	
	}

	else {
    		print_header();
    		display_main_menu();
	}
}

sub print_header() {
	system ("clear");
	print "--------"x10;
	print "\nBeep song menu\tversion: $version\n";
	print  "--------"x10;
	print "\n\n";    
}

# If -s was passed, figure out which song was requested and play it
sub cli_play_song() {
	foreach $song_file (@song_files) {
		chomp ($song_file);

		if ($j eq $song_requested) {
			system ("$song_path/$song_file");
		}

		$j++;		
	}

}

sub display_main_menu() {
	print "Select the genre of music for a list of songs:\n\n";
	print "1.  Classic Rock\n";
	print "2.  Classical Music\n";
	print "3.  Miscellaneous\n";
	print "4.  Sound Effects\n";
	print "5.  Video Game\n";
	print "Q.  Quit beepbeep\n";

	print "\nGenere: ";
	$genre_user_input = <>;
	chomp ($genre_user_input);

	if ($genre_user_input eq "1") {
		while ($song_requested eq "") {
			print_header();
			display_classic_rock_menu();
		}
	}

	elsif ($genre_user_input eq "2") {
		while ($song_requested eq "") {
			print_header();
			display_classical_music_menu();
		}
	}

	elsif ($genre_user_input eq "3") {
		while ($song_requested eq "") {
			print_header();
			display_miscellaneous_menu();
		}
	}
	
	elsif ($genre_user_input eq "4") {
		while ($song_requested eq "") {
			print_header();
			display_sound_effects_menu();
		}
	}

	elsif ($genre_user_input eq "5") {
		while ($song_requested eq "") {
			print_header();
			display_video_game_menu();
		}
	}	

	elsif ($genre_user_input =~ m/^q$/i) {
		exit_beep();
	}
	
	else {
		$genre_user_input = "";
		# Another potential bug, but I think we want to set the input variable to null
		# here so it's reset upon the next load of the menu.
		# A somewhat ugly hack, instead of having a else statement above, I think setting
		# this variable here to null will allow the display_main_menu fuction to be
		# re-ran.
	}

	# Setting to null to put us in a clean state
	$song_requested = "";
}

sub display_video_game_menu() {
	print "Select the song that you would like to hear:\n\n";
	print "1.  On to Zanarkand\n";
	print "2.  FFVI (FFIII) Decisive Battle\n";
	print "M.  Go to main (genre) menu\n";
	print "Q.  Quit beepbeep\n";

	print "\nSong: ";
	$song_requested = <>;
	chomp $song_requested;

	if ($song_requested == 1) {
		system ("$song_path/on_to_zanarkand.pl");
		$song_requested = "";
	}
	
	elsif ($song_requested == 2) {
		system ("$song_path/ff6_decisive_battle.pl");
		$song_requested = "";
	}

	elsif ($song_requested =~ m/^m$/i) {
		# Basically $song_requested just has to be not null to take us back to the main menu.
		$song_requested="main_menu";	
	}
	
	elsif ($song_requested =~ m/^q$/i) {
		exit_beep();	
	}

	else {
		$song_requested = "";
	}
}

sub display_classical_music_menu() {
	print "Select the song that you would like to hear:\n\n";
	print "1.  Entry of the Gladiators\n";
	print "M.  Go to main (genre) menu\n";
	print "Q.  Quit beepbeep\n";

	print "\nSong: ";
	$song_requested = <>;
	chomp ($song_requested);

	if ($song_requested == 1) {
		system ("$song_path/entry_of_the_gladiators.pl");
		$song_requested = "";
	}
	
	elsif ($song_requested =~ m/^m$/i) {
		# Basically $song_requested just has to be not null to take us back to the main menu.
		$song_requested="main_menu";	
	}
	
	elsif ($song_requested =~ m/^q$/i) {
		exit_beep();	
	}

	else {
		$song_requested = "";
	}
}

sub display_classic_rock_menu() {
	print "Select the song that you would like to hear:\n\n";
	print "1.  Final Countdown (Intro)\n";
	print "M.  Go to main (genre) menu\n";
	print "Q.  Quit beepbeep\n";

	print "\nSong: ";
	$song_requested = <>;
	chomp ($song_requested);

	if ($song_requested == 1) {
		system ("$song_path/final_countdown.pl");
		$song_requested = "";
	}
	
	elsif ($song_requested =~ m/^m$/i) {
		# Basically $song_requested just has to be not null to take us back to the main menu.
		$song_requested="main_menu";	
	}
	
	elsif ($song_requested =~ m/^q$/i) {
		exit_beep();	
	}

	else {
		$song_requested = "";
	}
}

sub display_sound_effects_menu() {
	print "Select the song that you would like to hear:\n\n";
	print "1.  Router Boot\n";
	print "2.  Torrent Completion\n";
	print "3.  Final Fantasy Victory theme\n";
	print "4.  Beep on time\n";
	print "M.  Go to main (genre) menu\n";
	print "Q.  Quit beepbeep\n";

	print "\nSong: ";
	$song_requested = <>;
	chomp ($song_requested);

	if ($song_requested == 1) {
		system ("$song_path/router_boot.bash");
		$song_requested = "";
	}
	
	elsif ($song_requested == 2) {
		system ("$song_path/torrent_completion.bash");
		$song_requested = "";
	}
	
	elsif ($song_requested == 3) {
		system ("$song_path/final_fantasy_victory_theme.bash");
		$song_requested = "";
	}
	
	elsif ($song_requested == 4) {
		system ("$song_path/beep_on_time.bash");
		$song_requested = "";
	}
	
	elsif ($song_requested =~ m/^m$/i) {
		# Basically $song_requested just has to be not null to take us back to the main menu.
		$song_requested="main_menu";	
	}
	
	elsif ($song_requested =~ m/^q$/i) {
		exit_beep();	
	}

	else {
		$song_requested = "";
	}
}

sub display_miscellaneous_menu() {
	print "Select the song that you would like to hear:\n\n";
	print "1.  Taps\n";
	print "2.  Base Warmup\n";
	print "M.  Go to main (genre) menu\n";
	print "Q.  Quit beepbeep\n";

	print "\nSong: ";
	$song_requested = <>;
	chomp ($song_requested);

	if ($song_requested == 1) {
		system ("$song_path/taps.pl");
		$song_requested = "";
	}
	
	elsif ($song_requested == 2) {
		system ("$song_path/bass_warmup.pl");
		$song_requested = "";
	}
	
	elsif ($song_requested =~ m/^m$/i) {
		# Basically $song_requested just has to be not null to take us back to the main menu.
		$song_requested="main_menu";	
	}
	
	elsif ($song_requested =~ m/^q$/i) {
		exit_beep();	
	}

	else {
		$song_requested = "";
	}
}

sub exit_beep() {
	system ("clear");

	if ($song_list_flag) {
		print "Here are the songs that you can script beepbeep to play:\n\n";

		foreach $song_file (@song_files) {
			chomp ($song_file);

			print "$i:\t$song_file\n";
			$i++;
		}
	
		print "\nTo script playing a song:\n";
		print "\nbeepbeep --song number\n";
		print "where \'number\' is determined from the list above:\n\n";
	}


	print "Thanks for using beepbeep version $version\n";
	exit 0;
}

