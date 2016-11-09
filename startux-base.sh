#!/bin/bash
# Generic script for preparing a development environtment in Ubuntu Desktop
# DO NOT RUN THIS SCRIPT AS ROOT

# profile backup
echo -e "\e[1;31mMaking a backup of your .profile file...\e[0m"
cp -f $HOME/.profile $HOME/.profile.backup

# Update repositories
echo -e "\e[1;31mRetrieving list of packages...\e[0m"
sudo apt-get -qq update

# Install Terminator. A super-killer terminal
echo -e "\e[1;31mInstalling Terminator...\e[0m"
sudo apt-get -y install terminator

# Install curl
echo -e "\e[1;31mInstalling curl...\e[0m"
sudo apt-get -y install curl

# Install VIM
echo -e "\e[1;31mInstalling Vim...\e[0m"
sudo apt-get -y install vim

# Install Silver searcher (replacement for find)
echo -e "\e[1;31mInstalling ag...\e[0m"
sudo apt-get -y install silversearcher-ag

# Install htop (convenient replacement for ps)
echo -e "\e[1;31mInstalling htop...\e[0m"
sudo apt-get -y install htop

# Install at (application to  execute commands at a given time)
echo -e "\e[1;31mInstalling at...\e[0m"
sudo apt-get -y install at

# Install Remmina (RDP / VNC client)
echo -e "\e[1;31mInstalling Remmina...\e[0m"
sudo apt-get -y install remmina

# Install Atom
echo -e "\e[1;31mInstalling Atom...\e[0m"
# TODO ONLY DO THIS IF NOT INSTALLED
wget https://github.com/atom/atom/releases/download/v1.7.4/atom-amd64.deb  && sudo dpkg -i atom-amd64.deb

# Install npm, necessary to install atompackages
echo -e "\e[1;31mInstalling npm...\e[0m"
sudo apt-get -y install npm

# Install Atompackages
echo -e "\e[1;31mInstalling Atomextra packages...\e[0m"
apm install atom-beautify color-picker emmet highlight-selected javascript-snippets meteor-helper meteor-snippets react linter-lesshint git-time-machine git-plus merge-conflicts semicol goto goto-definition file-icons atom-ternjs

echo "Note: Use this instructions to configure atom-ternjs https://atom.io/packages/atom-ternjs"

# aliases
echo "Setting git aliases... lol st co br ci...\e[0m"
alias gg="git status && git log | head"
echo "alias gg=\"git status && git log | head\"" >> $HOME/.bashrc
echo "Setting alias 'clut', it checks code diff for Comments, Logs and TODOs"
alias clut="git diff | grep // && git diff | grep console. && git diff | grep TODO"
echo "alias clut=\"git diff | grep // && git diff | grep console. && git diff | grep TODO\"" >> $HOME/.bashrc

#lol, a popular git log alias
git config --global alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit

#install bash-git-prompt, an informative bash prompt
echo -e "\e[1;31mInstalling bash-git-prompt...\e[0m"
cd ~
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
echo -e "source ~/.bash-git-prompt/gitprompt.sh" >> $HOME/.bashrc
GIT_PROMPT_ONLY_IN_REPO=1

# Post execution steps:
  # Configure git email and name
  # git config --global user.email "you@example.com"
  # git config --global user.name "Your Name"
