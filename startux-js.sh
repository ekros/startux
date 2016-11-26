#!/bin/bash
# Setup the system for javascript development
# DO NOT RUN THIS SCRIPT AS ROOT

# Install nodejs (https://nodejs.org/en/download/package-manager/)
curl --silent --location https://deb.nodesource.com/setup_6.x | sudo bash -
sudo apt-get install --yes nodejs

# Install npm, the JS package manager
echo "Installing npm..."
sudo apt-get install --yes npm

# Install nodemon, node server with live reload
echo "Installing nodemon..."
sudo npm install -g nodemon

# Install Yeoman, the scaffolding tool
echo "Installing Yeoman..."
sudo npm install -g yo

# Install Bower, the package manager
echo "Installing Bower..."
sudo npm install -g bower

# Install grunt, the task runner
echo "Installing Grunt..."
sudo npm install -g grunt-cli

# Install gulp, the other task runner
echo "Installing Gulp..."
sudo npm install -g gulp

# Install SASS, the CSS preprocessor
echo "Installing SASS..."
sudo gem install sass

# Install live-server, the web server for development with live reload
echo "Installing live-server..."
sudo npm install -g live-server

# Install David. It checks if the last package versions are installed
echo "Installing David..."
sudp npm install -g david
