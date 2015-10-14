#!/bin/bash
# Generic script for preparing a development environtment in Ubuntu Desktop

# check distro (run only if ubuntu is found)
if [ "$DESKTOP_SESSION" != "Ubuntu" || "$DESKTOP_SESSION" != "Lubuntu" || "$DESKTOP_SESSION" != "Xubuntu" || "$DESKTOP_SESSION" != "Kubuntu" ]; then
 echo "This is script is not tested on non-ubuntu distros. Terminating..."
 exit 1
fi

# Update repositories
echo Retrieving list of packages...
sudo apt-get -qq update

# Install VIM
echo Installing Vim...
sudo apt-get -y install vim

# Install Silver searcher (replacement for find)
echo Installing ag...
sudo apt-get -y install silversearcher-ag

# Install Atom
echo Installing Atom...
# TODO ONLY DO THIS IF NOT INSTALLED
wget https://github.com/atom/atom/releases/download/v1.0.19/atom-amd64.deb && sudo dpkg -i atom-amd64.deb

# aliases
# TODO make this persistent
alias gg="git status && git log | head"

# Post execution steps:
  # Configure git email and name
  # git config --global user.email "you@example.com"
  # git config --global user.name "Your Name"
