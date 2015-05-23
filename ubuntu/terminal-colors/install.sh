#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "Installing dconf-cli..."
sudo apt-get install -y dconf-cli > /dev/null
echo "Cloning gnome-terminal-colors-monokai..."
git clone git://github.com/pricco/gnome-terminal-colors-monokai.git
echo "Installing gnome-terminal-colors-monokai..."
/bin/bash $DIR/gnome-terminal-colors-monokai/install.sh
echo "Removing cloned gnome-terminal-colors-monokai..."
rm -rf $DIR/gnome-terminal-colors-monokai

