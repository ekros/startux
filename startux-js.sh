#!/bin/bash
# Setup the system for javascript development
# RUN THIS SCRIPT WITH SUDO

# Install nodejs (https://nodejs.org/en/download/package-manager/)
curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
apt-get install --yes nodejs

# Install npm, the JS package manager
echo "Installing npm..."
apt-get install --yes npm

# Install Yeoman, the scaffolding tool
echo "Installing Yeoman..."
npm install -g yo

# Install Bower, the package manager
echo "Installing Bower..."
npm install -g bower

# Install grunt, the task runner
echo "Installing Grunt..."
npm install -g grunt-cli

# Install gulp, the other task runner
echo "Installing Gulp..."
npm install -g gulp

# Install SASS, the CSS preprocessor
echo "Installing SASS..."
gem install sass
