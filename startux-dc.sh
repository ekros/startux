#!/bin/bash
# Configure docker-compose
# Follow these instructions https://docs.docker.com/compose/install/
# and then execute this script
# DO NOT RUN THIS SCRIPT AS ROOT

# Add this line to /etc/default/docker (it allows you to connect to the docker daemon)
echo "Configuring /etc/default/docker..."
echo "DOCKER_OPTS=\"-H localhost:2376 --dns 8.8.8.8 --dns 8.8.4.4\"" >> /etc/default/docker

# export DOCKER_HOST
echo "Adding DOCKER_HOST variable..."
export DOCKER_HOST=tcp://localhost:2376
# Make it permanent
echo "export DOCKER_HOST=tcp://localhost:2376" >> $HOME/.profile

# dc alias
alias dc="docker-compose"
echo "alias dc=\"docker-compose\"" >> $HOME/.profile
