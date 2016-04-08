#!/bin/bash
# Generic script for preparing a development environtment in Ubuntu Desktop
# RUN THIS SCRIPT WITH SUDO

# profile backup
echo "Making a backup of your .profile file..."
cp -f $HOME/.profile $HOME/.profile.backup

# Update repositories
echo Retrieving list of packages...
apt-get -qq update

# Install curl
echo Installing curl...
apt-get -y install curl

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

# Install Remmina (RDP / VNC client)
echo Installing Remmina...
apt-get -y install remmina

# Install Atom
echo Installing Atom...
# TODO ONLY DO THIS IF NOT INSTALLED
wget https://github.com/atom/atom/releases/download/v1.0.19/atom-amd64.deb && sudo dpkg -i atom-amd64.deb

# aliases
alias gg="git status && git log | head"
echo "alias gg=\"git status && git log | head\"" >> $HOME/.bashrc

#lol, a popular git log alias
git config --global alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit

# Post execution steps:
  # Configure git email and name
  # git config --global user.email "you@example.com"
  # git config --global user.name "Your Name"
