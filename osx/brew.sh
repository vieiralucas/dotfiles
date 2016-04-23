#!/bin/bash

if test ! $(which brew); then
	echo "Installing homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\nInstalling homebrew pacakges"

# cli tools
brew install ack
brew install tree
brew install wget
brew install htop

# webserver
brew install nginx

# development tools
brew install tig
brew install macvim --override-system-vim
brew install tmux
brew install zsh
brew install nvm

# java
brew install Caskroom/cask/java

# android-sdk
brew install android-sdk
