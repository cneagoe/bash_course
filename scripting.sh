#!/bin/bash

# manual
# https://www.gnu.org/software/bash/manual/html_node/index.html

# will fix issues caused by referencing undefined variables 
# (which default to "") 
set -o nounset
# will fix issues caused by ignoring failing commands
set -o errexit

# safer rm
cd tmp && rm scratchfile

# If a failing command is to be tolerated use this idiom:
if ! cd /tmp/some_nonexisting_folder ; then
    echo "failure ignored"
fi

# functions can be used as commands
ExtractBashComments() {
    egrep "^#"
} 
cat myscript.sh | ExtractBashComments | wc 
comments=$(ExtractBashComments < myscript.sh)

# iterating over stdin - similar to awk
SumLines() {
    local sum=0
    local line=""
    while read line ; do
        sum=$((${sum} + ${line}))
    done
    echo ${sum}
} 
SumLines < data_one_number_per_line.txt 
log() {  # classic logger
   local prefix="[$(date +%Y/%m/%d\ %H:%M:%S)]: "
   echo "${prefix} $@" >&2
} 
log "INFO" "a message"

# Try moving all bash code into functions 
# leaving only global variable/constant definitions 
# and a call to “main” at the top-level.

# Variable Annotations 
# Bash allows for a limited form of variable annotations. 
# The most important ones are:
# local (for local variables inside a function)
# readonly (for read-only variables)

# Favor  $() over backticks (`)
# Backticks are hard to read 
# and in some fonts easily confused with single quotes.
# $()also permits nesting without the quoting headaches.
# both commands below print out: A-B-C-D
echo "A-`echo B-\`echo C-\\\`echo D\\\`\``"
echo "A-$(echo B-$(echo C-$(echo D)))"

# Favor [[]] (double brackets) over [] 
# [[]] avoids problems like unexpected pathname expansion, 
# offers some syntactical improvements,
# and adds new functionality:

# Operator        Meaning
# ||              logical or (double brackets only)
# &&              logical and (double brackets only)
# <               string comparison (no escaping necessary within double brackets)
# -lt             numerical comparison
# =               string matching with globbing
# ==              string matching with globbing (double brackets only, see below)
# =~              string matching with regular expressions (double brackets only , see below)
# -n              string is non-empty        
# -z              string is empty
# -eq             numerical equality
# -ne             numerical inequality

# single bracket
# [ "${name}" \> "a" -o ${name} \< "m" ]

# double brackets
# [[ "${name}" > "a" && "${name}" < "m"  ]]

