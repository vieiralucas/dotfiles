#!/bin/bash

# add ppa for sublime-text-3
echo "Adding ppa for sublime-text-3"
sudo add-apt-repository ppa:webupd8team/sublime-text-3

# update packages
echo "Updating packages..."
sudo apt-get update > /dev/null

# Install stuff
echo "Installing htop..."
sudo apt-get install -y htop > /dev/null
echo "Installing traceroute..."
sudo apt-get install -y traceroute > /dev/null
echo "Installig terminator..."
sudo apt-get install -y terminator > /dev/null
echo "Installing curl..."
sudo apt-get install -y curl > /dev/null
echo "Installing zsh..."
sudo apt-get install -y zsh > /dev/null
echo "Installing vim..."
sudo apt-get install -y vim > /dev/null
echo "Installing git..."
sudo apt-get install -y git > /dev/null
echo "Installing sublime-text-3..."
sudo apt-get install -y sublime-text-installer > /dev/null
echo "Installing nvm"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash > /dev/null
echo "Installing rvm"
curl -sSL https://get.rvm.io | bash -s stable --ruby
echo "Installing oh-my-zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh > /dev/null
