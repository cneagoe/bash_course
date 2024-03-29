#!/bin/bash


# BASIC COMMANDS 

# alias 
# usualy a shortened form of a command
# see ll example in ~/.bashrc

# see if command is alias, internal or external
type pwd
type man
type ll

# internal command is part of the shell
# external command is found on disk through the PATH variable

# environment variables
# find out what shell you're using
echo $SHELL
# check the PATH variable
echo $PATH
# $PATH variable can be set for specific users

# shows path to bin if the path is already present in $PATH
which man

# ls : Display the contents of the directory. 
# If you call the command without parameters, it shows you
# the contents of the current directory.
ls 

# pwd : Display the path to the current directory.
pwd

# cd : Go to the directory at the specified 
# relative or absolute path. 
cd /tmp
cd .. 
cd ~

# exercises
# 1. Type time ls. This executes the ls command where the Bash internal time
# shows information about the time it took to complete this command.
# 2. Type which time. This shows the filename /usr/bin/time that was found in the
# $PATH variable.
# 3. Type time, which shows that time is a shell keyword.
# 4. Type echo $PATH to show the contents of the $PATH variable. You can
# see that /usr/bin is #included in the list, but because there also is an internal
# command time, the time command from the path will not be executed unless
# you tell the shell specifically to do so—the command in step 2 has executed the
# internal command for you because of command precedence.
# 5. Type /usr/bin/time ls to run the /usr/bin/time command when executing
# ls. You’ll notice that the output differs completely. Ignore the meaning of the
# output; we get back to that later. What matters for now is that you realize that
# these are really two different commands.

Standard Input, Output, and Error 
Name    File Descriptor Number
STDIN   0
STDOUT  1
STDERR  2

Common Bash Redirectors
Redirector        Explanation
> (same as 1>)    Redirects STDOUT. If redirection is to a file, the current contents of that file are overwritten.
>> (same as 1>>)  Redirects STDOUT in append mode. If output is written to a file, the output is appended to that file.
2>                Redirects STDERR.
2>&1              Redirects STDERR to the same destination as STDOUT. Notice that this has to be used in combination with normal output redirection,as in ls whuhiu > errout 2>&1.
< (same as 0<)    Redirects STDIN.

# pipe : send the output of one command to another
history | grep ls

# exercises
# 1. Type ls. You’ll see the ls command output onscreen.
# 2. Type ls > /dev/null. This redirects STDOUT to the null device, with the result
# that you will not see it.
# 3. Type ls ilwehgi > /dev/null. This command shows a “no such file or directory”
# message onscreen. You see the message because it is not STDOUT, but rather an
# error message that is written to STDERR.
# 4. Type ls ilwehgi 2> /dev/null. Now you will no longer see the error message.
# 5. Type ls ilwehgi /etc 2> /dev/null. This shows the contents of the /etc folder
# while hiding the error message.
# 6. Type ls ilwehgi /etc 2> /dev/null > output. In this command, you still write
# the error message to /dev/null while sending STDOUT to a file with the name
# output that will be created in your home directory.
# 7. Type cat output to show the contents of this file.
# 8. Type echo hello > output. This overwrites the contents of the output file. Verify
# this by using cat output again.
# 9. Type ls >> output. This appends the result of the ls command to the output file.
# Type cat output to verify.
# 10. Type ls -R /. This shows a long list of files and folders scrolling over your
# computer monitor. (You might want to press Ctrl-C to stop [or wait some time]).
# 11. Type ls -R /. | less. This shows the same result, but in the less pager, where you
# can scroll up and down using the arrow keys on your keyboard.
# 12. Type q to close less. This will also end the ls program.
# 13. Type ls > /dev/tty1. This gives an error message because you are executing the
# command as an ordinary user, and ordinary users cannot address device files
# directly (unless you were logged in to tty1). Only the user root has permission to
# write to device files directly.

# view history of commands run so far
history
# Type !number to execute a command with a specific number from history.
# Use history -d number to delete a specific command from history. 
# type history -c to clear the current history.
# if you want to remove both the current history and the contents of the .bash_history file,
# then type history -w immediately after running the history -c command.

# exercises
# 1. Type history to get an overview of commands that you have previously used.
# 2. Type some commands, such as the following:
# ls
# pwd
# cat /etc/hosts
# ls –l
# The goal is to fill the history a bit.
# 3. Open a second terminal on your server. To do so, click Activities in the upper-
# left corner, and in the Search bar, type term. Next, click the terminal window to
# start it.
# 4. Type history from this second terminal window. Notice that you do not see
# the commands that you just typed in the other terminal. The reason is that the
# history file has not been updated yet.
# 5. From the first terminal session, press Ctrl-r. From the prompt that opens now,
# type ls. You’ll see the last ls command you used. Press Ctrl-r again. You’ll now see
# that you are looking backward and that the previous ls command is highlighted.
# Press Enter to execute it.
# 6. Type history | grep cat. The grep command searches the history output for any
# commands that contain the text cat. Note the command number of one of the cat
# commands you have previously used.
# 7. Type !nn, where nn is replaced by the number you noted in step 7. You’ll see that
# the last cat command is repeated.
# 8. Close this terminal by typing exit.
# 9. From the remaining terminal window, type history -c. This wipes all history that
# is currently in memory. Close this terminal session as well.
# 10. Open a new terminal session and type history. The result may be a bit unex-
# pected, but you’ll see a list of commands anyway. The reason is that history -c
# clears the in-memory history, but it does not remove the .bash_history file in
# your home directory.

# using autocompletion with tab
# 1. Still from a user shell, type gd and press Tab. You’ll see that nothing happens.
# 2. Press Tab again. Bash now shows a short list of all commands that start with the
# letters gr.
# 3. To make it clear to Bash what you want, type i (so that your prompt at this point
# shows the command grep). Press Tab again. Bash now completes the command to
# grep. Press Enter to launch it.
# 4. Use cd /etc to go to the /etc directory.
# 5. Type cat ps and press Tab. Because there is one file only that starts with pas, Bash
# knows what to do and automatically completes the filename to passwd. Press
# Enter to execute the command.
# using tab is important for speed but also correctness for example when tabing in a long path

# vim cheat sheet
# Command        Explanation
# Esc            Switches from input mode to command mode. Press this key before typing any command.
# i, a           Switches from command mode to input mode at (i) or after (a) the current cursor position.
# o              Opens a new line below the current cursor position and goes to input mode.
# :wq            Writes the current file and quits.
# :q!            Quits the file without applying any changes. The ! forces the command to do its work. Add the ! only if you really know what you are doing.
# :w             filename Writes the current file with a new filename.
# dd             Deletes the current line and places the contents of the deleted line into memory.
# yy             Copies the current line.
# p              Pastes the contents that have been cut or copied into memory.
# v              Enters visual mode, which allows you to select a block of text using the arrow keys. Use d to cut the selection or y to copy it.
# u              Undoes the last command. Repeat as often as necessary.
# Ctrl-r         Redoes the last undo. (Cannot be repeated more than once.)
# gg             Goes to the first line in the document.
# G              Goes to the last line in the document.
# /text          Searches for text from the current cursor position forward.
# ?text          Searches for text from the current cursor position backward.
# ^              Goes to the first position in the current line.
# $              Goes to the last position in the current line.
# !ls            Adds the output of ls (or any other command) in the current file.
# :%s/old/new/g  Replaces all occurrences of old with new.
# :set number    adds line numbers

# exercises
# 1. Type vim ~/testfile. This starts vim and opens a file with the name testfile in ~,
# which represents your current home directory.
# 2. Type i to enter input mode and then type the following text:
# cow
# sheep
# ox
# chicken
# snake
# fish
# oxygen
# 3. Press Esc to get back to command mode and type :w to write the file using the
# same filename.
# 4. Type :3 to go to line number 3.
# 5. Type dd to delete this line.
# 6. Type dd again to delete another line.
# 7. Type u to undo the last deletion.
# 8. Type o to open a new line.
# 9. Enter some more text at the current cursor position:
# tree
# farm
# 10. Press Esc to get back into command mode.
# 11. Type :%s/ox/OX/g and note the changes to the line that contained ox.
# 12. Type :wq to write the file and quit. If for some reason that does not work,
# use :wq!

# see all environment variables
env

# env file locations
# /etc/profile: This is the generic file that is processed by all users upon login.
# /etc/bashrc: This file is processed when subshells are started.
# ~/.bash_profile: In this file, user-specific login shell variables can be defined.
# ~/.bashrc: In this user-specific file, subshell variables can be defined.
# to add a path you need to add an export statement similar to the one bellow to one of the files above
export PATH="/root/.pulumi/bin/:$PATH"

# banners
# To display messages during the login process, Bash uses the /etc/motd and the /etc/ issue files.

# exercises
# 1. Type echo $LANG to show the contents of the variable that sets your system
# keyboard and language settings.
# 2. Type ls --help. You’ll see that help about the ls command is displayed in the
# current language settings of your computer.
# 3. Type LANG=es_ES.UTF-8. This temporarily sets the language variable to
# Spanish. Type ls --help again to verify.
# 4. Type exit to close your terminal window. Because you have not changed the
# contents of any of the previously mentioned files, when you open a new shell, the
# original value of the LANG variable will be used.
# 5. Open a shell as user again.
# 6. Verify the current value of the LANG variable by typing echo $LANG.
# 7. Type vim .bashrc to open the .bashrc configuration file.
# 8. In this file, add the line COLOR=red to set a variable with the name COLOR
# and assign it the value red. Notice that this variable doesn’t really change
# anything on your system; it just sets a variable.
# 9. Close the user shell and open a new user shell.
# 10. Verify that the variable COLOR has been set, by using echo $COLOR.
# Because the .bashrc file is included in the login procedure, the variable is set after
# logging in.

# --help
# Nearly all commands provide a short overview of help when the option --help
# is used. Some commands do not honor that option and consider it erroneous.
# Fortunately, these commands will be so friendly as to show an error message,
# displaying valid options with the command, which effectively means that you’ll get
# what you needed anyway.

# accessing documentation
man ls
# To get to the bottom of the man page as fast as possible, use the G command. 
# You can also type /example to search the man page for any examples.
# You can search the mandb database by using apropos or man -k

# update documentation database
mandb

# exercises
# 1. If man -k does not give the expected result, it makes sense to look in the
# man page for the man command for additional information about man -k. Type
# man man to open the man page of man. Once in the man page, type /-k to look
# for a description of the -k option. Type n a few times until you get to the line that
# describes the option. You’ll see that man -k is equivalent to apropos and that
# you can read the man page of apropos for more details. So type q to exit this man
# page.
# 2. Type man apropos and read the first paragraphs of the description. You’ll see
# that the database searched by apropos is updated by the mandb program.
# 3. Type man mandb. This man page explains how to run mandb to update the
# mandb database. As you’ll read, all you need to do is type mandb, which does the
# work for you.
# 4. Type sudo mandb to update the mandb database. Notice that you won’t see
# many man pages being added if the mandb database was already up to date.

# Using info
# exercises 
# 1. Type man ls. Type G to go to the end of the man page and look at the “See
# Also” section. It tells you that the full documentation for ls is maintained as a
# Texinfo manual that can be shown with the info command. Quit the man page by
# pressing q.
# 2. Type pinfo ‘(coreutils) ls invocation’. This shows the information about ls
# usage in the pinfo page. Read through it and press q when done. Alternatively,
# you can use the info command, but pinfo shows nicer formatting.

# /usr/share/doc
# Find info about rsyslog, bind, Kerberos, OpenSSL, and others. 
# For some services, even sample files are included.

# sample review questions for spaced repetition
# 1. What is a linux system variable?
# 2. Which command enables you to find the correct man page based on keyword usage?
# 3. Which file do you need to change if you want a variable to be set for user bob when this user logs in?
# 4. When analyzing how to use a command, you read that the documentation is maintained with the Techinfo system. How can you read the information?
# 5. What is the name of the file where Bash stores its history?
# 6. Which command enables you to update the database that contains man keywords?
# 7. How can you undo the last modification you have applied in vim?
# 8. What can you add to a command to make sure that it does not show an error message, assuming that you do not care about the information that is in the error messages either?
# 9. How do you read the current contents of the $PATH variable?
# 10. How do you repeat the last command you used that contains the string dog somewhere in the command?

# lab 1
# 1. Modify your shell environment so that on every subshell that is started, a variable is set. The name of the variable should be COLOR, and the value should be set to red. 
# Verify that it is working.
# 2. Use the appropriate tools to find the command that you can use to change a user password. 
# Do you need root permissions to use this command?
# 3. From your home directory, type the command ls -al wergihl * and ensure that errors as well as regular output are redirected to a file with the name /tmp/ lsoutput.


# file system
# Directory       Use
# /               Specifies the root directory. This is where the file system tree starts.
# /boot           Contains all files and directories that are needed to boot the Linux kernel.
# /dev            Contains device files that are used for accessing physical devices. This directory is essential during boot.
# /etc            Contains configuration files that are used by programs and services on your server. This directory is essential during boot.
# /home           Used for local user home directories.
# /media, /mnt    Contain directories that are used for mounting devices in the file system tree.
# /opt            Used for optional packages that may be installed on your server.
# /proc           Used by the proc file system. This is a file system structure that gives access to kernel information.
# /root           Specifies the home directory of the root user.
# /run            Contains process and user-specific information that has been created since the last boot.
# /srv            May be used for data by services like NFS, FTP, and HTTP.
# /sys            Used as an interface to different hardware devices that are managed by the Linux kernel and associated processes.
# /tmp            Contains temporary files that may be deleted without any warning during boot.
# /usr            Contains subdirectories with program files, libraries for these program files, and documentation about them.
# /var            Contains files that may change in size dynamically, such as log files, mail boxes, and spool files.

# mount concept 
# A mount is a connection between a device and a directory. 
# A Linux file system is presented as one hierarchy, with the root directory (/) as its starting point. 
# This hierarchy may be distributed over different devices and even computer systems that are mounted into the root directory.
# In the process of mounting, a device is connected to a specific directory, such that after a successful mount this directory gives access to the device contents.
# It's similar to adding another hard disk to a windows device

# mount command
mount
# The mount command gives an overview of all mounted devices.

# findmnt
findmnt
# The findmnt command shows mounts and the relationship that exists between the different mounts. 

# df 
df - Th
# The df -Th command was designed to show available disk space on mounted devices; it includes most of the system mounts. 
# The -h option summarizes the output of the command in a human-readable way, and the -T option shows which file system type is used on the different mounts.
# Let's take a look at the output and try to understand it

# Wildcard  Use
# *         Refers to an unlimited number of any characters. ls *, for instance, shows all files in the current directory (except those that have a name starting with a dot).
# ?         Used to refer to one specific character that can be any character. ls c?t would match cat as well as cut.
# [auo]     Refers to one character that may be selected from the range that is specified between square brackets. ls c[auo]t would match cat, cut, and cot.

# exercises folders
# 1. Open a shell. Type cd. Next, type pwd, which stands for print working directory. 
# You’ll see that you are currently in your home directory; that is, name /home/<username>.
# 2. Type touch file1. This command creates an empty file with the name file1 on your server. 
# Because you currently are in your home directory, you can create any file you want to.
# 3. Type cd /. This changes the current directory to the root (/) directory. 
# Type touch file2. You’ll see a “permission denied” message. 
# Ordinary users can create files only in directories where they have the permissions needed for this.
# 4. Type cd /tmp. This brings you to the /tmp directory, where all users have write permissions. 
# Again, type touch file2. 
# You’ll see that you can create items in the /tmp directory (unless there is already a file2 that is owned by somebody else).
# 5. Type cd without any arguments. This command brings you back to your home directory.
# 6. Type mkdir files. This creates a directory with the name files in the current directory. 
# The mkdir command uses the name of the directory that needs to be created as a relative pathname; it is relative to the position you are currently in.
# 7. Type mkdir /home/$USER/files. In this command, you are using the variable $USER, which is substituted with your current username. 
# The complete argument of mkdir is an absolute filename to the files directory that you are trying to create. 
# Because this directory already exists, you’ll get a “file exists” error message.
# 8. Type rmdir files to remove the files directory that you have just created. 
# The rmdir command enables you to remove directories, but it works only if the directory is empty and does not contain any files.

# absolute paths
# An absolute filename, or absolute pathname, is a complete path reference to the file or directory you want to work with. 
# This pathname starts with the root directory, followed by all subdirectories up to the actual filename. 
# No matter what your current directory is, absolute filenames will always work. 
# An example of an absolute filename is /home/lisa/file1.
# relative paths
# A relative filename is relative to the current directory as shown with the pwd command. 
# It contains only the elements that are required to get from the current directory up to the item you need. 
# Suppose that your current directory is /home (as shown by the pwd command). 
# When you refer to the relative filename lisa/file1, you are referring to the absolute filename /home/lisa/file1.

# coppy files from one location to another
cp /etc/hosts /tmp

# move files from one location to another
mv myfile /tmp

# multiple commands on the same line
# create directory
mkdir somefiles; mv somefiles /tmp

# delete a file or folder
rm myfile
rm -r mydir

# exercises
# 1. Type pwd. You should be in the directory /home/$USER.
# 2. Type mkdir newfiles oldfiles
# Type ls
# You’ll see the two directories you have just created, as well as some other direc-
# tories that already existed in the user home directory.
# 3. Type touch newfiles/.hidden; touch newfiles/unhidden
# This creates two files in the directory newfiles.
# 4. Type cd oldfiles
# 5. Type ls -al
# This shows two items only: ., which refers to the current directory; and .., which
# refers to the item above this (the parent directory).
# 6. Type ls -al ../newfiles
# In this command, you are using a relative pathname to refer to the contents of
# the /home/$USER/newfiles directory.
# 7. Use the command cp -a ../newfiles/ . (notice the space between the / and the . at
# the end of the command).
# 8. Type ls -a
# You see that you have created the subdirectory newfiles into the directory oldfiles.
# 9. Make sure that you are still in /home/$USER/oldfiles, and type rm -rf newfiles
# 10. Now use the command cp -a ../newfiles/* . (notice the space between the *
# and .). Type ls -al to see what has been copied now. You’ll see that the hidden file
# has not been copied.
# 11. To make sure that you copy hidden files as well as regular files, use cp -a
# ../newfiles/. .
# 12. Verify the command worked this time, using ls -al
# You’ll notice that the hidden files as well as the regular files have been success-
# fully copied.

# links 
# Links on Linux are like aliases that are assigned to a file. There are symbolic links, and there are hard links. 

# hard links
# Linux stores administrative data about files in inodes. The inode is used to store all
# administrative data about files. Every file on Linux has an inode, and in the inode,
# important information about the file is stored:
# The data block where the file contents are stored
# The creation, access, and modification date
# Permissions
# File owners
# Just one important piece of information is not stored in the inode: the name of the file. 
# Names are stored in the directory, and each filename knows which inode it has to address to access further file information. 
# It is interesting to know that an inode does not know which name it has; it just knows how many names are associated with the inode. 
# These names are referred to as hard links. 
# So every file always has one hard link to start with, which is the name of the file
# When you create a file, you give it a name. Basically, this name is a hard link. 
# On a Linux file system, multiple hard links can be created to a file. 
# This is useful if a file with the same contents needs to be available at multiple locations, and you need an easy solution to keep the contents the same. 
# If a change is applied to any one of the hard links, it will show in all other hard links as well, as all hard links point to the same data blocks. 
# Some restrictions apply to hard links, though:
# Hard links must exist all on the same device (partition, logical volume, etc).
# You cannot create hard links to directories.
# When the last name (hard link) to a file is removed, access to the file’s data is also removed.

# soft links
# A symbolic link (also referred to as a soft link) does not link directly to the inode but to the name of the file. 
# This makes symbolic links much more flexible, but it also has some disadvantages. 
# The advantage of symbolic links is that they can link to files on other devices, as well as on directories. 
# The major disadvantage is that when the original file is removed, the symbolic link becomes invalid and does not work any longer

