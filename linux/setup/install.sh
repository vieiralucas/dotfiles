#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# nvm
/bin/bash $DIR/nvm.sh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# nvm and oh-my-zsh needs to run before copying dotfiles, because they want to edit my .zshrc --'

# copy dotfiles
/bin/bash $DIR/dotfiles.sh

# apt-get stuff
/bin/bash $DIR/apt-get.sh

# rvm
/bin/bash $DIR/rvm.sh

