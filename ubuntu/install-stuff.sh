#!/bin/bash

# update packages
echo "sudo apt-get update"
sudo apt-get update

# install programs
echo "sudo apt-get install -y htop traceroute terminator curl zsh vim git"
sudo apt-get install -y htop traceroute terminator curl zsh vim git

# install oh-my-zsh
echo "wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