# create links
ln /etc/hosts .     # Creates a link to the file /etc/hosts in the current directory
ln -s /etc/hosts .  # Creates a symbolic link to the file /etc/hosts in the current directory
ln -s /home /tmp    # Creates a symbolic link to the directory /home in the directory /tmp

# exercises removing links
# Removing links can be dangerous. To show you why, let’s consider the following procedure.
# 1. Make a directory named test in your home directory: mkdir ~/test
# 2. Copy all files that have a name starting with a, b, c, d, or e from /etc to this directory: cp /etc/[a-e]* ~/test
# 3. Type ls -l ~/test/ to verify the contents of the test directory.
# 4. Make sure that you are in your home directory, by using cd without arguments.
# 5. Type ln -s test link
# 6. Type rm link. This removes the symbolic link. (Do not use -r or -f to remove symbolic links, even if they are subdirectories.)
# 7. Type ls -l. You’ll see that the symbolic link has been removed.
# 8. Let’s do it again. Type ln -s test link to create the link again.
# 9. Type rm -rf link/ (which is what you would get by using Bash command-line completion).
# 10. Type ls. You’ll see that the directory link still exists.
# 11. Type ls test/. You’ll see the directory test is now empty.

# exercise working with links
# 1. From your home directory, type ln /etc/passwd . (Make sure that the command
# ends with a dot that has a space before it!) This command gives you an “oper-
# ation not permitted” error because you are not the owner of /etc/passwd.
# 2. Type ln -s /etc/passwd . (Again, make sure that the command ends with a space
# and a dot!) This works; you do not have to be the owner to create a symbolic link.
# 3. Type ln -s /etc/hosts (this time with no dot at the end of the command). 
# You’ll notice this command also works. If the target is not specified, the link is created in the current directory.
# 4. Type touch newfile and create a hard link to this file by using ln newfile linkedfile
# 5. Type ls -l and notice the link counter for newfile and linkedfile, which is currently set to 2.
# 6. Type ln -s newfile symlinkfile to create a symbolic link to newfile.
# 7. Type rm newfile
# 8. Type cat symlinkfile. You will get a “no such file or directory” error message because the original file could not be found.
# 9. Type cat linkedfile. This gives no problem.
# 10. Type ls -l and look at the way the symlinkfile is displayed. Also look at linkedfile, which now has the link counter set to 1.
# 11. Type ln linkedfile newfile
# 12. Type ls -l again. You’ll see that the original situation has been restored.

# tar command
# create an archive
tar -cvf /root/homes.tar /home
# add to an existing archive
tar -rvf /root/homes.tar /etc/hosts
# update an existing archive
tar -uvf /root/homes.tar /home
# check contents
tar -tvf /root/homes.tar
# extract archive
tar -xvf /root/etc.tar etc/hosts
# The Tape ARchiver (tar) utility is used to archive and dearchive files and folders.

# tar options
# Option  Use
# c       Creates an archive.
# v       Shows verbose output while tar is working.
# t       Shows the contents of an archive.
# z       Compresses/decompresses the archive while creating it, by using gzip.
# j       Compresses/decompresses the archive by using bzip2.
# J       Compresses/decompresses the archive using xz.
# x       Extracts an archive.
# u       Updates an archive; only newer files will be written to the archive.
# C       Changes the working directory before performing the command.
# r       Appends files to an archive.

# exercises tar
# 1. Open a root shell on your server. When you log in, the home directory of user
# root will become the current directory, so all relative filenames used in this exercise refer to /root/.
# 2. Type tar cvf etc.tar /etc to archive the contents of the /etc directory.
# 3. Type file etc.tar and read the information that is provided by the command.
# This should look like the following:
# [root@server1 ~]# file etc.tartar: POSIX tar archive (GNU)
# 4. Type gzip etc.tar to compress the tar file, which packages it into the file etc.tar.gz.
# 5. Type tar tvf etc.tar.gz Notice that the tar command has no issues reading from a gzip compressed file. 
# Also notice that the archive content consists of all relative filenames.
# 6. Type tar xvf etc.tar.gz etc/hosts
# 7. Type ls -R Notice that a subdirectory etc has been created in the current directory. 
# In this subdirectory, the file hosts has been restored.
# 8. Type gunzip etc.tar.gz This decompresses the compressed file but does not
# change anything else with regard to the tar command.
# 9. Type tar xvf etc.tar -C /tmp etc/passwd This extracts the password file
# including its relative pathname to the /tmp directory. Use ls -l /tmp/etc/ passwd to verify.
# 10. Type tar cjvf homes.tar /home This creates a compressed archive of the home directory to the home directory of user root.
# 11. Type rm -f *gz *tar to remove all files resulting from exercises in this chapter from the home directory of /root.

# sample review questions for spaced repetition
# 1. Which directory would you go to if you were looking for configuration files?
# 2. Which command enables you to display a list of current directory contents, with the newest files listed first?
# 3. Which command enables you to rename the file myfile to yourfile?
# 4. Which command enables you to wipe an entire directory structure, including all of its contents?
# 5. How do you create a link to the directory /tmp in your home directory?
# 6. How would you copy all files that have a name that starts with a, b, or c from the directory /etc to your current directory?
# 7. Which command enables you to create a link to the directory /etc in your home directory?
# 8. What is the safe option to remove a symbolic link to a directory?
# 9. How do you create a compressed archive of the directories /etc and /home and write that archive to /tmp/etchome.tgz?
# 10. How would you extract the file /etc/passwd from /tmp/etchome.tgz that you have created in the previous step?

# lab
# 1. Log in and use sudo -i to open a root shell. In the home directory of root, 
# create one archive file that contains the contents of the /home directory and the /etc directory. 
# Use the name /root/essentials.tar for the archive file.
# 2. Copy this archive to the /tmp directory. Also create a hard link to this file in the / directory.
# 3. Rename the file /essentials.tar to /archive.tar.
# 4. Create a symbolic link in the home directory of the user root that refers to
# /archive.tar. Use the name link.tar for the symbolic link.
# 5. Remove the file /archive.tar and see what happened to the symbolic link.
# Remove the symbolic link also.
# 6. Compress the /root/essentials.tar file.

# common text file tools

# Dump the contents of the text file on the screen
cat /etc/passwd

# Open the text file in a pager for easy reading
less /etc/passwd
# you can easily search for specific contents in less using /sometext for a forward search and ?sometext for a backward search
# Press G to go to the last line in the file.
# Press q to quit less

# Show the bottom 5 lines of the text file
tail -n 5 /etc/passwd

# Show the top 5 lines of the text file
head -n 5 /etc/passwd

# Filter specific columns
# filter out the first field of the /etc/passwd file
cut -d : -f 1 /etc/passwd

# Sort content
du -h | sort -rn
# Sort a list of files in reverse numeric order
sort -k3 -t : /etc/passwd
# Sort by column 3 and ":" separator

# count words
ps aux | wc

# regex
# Regular   Expression Use
# ^text     Matches line that starts with specified text.
# text$     Matches line that ends with specified text.
# .         Wildcard. (Matches any single character.)
# [abc]     Matches a, b, or c.
# ?         Extended regular expression that matches zero or one of the preceding character.
# +         Extended regular expression that matches one or more of the preceding character.
# *         Matches zero to an infinite number of the previous character.
# \{2\}     Matches exactly two of the previous character.
# \{1,3\}   Matches a minimum of one and a maximum of three of the previous character.
# colou?r   Matches zero or one of the previous character. This makes the previous character optional, which in this example would match both color and colour.
# (…)       Used to group multiple characters so that the regular expression can be applied to the group.

# exercise
# Step 1. Create a text file with the name regex.txt and the following contents:
# bat
# boot
# boat
# bt
# Step 2. Use grep 'b.*t' regex.txt to see any line that starts with a b and ends with a t.
# Step 3. Use grep 'b.+t' regex.txt. You might expect to see only lines that have at least three characters, but you don’t, because you are using an extended
# regular expression, and without using any additional options, grep doesn’t recognize the extended regular expression.
# Step 4. Use grep -E 'b.+t' regex.txt. Now you see that the extended regular expression does work as expected. 

# grep options
# Option Use
# -i     Matches upper- and lowercase letters (i.e., not case sensitive).
# -v     Shows only lines that do not contain the regular expression.
# -r     Searches files in the current directory and all subdirectories.
# -e     Searches for lines matching more than one regular expression. Use
# -e     before each regular expression you want to use.
# -E     Interprets the search pattern as an extended regular expression.
# -A     <number> Shows <number> of lines after the matching regular expression.
# -B     <number> Shows <number> of lines before the matching regular expression.

# grep exercises
# 1. Type grep ' #'/etc/services. This shows that the file /etc/services contains a number of lines that start with the comment sign, #.
# 2. To view the configuration lines that really matter, type grep -v '^#' /etc/ services. This shows only lines that do not start with a #.
# 3. Type grep -v '^#' /etc/services -B 5. This shows lines that do not start with a # sign but also the five lines that are directly before each of those lines, which is useful because in the preceding lines you’ll typically find comments on how to use the specific parameters. 
# However, you’ll also see that many blank lines are displayed.
# 4. Type grep -v -e '^#' -e '^$'/etc/services. This excludes all blank lines and lines that start with #.

# text processing awk
awk -F : '{ print $4 }' /etc/passwd
# show the fourth field from /etc/passwd:
awk -F : '/user/ { print $4 }' /etc/passwd
# search the /etc/passwd file for the text user and print the fourth field of any matching line.

# text processing sed
sed -n 5p /etc/passwd
# print the fifth line from the /etc/passwd file:
sed -i s/old-text/new-text/g ~/myfile
# search for the text old-text in ~/myfile and replace all occurrences with the text new-text
sed -i -e '2d;20,25d' ~/myfile 
# delete lines 2 and 20 through 25 in the file ~/myfile

# sample review questions for spaced repetition
# 1. Which command enables you to see the results of the ps aux command in a way that you can easily browse up and down in the results?
# 2. Which command enables you to show the last five lines from ~/samplefile? 
# 3. Which command do you use if you want to know how many words are in ~/samplefile?
# 4. After opening command output using tail -f ~/mylogfile, how do you stop showing output?
# 5. Which grep option do you use to exclude all lines that start with either a # or a ;?
# 6. Which regular expression do you use to match one or more of the preceding characters?
# 7. Which grep command enables you to see text as well as TEXT in a file?
# 8. Which grep command enables you to show all lines starting with PATH, as well as the five lines just before that line?
# 9. Which sed command do you use to show line 9 from ~/samplefile?
# 10. Which command enables you to replace all occurrences of the word user with the word users in ~/samplefile?

# lab 
# 1. Describe two ways to show line 5 from the /etc/passwd file.
# 2. How would you locate all text files on your server that contain the current IP address? Do you need a regular expression to do this?
# 3. You have just used the sed command that replaces all occurrences of the text Administrator with root. Your Windows administrators do not like that very much. How do you revert?
# 4. Assuming that in the ps aux command the fifth line contains information about memory utilization, how would you process the output of that command to show the process that has the heaviest memory utilization first in the results list?
# 5. Which command enables you to filter the sixth column of ps aux output?
# 6. How do you delete the sixth line from the file ~/myfile?

# reboot server
systemctl reboot    # or reboot
systemctl halt      # or halt
systemctl poweroff  # or poweroff

# remote connectivity ssh
ssh root@remoteserver # ip or dns can be used for identifying remoteserver
# To access a server using SSH, you need the sshd server process, as well as an SSH client. 
# On the remote server that you want to access, the sshd service must be running and offering services,
# which it does at its default port 22, and it should not be blocked by the firewall. 
# After installation, Red Hat Enterprise Linux starts the sshd process automatically, 
# and by default it is not blocked by the firewall.

# These exercises assume that a remote server is available and reachable. 
# In this exercise, server1 is used as the local server, 
# and server2 is the remote server on which the sshd process should be up and running.

# exercises
# 1. Open a root shell on server2. 
# Type systemctl status sshd. This should show you that the sshd process is currently up and running.
# 2. Type ip a | grep 'inet '. 
# (Notice the space between inet and the closing quote mark.) 
# Notice the IPv4 address your server is currently using. 
# In the rest of this exercise, it is assumed that server2 is using IP address 192.168.4.220. 
# Replace that address with the address that you have found here.
# 3. Open a shell as a nonprivileged user on server1.
# 4. On server1, type ssh root@192.168.4.220. 
# This connects to the sshd process on server2 and opens a root shell.
# 5. Before being prompted for a password, you see a message indicating that the authenticity of
# host 192.168.4.220 cannot be established. 
# This message is shown because the host you are connecting to is not yet known on your current host, 
# which might involve a security risk. Type yes to continue.
# 6. When prompted, enter the root password. After entering it, you now are logged in to server2.
# 7. Type w. Notice that the SSH session you have just opened shows as just another pseudo terminal session, 
# but you’ll see the source IP address in the FROM column.
# 8. Type exit to close the SSH session.

# coppy files via ssh
scp /etc/hosts server2:/tmp
# copy the /etc/hosts file from the local machine to the /tmp directory on server2 using your current user account,
scp root@server2:/etc/passwd ~
# connect to server2 as user root to copy the /etc/passwd file to your home directory
scp -r server2:/etc/ /tmp

# sftp is a secure alternative to scp
sftp ftpuser@192.168.1.231:/home/ftpuser/new_file1 /home/someuser/new_local_dir
# sftp {user}@{remote-host}:{remote-file-name} {local-file-name}
# download from remote
sftp fx_zzzzz@filex-m1.oclc.org:/xfer/metacoll/in/bib/ <<EOF
put 1234567.zzzzz.bibs.20200101.mrc
quit
EOF
# sftp {user}@{host}:{remote-path} <<EOF 
# sftp_commands ...
# EOF
# heredoc explained
# https://tldp.org/LDP/abs/html/here-docs.html

# sftp exercises
# 1. From a sudo shell, add a line that matches the server2 IP address to the hostname server2.
# 2. From a terminal, type sftp student@server2. 
# This gives you access to an SFTP prompt that is opened on server2.
# 3. Type ls. 
# You’ll see files in the current working directory on the remote server.
# 4. Type pwd. 
# This shows the current directory on the remote server.
# 5. Type lpwd. 
# This shows your local current directory.
# 6. Type lcd /tmp. 
# This changes the local current directory to /tmp.
# 7. Type put /etc/hosts. 
# This file will upload the /etc/hosts file from server1 to the user student home directory on server2.
# 8. Type exit to close your SFTP session.

# sync files
rsync -avz /home/karl/ /mnt/usbstore
# This would recursively transfer all files from the directory src/bar on the machine foo into the /data/tmp/bar directory on the local machine.  
# The files  are  transferred  in  archive  mode, which  ensures  that  symbolic links, devices, attributes, permissions, ownerships, etc. are preserved in the transfer.  
# Additionally, compression will be used to reduce the size of data portions of the transfer.

# ssh keys
# SSH is more secure when using public/private keys for authentication. 
# This authentication method is normally enabled by default 
# because it is more secure than password-based authentication. 
# Only if that is not possible is a password login used. 
# The only thing you need to do to enable key-based login is to create a key pair; 
# everything else is organized by default already.
# When using public/private key-based authentication, 
# the user who wants to connect to a server generates a public/private key pair. 
# The private key needs to be kept private and will never be distributed. 
# The public key is stored in the home directory of the target user on the SSH server in the file .ssh/authorized_keys.
# When authenticating using key pairs, the user generates a hash derived from the private key. 
# This hash is sent to the server, 
# and if on the server it proves to match the public key that is stored on the server, 
# the user is authenticated.

# ssh key exercises
# 1. On server 1, type ssh-keygen.
# 2. When asked for the filename in which to store the (private) key, 
# accept the default filename ~/.ssh/id_rsa.
# 3. When asked to enter a passphrase, press Enter twice.
# 4. The private key now is written to the ~/.ssh/id_rsa file 
# and the public key is written to the ~/.ssh/id_rsa.pub file.
# 5. Use ssh-copy-id server2 to copy to server2 the public key you have just created. 
# You are then asked for the password on the remote server one last time.
# 6. After copying the public key, verify that it can actually be used for authentication. 
# To do this, type ssh server2. 
# You should now authenticate without having to enter the password for the remote user account.

# Lab 
# 1. Set up SSH-based authentication. From server2, use SSH to connect to server1.
# 2. Make sure that graphical applications are supported through the SSH session. 
# Also set up key-based authentication so that no password has to be entered while connecting to the remote server.

# user and group management

# Linux typically has two main types of user accounts: 
# regular users and the superuser (often called "root"). 
# Regular users have limited privileges and can perform most tasks but not system-level configurations. 
# The root user has unrestricted access and can modify system files and settings.

# show user info
id cip
# uid=1000(cip) gid=1000(cip) groups=1000(cip),10(wheel)

# switch user
su root
# check what the difference is between using "-" in the command or not
# su - root vs su root

# execute command as root
sudo ls /root

# add user to wheel group
usermod -aG wheel user

# edit the sudoers file
visudo
# check and make sure the line %wheel ALL=(ALL) ALL is included for access to all admin commands
# if you included the line linda ALL=/usr/bin/useradd, /usr/bin/passwd in this file, 
# that would allow user linda to run only the commands useradd and passwd with the sudo command

# While using sudo, you are prompted to enter a password. 
# Based on this password a token is generated, 
# it allows you to run new sudo commands without having to enter the password again. 
# However, this token is valid for only five minutes. 
# It is possible to extend the lifetime of the token: 
# include the following in /etc/sudoers (using visudo) to extend the token lifetime to 240 minutes:
# Defaults timestamp_timeout=240

# allow most admin commands except some
# include the line bellow in visudo
# linda ALL=/usr/bin/useradd, /usr/bin/passwd, ! /usr/bin/passwd root

# sudo with pipes
# get a list of all packages that have the string “ssh” in their name
sudo sh -c "rpm -qa | grep ssh"

# exercises sudo
# 1. Type sudo -i to open a sudo root shell. 
# When prompted for a password, enter the password assigned to user student.
# 2. Use useradd betty; useradd amy to create two users.
# 3. Type echo password | passwd --stdin betty; echo password | passwd --stdin amy 
# to set the password for these two users. Type exit to return to the user student shell.
# 4. Use su - betty to open a shell as user betty. 
# When prompted for a password, enter the password you’ve just assigned for user betty.
# 5. Type sudo ls /root, enter the user betty password and notice the error message.
# 6. Type exit to return to the shell in which you are user student. 
# Use whoami to verify the current user ID.
# 7. Type sudo sh -c 'echo "betty ALL=(ALL) ALL" > /etc/sudoers.d/betty' 
# to allow full sudo access for betty.
# 8. Use su - betty to open a shell as betty and enter the password of this user when prompted.
# 9. Use sudo ls -l /root to verify that sudo access is working. 
# The /root directory can only be viewed by the root user due to the permissions on that directory.
# 10. Use sudo sh -c ' echo "amy ALL=/usr/sbin/useradd, /usr/bin/passwd, ! /usr/bin/passwd root" > /etc/sudoers.d/amy' 
# to allow user amy to create users and reset user passwords, but not for root.
# 11. Type su - amy and enter user amy’s password when prompted.
# 12. Use sudo passwd betty to verify that you can change the password as user amy.
# 13. Use sudo passwd root to verify that changing the root user password is not allowed.
# 14. Type exit and exit to return to the user student shell. 
# Use whoami to verify that you’re in the right shell.

