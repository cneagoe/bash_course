# bash cmd refresh
# what does ls do 
# what does pwd do 
# what does cd do 
# what does mkdir do 

# What git does
# It allows you to revert selected files back to a previous state, 
# revert the entire project back to a previous state, 
# compare changes over time, see who last modified something 
# that might be causing a problem, who introduced an issue and when, and more.

# Git architecture
# https://git-scm.com/book/en/v2/images/distributed.png

# In a DVCS (such as Git, Mercurial or Darcs), 
# clients don’t just check out the latest snapshot of the files; 
# rather, they fully mirror the repository, including its full history. 
# Thus, if any server dies, and these systems were collaborating via that server, 
# any of the client repositories can be copied back up to the server to restore it. 
# Every clone is really a full backup of all the data.

# install git
# linux rpm
sudo dnf install git-all
# linux deb
sudo apt install git-all
# win
# https://git-scm.com/download/win
# mac
# should already have it installed, if not 
brew install git

# You can view all of your settings and where they are coming from using:
git config --list --show-origin

# set up username and email
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com

# configure the default editor
# it's used when git needs you to type in something like a commit message
git config --global core.editor vim

# getting a repo going
# You typically obtain a Git repository in one of two ways:
# You can take a local directory that is currently not under version control, 
# and turn it into a Git repository, or
# You can clone an existing Git repository from elsewhere.

# create an account on github 
# create a repo on github
# generate and add an ssh key to your account 
# clone your new repo using the ssh link option
git clone git@github.com:libgit2/libgit2.git
