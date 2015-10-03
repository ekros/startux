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