# check config file /etc/passwd
# Username: 
# This is a unique name for the user. 
# Usernames are important to match a user to their password, 
# which is stored separately in /etc/shadow (see next bullet). 
# On Linux, there can be no spaces in the username, and in general 
# it’s a good idea to specify usernames in all lowercase letters.
# Password: 
# In the old days, the second field of /etc/passwd was used to store the hashed password of the user. 
# Because the /etc/passwd file is readable by all users, 
# this poses a security threat, and for that reason 
# on current Linux systems the hashed passwords are stored in /etc/shadow 
# UID: 
# Each user has a unique user ID (UID). This is a numeric ID. 
# It is the UID that really determines what a user can do. 
# When permissions are set for a user, the UID (and not the username) is stored in the file metadata. 
# UID 0 is reserved for root, the unrestricted user account. 
# The lower UIDs (typically up to 999) are used for system accounts, 
# and the higher UIDs (from 1000 on by default) are reserved for people who need to connect a directory to the server. 
# The range of UIDs that are used to create regular user accounts is set in /etc/login.defs.
# GID: 
# On Linux, each user is a member of at least one group. 
# This group is referred to as the primary group, 
# and this group plays a central role in permissions management
# Users can be a member of additional groups, which are administered in the file /etc/group.
# Comment field: 
# The Comment field, as you can guess, is used to add comments for user accounts. 
# This field is optional, but it can be used to describe what a user account is created for. 
# Directory: 
# This is the initial directory where the user is placed after logging in, also referred to
# as the home directory. If the user account is used by a person, 
# this is where the person would store their personal files and programs. 
# For a system user account, this is the environment where the service can store files it needs while operating.
# Shell: 
# This is the program that is started after the user has successfully connected to a server.
# For most users this will be /bin/bash, the default Linux shell. 
# For system user accounts, it will typically be a shell like /sbin/nologin. 
# The /sbin/nologin command is a specific command that silently denies access to users 
# (to ensure that if by accident an intruder logs in to the server, the intruder cannot get any shell access). 
# Optionally, you can create an /etc/nologin.txt file, in which case only root will be able to log in 
# but other users will see the contents of this file when their logins are denied.

# check config file /etc/shadow
# Login name: 
# Notice that /etc/shadow does not contain any UIDs, but usernames only. 
# This opens up a possibility for multiple users using the same UID but different passwords 
# (which, by the way, is not recommended).
# Encrypted password: 
# This field contains all that is needed to store the password in a secure way. 
# If the field is empty, no password is set and the user cannot log in. 
# If the field starts with an exclamation mark, login for this account currently is disabled.
# Days since Jan. 1, 1970, that the password was last changed: 
# Many things on Linux refer to this date, which on Linux is considered the beginning of time. 
# It is also referred to as epoch.
# Days before password may be changed: 
# This allows system administrators to use a stricter password policy, 
# where it is not possible to change back to the original password 
# immediately after a password has been changed. 
# Typically this field is set to the value 0.
# Days after which password must be changed: 
# This field contains the maximal validity period of passwords. 
# Notice in the last line of Example 6-3 that it is set to 99,999 (about 274 years), which is the default.
# Days before password is to expire that user is warned: 
# This field is used to warn a user when a forced password change is upcoming. 
# Notice in the last line of Example 6-3 that it is set to 7 days, 
# which is the default (even if the password validity is set to 99,999 days).
# Days after password expires that account is disabled: 
# Use this field to enforce a password change. 
# After password expiry, the user no longer can log in. 
# After the account has reached the maximum validity period, the account is locked out. 
# This field allows for a grace period in which the user can change her password, 
# but only during the login process. 
# This field is set in days and is unset by default.
# Days since Jan. 1, 1970, that account is disabled: 
# An administrator can set this field to disable an account on a specific date. 
# This is typically a better approach than removing an account, 
# as all associated properties and files of the account will be kept, 
# but the account no longer can be used to authenticate on your server. 
# Note that this field does not have a default value.
# A reserved field, which was once added “for future use”: 
# This field was reserved a long time ago; it will probably never be used.

# create a new user
useradd -m -u 1201 -G sales,ops linda
# create a user linda who is a member of the secondary groups sales and ops with UID 1201 
# and add a home directory to the user account as well.

# dissable login
useradd caroline -s /sbin/nologin 
# make sure this user will not be allowed to log in.

# check useradd default settings in /etc/default/useradd

# check useradd default settings in /etc/login.defs
# MOTD_FILE: 
# Defines the file that is used as the “message of the day” file. 
# In this file, you can include messages to be displayed after the user has successfully logged in to the server.
# ENV_PATH: 
# Defines the $PATH variable, a list of directories that should be searched for executable files after logging in.
# PASS_MAX_DAYS, PASS_MIN_DAYS, and PASS_WARN_AGE: 
# Define the default password expiration properties when creating new users.
# UID_MIN: 
# Indicates the first UID to use when creating new users.
# CREATE_HOME: 
# Indicates whether or not to create a home directory for new users.

# Showing Password Expiry Information
chage -l

# user settings files
# /etc/profile: Used for default settings for all users when starting a login shell
# /etc/bashrc: Used to define defaults for all users when starting a subshell
# ~/.profile: Specific settings for one user applied when starting a login shell
# ~/.bashrc: Specific settings for one user applied when starting a subshell

# exercises create users
# 1. From a sudo shell, type 
vim /etc/login.defs 
# to open the configuration file /etc/login.defs 
# and set the PASS_MAX_DAYS to use the value 99 before you start creating users. 
# Look for the parameter CREATE_HOME and make sure it is set to “yes.”
# 2. Use 
cd /etc/skel 
# to go to the /etc/skel directory. 
# Type mkdir fotos and mkdir files to add two default directories to all user home directories. 
# Also change the contents of the file .bashrc toinclude the line export EDITOR=/usr/bin/vim, 
# which sets the default editor for tools that need to modify text files.
# 3. Type useradd linda to create an account for user linda. 
# Then, type id linda to verify that linda is a member of a group with the name linda and nothing else. 
# Also verify that the directories Pictures and Documents have been created in user linda’s home directory.
# 4. Use passwd linda to set a password for the user you have just created. 
# Use the password : password.
# 5. Type 
passwd -n 30 -w 3 -x 90 linda 
# to change the password properties. 
# This has the password expire after 90 days (-x 90). 
# Three days before expiry, the user will get a warning (-w 3), 
# and the password has to be used for at least 30 days before (-n 30) it can be changed.
# 6. Create a few more users: 
# lucy, lori, and bob, using 
for i in lucy lori bob; do useradd $i; done
# You may get an error message stating the user already exists. 
# This message can be safely ignored.
# 7. Use 
grep lori /etc/passwd /etc/shadow /etc/group
# This shows the user lori created in all three critical files and confirms they have been set up correctly.

# check group settings file
vim /etc/group
# Group name: 
# As is suggested by the name of the field, it contains the name of the group.
# Group password: 
# Where applicable, this field contains a group password, a feature that is hardly used anymore. 
# A group password can be used by users who want to join the group on a temporary basis, 
# so that access to files the group has access to is allowed. 
# If a group password is used, it is stored in the /etc/gshadow file, 
# as that file is root accessible only.
# Group ID: 
# This field contains a unique numeric group identification number.
# Members: 
# Here you find the names of users who are a member of this group as a secondary group. 
# Note that this field does not show users who are a member of this group as their primary group.

# create group
groupadd examplegroup

# modify group
groupmod -n newgroupname oldgroupname
# change a group name

# exercises group
# 1. Open a sudo shell and type 
groupadd sales 
# followed by 
groupadd account 
# to add groups with the names sales and account.
# 2. Use usermod to add users linda and laura to the group sales, and lori and bob to the sales group account:
usermod -aG sales linda
usermod -aG sales lucy
usermod -aG account lori
usermod -aG account bob
id linda
# 3. Type id linda to verify that user linda has correctly been added to the group sales. 
# In the results of this command, you see that linda is assigned to a group with the name linda. 
# This is user linda’s primary group and is indicated with the gid option. 
# The groups parameter shows all groups user linda currently is a member of, 
# which includes the primary group as well as the secondary group sales that the user has just been assigned to.
# uid=1000(linda) gid=1000(linda) groups=1000(linda),1001(sales)

# lab 1
# Create two groups: sales and account.
# Create users joana, john, laura, and beatrix. 
# Make sure they have their primary group set to a private group that has the name of the user.
# Make joanna and john members of the group sales, and laura and beatrix members of the group account.
# Set a password policy that requires users to change their password every 90 days.

# lab 2
# Create a sudo configuration that allows user bill to manage user properties and passwords, 
# but which does not allow this user to change the password for the root user.

# permissions

# see file perm
ls -l

# find all files owned by a certain user
find / -user cip

# find all files owned by a certain group
find / -group users

# change user owner
chown linda myfile

# change owner for all underlying files
chown -R linda /myfolder

# change owner and group
chown lisa.sales myfile
chown lisa:sales myfile

# change just group
chown .sales myfile
chown :sales myfile
chgrp account /home/account

# when a user creates a file, default ownership is applied. 
# The user who creates the file automatically becomes user owner, 
# and the primary group of that user automatically becomes group owner.

# When user is a part of multiple groups
# they can select the primary one (default one)

# list default group for user
groups cip

# change default group for user
sudo usermod -g ops vagrant

# Permission  Applied to Files            Applied to Directories
# Read        View file content           List contents of directory
# Write       Change contents of a file   Create and delete files and subdirectories
# Execute     Run a program file          Change to the directory

# Permission  Numeric Representation
# Read        4
# Write       2
# Execute     1

# change permission to a file
chmod 755 /somefile
# umask version
chmod +x somefile
# +-rwx version
chmod g+w,o-r somefile
# u user, g group, o other, a all, +-rwx version

# check diff between the two commands bellow
chmod -R a+X /dir
chmod -R a+x /dir
# This ensures that subdirectories will obtain the execute permission 
# but the execute permission is not applied to any files.

# exercises
# 1. From a root shell, type mkdir -p /data/sales /data/account.
# 2. Before setting the permissions, change the owners of these directories 
# using chown linda.sales /data/sales and chown linda.account /data/account.
# 3. Set the permissions to enable the user and group owners to write files to these directories, 
# and deny all access for all others: chmod 770 /data/sales, and next chmod 770 /data/account.
# 4. Use su - laura to become user laura and change into the directory /data/account. 
# Use touch emptyfile to create a file in this directory. Does this work? Type groups to figure out why.
# 5. Still as user laura, use cd /data/sales and use touch emptyfile to create a file in this directory. 
# Does this work? Type groups to figure out why.

# SUID permission (special user permission)
# A file with SUID always executes as the user who owns the file, 
# regardless of the user passing the command.
# check perm for file containing passwords
ls -l /usr/bin/passwd
# You can see the SUID permission as an s at the position 
# where normally you would expect to see the x for the user permissions 
# (the lowercase s means that both SUID and execute are set, 
# an uppercase S would mean that only SUID is set)
# when a user is changing their password, 
# the user temporarily has root permissions 
# because the /usr/bin/passwd utility is owned by the root user,

# The second special permission is set group ID (SGID). 
# This permission has two effects. 
# If set on a file, it allows the file to be executed 
# as the group that owns the file (similar to SUID)
# If set on a directory, any files created in the directory
# will have their group ownership set to that of the directory owner

# The third of the special permissions is sticky bit. This permission is useful to protect files against
# accidental deletion in an environment where multiple users have write permissions in the same
# directory. If sticky bit is applied, a user may delete a file only if they are the user owner of the file
# or of the directory that contains the file. It is for that reason that sticky bit is applied as a default
# permission to the /tmp directory, and it can be useful on shared group directories as well.

# When using ls -l, you can see sticky bit as a T at the position where you normally see the execute
# permission for others (a lowercase t indicates that sticky bit as well as the execute permission for
# the others entity are set, whereas uppercase T indicates that only sticky bit is set):
ls -ld account/
# example sticky bit

# apply SUID
chmod u+s
# apply SGID
use chmod g+s
# apply sticky bit 
use chmod +t

# exercises
# 1. Use su - linda to open a terminal in which you are user linda.
# 2. Use cd /data/sales to go to the sales directory. 
# Use touch linda1 and touch linda2 to create two files of which linda is the owner.
# 3. Use su - laura to switch the current user identity to user laura, 
# who also is a member of the sales group.
# 4. Use cd /data/sales again, and from that directory, 
# use ls -l. You’ll see the two files that were created by user linda 
# that are group-owned by the group linda. 
# Use rm -f linda*. This will remove both files.
# 5. Use the commands touch laura1 laura2 to create two files that are owned by user laura.
# 6. Use su - to escalate your current permissions to root level.
# 7. Use chmod g+s,o+t /data/sales to set the group ID bit 
# as well as sticky bit on the shared group directory.
# 8. Use su - linda and type cd /data/sales. First, use touch linda3 linda4. 
# You should now see that the two files you have created are owned by the group sales, 
# which is group owner of the directory /data/sales.
# 9. Use rm -rd laura*. Normally, sticky bit prevents you from doing so, 
# but because user linda is the owner of the directory that contains the files, 
# you are allowed to do it anyway!

# optional
# An alternative method of securing files on a Linux server is by working with attributes. 
# Attributes do their work regardless of the user who accesses the file.

# A     This attribute ensures that the file access time of the file is not modified. Normally, every
#       time a file is opened, the file access time must be written to the file’s metadata. This affects
#       performance in a negative way; therefore, on files that are accessed on a regular basis, the A
#       attribute can be used to disable this feature.
# a     This attribute allows a file to be added to but not to be removed.
# c     If you are using a file system where volume-level compression is supported, this file attribute
#       makes sure that the file is compressed the first time the compression engine becomes active.
# D     This attribute makes sure that changes to files are written to disk immediately, and not to
#       cache first. This is a useful attribute on important database files to make sure that they do not
#       get lost between file cache and hard disk.
# d     This attribute makes sure the file is not backed up in backups where the legacy dump utility
#       is used.
# I     This attribute enables indexing for the directory where it is enabled.
# i     This attribute makes the file immutable. Therefore, no changes can be made to the file at all,
#       which is useful for files that need a bit of extra protection.
# s     This attribute overwrites the blocks where the file was stored with 0s after the file has been
#       deleted. This makes sure that recovery of the file is not possible after it has been deleted.
# u     This attribute saves undelete information. This allows a utility to be developed that works
#       with that information to salvage deleted files.

# exercises
# 1. Open a root shell.
# 2. Create a file named touch /root/myfile3. Set the immutable permission to chattr +i /root/myfile
# 4. Try to remove the file: rm -f /root/myfile. You can’t!
# 5. Remove the attribute again: chattr -i /root/myfile
# To get an overview of all attributes that are currently applied, use the lsattr command.

# lab
# 1. Set up a shared group environment. If you haven’t created these directories in a previous
# exercise yet, create two directories: /data/account and /data/sales. Make the group sales the
# owner of the directory sales, and make the group account the owner of the directory account.
# 2. Configure the permissions so that the user owner (which must be root) and group owner have
# full access to the directory. There should be no permissions assigned to the others entity.
# 3. Ensure that all new files in both directories inherit the group owner of their respective
# directory. This means that all files that will be created in /data/sales will be owned by the group
# sales, and all files in /data/account will be owned by the group account.
# 4. Ensure that users are only allowed to remove files of which they are the owner.

# networking

# aditional resources
# https://iximiuz.com/en/posts/computer-networking-101/?utm_medium=reddit&utm_source=r_programming

# https://www.hacker101.com/
# https://www.hackerone.com/

# IPv4 addresses: 
# These are based on 32-bit addresses and have four octets, separated by dots, such as 192.168.10.100.
# IPv6 addresses: 
# These are based on 128-bit addresses and are written in eight groups of hexadecimal numbers that are 16 bits each and separated by colons. 
# An IPv6 address may look like fe80:badb:abe01:45bc:34ad:1313:6723:8798.

# To know to which network a computer belongs, a subnet mask is used with every IP address. The
# subnet mask defines which part of the network address indicates the network and which part
# indicates the node. Subnet masks may be written in the Classless Inter-Domain Routing (CIDR)
# notation, which indicates the number of bits in the subnet mask, or in the classical notation, and
# they always need to be specified with the network address. Examples include 192.168.10.100/24
# (CIDR notation), which indicates that a 24-bit network address is used, and
# 192.168.10.100/255.255.255.0 (classical notation), which indicates exactly the same.

# Often, network masks use multiple bytes. In the example using 192.168.10.100/24, the first 3 bytes
# (the 192.168.10 part) form the network part, and the last byte (the number 100) is the host part on
# that network.

# In IPv4 networks, there is also always a broadcast address. This is the address that can be used to
# address all nodes in the network. In the broadcast address, all node bits are set to 1, which makes
# for the decimal number 255 if an entire byte is referred to. So in the example of the address
# 192.168.10.100/24, the broadcast address is 192.168.10.255.
# sample subnet mask /27 = 11111111.11111111.11111111.11100000
# sample ip address  212.209.113.33 = 11010100.11010001.00001010.00100001

# binary   decimal
# 00000000 0
# 00100000 32
# 01000000 64
# 01100000 96
# 10000000 128
# 10100000 160
# 11000000 192
# 11100000 224

# Each network card also has a 12-byte MAC address.
# MAC addresses are for use on the local network (that is, the local physical network or local WLAN,
# just up to the first router that is encountered); they cannot be used for communications between
# nodes that are on different networks.
# An example of a MAC address is 00:0c:29:7d:9b:17. Notice that each MAC address consists of two
# parts. The first 6 bytes is the vendor ID, and the second 6 bytes is the unique node ID. Vendor IDs
# are registered, and by using registered vendor IDs, it is possible to allocate unique MAC addresses.

# To identify services, port addresses are used. Every service has a specific port address, such as port 80 for
# Hypertext Transfer Protocol (HTTP) or port 22 for a Secure Shell (SSH) server, and in network
# communication, the sender and the receiver are using port addresses. So, there is a destination
# port address as well as a source port address involved in network communications.

# Because not all services are addressed in a similar way, a specific protocol is used between the IP
# address and the port address, such as Transfer Control Protocol (TCP), User Datagram Protocol
# (UDP), or Internet Control Message Protocol (ICMP) (ping uses this). Every protocol has specific properties: TCP is
# typically used when the network communication must be reliable and delivery must be guaranteed;
# UDP is used when it must be fast and guaranteed delivery is not necessary.

# old school video on how the internet works
# https://www.youtube.com/watch?v=hymzoUpM0K0

# osi model layers of protocols of the internet
# https://en.wikipedia.org/wiki/OSI_model

# network adress translation
# go to https://www.whatismyip.com/
# check output of command bellow
ip addr
# NAT is being used by the isp router by default usualy

# DO NOT USE ifconfig any more, it's obsolete on rhel 9
# use ip instead


# localhost / loopback
# The loopback interface is used for communication between processes. Some processes use the IP
# protocol for internal communications. For that reason, you’ll always find a loopback interface, and
# the IP address of the loopback interface is always set to 127.0.0.1.

# Every network has, at least, a default router (also called the default gateway) that is set, 
# and you can see which router is used as the default router
ip route show
# the first line shows that the default route goes through IP address 192.168.4.2, 
# and also shows that network interface ens33 is used by this address
# and that dhcp(dynamic host configuration protocol) is used (ip is assigned dinamically)

# To verify availability of ports on your server, 
# you can use the netstat command or the newer ss command, 
# which provides the same functionality.
# Display All Listening Ports on the Local System
ss -lt

# exercises (config changes done via ip command are not permanent but for safety you may 
# want to use a vm to experiment with network settings)
# 1. Open a root shell to your server and type ip addr show. This shows the current network
# configuration. Note the IPv4 address that is used and the network device names that are used;
# you need these later in this exercise.
# 2. Type ip route show to verify routing configuration.
# 3. If your computer is connected to the Internet, you can now use the ping command to verify the
# connection to the Internet is working properly. Type ping -c 4 8.8.8.8, for instance, to send
# four packets to IP address 8.8.8.8. If your Internet connection is up and running, you should
# get “echo reply” answers.
# 4. Type ip addr add 10.0.0.10/24 dev <yourdevicename>. This will temporarily set a new IP
# address.5. Type ip addr show. You’ll see the newly set IP address, in addition to the IP address that was
# already in use.
# 6. Type ifconfig. Notice that you do not see the newly set IP address (and there are no options
# with the ifconfig command that allow you to see it). This is one example of why you should not
# use the ifconfig command anymore.
# 7. Type ss -tul. You’ll now see a list of all UDP and TCP ports that are listening on your server.

