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
# see glob link
find /tmp -name *vim*
# touch : create a new file
touch test.txt
touch some.yml
touch some_git.yml

# grep : Search in the contents of a file or directory. 
grep "PATH" *
grep -Rn "PATH" .
grep "PATH" * .*

# find : Search for a file or directory with a certain name or type 
find . -name "*.txt"

# pipe : send the output of one command to another
find . -name "*.yml" | grep "git" > tst.txt
history | grep ls

# echo : print something
# > and >> : redirect output of a command 
echo "some PATH" > test.txt 
echo "some other PATH" >> test.txt 

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

# create a local variable
NAME=value

# file paths
# absolute path example
ls /home/codio/workspace
# relative path example
ls ./workspace

# sudo (super user do)
# run current command as root user
# can be put in front of any command

# package manager
# ubuntu apt

# update package lists
apt-get update

# install software
apt-get install apache2

# service management

# set the service to run at boot time
systemctl enable apache2

# start a service
sudo systemctl start apache2

# check service status
sudo systemctl status apache2

# generate an ssh key
ssh-keygen -t rsa
