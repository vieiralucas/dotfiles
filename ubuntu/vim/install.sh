#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

sudo apt-get install -y vim > /dev/null

# setup vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# copy vimrc
cp $DIR/.vimrc ~/.vimrc

# install powerline fonts
/bin/bash $DIR/fonts/install.sh

# install desertEx
wget https://raw.githubusercontent.com/vim-scripts/desertEx/master/colors/desertEx.vim -O ~/.vim/colors/desertEx.vim

vim +PluginInstall +qall
