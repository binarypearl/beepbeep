#!/usr/bin/perl

# This code is copyright (C) Shaun Miller, 2011
#
# This code may distributed only under the terms of the GNU Public License 
# which can be found at http://www.gnu.org/copyleft or in the file COPYING 
# supplied with this code.
#
# This code is not distributed with warranties of any kind, including implied
# warranties of merchantability or fitness for a particular use. 

# The variables work like this:
#  CN  - This is a C Natrual
#  CS  - This is a C Sharp
#  Db  - This is a D Flat
#  0-8 - This is the octave that you want.  0 is the lower, 8 is the highest.  
#        Basically it's trial and error on which octave you want.
#
# So...
#  $CN5 is a C Natural in the 5/8 possible octaves.
#  $CS4 is a C Sharp one octave below the previous example. 
#  $Db4 is a D flat, which is the same as a CS4.*
#
#  *Yes, from a pure true standpoint, the Sharp and Flat are not really the same note.  
#  Unfortunately I don't remember where I got these values below from.  
#  If someone knows what the frequenceies differences between the sharps and flats, 
#  we could change them.  But...would that make sense?  Have we not gotten used to 
#  these notes being the same...thus if the values were really different, would it
#  be enough for us to go "wait that ain't right" if someone for exmaple used a 
#  C# instead where they intended for a Db?
#

# If my notions are correct, the following values apply to a 
# 115 Beats Per Minute (BPM).  How did I come up with this?
# I used the Tempo Tap button on my Yamaha keyboard.  I played a 
# loop of quarter notes with the values below, and 115 is what
# it appeared to work out as.  So theory is...since we know
# the BPM (115), the values at that BMP (Defined below), and 
# the BPM that you want (defined at top of a song), we can 
# calculate what the values should be below. 

# If anyone understands the relationship between the -l values to beep (which 
# are in milliseconds) using powers of 2 and how that relates to 115 BPM,
# would love to hear how that works :)b

# Don't change $default_bpm! (Unless of course I'm totally off in my theory) :)
# Instead, use the set_tempo() subroutine in the beginning of every song.  
# It will re-calculate all of the values for the note lengths and rests.
my $default_bpm = 115;

# Length of notes
our $whole='-l 2048';
our $dottedhalf='-l 1536';
our $half_slide_eighth='-l 1280';
our $half_slide_sixteenth='-l 1152';
our $half='-l 1024';
our $dottedquarter='-l 768';
our $quarter='-l 512';
our $dottedeighth='-l 384';
our $eighth='-l 256';
our $sixteenth='-l 128';

# Rest Notes
# These 3 are legacy rests...didn't know what I was doing at the time.
# Don't use these 3 variables.  If you need these values, please put in a feature 
# request if I haven't already done so.
our $super_small='-D 32';
our $smallspace='-D 64';
our $longspace='-D 128';

our $sixteenth_rest = '-D 128';
our $eighth_rest = '-D 256';
our $dottedeighth_rest = '-D 384';
our $quarter_rest = '-D 512';
our $dottedquarter_rest = '-D 768';
our $half_rest = '-D 1024';
our $half_slide_sixteenth='-l 1152';
our $half_slide_eighth='-l 1280';
our $dottedhalf_rest = '-D 1536';
our $whole_rest = '-D 2048'; 

