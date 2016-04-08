#!/bin/bash
# Generic script for preparing a development environtment in Ubuntu Desktop
# RUN THIS SCRIPT WITH SUDO

# check distro (run only if ubuntu is found)
if [ "$DESKTOP_SESSION" != "Ubuntu" || "$DESKTOP_SESSION" != "Lubuntu" || "$DESKTOP_SESSION" != "Xubuntu" || "$DESKTOP_SESSION" != "Kubuntu" ]; then
 echo "This is script is not tested on non-ubuntu distros. Terminating..."
 exit 1
fi

# profile backup
echo "Making a backup of your .profile file..."
cp -f $HOME/.profile $HOME/.profile.backup

# Update repositories
echo Retrieving list of packages...
apt-get -qq update

# Install VIM
echo Installing Vim...
apt-get -y install vim

# Install Silver searcher (replacement for find)
echo Installing ag...
apt-get -y install silversearcher-ag

# Install htop (convenient replacement for ps)
echo Installing htop...
apt-get -y install htop

# Install at (application to  execute commands at a given time)
echo Installing at...
apt-get -y install at

# Install Atom
echo Installing Atom...
# TODO ONLY DO THIS IF NOT INSTALLED
wget https://github.com/atom/atom/releases/download/v1.0.19/atom-amd64.deb && sudo dpkg -i atom-amd64.deb

# aliases
alias gg="git status && git log | head"
echo "alias gg=\"git status && git log | head\"" >> $HOME/.bashrc

#lol, a popular git log alias
git config --global alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"

# Post execution steps:
  # Configure git email and name
  # git config --global user.email "you@example.com"
  # git config --global user.name "Your Name"
