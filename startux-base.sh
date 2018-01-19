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

# Install Trash, like rm but sends to trash
echo -e "\e[1;31mInstalling Trash...\e[0m"
sudo apt-get -y install trash

# Install zsh, an alternative customizable bash shell
echo -e "\e[1;31mInstalling Zsh...\e[0m"
sudo apt-get -y install Zsh

# Set zsh as default shell
echo -e "\e[1;31mSetting Zsh as default shell...\e[0m"
chsh -s /bin/zsh

# Install oh my zsh! Themes for zsh shell
echo -e "\e[1;31mInstalling oh my zsh!...\e[0m"
curl -L http://install.ohmyz.sh | sh

# Install Atom
echo -e "\e[1;31mInstalling Atom...\e[0m"
# TODO ONLY DO THIS IF NOT INSTALLED
wget https://github.com/atom/atom/releases/download/v1.7.4/atom-amd64.deb  && sudo dpkg -i atom-amd64.deb

# Install npm, necessary to install atompackages
echo -e "\e[1;31mInstalling npm...\e[0m"
sudo apt-get -y install npm

# Install Meld, a graphical diff tool
echo -e "\e[1;31mInstalling Meld...\e[0m"
sudo apt-get -y install meld

# Install Zeal, an offline developer docs
echo -e "\e[1;31mInstalling Zeal...\e[0m"
sudo apt-get install zeal

# Install tig, git commits browser
echo -e "\e[1;31mInstalling tig...\e[0m"
sudo apt install tig

# Install depcheck, a npm deps checker
echo -e "\e[1;31mInstalling depcheck...\e[0m"
sudo npm install depcheck -g

# Install code-notes, a TODOs, NOTEs,... code scanner
echo -e "\e[1;31mInstalling code-notes...\e[0m"
sudo npm install code-notes -g

# Install gtop, an activity monitor
echo -e "\e[1;31mInstalling gtop...\e[0m"
sudo npm install -g gtop

# Install fkill, an interactive replacement for kill
echo -e "\e[1;31mInstalling fkill...\e[0m"
sudo npm install -g fkill-cli

# Install git quick-stats, repo statistics
echo -e "\e[1;31mInstalling git quick-stats...\e[0m"
git clone https://github.com/arzzen/git-quick-stats.git && cd git-quick-stats && sudo make install

# Install Atompackages
echo -e "\e[1;31mInstalling Atom extra packages...\e[0m"
apm install color-picker emmet highlight-selected javascript-snippets meteor-helper meteor-snippets react linter-lesshint git-time-machine git-plus merge-conflicts semicol goto file-icons atom-ternjs pigments tool-bar markdown-writer tool-bar-markdown-writer markdown-pdf bezier-curve-editor compare-files atom-typescript refactor js-refactor atom-prettier autocomplete-js-import clipboard-plus meteor-api

# setting clipboard-plus shortcuts

echo -e "\e[1;31mSetting up atom packages...\e[0m"
echo "'.platform-linux atom-text-editor:not([mini])':
  'ctrl-shift-v': 'clipboard-plus:toggle'" >> ~/.atom/keymap.cson

echo "Note: Use this instructions to configure atom-ternjs https://atom.io/packages/atom-ternjs"

# aliases
echo "Setting git aliases... lol st co br ci...\e[0m"
alias gg="git status && git log | head"
echo "alias gg=\"git status && git log | head\"" >> $HOME/.bashrc
echo "Setting alias 'clut', it checks code diff for Comments, Logs and TODOs"
alias clut="git diff | grep // && git diff | grep console. && git diff | grep TODO"
echo "alias clut=\"git diff | grep // && git diff | grep console. && git diff | grep TODO\"" >> $HOME/.bashrc

# lol, a popular git log alias
git config --global alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.l "log --stat"
# git customizations
git config --global help.autocorrect 50
git config --global color.status.changed "white yellow bold"

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