# Hopefully we can change the values above based upon the tempo of BPM.
sub set_tempo() {
	my $new_bpm = $_[0];

	# First we need to strip off the -l and -D in the values.  Then find the new value, and 
	# then put the -l or -d back.  ugh.  

	# Also, since the value for a note an it's rest value are the same, we'll try to 
	# only do one calcuation for both.  

	### Begin whole note 

	$whole =~ tr/\-l //d;
	$whole_rest =~ tr/\-D //d;

	$whole = int (($whole * $default_bpm / $new_bpm) + 0.5);

	$whole_rest =~ s/$whole_rest/-D $whole/;
	$whole =~ s/$whole/-l $whole/;

	### End whole note 


	### Begin dottedhalf

	$dottedhalf =~ tr/\-l //d;
	$dottedhalf_rest =~ tr/\-D //d;

	$dottedhalf = int (($dottedhalf * $default_bpm / $new_bpm) + 0.5);

	$dottedhalf_rest =~ s/$dottedhalf_rest/-D $dottedhalf/;
	$dottedhalf =~ s/$dottedhalf/-l $dottedhalf/;
			
	### End dottedhalf  

		
	### Begin half_slide_eighth 

	$half_slide_eighth =~ tr/\-l //d;
	$half_slide_eighth_rest =~ tr/\-D //d;

	$half_slide_eighth = int (($half_slide_eighth * $default_bpm / $new_bpm) + 0.5);

	$half_slide_eighth_rest =~ s/$half_slide_eighth_rest/-D $half_slide_eighth/;
	$half_slide_eighth =~ s/$half_slide_eighth/-l $half_slide_eighth/;
			
	### End half_slide_eighth


	### Begin half_slide_sixteenth

	$half_slide_sixteenth =~ tr/\-l //d;
	$half_slide_sixteenth_rest =~ tr/\-D //d;

	$half_slide_sixteenth = int (($half_slide_sixteenth * $default_bpm / $new_bpm) + 0.5);

	$half_slide_sixteenth_rest =~ s/$half_slide_sixteenth_rest/-D $half_slide_sixteenth/;
	$half_slide_sixteenth =~ s/$half_slide_sixteenth/-l $half_slide_sixteenth/;
			
	### End half_slide_sixteenth


	### half

	$half =~ tr/\-l //d;
	$half_rest =~ tr/\-D //d;

	$half = int (($half * $default_bpm / $new_bpm) + 0.5);

	$half_rest =~ s/$half_rest/-D $half/;
	$half =~ s/$half/-l $half/;
			
	### End half


	### dottedquarter

	$dottedquarter =~ tr/\-l //d;
	$dottedquarter_rest =~ tr/\-D //d;

	$dottedquarter = int (($dottedquarter * $default_bpm / $new_bpm) + 0.5);

	$dottedquarter_rest =~ s/$dottedquarter_rest/-D $dottedquarter/;
	$dottedquarter =~ s/$dottedquarter/-l $dottedquarter/;
			
	### End dottedquarter


	### quarter

	$quarter =~ tr/\-l //d;
	$quarter_rest =~ tr/\-D //d;

	$quarter = int (($quarter * $default_bpm / $new_bpm) + 0.5);

	$quarter_rest =~ s/$quarter_rest/-D $quarter/;
	$quarter =~ s/$quarter/-l $quarter/;
			
	### End quarter


	### dottedeighth

	$dottedeighth =~ tr/\-l //d;
	$dottedeighth_rest =~ tr/\-D //d;

	$dottedeighth = int (($dottedeighth * $default_bpm / $new_bpm) + 0.5);

	$dottedeighth_rest =~ s/$dottedeighth_rest/-D $dottedeighth/;
	$dottedeighth =~ s/$dottedeighth/-l $dottedeighth/;
			
	### End dottedeighth


	### eighth

	$eighth =~ tr/\-l //d;
	$eighth_rest =~ tr/\-D //d;

	$eighth = int (($eighth * $default_bpm / $new_bpm) + 0.5);

	$eighth_rest =~ s/$eighth_rest/-D $eighth/;
	$eighth =~ s/$eighth/-l $eighth/;
			
	### End eighth


	### sixteenth

	$sixteenth =~ tr/\-l //d;
	$sixteenth_rest =~ tr/\-D //d;

	$sixteenth = int (($sixteenth * $default_bpm / $new_bpm) + 0.5);

	$sixteenth_rest =~ s/$sixteenth_rest/-D $sixteenth/;
	$sixteenth =~ s/$sixteenth/-l $sixteenth/;
			
	### End sixteenth

}

# Here are the variable definitions for all of the possibe notes that we can play.
# Unfortunately I don't remember where I got these values.  I'll have to dig 
# though my google bookmarks, myabe something will turn up.  

#  Octave 0
our $CN0 = "-f 16.35";
our $CS0 = our $Db0 = "-f 17.32";
our $DN0 = "-f 18.35";
our $DS0 = our $Eb0 = "-f 19.45";
our $EN0 = "-f  20.60";
our $FN0 = "-f 21.83";
our $FS0 = our $Gb0 = "-f 23.12";
our $GN0 = "-f 24.50";
our $GS0 = our $Ab0 = "-f 25.96";
our $AN0 = "-f  27.50";
our $AS0 = our $Bb0 = "-f 29.14";
our $BN0 = "-f 30.87";