# networking on RHEL 9 is managed by the NetworkManager service. 
# You can use : 
systemctl status NetworkManager 
# to verify its current status
# When NetworkManager comes up, it reads the network card configuration scripts, which are in
# /etc/NetworkManager/system-connections and have a name that starts with the name of the
# network interface the configuration applies to, like ens160.nmconnection.

# device vs config
# A device is a network interface card.
# A connection is the configuration that is used on a device.

# nmcli vs nmtui
# nmcli tool is cool and very powerful, but it’s not the easiest tool available. To
# change network configurations fast and efficiently, you should use the menu-driven
# nmtui utility. It may not be as cool as nmcli, but it allows you to do what you need to
# do in less than a minute,

# To check your user's current permissions, use :
nmcli general permissions

# see all connections
nmcli con show

# see connection details
nmcli con show name-of-connection

# check docs about these settings
man 5 nm-settings

# see all devices
nmcli dev status

# see details about a device
nmcli dev show name-of-device

# use double tap tab to use autocompletion for building commands easier

# Run these exercises from a console session, not using an SSH connection.
# 1. Create a new network connection by typing nmcli con add con-name dhcp type ethernet
# ifname ens33 ipv4.method auto.
# 2. Create a connection with the name static to define a static IP address and gateway: nmcli con
# add con-name static ifname ens33 autoconnect no type ethernet ip4 10.0.0.10/24 gw4
# 10.0.0.1 ipv4.method manual. The gateway might not exist in your configuration, but that
# does not matter.
# 3. Type nmcli con show to show the connections, and use nmcli con up static to activate the
# static connection. Switch back to the DHCP connection using nmcli con up dhcp.

# more exercises
# 1. Make sure that the static connection does not connect automatically by using nmcli con mod
# static connection.autoconnect no.
# 2. Add a DNS server to the static connection by using nmcli con mod static ipv4.dns
# 10.0.0.10. Notice that while adding a network connection, you use ip4, but while modifying
# parameters for an existing connection, you often use ipv4 instead. This is not a typo; it is just
# how it works.
# 3. To add a second item for the same parameters, use a + sign. Test this by adding a second DNS
# server, using nmcli con mod static +ipv4.dns 8.8.8.8.
# 4. Using nmcli con mod, you can also change parameters such as the existing IP address. Try
# this by using nmcli con mod static ipv4.addresses 10.0.0.100/24.
# 5. And to add a second IP address, you use the + sign again: nmcli con mod static
# +ipv4.addresses 10.20.30.40/16.
# 6. After changing connection properties, you need to activate them. To do that, you can use nmcli
# con up static.

# Every connection that you create is stored as a configuration file in the directory
# /etc/NetworkManager/system-connections.
# In previous versions of RHEL, network connections were stored in the /etc/sysconfig/network-
# scripts directory. If NetworkManager finds legacy connection scripts in this directory, they will still
# be used, but NetworkManager connection scripts are no longer stored by default at this location.

# There are different ways to change the hostname:
# Use nmtui and select the option Change Hostname.
# Use hostnamectl set-hostname.
# Edit the contents of the configuration file /etc/hostname.
# To configure the hostname with hostnamectl, you can use a command like hostnamectl set-
# hostname myhost.example.com. After setting the hostname, you can use : 
hostnamectl status 
# to show the current hostname.

# dns
# The NetworkManager configuration stores the DNS information in the configuration file for the network
# connection, which is in /etc/sysconfig/network-scripts, and from there pushes the configuration to
# the /etc/resolv.conf file, which is used for DNS name server resolving. Do not edit /etc/resolv.conf
# directly, as it will be overwritten the next time you restart NetworkManager.

# Use nmtui to set the DNS name servers. 
# Use 8.8.8.8 and 8.8.4.4
# Use : 
nmcli con mod <connection-id> [+]ipv4.dns <ip-of-dns>.

# Notice that if your computer is configured to get the network configuration from a DHCP server,
# the DNS server is also set via the DHCP server. If you do not want this to happen, 
# use the following command: 
nmcli con mod <con-name> ipv4.ignore-auto-dns yes

# sample review questions for spaced repetition
# 1. What is the network address in the address 213.214.215.99/29?
# 2. Which command only shows link status and not the IP address?3. You have manually edited the /etc/resolv.conf file to include DNS servers. After a restart your
# modifications have disappeared. What is happening?
# 4. Which file contains the hostname in RHEL 9?
# 5. Which command enables you to set the hostname in an easy way?
# 6. Where does NetworkManager store the configuration that it generates?
# 7. Which configuration file can you change to enable hostname resolution for a specific IP address?
# 8. Is a non-administrator user allowed to change NetworkManager connections?
# 9. How do you verify the current status of the NetworkManager service?
# 10. Which command enables you to change the current IP address and default gateway on your
# network connection?

# lab
# 1. Set up the first server to use the FQDN (fully qualified domain name) server1.example.com 
# (host name (server1) + domain name (example.com)) 
# Set up the second server to use server2.example.com.
# 2. On server1.example.com, use nmtui and configure your primary network card to automatically
# get an IP address through DHCP. Also set a fixed IP address to 192.168.4.210. On server2, set
# the fixed IP address to 192.168.4.220.
# 3. Make sure that from server1 you can ping server2, and vice versa.
# 4. To allow you to access servers on the Internet, make sure that your local DHCP server provides
# the default router and DNS servers.

# software

# Software on Red Hat Enterprise Linux is provided in the Red Hat Package Manager (RPM) format. 
# This is a specific format used to archive the package and provide package metadata as well.

# a repository is an installation source that contains installable packages and an index that contains
# information about the installable packages so that the installation program dnf can compare the
# version of packages currently installed with the version of packages available in the repository.

# list all repos
dnf repolist 
# can be used with enabled and dissabled option as well
# crb may be dissabled by default if you're on stream centos 9

# add a repo 
dnf config-manager --add-repo=http://reposerver.example.com/BaseOS
# you need to edit the repository file in /etc/yum.conf.d after adding it, 
# so that it includes the line gpgcheck=0.
# code /etc/yum.repos.d

# To secure packages in a repository, these packages are often signed with a GPG key. This makes it
# possible to check whether packages have been changed since the owner of the repository provided
# them. The GPG key used to sign the software packages is typically made available through the
# repository as well. The users of the repository can download that key and store it locally so that the
# package signature check can be performed automatically each time a package is downloaded from
# the repository.

# create your own repo
# 1. Insert the installation disk in your virtual machine and make sure it is attached and available.
# 2. Open a root shell and type mkdir /repo so that you have a mount point where you can mount
# the ISO file.
# 3. Add the following line to the end of the /etc/fstab configuration file: /dev/sr0 /repo iso9660
# defaults 0 0
# 4. Type mount -a, followed by mount | grep sr0. You should now see that the optical device is
# mounted on the directory /repo. At this point, the directory /repo can be used as a repository.5. Now, two subdirectories are available through the /repo directory. The BaseOS repository
# provides access to the base packages, and the Application Stream (AppStream) repository
# provides access to application streams (these repositories are described in more detail in the
# “Managing Package Module Streams” section later in this chapter). To make them accessible,
# you need to add two files to the /etc/yum.repos.d directory. Start with the file BaseOS.repo. You
# can generate this file using dnf config-manager --add-repo=file:///repo/BaseOS
# 6. Add the file /etc/yum.repos.d/AppStream.repo using the following command: dnf config-
# manager --add-repo=file:///repo/AppStream
# 7. Type ls /etc/yum.repos.d/. This will show you two new files: repo_BaseOS.repo and
# repo_AppStream.repo. Add the following line to the end of both files: gpgcheck=0
# 8. Type dnf repolist to verify the availability of the newly created repository. It should show the
# name of both repositories, including the number of packages offered through this repository
# (see Example 9-3). Notice that if you’re doing this on RHEL, you’ll also see a message that this
# system is not registered with an entitlement server. You can safely ignore that message.

# search for a package
dnf search user

# get more details about a package
dnf info nmap

# install a package
dnf install nmap

# uninstall a package
dnf remove nmap

# see installed packages
dnf list

# update a package
dnf update package-name

# To make it easier to manage specific functionality, instead of specific packages, you can work with package groups as well.
# see installed package groups
dnf group list
# used dnf group list hidden to see all

# see more info about groups
dnf group info

# see dnf history
dnf history

# exercises dnf
# 1. Type dnf repolist to show a list of the current repositories that your system is using.
# 2. Type dnf search seinfo. This will give no matching result.
# 3. Type dnf provides seinfo. The command shows that the setools-console-<version> package
# contains this file.
# 4. Install this package using dnf install -y setools-console. Depending on your current
# configuration, you might notice that quite a few dependencies have to be installed also.
# 5. Type dnf list setools-console. You see that the package is listed as installed.
# 6. Type dnf history and note the number of the last dnf command you used.
# 7. Type dnf history undo <nn> (where <nn> is replaced with the number that you found in
# step 6). This undoes the last action, so it removes the package you just installed.
# 8. Repeat the dnf list setools-console command. The package is now listed as available but not
# as installed.

# A module describes a set of RPM packages that belong together, and adds features to package management. 
# Typically, modules are organized around a specific version of an application, 
# and in a module you’ll find module packages, together with all of the dependencies for that specific version.

# A stream contains one specific version, and updates are provided for a specific stream. 
# By using streams, different versions of packages can be offered through the same repositories. 
# When you’re working with modules that have different streams, only one stream can be enabled at the same time. 
# This allows users to select the package version that is needed in their environment.

# A profile is a list of packages that are installed together for a particular use case. 
# You may find, for instance, a minimal profile, a default profile, a # server profile, and many more. 
# While you’re working with modules, you may select which profile you want to use.

# list modules
dnf module list

# list streams for a module
dnf module list maven

# see more profile info
dnf module info php

# If you want to work with a different version, you should start by enabling the corresponding module stream. 
dnf module enable php:8.1

# If you are now on php:8.1 and you want to change to php:8.2 you use : 
dnf module install php:8.2. 
# This will disable the old stream and enable the new stream.
# After doing this, to ensure that all dependent packages that are not in the module itself are updated as well, type :
dnf distro-sync 

# rpm vs dnf
# On your system, two package databases are maintained: the dnf database and the RPM
# database. When you are installing packages through dnf, the dnf database is updated
# first, after which the updated information is synchronized to the RPM database. If you
# install packages using the rpm command, the update is written to the RPM database
# only and will not be updated to the dnf database, which is an important reason not to
# use the rpm command to install software packages.

# exercises rpm
# 1. To practice working with rpm, we need a package. It doesn’t really matter which package that
# is. Type dnf install -y dnsmasq (you may get a message that the package is already installed).
# 2. Type which dnsmasq. This command gives the complete pathname of the dnsmasq
# command.
# 3. Type rpm -qf $(which dnsmasq). This does an RPM file query on the result of the which dnsmasq command
# 4. Now that you know that the dnsmasq binary comes from the dnsmasq package, use rpm -qi
# dnsmasq to show more information about the package.
# 5. The information that is shown with rpm -qi is useful, but it does not give the details that are
# needed to start working with the software in the package. Use rpm -ql dnsmasq to show a list
# of all files in the package.
# 6. Use rpm -qd dnsmasq to show the available documentation. Notice that this command
# reveals that there is a man page, but there is also a doc.html file and a setup.html file in the
# /usr/share/doc/dnsmasq-version directory. Open these files with your browser to get more
# information about the use of dnsmasq.
# 7. Type rpm -qc dnsmasq to see which configuration files are used by dnsmasq.
# 8. After installation, it does not make much sense, but it is always good to know which scripts are
# executed when a package is installed. Use rpm -q --scripts dnsmasq to show the script code
# that can be executed from this RPM.

# sample review questions for spaced repetition
# 1. You have a directory containing a collection of RPM packages and want to make that directory a
# repository. Which command enables you to do that?
# 2. What needs to be in the repository file to point to a repository on http://server.example.com/repo?
# 3. You have just configured a new repository to be used on your RHEL computer. Which command
# enables you to verify that the repository is indeed available?
# 4. Which command enables you to search the RPM package containing the file useradd?5. Which two commands do you need to use to show the name of the dnf group that contains security
# tools and shows what is in that group?
# 6. Which command do you use to ensure that all PHP-related packages are going to be installed using
# the older version 7.1, without actually installing anything yet?
# 7. You want to make sure that an RPM package that you have downloaded does not contain any
# dangerous script code. Which command enables you to do so?
# 8. Which command reveals all documentation in an RPM package?
# 9. Which command shows the RPM package a file comes from?
# 10. Which command enables you to query software from the repository?

# lab
# 1. Copy some RPM files from the installation disk to the /myrepo directory. Make this directory a
# repository and make sure that your server is using this repository.
# 2. List the repositories currently in use on your server.
# 3. Search for the package that contains the cache-only DNS name server. Do not install it yet.
# 4. Perform an extensive query of the package so that you know before you install it which files it
# contains, which dependencies it has, and where to find the documentation and configuration.
# 5. Check whether the RPM package contains any scripts. You may download it, but you may not
# install it yet; you want to know which scripts are in a package before actually installing it,
# right?
# 6. Install the package you found in step 3.
# 7. Undo the installation.

# processes

# When a user types a command, a shell job is started. If no particular measures have been taken,
# the job is started as a foreground process, occupying the terminal it was started from until it has
# finished its work. As a Linux administrator, you need to know how to start shell jobs as foreground
# processes or as background processes and what you can do to manage shell jobs.

# Shell jobs 
# are commands started from the command line. 
# They are associated with the shell that was current when the process was started. 
# Shell jobs are also referred to as interactive processes.
# Daemons 
# are processes that provide services.
# They normally are started when a computer is booted 
# and often (but certainly not in all cases) run with root privileges.
# Kernel threads 
# are a part of the Linux kernel. You cannot manage them using common tools,
# but for monitoring of performance on a system, it’s important to keep an eye on them.


# If you know that a job will take a long time to complete, you can start it with an & behind it.
# To move the last job that was started in the background back as a foreground job, use the fg command.
# start a bg job
while true; do echo tst; sleep 2; done &
# bring it to foreground
fg
# kill it 
# ctrl + c

# ctrl + c will kill the process if it's started without &
# start the process with and without the & and try to kill it with ctrl + c
# use the fg command to bring it back to foreground when its started with & 
# so you can kill it with ctrl + c

# A job might sometimes have been started that takes (much) longer than predicted. If that happens,
# you can use Ctrl-Z to temporarily stop the job. This does not remove the job from memory; it just
# pauses the job so that it can be managed. Once the job is paused, you can continue it as a
# background job by using the bg command.

# Another key combination is Ctrl-D, which sends the End Of File (EOF) character to the current
# job. The result is that the job stops waiting for further input so that it can complete what it was
# currently doing. When Ctrl-C is used, the job is just canceled, and nothing is closed
# properly. When Ctrl-D is used, the job stops waiting for further input and next terminates, which
# often is just what is needed to complete in a proper way.

# start a bg job
while true; do echo tst > /dev/null; sleep 2; done &
# check what bg jobs are running
jobs
# bring the job to foregroud and kill it
fg
# ctrl + c

# exercises

# 1. Open a root shell and type the following commands:
sleep 3600 &
dd if=/dev/zero of=/dev/null &
sleep 7200
# 2. Because you started the last command with no & after the command, you have to wait 2 hours
# before you get back control of the shell. Press Ctrl-Z to stop the command.
# 3. Type jobs. You will see the three jobs that you just started. The first two of them have the
# Running state, and the last job currently is in the Stopped state.
# 4. Type bg 3 to continue running job 3 in the background. Note that because it was started as the
# last job, you did not really have to add the number 3.
# 5. Type fg 1 to move job 1 to the foreground.
# 6. Press Ctrl-C to cancel job number 1 and type jobs to confirm that it is now gone.
# 7. Use the same approach to cancel jobs 2 and 3 also.
# 8. Open a second terminal on your server.
# 9. From that second terminal, type dd if=/dev/zero of=/dev/null &
# 10. Type exit to close the second terminal.
# 11. From the other terminal, start top. You will see that the dd job is still running. It should show
# on top of the list of running processes. From top, press k to kill the dd job. It will prompt for a
# PID to kill; make sure to enter the PID of the process you want to terminate, and then press
# Enter to apply default values.

# When a process is started from a shell, it becomes a child process of that shell. In process
# management, the parent–child relationship between processes is very important. The parent is
# needed to manage the child. For that reason, all processes started from a shell are terminated
# when that shell is stopped. This also offers an easy way to terminate processes no longer needed.
# Processes started in the background will not be killed when the parent shell from which they were
# started is killed. To terminate these processes, you need to use the kill command

# In earlier versions of the Bash shell, background processes were also killed when the
# shell they were started from was terminated. To prevent that, the process could be
# started with the nohup command in front of it. Using nohup for this purpose is no
# longer needed in RHEL 9. If a parent process is killed while the child process still is
# active, the child process becomes a child of systemd instead.

# Tasks on Linux are typically started as processes. One process can start several worker threads. 
# The threads can be handled by different CPUs or CPU cores available in the machine.

# There are two different types of background processes: kernel threads and daemon processes. 
# Kernel threads are a part of the Linux kernel, and each of them is started with its own process identification number (PID)
# Kernel threads cannot be managed. You cannot adjust their priority; neither is it possible to kill them, except by killing the machine.

# short summary of the active processes 
ps aux | head
# If used without any arguments, the ps command shows only those processes that have been started by the current user.
# see the exact command that was used to start the process
ps -ef
# shows hierarchical relationships between parent and child processes
ps fax
# list all PIDs that have a name containing the string “dd”
ps aux | grep dd
pgrep dd

# On modern Linux systems, cgroups are used to allocate system resources. 
# In cgroups, three system areas, the so-called slices, are defined:
# system: 
# This is where all systemd-managed processes are running.
# user: 
# This is where all user processes (including root processes) are running.
# machine: 
# This os feature is used for virtual machines and containers
# Within a slice, process priority can be managed by using nice and renice.

# create a service that stresses the machine
# create a file named stress1.service 
  # [Unit]
  # Description=create some stress
  
  # [Service]
  # Type=simple
  # ExecStart=/usr/bin/dd if=/dev/zero of=/dev/null
  # CPUShares=1024

# create a service that creates the double amount of stress
# create a file named stress2.service
  # [Unit]
  # Description=create twice as much stress
  
  # [Service]
  # Type=simple
  # ExecStart=/usr/bin/dd if=/dev/zero of=/dev/null
  # CPUShares=2048

# move files over in /etc/systemd/system
# refresh systemctl
systemctl daemon-reload
# start stress test
systemctl start stress1
systemctl start stress2
# see how it's going
top
# You’ll see that there are two very active dd processes, 
# which each get about 50 percent of all CPU capacity. 
# Keep the top screen open.

# Open another terminal, and as a non-root user, type 
while true; do true; done
# Observe what is happening in top in the previous terminal. 
# If you have a single-core system, you will see that both dd processes get 50 percent of all CPU cycles, 
# and the user bash process that was just started also gets 50 percent of all CPU cycles. 
# This proves that one very busy user process can have dramatic consequences for the system processes.

# If in the previous step you don’t see the described behavior, type 1 in the top interface. 
# This will show a line for each CPU core on your system.
# You should see multiple CPU cores.

