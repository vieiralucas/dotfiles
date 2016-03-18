#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# add ppas
sudo add-apt-repository ppa:webupd8team/unstable

# create bub dir
mkdir -p $HOME/bin

# update packages
echo "Updating packages..."
sudo apt-get update > /dev/null

# Install stuff
echo "Installing guake..."
sudo apt-get install -y guake > /dev/null
echo "Installing htop..."
sudo apt-get install -y htop > /dev/null
echo "Installing traceroute..."
sudo apt-get install -y traceroute > /dev/null
echo "Installing curl..."
sudo apt-get install -y curl > /dev/null
echo "Installing xclip..."
sudo apt-get install -y xclip > /dev/null
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
echo "Installing atom.io"
wget https://atom.io/download/deb -O atom.deb > /dev/null
sudo dpkg -i atom.deb
rm atom.deb
echo "Installing leiningen for clojure"
curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -o $HOME/bin/lein