#  Octave 1
our $CN1 = "-f 32.70";
our $CS1 = our $Db1 = "-f 34.65";
our $DN1 = "-f 36.71";
our $DS1 = our $Eb1 = "-f 38.89";
our $EN1 = "-f  41.20";
our $FN1 = "-f 43.65";
our $FS1 = our $Gb1 = "-f 46.25";
our $GN1 = "-f 49.00";
our $GS1 = our $Ab1 = "-f 51.91";
our $AN1 = "-f  55.00";
our $AS1 = our $Bb1 = "-f 58.27";
our $BN1 = "-f 61.74";

#  Octave 2
our $CN2 = "-f 65.41";
our $CS2 = our $Db2 = "-f 69.30";
our $DN2 = "-f 73.42";
our $DS2 = our $Eb2 = "-f 77.78";
our $EN2 = "-f  82.41";
our $FN2 = "-f 87.31";
our $FS2 = our $Gb2 = "-f 92.50";
our $GN2 = "-f 98.00";
our $GS2 = our $Ab2 = "-f 103.83";
our $AN2 = "-f  110.00";
our $AS2 = our $Bb2 = "-f 116.54";
our $BN2 = "-f 123.47";

#  Octave 3
our $CN3 = "-f 130.81";
our $CS3 = our $Db3 = "-f 138.59";
our $DN3 = "-f 146.83";
our $DS3 = our $Eb3 = "-f 155.56";
our $EN3 =  "-f 164.81";
our $FN3 = "-f 174.61";
our $FS3 = our $Gb3 = "-f  185.00";
our $GN3 = "-f 196.00";
our $GS3 = our $Ab3 = "-f 207.65";
our $AN3 = "-f 220.00";
our $AS3 = our $Bb3 = "-f 233.08";
our $BN3 =  "-f 246.94";

# Octave 4
our $CN4 = "-f 261.63";
our $CS4 = our  $Db4 = "-f 277.63";
our $DN4 = "-f 293.66";
our $DS4 = our $Eb4 =  "-f 311.13";
our $EN4 = "-f 329.63";
our $FN4 = "-f 349.23";
our $FS4 = our $Gb4 = "-f 369.99";
our $GN4 = "-f 392.00";
our $GS4 = our  $Ab4 = "-f 415.30";
our $AN4 = "-f 440.00";
our $AS4 = our $Bb4 = "-f  466.16";
our $BN4 = "-f 493.88";

# Octave 5
our $CN5 = "-f  523.25";
our $CS5 = our $Db5 = "-f 554.37";
our $DN5 = "-f 587.33";
our $DS5 = our $Eb5 = "-f 622.25";
our $EN5 = "-f 659.26";
our $FN5 =  "-f 698.46";
our $FS5 = our $Gb5 = "-f 739.99";
our $GN5 = "-f  783.99";
our $GS5 = our $Ab5 = "-f 830.61";
our $AN5 = "-f 880.00";
our $AS5 = our $Bb5 = "-f 932.33";
our $BN5 = "-f 987.77";

# Octave  6
our $CN6 = "-f 1046.50";
our $CS6 = our $Db6 = "-f 1108.73";
our $DN6 = "-f 1174.66";
our $DS6 = our $Eb6 = "-f 1244.51";
our $EN6 =  "-f 1318.51";
our $FN6 = "-f 1396.91";
our $FS6 = our $Gb6 = "-f  1479.98";
our $GN6 = "-f 1567.98";
our $GS6 = our $Ab6 = "-f  1661.22";
our $AN6 = "-f 1760.00";
our $AS6 = our $Bb6 = "-f  1864.66";
our $BN6 = "-f 1975.53";

# Octave 7
our $CN7 = "-f  2093.00";
our $CS7 = our $Db7 = "-f 2217.46";
our $DN7 = "-f  2349.32";
our $DS7 = our $Eb7 = "-f 2489.02";
our $EN7 = "-f  2637.02";
our $FN7 = "-f 2793.83";
our $FS7 = our $Gb7 = "-f  2959.96";
our $GN7 = "-f 3135.96";
our $GS7 = our $Ab7 = "-f  3322.44";
our $AN7 = "-f 3520.00";
our $AS7 = our $Bb7 = "-f  3729.31";
our $BN7 = "-f 3951.07";

# Octave 8 (Don't know all of it)
our $CN8 = "-f 4186.01";
our $CS8 = our $Db8 = "-f 4434.92";
our $DN8 = "-f 4698.64";
our $DS8 = our $Eb8 = "-f 4978.03";


