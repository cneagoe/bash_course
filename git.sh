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

# Each file in your working directory can be in one of two states: 
# tracked or untracked. 
# Tracked files are files that were in the last snapshot, as well as any newly staged files; 
# they can be unmodified, modified, or staged.
# Untracked files are everything else — 
# any files in your working directory that were not in your last snapshot and are not in your staging area.
# overview
# https://git-scm.com/book/en/v2/images/lifecycle.png

# check status 
git status

# ignore 
cat .gitignore

# add new files
git add README

# see what you’ve changed but not yet staged
git diff

# see what you’ve staged that will go into your next commit
git diff --staged

# commit changes
git commit

# avoid getting thrown in editor to add commit message
git commit -m "short summary of changes"

# push local repo to remote
git push

# remove files
git rm

# see commit history
git log

# see summary of each commit
git log --stat

# the log command has manny options for formating
git log --pretty=oneline


# you commit too early and possibly forget to add some files, 
# or you mess up your commit message. 
# If you want to redo that commit, make the additional changes you forgot, 
# stage them, and commit again using the --amend option
git commit -m 'Initial commit'
git add forgotten_file
git commit --amend

# revert changes to a file before adding it
git checkut filename

# make some changes to some files
# stage the changes
git add *
# unstanging changes to a file
git reset HEAD filename
# it's an obsolete method please use with caution

# Git version 2.23.0 introduced a new command: 
git restore
# It’s basically an alternative to git reset which we just covered.

# show remote servers
git remote -v

# more info about remote
git remote show origin

# push code to remote
git push <remote> <branch>

# show tags 
git tag

# create lightweight tag
git tag v1.4-lw

# create annotated tag
git tag -a v1.4 -m "my version 1.4"

# tag a particular commit
git tag -a v1.2 9fceb02

# push tag to remote
git push origin v1.5
# by default git push doesn't push tags as well
# so we will need to be explicit
# push all tags
git push origin --tags

# create a new branch
git branch testing
