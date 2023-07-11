#!/bin/bash
# BASIC COMMANDS 
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
cd tmp
cd .. 
# mount : Mount the disk to the root file system. If you call the
# command without parameters, it shows a list of all
# mounted disks.
mount
# find : Find a file or directory. The first parameter find . -name vim
# specifies the directory to start searching. 
touch /tmp/somevimfile
find /tmp -name *vim*
# touch : create a new file
touch test.txt
touch some.yml
touch some_git.yml
# echo : print something
# > : redirect output of a command 
echo "some PATH" > test.txt 
# grep : Find a file by its contents. 
grep "PATH" *
grep -Rn "PATH" .
grep "PATH" * .*
# find : find a file or directory by its name 
find . -name "*.txt"
# pipe : send the output of one command to another
find . -name "*.yml" | grep "git" > tst.txt
# file permissions

