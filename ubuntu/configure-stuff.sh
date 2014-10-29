#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# set zsh to the default shell
echo "Setting default shell for $(whoami) to zsh..."
chsh -s $(which zsh) $(whoami)

# download yan theme for zsh
echo "Cloning yan oh-my-zsh theme from github..."
git clone https://github.com/vieiralucas/yan/ $DIR/yan

# cp yan theme to oh-my-zsh's theme folder
echo "Copying yan.zsh-theme to ~/.oh-my-zsh/themes/yan.zsh-theme..."
cp $DIR/yan/yan.zsh-theme ~/.oh-my-zsh/themes/yan.zsh-theme

# remove downloaded yan theme
echo "Removing yan repo..."
rm -rf $DIR/yan

# install zshrc
echo "Copying .zshrc file to $(whoami)'s home directory..."
cp $DIR/../zsh/.zshrc ~/.zshrc

# install terminator's config
echo "Copying terminator config file to $(whoami)'s terminator config directory..."
cp $DIR/terminator/config ~/.config/terminator/config

# copy aliases to ~/.aliases
echo "Copying .aliases to $(whoami)'s home folder..."
cp $DIR/.aliases ~/.aliases
