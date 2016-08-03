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
echo "Installing vim..."
sudo apt-get install -y vim > /dev/null
echo "Installing tmux..."
sudo apt-get install -y tmux > /dev/null
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
echo "Installing i3"
sudo apt-get install -y i3 > /dev/null
echo "Installing vim..."
sh $DIR/vim/install.sh
rm atom.deb
echo "Installing leiningen for clojure"
curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -o $HOME/bin/lein
