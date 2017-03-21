#!/bin/bash

if test ! $(which brew); then
	echo "Installing homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages"

# update
brew update

# gpg
brew install gnupg gnupg2

# cli tools
brew install ack
brew install tree
brew install wget
brew install htop
brew install thefuck

# webserver
brew install nginx

# development tools
brew install tig
brew tap neovim/neovim
brew install --HEAD neovim
brew install tmux
brew install zsh
brew install zsh-completions
brew install nvm
brew install emacs

# javascript tools
brew install yarn
brew install flow

# java
brew install Caskroom/cask/java

# zsh syntax highlight
brew install zsh-syntax-highlighting

# android-sdk
# brew install android-sdk
