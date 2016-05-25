#!/bin/bash
# Generic script for preparing a development environtment in Ubuntu Desktop
# DO NOT RUN THIS SCRIPT AS ROOT

# profile backup
echo "Making a backup of your .profile file..."
cp -f $HOME/.profile $HOME/.profile.backup

# Update repositories
echo Retrieving list of packages...
sudo apt-get -qq update

# Install Terminator. A super-killer terminal
echo Installing Terminator...
sudo apt-get -y install terminator

# Install curl
echo Installing curl...
sudo apt-get -y install curl

# Install VIM
echo Installing Vim...
sudo apt-get -y install vim

# Install Silver searcher (replacement for find)
echo Installing ag...
sudo apt-get -y install silversearcher-ag

# Install htop (convenient replacement for ps)
echo Installing htop...
sudo apt-get -y install htop

# Install at (application to  execute commands at a given time)
echo Installing at...
sudo apt-get -y install at

# Install Remmina (RDP / VNC client)
echo Installing Remmina...
sudo apt-get -y install remmina

# Install Atom
echo Installing Atom...
# TODO ONLY DO THIS IF NOT INSTALLED
wget https://github.com/atom/atom/releases/download/v1.7.4/atom-amd64.deb  && sudo dpkg -i atom-amd64.deb

# Install npm , necessary to install atom packages
echo Installing npm...
sudo apt-get -y install npm

# Install Atom packages
echo Installing Atom extra packages...
apm install atom-beautify color-picker emmet highlight-selected javascript-snippets meteor-helper meteor-snippets react

# aliases
echo Setting git aliases... lol st co br ci...
alias gg="git status && git log | head"
echo "alias gg=\"git status && git log | head\"" >> $HOME/.bashrc

#lol, a popular git log alias
git config --global alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit

#install bash-git-prompt, an informative bash prompt
echo Installing bash-git-prompt...
cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
echo "source ~/.bash-git-prompt/gitprompt.sh" >> $HOME/.bashrc
GIT_PROMPT_ONLY_IN_REPO=1

# Post execution steps:
  # Configure git email and name
  # git config --global user.email "you@example.com"
  # git config --global user.name "Your Name"