# stop previously started processes
systemctl stop stress1
systemctl stop stress2

# Changing process priority may make sense in two different scenarios. Suppose, for
# example, that you are about to start a backup job that does not necessarily have to
# finish fast. Typically, backup jobs are rather resource intensive, so you might want to
# start the backup job in a way that does not annoy other users too much, by lowering
# its priority.
# Another example is where you are about to start a very important calculation job. To
# ensure that it is handled as fast as possible, you might want to give it an increased
# priority, taking away CPU time from other processes.

# Modern Linux kernels differentiate between essential kernel threads that are
# started as real-time processes and normal user processes. Increasing the priority
# of a user process will never be able to block out kernel threads or other
# processes that were started as real-time processes.
# Modern computers often have multiple CPU cores. A single-threaded process
# that is running with the highest priority will never be able to get beyond the
# boundaries of the CPU it is running on.
# Processes are running in slices, and by default, each slice
# can claim as many CPU cycles as each other slice.

# When using nice or renice to adjust process priority, you can select from values
# ranging from –20 to 19. The default niceness of a process is set to 0 (which results
# in the priority value of 20). By applying a negative niceness, you increase the priority.
# Use a positive niceness to decrease the priority. It is a good idea not to use the
# ultimate values immediately. Instead, use increments of 5 and see how it affects the
# application.

# exercises
# 1. Run the command : 
nice -n 5 dd if=/dev/zero of=/dev/null & 
# to an infinite I/O-intensive job, 
# but with an adjusted niceness so that some room remains for other processes as well.
# 2. Use 
ps aux | grep dd 
# to find the PID of the dd command that you just started. 
# The PID is in the second column of the command output.
# 3. Use 
renice -n 10 -p 1234 
# (assuming that 1234 is the PID you just found).
# 4. Use 
top 
# to verify the adjusted process priority and stop the dd process you just started.

# Before you start to think about using the kill command or sending other signals
# to processes, it is good to know that Linux processes have a hierarchical relationship.
# Every process has a parent process, and as long as it lives, the parent process is
# responsible for the child processes it has created. In older versions of Linux, killing a
# parent process would also kill all of its child processes. In RHEL 9, if you kill a parent
# process, all of its child processes become children of the systemd process.

# a complete overview of all the available signals
man 7 signal

# The signal SIGTERM (15) is used to ask a process to stop.
# The signal SIGKILL (9) is used to force a process to stop.
# The SIGHUP (1) signal is used to hang up a process. The effect is that the
# process will reread its configuration files, which makes this a useful signal to
# use after making modifications to a process configuration file.

# show a list of available signals that can be used with kill
kill -l

# The pkill command is a bit easier to use because it takes the name 
# rather than the PID of the process as an argument. 
# However, it is recommended to use kill, followed by the exact PID of processes you want to stop, 
# because otherwise you risk terminating processes that didn’t need to be killed anyway.

# exercises
# 1. Open a root shell. From this shell, type 
dd if=/dev/zero of=/dev/null &
# Repeat this command three times.
# 2. Type 
ps aux | grep dd
# This command shows all lines of output that have the letters dd in them; 
# you will see more than just the dd processes, but that should not really matter. 
# The processes you just started are listed last.
# 3. Use the PID of one of the dd processes to adjust the niceness, using renice -n 5 <PID>.
# 4. Type 
ps fax | grep -B5 dd
# The -B5 option shows the matching lines, including the five lines before that. 
# Because ps fax shows hierarchical relationships between processes, 
# you should also find the shell and its PID from which all the dd processes were started.
# 5. Find the PID of the shell from which the dd processes were started and type 
kill -9 <PID>
# replacing <PID> with the PID of the shell you just found. 
# Because the dd processes were started as background processes, 
# they are not killed when their parent shell is killed. 
# Instead, they have been moved up and are now children of the systemd process.
# 6. Use 
killall 
# to kill all remaining dd processes. 

# Zombies are processes with a special state. 
# Zombie processes are processes that have completed execution but are still listed in the process table. 
# You can check if you have zombies using 
ps aux | grep defunct
# Although zombies are harmless, it is annoying to have them, and you may want to do something to clean them up.
# The issue with zombies is that you cannot kill them in the way that works for normal processes. 
# Rebooting your system is a solution, but doing so is a bit too much for processes that aren’t really causing any harm. 
# Fortunately, in recent RHEL systems you can often—not in all cases—get rid of zombies by applying the following procedure:

# 1. use 
./zombie 
# to start the demo zombie process.
# Use ps aux | grep zombie to verify the zombie is running. 
# You should see two processes, one being the parent that is responsible for the zombie, the other one being the zombie itself.
# Use 
kill <childpid>
# in which <childpid> is replaced with the actual PID of the child processes you’ve found previously. Notice that this fails.
# use 
kill -SIGCHLD <parentpid>
# This will tell the parent process to remove its child processes. 
# Now the zombie will get adopted by systemd, and after a few seconds it will be removed.

# top status
# Running (R) The process is currently active and using CPU time, or in the queue of runnable processes waiting to get services.
# Sleeping (S) The process is waiting for an event to complete.
# Uninterruptible sleep (D) The process is in a sleep state that cannot be stopped. 
# This usually happens while a process is waiting for I/O. 
# This state is also known as blocking state.
# Stopped (T) The process has been stopped, which typically has happened to an interactive shell process, using the Ctrl-Z key sequence.
# Zombie (Z) The process has been stopped but could not be removed by its parent, which has put it in an unmanageable state.

# To kill a process from top, type k 
# top then prompts for the PID of the process you want to send a signal to. 
# By default, the most active process is selected. 
# After you enter the PID, top asks which signal you want to send. 
# By default, signal 15 for SIGTERM is used. However, if you want to insist on a bit more, 
# you can type 9 for SIGKILL. 
# Now press Enter to terminate the process.

# To renice a running process from top, type r.
# You are first prompted for the PID of the process you want to renice. 
# After entering the PID, you are prompted for the nice value you want to use. 
# Enter a positive value to decrease process priority or a negative value to increase process priority.

# The load average is expressed as the number of processes that are in a runnable state (R) or in a blocking state (D). 
# Processes are in a runnable state if they currently are running, or waiting to be serviced. 
# Processes are in a blocking state if they are waiting for I/O.
# The load average is shown for the last 1, 5, and 15 minutes, 
# and you can see the current values in the upper-right corner of the top screen. 

# load average statistics
uptime
# As a rule of thumb, the load average should not be higher than the number of CPU cores in your system.

# see number of cpu
lscpu

# RHEL 9 comes with tuned. 
# It offers a daemon that monitors system activity and provides some profiles.
# In the profiles, an administrator can automatically tune a system for best possible latency, throughput, or power consumption.
# Based on the properties of an installed system, a tuned profile is selected automatically at installation, 
# and after installation it’s possible to manually change the current profile. 
# Administrators can also change settings in a tuned profile.

# # tuned profiles
# balanced 
# The best compromise between power usage and performance desktop Based on the balanced profile, 
# but tuned for better response to interactive applications
# latency-performance 
# Tuned for maximum throughput # network-latency Based on latency-performance, 
# but with additional options to reduce network latency
# network-throughput 
# Based on throughput-performance, optimizes older CPUs for streaming content
# powersave 
# Tunes for maximum power saving 
# throughput-performance 
# Tunes for maximum throughput
# virtual-guest 
# Optimizes Linux for running as a virtual machine
# virtual-host 
# Optimizes Linux for use as a KVM host

# exercises
# 1. Use 
dnf -y install tuned 
# to ensure that tuned is installed.
# 2. Type 
systemctl status tuned 
# to check whether tuned currently is running. 
# If it is not, use 
systemctl enable --now tuned
# 3. Type 
tuned-adm active 
# to see which profile currently is used.
# 4. Type 
tuned-adm recommend 
# to see which tuned profile is recommended.
# 5. To select and activate the throughput-performance profile, type
tuned-adm profile throughput-performance.

# # sample review questions for spaced repetition
# 1. Which command gives an overview of all current shell jobs?
# 2. How do you stop the current shell job to continue running it in the background?
# 3. Which keystroke combination can you use to cancel the current shell job?
# 4. A user is asking you to cancel one of the jobs he has started. 
# You cannot access the shell that user currently is working from. 
# What can you do to cancel his job anyway?
# 5. Which command would you use to show parent–child relationships between processes?
# 6. Which command enables you to change the priority of PID 1234 to a higher priority?
# 7. On your system, 20 dd processes are currently running. 
# What is the easiest way to stop all of them?
# 8. Which command enables you to stop the command with the name mycommand?
# 9. Which command do you use from top to kill a process?
# 10. What is required to select a performance profile that best matches your system needs?

# lab 
# 1. Launch the command 
dd if=/dev/zero of=/dev/null 
# three times as a background job.
# 2. Increase the priority of one of these commands using the 
nice value -5
# Change the priority of the same process again, but this time use the value -15.
# Observe the difference.
# 3. Kill all the dd processes you just started.
# 4. Ensure that tuned is installed and active, and set the throughput-performance profile.

# systemd

# is the system and service manager used on RHEL since RHEL 7
# to manage different units across the os 

# see list of units that can be managed with systemd
systemctl -t help

# systemd provides a uniform interface to start units
# This interface is defined in the unit file. 

# Unit files can occur in three locations:

# /run/systemd/system: 
# Contains unit files that have been generated automatically.

# /etc/systemd/system: 
# Contains custom unit files. 
# It may also contain files that have been written by an administrator 
# or generated by the systemctl edit command.

# /usr/lib/systemd/system: 
# Contains default unit files that have been installed from RPM packages. 
# You should never edit these files directly.

# if files are present in more than one place 
# the order of the list above represents priority in ascending order

# we will focus on services
# services are processes that provide specific functionality 
# and allow connections from external clients coming in, 
# such as the SSH service, the Apache web service
# you can start any type of process by using a service unit, 
# including daemon processes and commands.

# # service unit sample
# [Unit]
# Description=Vsftpd ftp daemon
# After=network.target
# [Service]
# Type=forking
# ExecStart=/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
# [Install]
# WantedBy=multi-user.target

# [Unit] 
# Describes the unit and defines dependencies. 
# The Before statement indicates that this unit should be started 
# before the unit that is specified. 
# The After statement indicates that this unit should be started 
# after the unit that is specified.
# [Service] 
# Describes how to start, stop the service
# and request status installation. 
# ExecStart indicates how to start the unit
# ExecStop indicates how to stop the unit.
# The Type option is used to specify how the process should start.
# The forking type is commonly used by daemon processes, 
# but you can also use other types, such as oneshot and simple, 
# which will start any command from a Systemd unit. 

# [Install] 
# Indicates in which target this unit has to be started. 
# This section is optional, but units that don’t have an [Install] section 
# cannot be started automatically.

# See man 5 systemd.service or online documentation about all options available
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/using_systemd_unit_files_to_customize_and_optimize_your_system/assembly_working-with-systemd-unit-files_working-with-systemd

# mount unit sample
cat /usr/lib/systemd/system/tmp.mount

# [Unit] 
# The Conflicts statement is used to list units 
# that cannot be used together with this unit. 
# Use this statement for mutually exclusive units.

# [Mount] 
# This section defines exactly where the mount has to be performed.
# Here you see the arguments that are typically used in any mount command.

# A socket creates a method for applications to communicate with one another. 
# A socket may be defined as a file but also as a port 
# on which Systemd will be listening for incoming connections.
# That way, a service doesn’t have to run continuously 
# but instead will start only if a connection is coming in 
# on the socket that is specified.

# socket unit sample
# [Unit]
# Description=Cockpit Web Service Socket
# Documentation=man:cockpit-ws(8)
# Wants=cockpit-motd.service
# [Socket]
# ListenStream=9090
# ExecStartPost=-/usr/share/cockpit/motd/update-motd '' localhost
# ExecStartPost=-/bin/ln -snf active.motd /run/cockpit/motd
# ExecStopPost=-/bin/ln -snf /usr/share/cockpit/motd/inactive.motd /run/
# cockpit/motd
# [Install]
# WantedBy=sockets.target

# ListenStream option defines the TCP port 
# that Systemd should be listening to for incoming connections. 
# Sockets can also be created for UDP ports, 
# using the ListenDatagram option.

# target units 
# A simple definition of a target unit is “a group of units.” 
# This grouping makes it possible to load them in the right order 
# and at the right moment.  
# Some targets are used to define the state a server should be started in.

# Other targets are just a group of services 
# that make it easy to manage all the units 
# that are required to get specific functionality. 
# The sound.target can be used to easily start or stop all units 
# that are required to enable sound on a system.

# in earlier versions of RHEL runlevels were used instead of target units 

# Targets by themselves can have dependencies on other targets. 
# These dependencies are defined in the target unit. 
# An example of such a dependency relation is the basic.target. 
# This target defines all the units that should always be started. 
# You can use the 
systemctl list-dependencies 
# command for an overview of any existing dependencies.

# target unit sample
# [Unit]
# Description=Multi-User System
# Documentation=man:systemd.special(7)
# Requires=basic.target
# Conflicts=rescue.service rescue.target
# After=basic.target rescue.service rescue.target
# AllowIsolate=yes

# by itself the target unit does not contain any information 
# about the units that it should start. 
# It just defines what it requires and which services and
# targets it cannot coexist with.

# It also defines load ordering, 
# by using the After statement in the [Unit] section.
# The target file does not contain any information about
# the units that should be included; 
# that is defined in the [Install] section of the different unit files.

# The systemctl enable command is used 
# to ensure that a unit is automatically started while booting.
# The [Install] section of that unit is considered to determine 
# to which target the unit should be added.

# When you add a unit to a target,  
# a symbolic link is created in the target directory etc/systemd/system

# enable vsftpd service to star automatically on every boot 
systemctl enable vsftpd
# a symbolic link /etc/systemd/system/multi-user.target/wants/vsftpd.service 
# has been added pointing to the unit file in 
# /usr/lib/systemd/system/vsftpd.service

# In Systemd terminology, this symbolic link is known as a
# want, as it defines what the target wants to start when it is processed.

# exercises
# 1. From a root shell, type 
dnf -y install vsftpd 
# to install the Very Secure FTP service.
# 2. Type 
systemctl start vsftpd 
# to activate the FTP server on your machine.
# 3. Type 
systemctl status vsftpd 
# to get output where you can see 
# that the vsftpd service is currently operational. 
# In the Loaded line, you can also see that the service is currently disabled, 
# which means that it will not be activated on a system restart. 
# The vendor preset also shows as disabled, which means that, by default, 
# after installation this unit will not automatically be enabled.
# 4. Type 
systemctl enable vsftpd 
# to create a symbolic link in the wants directory 
# for the multiuser target to ensure 
# that the service is automatically started after a restart.
# 5. Type 
systemctl status vsftpd 
# gain. You’ll see that the unit file has changed from being disabled to enabled.

# Status           Description
# Loaded           The unit file has been processed and the unit is active.
# Active(running)  The unit is running with one or more active processes.
# Active(exited)   The unit has successfully completed a one-time run.
# Active(waiting)  The unit is running and waiting for an event.
# Inactive(dead)   The unit is not running.
# Enabled          The unit will be started at boot time.
# Disabled         The unit will not be started at boot time.
# Static           The unit cannot be enabled but may be started by another unit                        automatically.

# Command                                Description
# systemctl -t service                   Shows only service units
# systemctl list-units -t service        Shows all active service units 
#                                        (same result as the previous command)
# systemctl list-units -t service --all  Shows inactive service units as well as
#                                        active service units
# systemctl --failed -t service          Shows all services that have failed
# systemctl status -l your.service       Shows detailed status information about
#                                        services

# Managing Dependencies
# In general, there are two ways to manage Systemd dependencies:

# Unit types such as socket, timer, and path are directly related to a service unit.
# Systemd can make the connection because the first part of the name is the
# same: cockpit.socket works with cockpit.service. Accessing either of these unit
# types will automatically trigger the service type.

# Dependencies can be defined within the unit, using keywords like Requires,
# Requisite, After, and Before.

# show upstream dependencies
systemctl list-dependencies vsftpd

# show downstream dependencies
systemctl list-dependencies vsftpd --reverse

# To ensure accurate dependency management, 
# you can use different keywords in the [Unit] section of a unit:
# Requires: 
# If this unit loads, units listed here will load also. 
# If one of the other units is deactivated, this unit will also be deactivated.
# Requisite: 
# If the unit listed here is not already loaded, this unit will fail.
# Wants: 
# This unit wants to load the units that are listed here, 
# but it will not fail if any of the listed units fail.
# Before: 
# This unit will start before the unit specified with Before.
# After: 
# This unit will start after the unit specified with After.

systemctl show sshd | head -20
# shows first 20 Systemd options that can be configured in the sshd.service unit, 
# including their current default values.

# By default, Systemd uses the nano editor. 
# If you want vim to be used instead of nano, 
# edit the /root/.bash_profile file to include the following line: 
# export SYSTEMD_EDITOR="/bin/vim" 
# and add this line to the ~/.bashrc file. 
# After you log in again, vim will be used as the default editor. 
# If you would rather use /bin/vim as the default editor for all
# commands that need an external editor (including systemctl), 
# you may also include export EDITOR="/bin/vim" instead.

# exercises
# 1. From a root shell, type 
dnf -y install httpd 
# to install the Apache web server package.
# 2. Use 
systemctl cat httpd.service 
# to show the current configuration of the unit file 
# that starts the Apache web server.
# 3. Type 
systemctl show httpd.service 
# to get an overview of available configuration options for this unit file.
# 4. Type 
export SYSTEMD_EDITOR=/bin/vim 
# to ensure you use vim as the default editor for the duration of this session.
# (Optionally, add this line to ~/.bashrc to make it persistent.)
# 5. Use 
systemctl edit httpd.service 
# to change the default configuration, 
# and add a [Service] section 
# that includes the Restart=always and RestartSec=5s lines.
# 6. Enter 
systemctl daemon-reload 
# to ensure that Systemd picks up the new configuration.
# 7. Type 
systemctl start httpd 
# to start the httpd service and 
systemctl status sshd
# to verify that the sshd service is indeed running.
# 8. Use 
killall httpd 
# to kill the httpd process.
# 9. Type 
systemctl status httpd 
# and then repeat after 5 seconds. 
# You’ll notice that the httpd process gets automatically restarted

# spaced repetion sample questions
# 1. What is a unit?
# 2. Which command should you use 
# to show all service units that are currently loaded?
# 3. How do you create a want for a service?
# 4. How do you change the default editor for systemctl?
# 5. Which directory contains custom Systemd unit files?
# 6. What should you include to ensure 
# that a unit file will automatically load another unit file?
# 7. Which command shows available configuration options 
# for the httpd.service unit?
# 8. Which command shows all dependencies for a specific unit?
# 9. What does it mean if systemctl status shows that a unit is dead?
# 10. How do you create a Systemd override file?

# lab
# 1. Install the vsftpd and httpd services.
# 2. Set the default systemctl editor to vim.
# 3. Edit the httpd.service unit file such that 
# starting httpd will always auto-start vsftpd. 
# Edit the httpd service such that after failure 
# it will automatically start again in 10 seconds.

# scheduling tasks
# RHEL 9 offers different solutions for scheduling tasks:

# Systemd timers 
# are now the default solution to ensure 
# that specific tasks are started at specific moments.

# cron 
# is the legacy scheduler service. 
# It is still supported and responsible for scheduling a few services.

# st 
# is used to schedule an occasional user job for future execution.

# A systemd timer is always used together with a service file, 
# and the names should match. 
# For example, the logrotate.timer file 
# is used to modify the logrotate.service file. 
# The service unit defines how the service should be started, 
# and the timer defines when it will be started. 
# If you need a service to be started by a timer, you enable the timer, 
# not the service

# samplet timer
systemctl cat logrotate.timer

# [Timer]

