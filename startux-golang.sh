#!/bin/bash
# Setup the system for golang development
# RUN THIS SCRIPT WITH SUDO

VERSION="1.5.1"
OS="linux"
ARCH="amd64"

# Remove existing go installation, if any
##if [ -r "/usr/local/go" ] then
##  echo "Go already installed"
##fi
#rm -rf /usr/local/go

# Install go from repositories
# Follow these instructions https://golang.org/doc/install

# download the binaries
echo "Downloading binaries..."
wget https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz

# extract it into /usr/local
echo "Extracting..."
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

# Add /usr/local/go/bin to the PATH
echo "Configuring PATH..."
export PATH=$PATH:/usr/local/go/bin
# Make it permanent
echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.profile

# Create a folder for your go code and set GOPATH (see https://www.youtube.com/watch?v=XCsL89YtqCs)
echo "Configuring GOPATH..."
mkdir -p ~/devel/gocode
export GOPATH=$HOME/devel/gocode
echo "export GOPATH=$HOME/devel/gocode" >> $HOME/.profile

# Enable vendor experiment
export GO15VENDOREXPERIMENT=1
echo "GO15VENDOREXPERIMENT=1" >> $HOME/.profile

# TODO check installation
