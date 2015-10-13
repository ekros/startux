#!/bin/bash

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

# Install Atom
echo Installing Atom...
wget https://github.com/atom/atom/releases/download/v1.0.19/atom-amd64.deb && sudo dpkg -i atom-amd64.deb

# aliases
alias gg="git status && git log | head"

# Post execution steps:
  # Configure git email and name
  # git config --global user.email "you@example.com"
  # git config --global user.name "Your Name"
