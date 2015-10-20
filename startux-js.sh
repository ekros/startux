#!/bin/bash
# Setup the system for javascript development
# RUN THIS SCRIPT WITH SUDO

# Install nodejs (https://nodejs.org/en/download/package-manager/)
curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
sudo apt-get install --yes nodejs

# Install Bower, the package manager
echo "Installing Bower..."
npm install -g bower
