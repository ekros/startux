#!/bin/bash
# Setup the system for golang development

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
wget https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz

# extract it into /usr/local
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

# Add /usr/local/go/bin to the PATH
export PATH=$PATH:/usr/local/go/bin

# Make it permanent
echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.profile

# TODO check installation
