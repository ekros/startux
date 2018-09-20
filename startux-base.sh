#!/bin/bash
# Generic script for preparing a development environtment in Ubuntu Desktop
# DO NOT RUN THIS SCRIPT AS ROOT

# profile backup
echo -e "\e[1;31mMaking a backup of your .profile file...\e[0m"
cp -f $HOME/.profile $HOME/.profile.backup

# Update repositories
echo -e "\e[1;31mRetrieving list of packages...\e[0m"
sudo apt -qq update

# Install Tilix. An advanced GTK3 tiling terminal emulator.
echo -e "\e[1;31mInstalling Tilix...\e[0m"
sudo apt -y install tilix

# Install curl
echo -e "\e[1;31mInstalling curl...\e[0m"
sudo apt -y install curl

# Install VIM
echo -e "\e[1;31mInstalling Vim...\e[0m"
sudo apt -y install vim

# Install Silver searcher (replacement for find)
echo -e "\e[1;31mInstalling ag...\e[0m"
sudo apt -y install silversearcher-ag

# Install htop (convenient replacement for ps)
echo -e "\e[1;31mInstalling htop...\e[0m"
sudo apt -y install htop

# Install at (application to  execute commands at a given time)
echo -e "\e[1;31mInstalling at...\e[0m"
sudo apt -y install at

# Install Remmina (RDP / VNC client)
echo -e "\e[1;31mInstalling Remmina...\e[0m"
sudo apt -y install remmina

# Install Trash, like rm but sends to trash
echo -e "\e[1;31mInstalling Trash...\e[0m"
sudo apt -y install trash

# Install xscreensaver and extras
echo -e "\e[1;31mInstalling screensaver...\e[0m"
sudo apt -y install xscreensaver xscreensaver-data-extra xscreensaver-gl-extra

# Install Atom
echo -e "\e[1;31mInstalling Atom...\e[0m"
# TODO ONLY DO THIS IF NOT INSTALLED
wget https://atom.io/download/deb && sudo dpkg -i deb
echo -e "\e[1;31mInstalling missing dependencies (if any)...\e[0m"
sudo apt -fy install

# Install npm, necessary to install atompackages
echo -e "\e[1;31mInstalling npm...\e[0m"
sudo apt -y install npm

# Install Meld, a graphical diff tool
echo -e "\e[1;31mInstalling Meld...\e[0m"
sudo apt -y install meld

# Install Zeal, an offline developer docs
echo -e "\e[1;31mInstalling Zeal...\e[0m"
sudo apt -y install zeal

# Install tig, git commits browser
echo -e "\e[1;31mInstalling tig...\e[0m"
sudo apt -y install tig

# Install git kraken, an awesome GIT GUI
echo -e "\e[1;31mInstalling GitKraken...\e[0m"
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb && sudo dpkg -i gitkraken-amd64.deb

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

# Install npm-upgrade, interactively upgrades outdated dependencies
echo -e "\e[1;31mInstalling git quick-stats...\e[0m"
sudo npm i -g npm-upgrade

# Install apm, the Atom Package manager
echo -e "\e[1;31mInstalling apm, Atom Package Manager...\e[0m"
sudo npm install -g apm

# Install Atompackages
echo -e "\e[1;31mInstalling Atom extra packages...\e[0m"
apm install color-picker emmet highlight-selected javascript-snippets meteor-snippets react git-time-machine git-plus merge-conflicts trailing-semicolon goto file-icons atom-ternjs pigments tool-bar markdown-writer tool-bar-markdown-writer bezier-curve-editor split-diff atom-typescript refactor js-refactor prettier-atom autocomplete-js-import clipboard-plus meteor-api atom-ide-ui ide-typescript todo-show npm-library-description console-log atom-editorconfig

# Instal missing dependencies
echo -e "\e[1;31mInstalling missing dependencies (if any)...\e[0m"
sudo apt -fy install

# setting clipboard-plus shortcuts
echo -e "\e[1;31mSetting up atom packages...\e[0m"
echo "'.platform-linux atom-text-editor:not([mini])':
  'ctrl-shift-v': 'clipboard-plus:toggle'" >> ~/.atom/keymap.cson

echo "Note: Use this instructions to configure atom-ternjs https://atom.io/packages/atom-ternjs"


# Install zsh, an alternative customizable bash shell
echo -e "\e[1;31mInstalling Zsh...\e[0m"
sudo apt -y install zsh

# Set zsh as default shell
echo -e "\e[1;31mSetting Zsh as default shell...\e[0m"
chsh -s /bin/zsh

# Install oh my zsh! Themes for zsh shell
echo -e "\e[1;31mInstalling oh my zsh!...\e[0m"
curl -L http://install.ohmyz.sh | sh

# Set zsh theme to agnoster
echo "ZSH_THEME=agnoster" >> $HOME/.zshrc

# Install Powerline fonts (required for agnoster zsh theme)
echo -e "\e[1;31mInstalling Powerline fonts!...\e[0m"
sudo apt -y install fonts-powerline

# aliases
echo "Setting git aliases... lol st co br ci...\e[0m"
alias gg="git status && git log | head"
echo "alias gg=\"git status && git log | head\"" >> $HOME/.zshrc
echo "Setting alias 'clut', it checks code diff for Comments, Logs and TODOs"
alias clut="git diff | grep // && git diff | grep console. && git diff | grep TODO"
echo "alias clut=\"git diff | grep // && git diff | grep console. && git diff | grep TODO\"" >> $HOME/.zshrc
alias yarn="yarn --emoji"
echo "alias yarn=\"yarn --emoji\"" >> $HOME/.zshrc

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

# Post execution steps:
  # Configure git email and name
  # git config --global user.email "you@example.com"
  # git config --global user.name "Your Name"