# OnCalendar: 
# Describes when the timer should execute. 
# In this case it is set to daily, which ensures daily execution.

# AccuracySec: 
# Indicates a time window within which the timer should execute.
# If the timer needs to be executed at a more specific time, 
# it is common to set it to a lower value. 
# Use 1us for the best accuracy.

# Persistent: 
# A modifier to OnCalendar=daily, 
# it specifies that the last execution time should be stored on disk, 
# so that the next time it executes is exactly one day later.

# Option              Use
# OnActiveSec         Defines a timer relative to the moment the timer is activated.
# OnBootSec           Defines a timer relative to when the machine was booted.
# OnStartupSec        Specifies a time relative to when the service manager was      
#                     started. In most cases this is the same as OnBootSec, 
#                     but not when systemd user units are used.
# OnUnitActiveSec     Defines a timer relative to when the unit 
#                     that the timer activates was last activated.
# OnCalendar          Defines timers based on calendar event expressions, 
#                     such as daily. See man systemd.time for more details.

# exercises
# 1. Use 
systemctl list-units -t timer 
# to show a list of all timers.
# 2. Type 
systemctl list-unit-files logrotate.* 
# which should show there is a logrotate.service and a logrotate.timer.
# 3. Enter 
systemctl cat logrotate.service 
# to verify the contents of the logrotate.service unit file. 
# Notice that it doesn’t have an [Install] section.
# 4. Use 
systemctl status logrotate.service
# which will show it marked as triggered by the logrotate.timer.
# 5. Use 
systemctl status logrotate.timer 
# to verify the status of the related timer.
# 6. Install the sysstat package, using 
dnf install -y sysstat
# 7. Verify the unit files that were added from this package, using 
systemctl list-unit-files sysstat*
# 8. Type 
systemctl cat sysstat-collect.timer 
# to show what the sysstat-collect timer is doing. 
# You’ll see the line OnCalendar=*:00/10, 
# which ensures that it will run every 10 minutes.

# Even if systemd timers are now the default solution for running recurring tasks,
# cron is still available. 
# Make sure you master both for purposes of preparing for the RHCSA exam!

# The crond service consists of two major components. 
# First is the service crond. 
# This daemon looks every minute to see whether there is work to do. 
# Second, this work to do is defined in the cron configuration, 
# which consists of multiple files working together to provide
# the right information to the right service at the right time.

# seee crond status
systemctl status crond

# cron time and date fields
# Field             Values
# minute            0–59
# hour              0–23
# day of month      1–31
# month             1–12 (or month names)
# day of week       0–7 (Sunday is 0 or 7), or day names

# We can use an * as a wildcard to refer to any value. 
# Ranges of numbers are allowed, as are lists and patterns. 
# examples:

# * 11 * * * 
# Every minute between 11:00 and 11:59 (probably not what you want)

# 0 11 * * 1-5 
# Every day at 11 a.m. on weekdays only

# 0 7-18 * * 1-5 
# Every hour at the top of the hour between 7 a.m. and 6 p.m. on weekdays

# 0 */2 2 12 5 
# Every two hours on the hour on December 2 and every Friday in December

man 5 crontab 
# shows all possible combitantions

# The main configuration file for cron is /etc/crontab, 
# but we will not change this file directly. 
# It does give you a convenient overview 
# of some time specifications that can be used in cron. 
# It also sets environment variables 
# that are used by the commands executed through cron

# We can modfy different cron configuration files:
# cron files in /etc/cron.d
# Scripts in /etc/cron.hourly, cron.daily, cron.weekly, and cron.monthly
# User-specific files that are created with crontab -e

# To create a user-specific cron job, type 
crontab -e 
# after logging in as that user, 
# or as root type 
crontab -e -u username
# These user-specific cron jobs are the most common way 
# for scheduling additional jobs through cron.

# When you are using crontab -e, the default editor opens 
# and creates a temporary file. 
# After you edit the cron configuration, 
# the temporary file is moved to its final location 
# in the directory /var/spool/cron. 
# In this directory, a file is created for each user. 
# These files should never be edited directly! 
# When the file is saved by crontab -e, it is activated automatically.

# If you want to add cron jobs manualy, 
# you add these to the /etc/cron.d directory. 
# Put a file in that directory (the exact name does not really matter) 
# and make sure that it meets the syntax of a typical cron job.

cat /etc/cron.d/0hourly
# This example starts by setting environment variables. 
# These are the environment variables that should be considered 
# while running this specific job. 
# On the last line the job itself is defined. 
# The first part of this definition specifies when the job should run. 
# In this case it will run 1 minute after each hour, 
# each day of the month, each month, and each day of the week. 
# The job will be executed as the root user, 
# and the job itself involves the run-parts command, 
# which is responsible for running the scripted cron jobs in /etc/cron.hourly.

# other dir that can host cron files
# /etc/cron.hourly
# /etc/cron.daily
# /etc/cron.weekly
# /etc/cron.monthly

# In these directories, you typically find scripts 
# (not files that meet the crontab syntax requirements) 
# that are put in there from RPM package files. 
# When opening these scripts, 
# notice that no information is included 
# about the time when the command should be executed. 
# The reason is that the exact time of execution does not really matter. 
# The only thing that does matter is that the job is launched 
# once an hour, once a day, a week, or a month, 
# and anacron is taking care of everything else.

# The anacron service takes care of starting 
# the hourly, daily, weekly, and monthly cron jobs, 
# no matter at which exact time. 
# To determine how this should be done, 
# anacron uses the /etc/anacrontab file.

cat /etc/anacrontab
# see wcontents of anacrontab

# It is not easy to get an overview of the cron jobs 
# actually scheduled for execution. 
# There is no single command that would show 
# all currently scheduled cron jobs. 
# The crontab -l command does list cron jobs, 
# but only for the current user account.

# cron sec
# By default, all users can enter cron jobs. 
# It is possible to limit which user is allowed to schedule cron jobs 
# by using the /etc/cron.allow and /etc/cron.deny configuration files. 
# If the cron.allow file exists, 
# a user must be listed in it to be allowed to use cron.
# If the /etc/cron.deny file exists, 
# a user must not be listed in it to be allowed to set up cron jobs. 
# Both files should not exist on the same system at the same time. 
# Only root can use cron if neither file exists.

# 1. Open a root shell. Type 
cat /etc/crontab 
# to get an impression of the contents of the /etc/crontab configuration file.
# 2. Type 
crontab -e
# This opens an editor interface that by default uses vi as its editor. 
# Add the following line:
0 2 * * 1-5 logger message from root
# 3. Use the vi command 
:wq! 
# to close the editing session and write changes.
# 4. Type 
cd /etc/cron.hourly
# In this directory, create a script file with the name eachhour 
# that contains the following line:
logger This message is written at $(date)
# 5. Use 
chmod +x eachhour 
# to make the script executable; if you fail to make it executable, it will not work.
# 6. Enter the directory /etc/cron.d and in this directory 
# create a file with the name eachhour. 
# Put the following contents in the file:
11 * * * * root logger This message is written from /etc/cron.d
# 7. Save the modifications to the configuration file 
# 8. After a couple of hours, type 
grep written /var/log/messages 
# and read the messages to verify correct cron operations.

# atd
# Whereas cron is used to schedule jobs that need to be executed on a regular basis,
# the atd service is available for services that need to be executed only once. 
# On RHEL 9, the atd service is available by default, 
# so all that you need to do is schedule jobs

at 14:00
# open the at shell
# From this shell, you can type several commands 
# that will be executed at 14:00. 
# After entering the commands, press Ctrl-D to quit the at shell.

# The batch command works like at, but it’s a bit more sophisticated. 
# When using batch, you can specify that a job 
# is started only when system performance parameters allow. 
# Typically, that is when system load is lower than 0.8. 
# This value is a bit low on modern multi-CPU systems, 
# which is why the load value can be specified manually when starting atd, 
# using the -l command-line option. 
# Use, for instance, atd -l 3.0 to make sure that no batch job 
# is started when the system load is higher than 3.0.

exercise
# 1. Type 
systemctl status atd
# In the line that starts with Loaded:, this command should show you 
# that the service is currently loaded and enabled, 
# which means that it is ready to start receiving jobs.
# 2. Type 
at 15:00 
# (or replace with any time near to the time 
# at which you are working on this exercise).
# 3. Type 
logger message from at
# Press Ctrl-D to close the at shell.
# 4. Type 
atq 
# to verify that the job has indeed been scheduled.

# spaced repetition question suggestion
# 1. Where do you configure a cron job that needs to be executed 
# once every two weeks?
# 2. How do you configure a service to be started 5 minutes 
# after your system has started?
# 3. You have enabled a systemd service unit file to be started by a timer, but it
# doesn’t work. What should you check?
# 4. What is the easiest way to start a service every 7 hours?
# 5. How do you match a specific timer to a specific service?
# 6. Which command enables you to schedule a cron job for user lisa?
# 7. How do you specify that user boris 
# is never allowed to schedule jobs through cron?
# 8. You need to make sure that a job is executed every day, even if the server at
# execution time is temporarily unavailable. How do you do this?
# 9. Which service must be running to schedule at jobs?
# 10. Which command enables you to find out whether any current at jobs are
# scheduled for execution?

# lab
# 1. Create a cron job that performs an update of all software 
# on your computer every evening at 11 p.m.
# 2. Schedule your machine to be rebooted at 3 a.m. tomorrow morning.
# 3. Use a systemd timer to start the vsftpd service 
# five minutes after your system has started.

# system logging
# three different approaches can be used by services to write log information:

# Systemd-journald: 
# With the introduction of Systemd, the journald log service
# systemd-journald has been introduced also. 
# This service is tightly integrated with Systemd, 
# which allows administrators to read detailed information from the journal 
# while monitoring service status using the systemctl status command
# or the journalctl command. 
# Systemd-journald is the default solution for logging in RHEL 9.

# Direct write: 
# Some services write logging information directly to the log files 
# even some important services such as the Apache web server 
# and the Samba file server. This approach to logging is not recommended.

# rsyslogd: 
# rsyslogd is the enhancement of syslogd, 
# a service that takes care of managing centralized log files. 
# syslogd has been around for a long time. 
# Even if systemd-journald is now the default for logging, 
# rsyslogd provides features not offered by systemd-journald, 
# and for that reason it is still offered on RHEL 9. 
# Also, rsyslogd is still configured to work as it did in older versions 
# of RHEL, which means that you can still use the log files 
# it generates to get the log information you need.

# On RHEL 9, systemd-journald provides an advanced log management system.
# This event journal is stored in a binary format,
# and you can query it by using the journalctl command.

# the journal that is written by systemd-journald is not persistent between reboots
# messages are also forwarded to the rsyslogd service 
# which writes the messages to different files in the /var/log directory
# rsyslogd also offers features that do not exist in journald, 
# like centralized logging and filtering messages by using modules
# such as output modules that allow administrators to store messages in a database.

# In RHEL 9 systems, rsyslogd is configured to receive logs from systemd-journald.
# This setup allows us to use the powerful filtering and forwarding capabilities 
# of rsyslogd to manage logs collected by systemd-journald. 
# For example, logs can be forwarded to remote servers for centralized logging 
# or saved in different formats for compliance or analysis purposes.

# To get more information about what has been happening on a machine 
# we can take three approaches:

# Use the journalctl command to get more detailed information from the journal.

# Use the systemctl status <unit> command to get a short overview 
# of the most recent significant events that have been logged by Systemd 
# units through systemd-journald. 
# This command shows the status of services, 
# as well as the most recent log entries that have been written. 
systemctl status sshd -l

# Monitor the files in /var/log that are written by rsyslogd.

# Log                       File Explanation
# /var/log/messages         This is the most commonly used log file; 
#                           it is the generic log file
#                           where most messages are written to.
# /var/log/dmesg            Contains kernel log messages.
# /var/log/secure           Contains authentication-related messages. 
#                           Look here to see which
#                           authentication errors have occurred on a server.
# /var/log/boot.log         Contains messages that are related to system startup.
# /var/log/audit/audit.log  Contains audit messages. SELinux writes to this file.
# /var/log/maillog          Contains mail-related messages.
# /var/log/httpd/           Contains log files that are written 
#                           by the Apache web server (if it is installed). 
#                           Notice that Apache writes messages to these files 
#                           directly and not through rsyslog.

tail -10 /var/log/messages
# check log messages

# Date and time: 
# Every log message starts with a timestamp. 
# For filtering purposes, the timestamp is written as military time.

# Host: 
# The host the message originated from. 
# This is relevant because rsyslogd can be configured to handle remote logging.

# Service or process name and PID: 
# The name of the service or process that generated the message.

# Message content: 
# The content of the message, which contains the exact message that has been logged.

tail -f /var/log/messages
# shows in real time which lines are added to the log file.

logger -p kern.err hello
# writes hello to the kernel facility, for example, using the error priority

# exercises
# 1. Open a root shell.
# 2. From the root shell, type 
tail -f /var/log/messages
# 3. Open a second terminal window. 
# In this terminal window, type 
su - <username> 
# to open a subshell as another user.
# 4. Type 
su - 
# to open a root shell, but enter the wrong password.
# 5. Look at the file /var/log/messages. 
# You see an error message was logged here.
# 6. From the student shell, type 
logger hello 
# You’ll see the message appearing in
# the /var/log/messages file in real time.
# 7. In the tail -f terminal, press Ctrl-C to stop tracing the messages file.
# 8. Type 
tail -20 /var/log/secure
# This shows the last 20 lines in /var/log/secure,
# which also shows the messages that the su - password 
# errors have generated previously.

# exercises
# 1. Type 
journalctl
# You’ll see the content of the journal since your server last
# started, starting at the beginning of the journal. 
# The content is shown in less, so you can use common less commands 
# to walk through the file.
# 2. Type q to quit the pager. Now type 
journalctl --no-pager
# This shows the contents of the journal without using a pager.
# 3. Type 
journalctl -f
# This opens the live view mode of journalctl, which allows you to see 
# new messages scrolling by in real time. Press Ctrl-C to interrupt.
# 4. Type 
journalctl
# press the Spacebar, and then press the Tab key twice. 
# When prompted to view all possibilities, 
# type y and then press the Enter key. 
# This shows specific options that can be used for filtering. 
# Type, for instance,
journalctl _UID=<your_uuid> 
# to show messages that have been logged for your user account.
# 5. Type 
journalctl -n 20
# The -n 20 option displays the last 20 lines of the journal
# (just like tail -n 20).
# 6. Type 
journalctl -p err
# This command shows errors only.
# 7. If you want to view journal messages 
# that have been written in a specific time
# period, you can use the --since and --until commands. 
# Both options take the time parameter in the format YYYY-MM-DD hh:mm:ss. 
# Also, you can use yesterday, today, and tomorrow as parameters. 
# So, type 
journalctl --since yesterday 
# to show all messages that have been written since yesterday.
# 8. journalctl allows you to combine different options, as well. 
# So, if you want to show all messages with a priority error 
# that have been written since yesterday, use 
journalctl --since yesterday -p err
# 9. If you need as much detail as possible, use 
journalctl -o verbose
# This shows different options that are used when writing to the journal 
# All these options can be used to tell the journalctl command which specific
# information you are looking for. Type 
journalctl _SYSTEMD_UNIT=sshd.service 
# to show more information about the sshd Systemd unit.
# 10. Type 
journalctl --dmesg 
# This shows kernel-related messages only. 
# Not many people use this command, 
# as the dmesg command gives the exact same result.

journalctl _SYSTEMD_UNIT=sshd.service -o verbose
# explore verbose output of the command

# journalctl options
# Option Use
# -f     Shows the bottom of the journal and live adds new messages that are
#        generated
# -b     Shows the boot log
# -x     Adds additional explanation to the logged items
# -u     Used to filter log messages for a specific unit only
# -p     Allows for filtering of messages with a specific priority

# By default, the journal is stored in the file /run/log/journal. 
# The entire /run directory is used for current process status information only, 
# which means that the journal is cleared when the system reboots. 
# To make the journal persistent between system restarts, 
# you should create a directory /var/log/journal.
# Storing the journal permanently requires the Storage=auto parameter in
# /etc/systemd/journald.conf, which is set by default. 
# This parameter can have different values:

# Storage=auto        The journal will be written on disk if the directory
#                     /var/log/journal exists.
# Storage=volatile    The journal will be stored only in the /run/log/journal
#                     directory.
# Storage=persistent  The journal will be stored on disk in the directory
#                     /var/log/journal. This directory will be created automatically 
#                     if it doesn’t exist.
# Storage=none        No data will be stored, 
#                     but forwarding to other targets such as the kernel log buffer
#                     or syslog will still work.

# Even when the journal is written to the permanent file in /var/log/journal, 
# that does not mean that the journal is kept forever. 
# The journal has built-in log rotation that will be used monthly. 
# Also, the journal is limited to a maximum size of 10 percent of
# the size of the file system that it is on, and it will stop growing 
# if less than 15 percent of the file system is still free. 
# If that happens, the oldest messages from the journal
# are dropped automatically to make room for newer messages. 
# To change these settings, you can modify the file 
# /etc/systemd/journald.conf

# exercises
# 1. Open a root shell and type 
mkdir /var/log/journal
# 2. Before journald can write the journal to this directory, 
# you have to set ownership. Type 
chown root:systemd-journal /var/log/journal
# followed by 
chmod 2755 /var/log/journal
# 3. Use 
systemctl restart systemd-journal-flush 
# to reload the new systemdjournald parameters.
# 4. The Systemd journal is now persistent across reboots.

# you can configure the rsyslogd service through the 
# /etc/rsyslog.conf file and optional drop-in files in /etc/rsyslog.d. 
# In the /etc/rsyslog.conf file, 
# you find different sections that allow you to specify where 
# and how information should be written.

less /etc/rsyslog.conf
# view config contents 

# #### MODULES ####: rsyslogd is modular. 
# Modules are included to enhance the supported features in rsyslogd.

# #### GLOBAL DIRECTIVES ####: T
# This section is used to specify global parameters, 
# such as the location where auxiliary files are written 
# or the default timestamp format.

# #### RULES ####: 
# This is the most important part of the rsyslog.conf file.
# It contains the rules that specify what information 
# should be logged to which destination.

# To specify what information should be logged to which destination, 
# rsyslogd uses facilities, priorities, and destinations:

# A facility specifies a category of information that is logged. 
# rsyslogd uses a fixed list of facilities, which cannot be extended. 
# This is because of backward compatibility with the legacy syslog service.

# A priority is used to define the severity of the message that needs to be logged.
# When you specify a priority, by default all messages with that priority 
# and all higher priorities are logged.

# A destination defines where the message should be written. 
# Typical destinations are files, but rsyslog modules 
# can be used as a destination as well, to allow further processing 
# through a rsyslogd module.

# The available facilities and priorities are fixed and cannot be added to.
# When you specify a destination, a file is often used. 
# If the filename starts with a hyphen (as in -/var/log/maillog), 
# the log messages will not be immediately committed to the file 
# but instead will be buffered to make writes more efficient.

# facilities
# Facility            Used by
# auth/authpriv        Messages related to authentication.
# cron                 Messages generated by the crond service.
# daemon               Generic facility that can be used for nonspecified daemons.
# kern                 Kernel messages.
# lpr                  Messages generated through the legacy lpd print system.
# mail                 Email-related messages.
# mark                 Special facility that can be used to write a marker periodically.
# news                 Messages generated by the NNTP news system.
# security             Same as auth/authpriv. Should not be used anymore.
# syslog               Messages generated by the syslog system.
# user                 Messages generated in user space.
# uucp                 Messages generated by the legacy UUCP system.
# local0-7             Messages generated by services that are configured by 
#                      any of the local0 through local7 facilities.

