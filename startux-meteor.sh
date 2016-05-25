#!/bin/bash
# Setup the system for Meteor development
# DO NOT RUN THIS SCRIPT AS ROOT

# Install the last version of Meteor
echo Installing Meteor...
curl https://install.meteor.com/ | sh

# Install ddp-analyzer-proxy (debug meteor apps ddp protocol)
echo Installing ddp-analyzer (Meteor apps debugger)...
sudo npm install -g ddp-analyzer
