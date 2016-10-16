#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

mkdir -p ~/.config/nvim/

# setup plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# copy config files
cp $DIR/*.vim ~/.config/nvim/

# fonts
if [[ $1 == "ubuntu" ]]; then
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf

fi

if [[ "$(uname)" == "Darwin" ]] || [[ $1 == "osx" ]]; then
    cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete.otf

fi
