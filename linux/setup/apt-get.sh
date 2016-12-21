#!/bin/bash

# add yarn to apt-get
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# update
sudo apt-get update

# cli tools
sudo apt-get install -y tree
sudo apt-get install -y wget
sudo apt-get install -y htop

# webserver
sudo apt-get install -y nginx

# development tools
sudo apt-get install -y tig
sudo apt-get install -y neovim
sudo apt-get install -y tmux
sudo apt-get install -y zsh

# javascript tools
sudo apt-get install -y yarn

# zsh syntax highlight
sudo apt-get install -y zsh-syntax-highlighting

