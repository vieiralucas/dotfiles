#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

sudo apt-get install -y vim > /dev/null

# setup vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# create colors folder
mkdir -p ~/.vim/colors

# copy colors
cp $DIR/* ~/.vim/colors/

# copy vimrc
cp $DIR/.vimrc ~/.vimrc

# install powerline fonts
/bin/bash $DIR/fonts/install.sh
