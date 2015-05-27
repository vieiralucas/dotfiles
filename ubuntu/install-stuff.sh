#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# update packages
echo "Updating packages..."
sudo apt-get update > /dev/null

# Install stuff
echo "Installing htop..."
sudo apt-get install -y htop > /dev/null
echo "Installing traceroute..."
sudo apt-get install -y traceroute > /dev/null
echo "Installing curl..."
sudo apt-get install -y curl > /dev/null
echo "Installing zsh..."
sudo apt-get install -y zsh > /dev/null
echo "Installing git..."
sudo apt-get install -y git > /dev/null
echo "Installing vim..."
sh $DIR/vim/install.sh
echo "Installing nvm"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash > /dev/null
echo "Installing rvm"
curl -sSL https://get.rvm.io | bash -s stable --ruby
echo "Installing oh-my-zsh"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh > /dev/null
echo "Installing gnome-terminal-colors-monokai"
sh $DIR/terminal-colors/install.sh
echo "Installing atom.io"
wget https://atom.io/download/deb -O atom.deb > /dev/null
sudo dpkg -i atom.deb
rm atom.deb
