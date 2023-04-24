#!/bin/bash
DEBIAN_FRONTEND=noninteractive
# Enable exit on error
set -e
# Show all commands
set -x

CONDA_PREFIX=/opt/miniconda3

echo ""
echo "Installing node..."
echo ""

sudo apt-get update
# https://nodejs.org/en/about/releases/ use even numbered releases, i.e. LTS versions
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash - 
sudo apt-get install -y nodejs 
# As conda is first in path, the commands 'node' and 'npm' reference to the version of conda.
# Replace those versions with the newly installed versions of node
rm -f $CONDA_PREFIX/bin/node && sudo ln -s /usr/bin/node $CONDA_PREFIX/bin/node
rm -f $CONDA_PREFIX/bin/npm && sudo ln -s /usr/bin/npm $CONDA_PREFIX/bin/npm
# Fix permissions
sudo chmod a+rwx /usr/bin/node 
sudo chmod a+rwx /usr/bin/npm 
# Fix node versions - put into own dir and before conda:
sudo mkdir -p /opt/node/bin
if [[ ! -e /opt/node/bin/node ]]; then
   sudo ln -s /usr/bin/node /opt/node/bin/node
fi
if [[ ! -e /opt/node/bin/npm ]]; then 
   sudo ln -s /usr/bin/npm /opt/node/bin/npm 
fi
# Update npm
sudo /usr/bin/npm install -g npm
# Install Yarn
sudo /usr/bin/npm install -g yarn
# Install typescript
sudo /usr/bin/npm install -g typescript 
# Install webpack - 32 MB
sudo /usr/bin/npm install -g webpack
# Install node-gyp
sudo /usr/bin/npm install -g node-gyp
# Update all packages to latest version
sudo /usr/bin/npm update -g

exit 0


