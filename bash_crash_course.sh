#!/bin/bash
# BASIC COMMANDS 

# accessing documentation
man ls

# view history of commands run so far
history

# environment variables
# find out what shell you're using
echo $SHELL
# check the PATH variable
echo $PATH
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
# create a new empty file at a location
touch /tmp/somevimfile
# find : Find a file or directory. 
# The first parameter find . -name vim specifies the directory to start searching. 
find /tmp -name *vim*
# touch : create a new file
touch test.txt
touch some.yml
touch some_git.yml
# echo : print something
# > and >> : redirect output of a command 
echo "some PATH" > test.txt 
echo "some other PATH" >> test.txt 
# grep : Search in the contents of a file or directory. 
grep "PATH" *
grep -Rn "PATH" .
grep "PATH" * .*
# find : Search for a file or directory with a certain name or type 
find . -name "*.txt"
# pipe : send the output of one command to another
find . -name "*.yml" | grep "git" > tst.txt
history | grep ls
# file permissions
touch script.sh
echo '#!/bin/bash' > script.sh
echo 'echo "hello World"' >> script.sh
# check permissions
ll script.sh
ls -altr script.sh
# try to execute the script
./script.sh
# try to execute the script 
bash script.sh
# add the execute permission
chmod +x script.sh
# try to execute the script again
./script.sh
# remove the script
rm script.sh

# create your own environment variables
export IRONMAN=Tony
echo $IRONMAN

# create a variable in a script
NAME=value

# file paths
# absolute path example
/home/codio/workspace
# relative path example
./workspace



