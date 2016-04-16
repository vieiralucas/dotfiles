#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# setup vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# copy vimrc
cp $DIR/.vimrc ~/.vimrc

# install powerline fonts
/bin/bash $DIR/fonts/install.sh

mkdir -p ~/.vim/colors

# install desertEx
wget https://raw.githubusercontent.com/vim-scripts/desertEx/master/colors/desertEx.vim -O ~/.vim/colors/desertEx.vim

# install atom-dark
wget https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark.vim -O ~/.vim/colors/atom-dark.vim

# install atom-dark-256
wget https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim -O ~/.vim/colors/atom-dark-256.vim

vim +PluginInstall +qall
