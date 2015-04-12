#!/usr/bin/python

# This code is copyright (C) Shaun Miller, 2011
#
# This code may distributed only under the terms of the GNU Public License 
# which can be found at http://www.gnu.org/copyleft or in the file COPYING 
# supplied with this code.
#
# This code is not distributed with warranties of any kind, including implied
# warranties of merchantability or fitness for a particular use. 

import os
import commands
import sys
import re

os.system ("clear")

# List of files
list_of_files = [
	'beepbeep',
	'beepbeep_version.txt',
	'command_prompt.pl',
	'install_beepbeep.py',
	'menu.pl',
	'notes.pl',
	'progress.pl'
]

# Def's:

def install_beepbeep():
	user_install_path = raw_input ("1.  Where would you like to install beepbeep? (/usr/local/bin/): ")

	if len(user_install_path) == 0:
		user_install_path='/usr/local/bin/'
 

	song_install_path = raw_input ("2.  Where would you like to install the beepbeep songs? (/usr/local/bin/beepbeep_songs/): ")

	if len(song_install_path) == 0:
		song_install_path='/usr/local/bin/beepbeep_songs/'

	# Let's install the real beep program:
	print "Compiling and installing beep 1.3 from: http://johnath.com/beep/\n"

	commands.getoutput ('tar -xvzf ./beep-1.3.tar.gz')
	commands.getoutput ('cd beep-1.3; make; make install')


	print "Installing beepbeep binaries and songs:"

	# Now that we have the path's lets mkdir and install:
	commands.getoutput ('mkdir -p ' + user_install_path)
	commands.getoutput ('mkdir -p ' + song_install_path)

	#x=commands.getoutput ('cp ' + cwd + '/*.pl beepbeep beepbeep_version.txt ' + user_install_path)
	for file in list_of_files:
		commands.getoutput ('cp ' + cwd + '/' + file + ' ' + user_install_path)


	y=commands.getoutput ('cp ' + cwd + '/songs/* ' + song_install_path)

	BEEPBEEPCONF = open ('/etc/beepbeep.conf' , 'w')

	BEEPBEEPCONF.write ('install_path=' + user_install_path + '\n\n')
	BEEPBEEPCONF.write ('song_path=' + song_install_path + '\n')

	BEEPBEEPCONF.close() 

	print "\nbeepbeep installed.  Run the command:  beeepbeep to launch the menu."

def uninstall_beepbeep():
	CONFFILE = open ('/etc/beepbeep.conf')
	for record in CONFFILE:
		match_object = re.search ('(^install_path)(=)(.*)', record)

		if match_object:
			user_install_path = match_object.group(3)


		match_object = re.search ('(^song_path)(=)(.*)', record)
			
		if match_object:
				song_path = match_object.group(3)

	# Remove binary files
	for file in list_of_files:
		commands.getoutput ('rm -rf ' + user_install_path + file)
		#print 'rm -rf ' + user_install_path + file		

	# Remove songs
	commands.getoutput ('rm -rf ' + song_path)
	#print 'rm -rf ' + song_path 

	# Remove config file:
	commands.getoutput ('rm -rf /etc/beepbeep.conf')

	#commands.getoutput ('rm -rf ' + install_path + '*.pl beepbeep beepbeep_version.txt')
	#print 'rm -rf ' + install_path + '*.pl beepbeep beepbeep_version.txt'

	print "beepbeep removed from system.  Have a nice day!\n"
	
	CONFFILE.close()


# First let's check to make sure we are root.
root_status=commands.getoutput ('id | cut -d \'=\' -f2 | cut -d \'(\' -f1')

# Default to re-install if beepbeep already exists.  However the user may remove it if they wish.
beepbeep_exists_prompt = "re-install"

if root_status != '0':
	print "Sorry you need be root (or rather have a uid==0) to install beepbeep."
	sys.exit(1)

# Get our current working directory
cwd=commands.getoutput('pwd')

# I don't like this code here, but it's a last minute change
try:
	CONFFILE = open ('/etc/beepbeep.conf')

	for record in CONFFILE:

		match_object = re.search ('(^install_path)(=)(.*)', record)

		if match_object:
			user_install_path = match_object.group(3)
			beepbeep_version_txt_file = user_install_path + 'beepbeep_version.txt'

except:
	beepbeep_version_txt_file = './beepbeep_version.txt'

VERFILE =  open (beepbeep_version_txt_file)

for record in VERFILE:
	reobj = re.search ('(version)(=)(.*)', record)

	if reobj:
		version=reobj.group(3) 

VERFILE.close()

print "Welcome to the beepbeep installer.  Installing beepbeep version: " + version
print "---------------------------------------------------------------------\n"

if os.path.isfile ('/etc/beepbeep.conf'):
	beepbeep_exists_prompt = raw_input ("It appears you have a previous install of beepbeep.\n\nWould you like to \'re-install\' or \'remove\' beepbeep?: (re-install) ")

# Finish code here
if beepbeep_exists_prompt == 'remove':
	uninstall_beepbeep()
else:
	install_beepbeep()

