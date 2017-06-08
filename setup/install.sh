#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# copy dotfiles
/bin/bash $DIR/dotfiles.sh

# homebrew stuff
/bin/bash $DIR/homebrew.sh

# rvm
/bin/bash $DIR/rvm.sh

