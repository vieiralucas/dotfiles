#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# nvm
/bin/bash $DIR/nvm.sh
# nvm needs to run before copying dotfiles, because they want to edit my .zshrc --'

# copy dotfiles
/bin/bash $DIR/dotfiles.sh

# apt-get stuff
/bin/bash $DIR/apt-get.sh

# rvm
/bin/bash $DIR/rvm.sh