# The syslog facilities were defined in the 1980s, 
# and to guarantee backward compatibility,
# no new facilities can be added. 
# The result is that some facilities still exist 
# that basically serve no purpose anymore, 
# and some services that have become relevant 
# at a later stage do not have their own facility. 
# As a solution, two specific facility types can be used. 
# The daemon facility is a generic facility that can be used by any daemon.
# In addition, the local0 through local7 facilities can be used.

# If services that do not have their own rsyslogd facility 
# need to write log messages to a specific log file anyway, 
# these services can be configured to use any of the local0
# through local7 facilities. 
# You next have to configure the services to use these facilities as well. 
# The procedure you follow to do that is specific to the service you are using.
# Then you need to add a rule to the rsyslog.conf file 
# to send messages that come in through that facility to a specific log file.

# To determine which types of messages should be logged, you can use different
# severities in rsyslog.conf lines. These severities are the syslog priorities.

# priorities
# Priority         Description
# debug            Debug messages that will give as much information as possible 
#                  about service operation.
# info             Informational messages about normal service operation.
# notice           Informational messages about items that might become an issue later.
# warning (warn)   Something is suboptimal, but there is no real error yet.
# error (err)      A noncritical error has occurred.
# crit             A critical error has occurred.
# alert            Message used when the availability of the service is about to be
#                  discontinued.
# emerg (panic)    Message generated when the availability of the service 
#                  is discontinued.

# When a specific priority is used, 
# all messages with that priority and higher are
# logged according to the specifications used in that specific rule. 
# If you need to configure logging in a detailed way, 
# where messages with different priorities are sent to different files, 
# you can specify the priority with an equal sign (=) in front of it, 
# as in the following line, which will write all cron messages 
# with only the debug priority to a specific file with the name /var/log/cron.debug. 
# The - in front of the line specifies to buffer writes so that information 
# is logged in a more efficient way. 
cron.=debug -/var/log/cron.debug

# the names of rsyslogd facilities and priorities are all listed in 
man 5 rsyslog.conf

# 1. By default, the Apache service does not log through rsyslog 
# but keeps its own logging. You are going to change that. To start, type 
dnf install -y httpd 
# to ensure that the Apache service is installed.
# 2. After installing the Apache service, 
# open its configuration file /etc/httpd/conf/httpd.conf 
# and verify it has the following line:
ErrorLog syslog:local1
# 3. Type 
systemctl restart httpd
# 4. Create a line in the /etc/rsyslog.conf file 
# that will send all messages that it receives for facility local1 
# (which is now used by the httpd service) to the file /var/log/httpd-error.log 
# To do this, include the following line in the 
# #### RULES #### section of the file:
local1.error /var/log/httpd-error.log
# 5. Tell rsyslogd to reload its configuration, by using 
systemctl restart rsyslog
# 6. All Apache error messages will now be written to the httpd-error.log file.
# 7. From the Firefox browser, go to http://localhost/index.html. 
# Because no index.html page exists yet, this will be written to the error log.
# 8. Create a snap-in file that logs debug messages to a specific file as well. 
# To do this, type 
echo "*.debug /var/log/messages-debug" /etc/rsyslog.d/debug.conf
# 9. Again, restart rsyslogd using 
systemctl restart rsyslog
# 10. Use the command 
tail -f /var/log/messages-debug 
# to open a trace on the newly created file.
# 11. From a second terminal, 
type logger -p daemon.debug "Daemon Debug Message"
# You’ll see the debug message passing by.
# 12. Press Ctrl-C to close the debug log file.

# To prevent syslog messages from filling up your system completely, you can rotate
# the log messages. That means that when a certain threshold has been reached, the
# old log file is closed and a new log file is opened. 
# The logrotate utility is started periodically to take care of rotating log files.
# When a log file is rotated, the old log file is typically copied to 
# a file that has the rotation date in it. 
# So, if /var/log/messages is rotated on June 8, 2023, the rotated
# filename will be /var/log/messages-20230608.
# As a default, four old log files are kept on the system. 
# Files older than that period are removed from the system automatically.

# The default settings for log rotation are kept in the file /etc/logrotate.conf
cat /etc/logrotate.conf

# The most significant settings used in this configuration file tell logrotate to
# rotate files on a weekly basis and keep four old versions of the file. 
# You can obtain more information about other parameters in this file 
# through the man logrotate command.

# If specific files need specific settings, you can create a configuration file 
# for that file in /etc/logrotate.d. 
# The settings for that specific file overwrite the default settings in
# /etc/logrotate.conf. 
# You will find that different files exist in this directory already to
# take care of some of the configuration files.

# spaced repetition example questions
# 1. Which file is used to configure rsyslogd?
# 2. Which log file contains messages related to authentication?
# 3. If you do not configure anything, how long will it take for log files to be
# rotated away?
# 4. Which command enables you to log a message from the command line to the
# user facility, using the notice priority?
# 5. Which line would you add to write all messages with a priority of info to the
# file /var/log/messages.info?
# 6. Which configuration file enables you to allow the journal to grow beyond its
# default size restrictions?
# 7. Which command allows you to check the systemd journal for boot messages,
# where an explanation is included?
# 8. Which command enables you to see all journald messages that have been
# written for PID 1 between 9:00 a.m. and 3:00 p.m.?
# 9. Which command do you use to see all messages that have been logged for the
# sshd service?
# 10. Which procedure enables you to make the systemd journal persistent?

# lab
# 1. Configure the journal to be persistent across system reboots.
# 2. Make a configuration file that writes all messages with an info priority to the
# file /var/log/messages.info.
# 3. Configure logrotate to keep ten old versions of log files.

# manage space

# Master Boot Record (MBR) partitioning scheme
# was defined as the first 512 bytes on a computer hard drive,
# contains all that is needed to start a computer, 
# including a boot loader and a partition table

# Current computer hard drives have become too big to be addressed by MBR partitions. 
# That is one of the main reasons why a new partitioning scheme was needed.

# GUID Partition Table (GPT) 
# On computers that are using the new Unified Extensible Firmware Interface (UEFI) 
# as a replacement for the old BIOS system, GPT partitions are the only way to address disks. 
# Also, older computer systems that are using BIOS instead of UEFI can be configured with globally unique ID (GUID) partitions, # which is necessary if a disk with a size bigger than 2 TiB needs to be addressed.

# a megabyte is a multiple of 1,000, and a mebibyte is a multiple of 1,024

# Once either MBR or GPT partitions have been created on a disk, 
# you cannot change its type. 
# The preferred utility for creating GPT partitions is gdisk. 
# Alternatively, after starting fdisk on a new disk, 
# you can use the g command to initialize a GPT.

# Exercises mbr
# 1. Open a root shell and type 
lsblk
# This lists the block devices that are available.
# 2. Open a root shell and run the 
fdisk /dev/sda2
# command. This command needs as its argument the name of the disk device 
# where you want to create the partition. 
# This exercise uses /dev/sda2. Change that, if needed, according to your hardware.
# 3. It is a good idea to check how much disk space you have available. 
# Press 
p 
# to see an overview of current disk allocation
# 4. Type 
n 
# to add a new partition
# 5. Press 
p 
# to create a primary partition.
# 6. Specify the first sector on disk that the new partition will start on. 
# The first available sector is suggested by default, so press Enter to accept.
# 7. Type 
+1G 
# to make this a 1-GiB partition. 
# If you were to just press Enter, the last sector available on disk would be suggested. 
# If you were to use that, after this exercise you would not have any disk space left 
# to create additional partitions or logical volumes, 
# so you should use another last sector. 
# To use another last sector, you can do one of the following:
# a. Enter the number of the last sector you want to use.
# b. Enter +number to create a partition that sizes a specific number of sectors.
# c. Enter +number(K,M,G) to specify the size you want to assign to the partition in KiB, MiB, or GiB.
# After you enter the partition’s ending boundary, fdisk will show a confirmation.
# 8. At this point, you can define the partition type. 
# By default, a Linux partition type is used. 
# If you want the partition to be of any other partition type, use t to change it. 
# For this exercise there is no need to change the partition type. 
# Common partition types include the following:
# 82: Linux swap
# 83: Linux
# 8e: Linux LVM
# 9. If you are happy with the modifications, press w to write them to disk and exit fdisk.
# 10. Type lsblk to verify that the new partition has been created successfully.

# Exercises Logical Partition
# 1. In a root shell, type 
fdisk /dev/sda2
# to open the fdisk interface.
# 2. Type 
n 
# to create a new partition. 
# To create a logical partition, when fdisk prompts which partition type you want to create, enter 
e
# This allows you to create an extended partition, which is necessary to later add logical partitions.
# 3. If the extended partition is the fourth partition that you are writing to the MBR, 
# it will also be the last partition that can be added to the MBR. 
# For that reason, it should fill the rest of your computer’s hard disk. 
# Press Enter to accept the default first sector and 
# press Enter again when fdisk prompts for the last sector (even if this is not the fourth partition yet).
# 4. Now that the extended partition has been created, 
# you can create a logical partition within it. 
# Still from the fdisk interface, press 
n 
# again. Because all of the space in the drive has been allocated to partitions, 
# the utility will by default suggest adding a logical partition with partition number 5.
# 5. Press Enter to accept the default first sector. When asked for the last sector, enter 
+1G
# 6. Now that the logical partition has been created, enter 
w 
# to write the changes to disk and quit fdisk.

# To apply the procedure in this exercise, you need a new disk device. 
# Do not use a disk that contains data that you want to keep, because this exercise will delete all data on it. 
# If you are using this exercise on a virtual machine, you may add the new disk through
# the virtualization software. If you are working on a physical machine, 
# you can use a USB thumb drive as a disk device for this exercise. 
# Note that this exercise works perfectly on a computer that starts from BIOS and not EFI; 
# all you need is a dedicated disk device.

# 1. To create a partition with gdisk, open a root shell and type 
gdisk /dev/sdc
# (Replace /dev/sdc with the exact device name used on your computer.) 
# gdisk will try to detect the current layout of the disk, 
# and if it detects nothing, it will create the GPT and associated disk layout.
# 2. Type 
n 
# to enter a new partition. 
# You can choose any partition number between 1 and 128, 
# but it is wise to accept the default partition number that is suggested.
# 3. You now are asked to enter the first sector. 
# By default, the first sector that is available on disk will be used, 
# press Enter to accept the default first sector that is proposed.
# 4. When asked for the last sector, 
# by default the last sector that is available on disk is proposed 
# (which would create a partition that fills the entire hard disk). 
# You can specify a different last sector, or specify the disk size using +, the size, and KMGTP. 
# So to create a 1-GiB disk partition, use 
+1G
# 5. You now are asked to set the partition type. 
# If you do not do anything, the partition type is set to 8300, 
# which is the Linux file system partition type. 
# Other options are available as well. 
# You can press 
l 
# to show a list of available partition types.
# The relevant partition types are as follows:
# 8200: Linux swap
# 8300: Linux file system
# 8e00: Linux LVM
# press Enter to accept the default partition type 8300.
# 6. The partition is now created (but not yet written to disk). 
# Press p to show an overview, which allows you to verify that this is really what you want to use.
# 7. If you are satisfied with the current partitioning, press 
w 
# to write changes to disk and commit. 
# This gives a warning which you can safely ignore by typing 
Y
# after which the new partition table is written to the GUID partition table.
# 8. If at this point you get an error message 
# indicating that the partition table is in use, type 
partprobe
# to update the kernel partition table.

# exercises parted
# 1. From a root shell, type 
parted /dev/sdd
# This opens the interactive parted shell.
# 2. Type 
help 
# to get an overview of available commands.
# 3. Type 
print
# You will see a message about an unrecognized disk label.
# 4. Type 
mklabel 
# and press Enter. parted will now prompt for a disk label type. 
# Press the Tab key twice to see a list of available disk label types. 
# From the list, select gpt and press Enter.
# 5. Type 
mkpart
# The utility prompts for a partition name. 
# Type part1 (the partition name doesn’t really matter).
# 6. Now the utility prompts for a file system type. 
# This is a very confusing option, 
# because it suggests that you are setting a file system type here, 
# but that is not the case. 
# Also, when using Tab completion, 
# you’ll see a list of file systems that you’ve probably never used before. 
# In fact, you could just press Enter to accept the default suggestion of ext2, 
# as the setting isn’t used anyway, but I suggest using a file system type 
# that comes close to what you’re going to use on the partition. 
# So type 
xfs 
# and press Enter to continue.
# 7. Now you are prompted for a start location. 
# You can specify the start location as a number of blocks, 
# or an offset from the start of the device. 
# Notice that you can type 1M to specify the start of the partition at 1 megabyte, 
# or type 1 MiB to have it start at 1 MiB. 
# This is confusing, so make sure you specify the appropriate value here. 
# At this point, type 
1MiB 
# and press Enter.
# 8. Type 
1GiB 
# to specify the end of the partition. 
# After doing so, type 
print
# to print the current partition table, and type 
quit 
# to quit the utility and commit your changes.
# 9. Type 
lsblk
# to verify the new partition has been created. It should show as /dev/sdd1 
# or something else depending on what you selected at the start.
# 10. Use 
mkfs.ext4 /dev/sdd1 
# to format this partition with the Ext4 file system.

# File System   Description
# XFS           The default file system in RHEL 9.
# Ext4          The default file system in previous versions of RHEL; still available and supported in RHEL 9.
# Ext3          The previous version of Ext4. On RHEL 9, there is no need to use Ext3 anymore.
# Ext2          A very basic file system that was developed in the early 1990s. 
#               There is no need to use this file system on RHEL 9 anymore.
# BtrFS         A relatively new file system that is not supported in RHEL 9.
# NTFS          A Windows-compatible file system that is not supported on RHEL 9.
# VFAT          A file system that offers compatibility with Windows and macOS 
#               and is the functional equivalent of the FAT32 file system. 
#               Useful on USB thumb drives that exchange data with other computers 
#               but not on a server’s hard disks.

mkfs.xfs /dev/sdb1
# format the /dev/sdb1 partition with the xfs file system

# manage Ext4 System Properties
tune2fs -l
# show file system properties

# tune2fs -o will set default file system mount options
# When set to the file system, 
# the option does not have to be specified while mounting through /etc/fstab anymore. 
tune2fs -o acl,user_xattr 
# to switch on access control lists and user-extended attributes. 
# Use a ^ in front of the option to switch it off again, as in 
tune2fs -o ^acl,user_xattr

# Ext file systems also come with file system features that may be enabled as a default. 
# To switch on a file system feature, use tune2fs -O followed by the feature. 
# To turn a feature off, use a ^ in front of the feature name.

# Use 
tune2fs -L 
# to set a label on the file system
# an alternative is the e2label command, 
# which also enables you to set a label on the file system.

# manage XFS System Properties

xfs_admin -L mylabel 
# will set the file system label to mylabel

# exercise swap partition
# 1. Type 
fdisk /dev/sdb 
# to open your disk in fdisk.
# 2. Press 
n 
# to add a new partition. 
# Specify start cylinder and size to create a 1-GiB partition.
# 3. Type 
t 
# to change the partition type. 
# If you are using fdisk, type swap to set the swap partition type to 82. 
# If you are using gdisk, use partition type 8200. 
# Press w to write and exit.
# 4. Usem kswap to format the partition as swap space. 
# Use, for instance, 
mkswap /dev/sdb6 
# if the partition you have just created is /dev/sdb6.
# 5.Type 
free -m
# You see the amount of swap space that is currently allocated. 
# This does not include the swap space you have just created, 
# as it still needs to be activated.
# 6. Use swapon to switch on the newly allocated swap space. 
# If, for instance, the swap device you have just created is /dev/sdb6, use 
swapon /dev/sdb6 
# to activate the swap space.
# 7. Type 
free -m 
# again. You see that the new swap space has been added to your server.
# 8. Open the file /etc/fstab with an editor and, 
# on the last line, add the following 
# to ensure the swap space is also available after a reboot: 
/dev/sdb6 none swap defaults 0 0

# If you do not have free disk space to create a swap partition 
# and you do need to add swap space urgently, 
# you can use a swap file as well. From a performance perspective, 
# it does not even make that much difference 
# if a swap file is used instead of a swap device 
# such as a partition or a logical volume, 
# and it may help you fulfill an urgent need in a timely manner.

# To add a swap file, you need to create the file first. The 
dd if=/dev/zero of=/swapfile bs=1M count=100 
# command would add 100 blocks with a size of 1 MiB from the /dev/zero device 
# (which generates 0s) to the /swapfile file. 
# The result is a 100-MiB file that can be configured as swap. 
# To do so, you can follow the same procedure as for swap partitions. 
# First use 
mkswap /swapfile 
# to mark the file as a swap file, and then use 
swapon /swapfile 
# to activate it. Also, put it in the /etc/fstab file 
# so that it will be initialized automatically, 
# using the following line:
/swapfile  none swap  defaults  0 0

# Just creating a partition and putting a file system on it is not enough 
# to start using it. To use a partition, you have to mount it as well. 
# By mounting a partition (or better, the file system on it), 
# you make its contents accessible through a specific directory.
# To manually mount a file system, you use the mount command. 
# To disconnect a mounted file system, you use the umount command.
# examples
mount /dev/sdb5 /mnt
umount /dev/sdb5
umount /mnt

# If your server is used in an environment where a dynamic storage topology is used,
# you may today have a storage device /dev/sdb5, 
# which tommorow changes in the storage topology can be /dev/sdc5 after the next reboot of your server. 
# This is why on a default RHEL 9 installation, 
# universally unique IDs (UUIDs) are used instead of device names.

# Every file system by default has a UUID associated with it
# not just file systems that are used to store files 
# but also special file systems such as the swap file system. 
# You can use the 
blkid 
# command to get an overview of the current file systems 
# on your system and the UUID that is used by that file system.

# To mount a file system based on a UUID, you use UUID=nnnnn instead of the device name
# mount UUID="5d34b37c-5d32-4790-8364-d22a8b8f88db" /mnt

# Normally, you do not want to be mounting file systems manually. 
# Once you are happy with them, it is a good idea to have them mounted automatically. 
# The classical way to do this is through the /etc/fstab file.

# Field                  Description
# Device                 The device that must be mounted. A device name, UUID, or label can be used.
# Mount Point            The directory or kernel interface where the device needs to be mounted.
# File System            The file system type.
# Mount Options          Mount options.
# Dump Support           Use 1 to enable support to back up using the dump utility. 
#                        This may be necessary for some backup solutions.
# Automatic Check        This field specifies whether the file system should be checked automatically when booting. 
#                        Use 0 to disable automated check, 
#                        1 if this is the root file system and it has to be checked automatically, 
#                        and 2 for all other file systems that need automatic checking while booting. 
#                        Network file systems should have this option set to 0.

# mount options
# Option               Use
# auto / noauto        Mounts/does not mount the file system automatically.
# acl                  Adds support for file system access control lists
# user_xattr           Adds support for user-extended attributes .
# ro                   Mounts the file system in read-only mode.
# atime / noatime      Disables/enables access time modifications.
# noexec / exec        Denies/allows execution of program files from the file system.

# The fifth column of /etc/fstab specifies support for the dump utility, 
# which was developed a long time ago to create file system backups. 
# On modern file systems this option is not needed, 
# which is why you will see it set to 0 in most cases.

# The last column indicates if the file system integrity needs to be checked while booting. 
# Enter a 0 if you do not want to check the file system at all, 
# a 1 if this is the root file system that needs to be checked before anything else, 
# and a 2 if this is a non-root file system that needs to be checked while booting. 
# Because file system consistency is checked in another way, 
# this option is now commonly set to the value 0.

findmnt --verify 
# Verifies /etc/fstab syntax and alerts you if anything is incorrect.

mount -a 
# Mounts all file systems that have a line in /etc/fstab and are not currently mounted.