# String Manipulation
# Basics
f="path1/path2/file.ext"  
len="${#f}" # = 20 (string length) 
# slicing: ${<var>:<start>} or ${<var>:<start>:<length>}
slice1="${f:6}" # = "path2/file.ext"
slice2="${f:6:5}" # = "path2"
slice3="${f: -8}" # = "file.ext"(Note: space before "-")
pos=6
len=5
slice4="${f:${pos}:${len}}" # = "path2"
# Substitution (with globbing)
f="path1/path2/path3/file.ext"  
single_subst="${f/path?/x}"   # = "x/path2/path3/file.ext"
global_subst="${f//path?/x}"  # = "x/x/x/file.ext" 
# string splitting
readonly DIR_SEP="/"
array=(${f//${DIR_SEP}/ })
second_dir="${array[1]}"     # = path2

# Deletion at beginning/end (with globbing)
f="path1/path2/file.ext" 
# deletion at string beginning 
extension="${f#*.}"  # = "ext" 
# greedy deletion at string beginning
filename="${f##*/}"  # = "file.ext" 
# deletion at string end
dirname="${f%/*}"    # = "path1/path2" 
# greedy deletion at end
root="${f%%/*}"      # = "path1"

# Some commands expect files as parameters  
# so straightforward pipelining does not work.
# This is where <() operator comes in handy 
# as it takes a command and transforms it into something
# which can be used as file contents:

# download and diff two webpages
diff <(wget -O - url1) <(wget -O - url2)

# Built-In Variables
# For reference
# $0   name of the script
# $n   positional parameters to script/function
# $$   PID of the script
# $!   PID of the last command executed (and run in the background)
# $?   exit status of the last command  (${PIPESTATUS} for pipelined commands)
# $#   number of parameters to script/function
# $@   all parameters to script/function (sees arguments as separate word)
# $*   all parameters to script/function (sees arguments as single word)
# Note
# $*   is rarely the right choice.
# $@ handles empty parameter list and white-space within parameters correctly
# $@ should usually be quoted like so "$@"

# Debugging
# To perform a syntax check/dry run of your bash script run:
bash -n myscript.sh
# To produce a trace of every command executed run:
bash -v myscripts.sh
# To produce a trace of the expanded command use:
bash -x myscript.sh
# -v and -x can also be made permanent by adding
# set -o verbose and set -o xtrace to the script prolog.
# This might be useful if the script is run on a remote machine, e.g.
# a build-bot and you are logging the output for remote inspection.

# IMPORTANT
# Signs you should not be using a bash script
# your script is longer than a few hundred lines of code
# you need data structures beyond simple arrays
# you have a hard time working around quoting issues
# you do a lot of string manipulation
# you do not have much need for invoking other programs or pipe-lining them
# you worry about performance
# Instead consider scripting languages like Python

# defensive programming
# thinking about what could go wrong

mkdir /some_path_that_exists/inexistent_folder/target_directory
# the command above will fail if any parrent of the target_directory is missing
# using -p will help with this issue
mkdir -p /some_path_that_exists/inexistent_folder/target_directory
# the command above will not fail 
# if any folder is missing along the path it will be created

rm /some_inexistent_file
# the command above will fail if the file doesn't exist
# we can use the -f option for this issue
rm -f /some_inexistent_file
# the command above will silently continue if the file is missing

# cover for the possibility of spaces in filenames
# use quotes around variables
if [[ $filename == "foo" ]];
# will fail if filename has spaces
if [[ "$filename" == "foo" ]];
# will NOT fail if filename has spaces
# same applies to $@
foo() { 
    for i in $@; 
    do 
        printf "%s\n" "$i"; 
    done 
}; 
foo bar "baz quux"
# will print
# bar
# baz
# quux
foo() { 
    for i in "$@"; 
    do 
        printf "%s\n" "$i"; 
    done 
}; 
foo bar "baz quux"
# will print
# bar
# baz quux

# you might see something like the loop bellow 
# used to loop through arguments
# but please use @ 
# it's way more readable
for value; do
    echo "$value"
    # do more stuff with $value...
done

# If you use find and xargs together, 
# you should use -print0 to separate filenames 
# with a null character rather than new lines. 
# You then need to use -0 with xargs.
touch "foo bar"
find | xargs ls
# the above command will fail
find -print0 | xargs -0 ls
# the above command will NOT fail

# https://mywiki.wooledge.org/BashFAQ
# https://mywiki.wooledge.org/BashPitfalls

# string substitution
printf "Hello, my name is %s .\n" "$1"
# try to use printf over echo whereever possible
# %s for strings
# %d for integers
# %f for floating point

# we can specify with for better formatting
printf "%8s %-15s:\n" first seccond third forth fifth sixth
# or we can pad 0 to numbers
printf "%04d\n" 12 23 56 123 255

# we can also print to a variable
printf -v num4 "%04d" 4
printf "%s\n" "$num4"

# standard output redirection to file
printf "message" > testfile
# append
printf "message" >> testfile
# error output redirection
printf "error" 2> /dev/null
# error redirect to same place as standard
printf "error" > file 2>&
# redirect both error and standard output
printf "error" &> file

# variable assignment
# no spaces between = sign
bankname="WorldBanc"
founded="1969"
ceo="Jeff Gates"

sudo apt install unzip
sudo apt install curl

curl -L https://github.com/bootdotdev/worldbanc/archive/refs/heads/main.zip -o worldbanc.zip
unzip worldbanc.zip
rm worldbanc.zip
mv worldbanc-main worldbanc
sudo chown -R $(whoami) worldbanc
sudo chmod -R 755 worldbanc
