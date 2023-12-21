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
# When you add the -W parameter, the command displays the
# path in the Windows directory structure.
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
# see that /usr/bin is included in the list, but because there also is an internal
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
# Type !sometext to execute the last command that starts with sometext. 
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
# letters gd.
# 3. To make it clear to Bash what you want, type i (so that your prompt at this point
# shows the command gdi). Press Tab again. Bash now completes the command to
# gdisk. Press Enter to launch it, and press Enter again to close it.
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
# 1. Because man -k does not give the expected result, it makes sense to look in the
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
# 1. What is a variable?
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

# chapter 5