# exercises
# 1. From a root shell, type 
blkid
# Use the mouse to copy the UUID=“nnnn” part for /dev/sdb5.
# 2. Type 
mkdir -p /mounts/data 
# to create a mount point for this partition.
# 3. Open /etc/fstab in an editor and add the following line:
UUID="nnnn"    /mounts/data    xfs    defaults 0 0
# 4. Before you attempt an automatic mount while rebooting, 
# it is a good idea to test the configuration. 
# Type 
mount -a
# This command mounts everything that is specified in /etc/fstab
# and that has not been mounted already.
# 5.Type 
df -h 
# to verify that the partition has been mounted correctly.

# In recent RHEL versions it is used as an input file to create systemd mounts, 
# as ultimately systemd is responsible for mounting file systems.
cat /run/systemd/generator/repo.mount

# sample spaced repetition questions
# 1.Which tool do you use to create GUID partitions?
# 2. Which tool do you use to create MBR partitions?
# 3. What is the default file system on RHEL 9?
# 4. What is the name of the file that is used to automatically mount partitions while booting?
# 5. Which mount option do you use if you want a file system not to be mounted automatically while booting?
# 6. Which command enables you to format a partition that has type 82 with the appropriate file system?
# 7. You have just added a couple of partitions for automatic mounting while booting. 
# How can you safely test if this is going to work without actually rebooting?
# 8. Which file system is created if you use the mkfs command without any file system specification?
# 9. How do you format an Ext4 partition?
# 10. How do you find UUIDs for all devices on your computer?

# lab

# Add two partitions to your server. Create both partitions with a size of 100 MiB. One of these partitions must be configured as swap space; the other partition must be formatted with an Ext4 file system.

# Configure your server to automatically mount these partitions. Mount the Ext4 partition on /mounts/data and mount the swap partition as swap space.

# Reboot your server and verify that all is mounted correctly.

# advanced storage
# Partitions are inflexible, they cannot be increased or reduced. 
# That is why the Logical Volume Manager was introduced. 
# Increasing and decreasing space is possible when working with LVM. 
# We can view this LVM architecture as layers.
# On the lowest layer, the storage devices are used. 
# These can be any storage devices, such as complete disks, partitions,  
# and whatever else is made possible in modern storage topologies.
# The seccond layer is physical volumes, 
# which allows other utilities to gain access to the logical volume representing the third layer. 

# Physical volumes can be added to the volume groups
# The volume group is not something that is fixed, 
# but it can be resized when needed, 
# which makes it possible to add more space on the volume group level 
# If you are running out of disk space on a logical volume, 
# you take available disk space from the volume group. 
# And if there is no available disk space in the volume group, 
# you just add it by adding a physical volume.
# On top of the volume group are the logical volumes. 
# Logical volumes get their disk space from available disk space in the volume group. 
# That means that a logical volume may consist of available storage from multiple physical volumes, 
# which adds an important layer of additional flexibility to the storage configuration.

# ADVICE :
# It is a good idea to avoid logical volumes from spanning multiple physical volumes; 
# if one of the physical volumes breaks, all files on the LVM file system will become inaccessible.
# The actual file systems are created on the logical volumes. 
# Because the logical volumes are flexible with regard to size, 
# that makes the file systems flexible as well. 

# It is also possible to reduce the size of a logical volume besides increasing it, 
# but only if the file system that was created on that volume supports the feature 
# Ext4 supports growing and shrinking; XFS size can only be increased.

# backup
# A snapshot keeps the current state of a logical volume,
# it can be used to revert to a previous situation 
# and to make a backup of the file system on the logical volume 
# if the volume is open.
# LVM snapshots are created by copying the logical volume administrative data 
# (the metadata) that describes the current state of files to a snapshot volume. 
# As long as nothing changes in the original volume the snapshot volume will stay the same size.
# When blocks are modified, the blocks containing the previous state of the file are copied over 
# to the snapshot volume, which will grow in size. 

# Another important advantage of using LVM logical volumes 
# is the option to replace failing hardware easily. 
# If a hard disk is failing, data can be moved within the volume group 
# (through the pvmove command), the failing disk can then be removed from the volume group,
# and a new hard disk can be added dynamically, 
# without requiring any downtime for the logical volume itself.

# You absolutely do not need to memorize the commands discussed here for the RHCSA exam. 
# All you really need to remember are pv, vg, and lv. 
# Open a command line, type pv, and press the Tab key twice. 
# This will show all commands that start with pv, 
# which are all commands that are used for managing physical volumes. 
# After you have found the command you need, 
# run this command with the --help option. 
# This shows a usage summary that lists everything you must do to create the element you need.

# you can use an empty cheap usb stick to practice creating partitions and lvms 
# these are all the steps you need to go through
# 1.  Open a root shell and type fdisk /dev/sdd
# 2.  Type p. This will show the current partition table layout. 
#     There should be none at this point.
# 3.  Type g to create a GPT partition table.
# 4.  Type n to create a new partition. Press Enter when asked for the partition number, 
#     as well as when asked for the first sector.
# 5.  When prompted for the last sector, type +1G to create a 1-GiB partition.
# 6.  Type t to change the partition type. 
#     As you only have one partition at the moment, 
#     this partition is automatically selected. 
#     When prompted for the partition type, enter lvm.
# 7.  Press p to verify the partition was created successfully.
# 8.  Repeat this procedure to create three other 1-GiB LVM partitions for future use.
# 9.  Press w to write the new partitions to disk and quit fdisk.
# 10. Use the lsblk command to verify that the new partitions were created successfully.
# 11. Type pvcreate /dev/sdd1 to mark the new partition as an LVM physical volume.
# 12. Type pvs to verify that the physical volume was created successfully.

# As an alternative to the pvs command, which shows 
# a summary of the physical volumes and their attributes, 
# you can use the pvdisplay command to show more details.
# If you want a compact overview of the current storage configuration on your server, 
# you might also like the lsblk command.

# Now that the physical volume has been created, 
# you can assign it to a volume group (VG). 
# Just type vgcreate followed by the name of the volume group you want to create 
# and the name of the physical device you want to add to it. 
# So, if the physical volume name is /dev/sdd1, the complete command is vgcreate vgdata /dev/sdd1. 
# You are completely free in your choice of name for the volume group.

# one shot
# If you want to add the disk /dev/sdc, for instance, 
# just type vgcreate vgdata /dev/sdc to create a volume group vgdata 
# that contains the /dev/sdc device. When you are doing this to add a device 
# that has not been marked as a physical volume yet, 
# the vgcreate utility will automatically flag it as a physical volume 
# so that you can see it while using the pvs command.

# When you’re creating volume groups, a physical extent size is used. 
# The physical extent size defines the size of the building blocks 
# used to create logical volumes. 
# A logical volume always has a size that is a multiple of the physical extent size. 
# If you need to create huge logical volumes, 
# it is more efficient to use a big physical extent size. 
# If you do not specify anything, a default extent size of 4 MiB is used. 
# The physical extent size is always specified as a multiple of 2 MiB, 
# with a maximum size of 128 MiB. 
# Use the vgcreate -s option to specify the physical extent size you want to use.

# When you’re working with an ext4 file system, logical extents are used. 
# The extent sizes on LVM are in no way related to the extent sizes that are used on the file systems.

# After creating the volume group, you can request details about the volume group 
# using the vgs command for a short summary, or the vgdisplay command to get more information.

# LVM volume device names can be addressed in multiple ways. 
# The simple method is to address the device as /dev/vgname/lvname. 
# So, for example, if you have created a volume with the name lvdata, 
# which gets its available disk space from the vgdata volume group, 
# the device name would be /dev/vgdata/lvdata

# The device mapper (abbreviated as dm) is a generic interface 
# that the Linux kernel uses to address storage devices. 
# The device mapper is used by multiple device types, 
# such as LVM volumes, but also by software RAID 
# and advanced network storage devices such as multipath devices.

# Device mapper devices are generated on detection and use names that are generated while booting, 
# like /dev/dm-0 and /dev/dm-1. To make these devices easier to access, 
# the device mapper creates symbolic links in the /dev/mapper directory.
# The symbolic links follow the naming structure /dev/mapper/vgname-lvname.
# So, the device /dev/vgdata/lvdata would also be known as /dev/mapper/vgdata-lvdata.
# When working with LVM logical volumes, you can use either of these device names.

# 1.  Open a root shell. 
#     Type pvs to verify the availability of physical volumes on your machine. 
#     You should see the /dev/sdd1 physical volume that was created previously.
# 2.  Type vgcreate vgdata /dev/sdd1. 
#     This will create the volume group with the physical volume assigned to it.
# 3.  Type vgs to verify that the volume group was created successfully. 
#     Also type pvs. Notice that this command now shows the name of the physical volumes, 
#     with the names of the volume groups they are assigned to.
# 4.  Type lvcreate -n lvdata -l 50%FREE vgdata. 
#     This creates an LVM logical volume with the name lvdata, 
#     which will use 50% of available disk space in the vgdata volume group.
# 5.  Type lvs to verify that the volume was added successfully.
# 6.  Type mkfs.ext4 /dev/vgdata/lvdata to create the file system.
# 7.  Type mkdir /files to create a folder on which the volume can be mounted.
# 8.  Add the following line to the bottom of /etc/fstab:
#     /dev/vgdata/lvdata /files ext4 defaults 0 0
# 9.  Type mount -a to verify that the mount works and mount the file system.
# 10. Use lsblk to verify that the partition was mounted successfully.

# common commands for managing lvm 
# Command            Explanation
# pvcreate           Creates physical volumes
# pvs                Shows a summary of available physical volumes
# pvdisplay          Shows a list of physical volumes and their properties
# pvremove           Removes the physical volume signature from a block device
# vgcreate           Creates volume groups
# vgs                Shows a summary of available volume groups
# vgdisplay          Shows a detailed list of volume groups and their properties
# vgremove           Removes a volume group
# lvcreate           Creates logical volumes
# lvs                Shows a summary of all available logical volumes
# lvdisplay          Shows a detailed list of available logical volumes and their properties

# resizing logical volumes
# lvresize -r -l 75%VG /dev/vgdata/lvdata 
#   Resizes the logical volume so that it will take 75% of the total disk space in the volume group. 
#   Notice that if currently the logical volume is using more than 75% of the volume group disk space, 
#   this command will try to reduce the logical volume size!
# lvresize -r -l +75%VG /dev/vgdata/lvdata 
#   Tries to add 75% of the total size of the volume group to the logical volume. 
#   This will work only if currently at least 75% of the volume group is unused. 
#   (Notice the difference with the previous command.)
# lvresize -r -l +75%FREE /dev/vgdata/lvdata 
#   Adds 75% of all free disk space to the logical volume.
# lvresize -r -l 75%FREE /dev/vgdata/lvdata 
#   Resizes the logical volume to a total size that equals 75% of the amount of free disk space, 
#   which may result in an attempt to reduce the logical volume size. 
#   (Notice the difference with the previous command.)

# ex remove vg from lv
# 1.  Use fdisk to create two partitions with a size of 2 GiB each, 
#       and set the type to lvm. In the remainder of this exercise, 
#       I’ll assume you’re using the partitions /dev/sdd3 and dev/sdd4 for this purpose.
# 2.  Use vgcreate vgdemo /dev/sdd3 to create a volume group.
# 3.  Type lvcreate -L 1G -n lvdemo /dev/vgdemo to create a logical volume 
#       with a size of 1 GiB. Notice that it is essential 
#       not to use all of the available disk space!
# 4.  Type vgextend vgdemo /dev/sdd4 to extend the volume group.
# 5.  Use pvs to verify extent usage on /dev/sdd3 and /dev/sdd4. 
#       You should see that sdd3 is using about half of its extents, 
#       and all extents on /dev/sdd4 are still unused.
# 6.  Now type lvextend -L +500M /dev/vgdemo/lvdemo /dev/sdd4 
#       to grow the lvdemo logical volume. Notice that you have to add 
#       /dev/sdd4 to ensure that free extents will be taken from the sdd4 device.
# 7.  Type pvs to verify current extent usage on the devices.
# 8.  Create a file system, using mkfs.ext4 /dev/vgdemo/lvdemo
# 9.  Temporarily mount the logical volume, using mount /dev/vgdemo/lvdemo /mnt
# 10. Use df -h to verify disk space usage.
# 11. Use dd if=/dev/zero of=/mnt/bigfile bs=1M count=1100. 
#       The size ensures that file data is on both PVs.



# Stratis
# In RHEL 9, Red Hat is offering Stratis as an advanced storage solution. 
# Stratis is a so-called volume-managing file system, 
# and it introduces advanced storage features that were not available prior to RHEL 8. 
# By doing so, Red Hat intends to offer an alternative to the Btrfs and ZFS file systems 
# that are used in other environments. 
# The following features are offered by Stratis:
# Thin provisioning: This feature enables a Stratis file system 
# to present itself to users as much bigger than it really is. 
# This is useful in many environments, such as virtual desktops, 
# where each user may see 20 GiB of available storage in total 
# although a much lower amount is actually provisioned to each user.
# Snapshots: A Stratis snapshot allows users 
# to take a “picture” of the current state of a file system. 
# This snapshot makes it easy to revert to the previous state of a file system, 
# rolling back any changes that have been made.
# Cache tier: Cache tier is a Ceph storage feature that ensures 
# that data can be stored physically closer to the Ceph client, 
# which makes data access faster.
# Programmatic API: The programmatic API ensures that storage 
# can easily be configured and modified through API access. 
# This is particularly interesting in cloud environments, 
# where setting up storage directly from cloud-native applications is extremely useful.
# Monitoring and repair: Whereas older file systems need tools like fsck 
# to verify the integrity of the file system, 
# Stratis has built-in features to monitor the health 
# of the file system and repair it if necessary.

# Architecture

# The lowest layer in the Stratis architecture is the pool. 
# The Stratis pool is comparable to an LVM volume group. 
# A pool represents all the available storage 
# and consists of one or more storage devices, 
# which in a Stratis environment are referred to as blockdev. 
# These block devices may not be thin provisioned 
# at the underlying hardware level. 
# Stratis creates a /dev/stratis/poolname directory for each pool.

# From the Stratis pool, XFS file systems are created. 
# Note that Stratis only works with XFS, 
# and the XFS file system it uses is integrated with the Stratis volume. 
# When a file system is created, no size is specified, 
# and each file system can grow up to the size of all the available storage space in the pool. 
# Stratis file systems are always thin provisioned. 
# The thin volume automatically grows as more data is added to the file system.

# create stratis storage, overview

# 1. Install the Stratis software using dnf by 
#     installing the stratis-cli and stratisd packages.
# 2. Start and enable the user-space daemon, 
#     using systemctl enable --now stratisd.
# 3. Once the daemon is running, 
#     use the stratis pool create command to create the pool that you want to work with. 
#     For instance, use stratis pool create mypool /dev/sde 
#     to create a pool that is based on the block device /dev/sdd. 
#     You can add additional block devices later, 
#     using stratis pool add-data poolname blockdevname, 
#     as in stratis pool add-data mypool /dev/sde.
# 4. Once you have created the pool, 
#     add a file system using stratis fs create poolname fsname.
# 5. To verify that all was created successfully, 
#     use the stratis fs list command.
# 6. After creating the file system, you can mount it. 
#     To mount a Stratis file system through /etc/fstab, 
#     you must use the UUID; using the device name is not supported. 
#     Also, when mounting the Stratis volume through /etc/fstab, 
#     include the mount option x-systemd.requires=stratisd.service 
#     to ensure that the Systemd waits to activate this device 
#     until the stratisd service is loaded. 
#     Without this option you won’t be able to boot your system anymore.

# management
# After creating the Stratis file system, you can perform several different management tasks. 
# To start with, you can dynamically extend the pool, using stratis pool add-data. 
# Also, you need to monitor Stratis volumes using Stratis-specific tools, 
# as the traditional Linux tools cannot handle the thin-provisioned volumes. 
# The following commands are available:
# stratis blockdev:   Shows information about all block devices that are used for Stratis.
# stratis pool:       Gives information about Stratis pools. 
#                     Note in particular the Physical Used parameter,   
#                     which should not come too close to the Physical Size parameter.
# stratis filesystem: Enables you to monitor individual file systems.

# exercise Stratis
#   You need one dedicated disk with a minimal size of 5 GiB to perform the steps in this exercise. 
#   In this exercise, the disk name /dev/sde is used as an example. 
#   Replace this name with the disk device name that is presented on your hardware.

# 1.  Type 
dnf install stratisd stratis-cli 
#     to install all the required packages.
# 2.  Type 
systemctl enable --now stratisd 
#     to enable the Stratis daemon.
# 3.  Type 
stratis pool create mypool /dev/sde 
#     to add the entire disk /dev/sde to the storage pool.
# 4.  Type 
stratis pool list 
#     to verify successful creation of the pool.
# 5.  Type 
stratis fs create mypool stratis1
#     to create the first Stratis file system. 
#     Note that you don’t have to specify a file system size.
# 6.  Type 
stratis fs list 
#     to verify the creation of the file system.
# 7.  Type 
mkdir /stratis1 
#     to create a mount point for the Stratis file system.
# 8.  Type 
stratis fs list 
#     to find the Stratis volume UUID.
# 9.  Add the following line to /etc/fstab to enable the volume 
#     to be mounted automatically. 
#     Make sure to use the UUID name that is used by your Stratis file system.
UUID=xxx /stratis1 xfs defaults,x-systemd.requires=stratisd.
service   0 0
# 10. Type 
mount -a 
#     to mount the Stratis volume. 
#     Use the 
mount 
#     command to verify that this procedure worked successfully.
# 11. Type 
cp /etc/[a-f]* /stratis1 
#     to copy some files to the Stratis volume.
# 12. Type 
stratis filesystem snapshot mypool stratis1 stratis1-snap 
#     to create a snapshot of the volume you just created. 
#     Note that this command may take up to a minute to complete.
# 13. Type 
stratis filesystem list 
#     to get statistics about current file system usage.
# 14. Type 
rm -f /stratis1/a* 
#     to remove all files that have a name starting with a.
# 15. Type 
mount /dev/stratis/mypool/stratis1-snap /mnt 
#     and verify that the files whose names start with a 
#     are still available in the /mnt directory.
# 16. Reboot your server. 
#     After reboot, verify that the Stratis volume is still automatically mounted.

# sample questions for spaced repetition
# 1. Which partition type is used on a GUID partition that needs to be used in LVM?
# 2. Which command enables you to create a volume group with the name vgroup 
#    that contains the physical device /dev/sdb3 and uses a physical extent size of 4 MiB?
# 3. Which command shows a short summary of the physical volumes 
#    on your system as well as the volume group to which these belong?
# 4. What do you need to do to add an entire hard disk /dev/sdd to the volume group vgroup?
# 5. Which command enables you to create a logical volume lvvol1 with a size of 6 MiB?
# 6. Which command enables you to add 100 MB to the logical volume lvvol1, 
#    assuming that the disk space is available in the volume group?
# 7. Which two commands do you use to remove a physical volume from a volume group?
# 8. When working with Stratis, what line would you add to /etc/fstab to mount the Stratis volume?
# 9. Which command do you use to create a Stratis pool that is based on the block device /dev/sdd?
# 10. How do you format a Stratis volume with the Ext4 file system?

# lab 1
# Create a 500-MB logical volume named lvgroup. 
# Format it with the XFS file system and mount it persistently on /groups. 
# Reboot your server to verify that the mount works.
# After rebooting, add another 250 MB to the lvgroup volume that you just created. 
# Verify that the file system resizes as well while resizing the volume.
# Verify that the volume extension was successful.

# lab 2
# Create a Stratis pool with a size of 5 GiB. 
# In this pool, create two Stratis file systems 
# and ensure that they are automatically mounted.
# Add an additional block device to the Stratis pool 
# and verify that the size of the pool was successfully extended.
# Ensure that the new Stratis device is 
# automatically mounted on the directory /stratis while rebooting.
