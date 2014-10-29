#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# set zsh to the default shell
echo "Setting default shell for $(whoami) to zsh..."
chsh -s $(which zsh) $(whoami)

# download dracula theme for zsh
echo "git clone https://github.com/zenorocha/dracula-theme/ $DIR/dracula"
git clone https://github.com/zenorocha/dracula-theme/ $DIR/dracula

# cp dracula theme to oh-my-zsh's theme folder
echo "cp $DIR/dracula/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme"
cp $DIR/dracula/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme

# remove downloaded dracula theme
echo "rm -rf $DIR/dracula"
rm -rf $DIR/dracula

# install zshrc
echo "Copying .zshrc file to $(whoami)'s home directory..."
cp $DIR/../zsh/.zshrc ~/.zshrc

# install terminator's config
echo "Copying terminator config file to $(whoami)'s terminator config directory..."
cp $DIR/terminator/config ~/.config/terminator/config

# copy aliases to ~/.aliases
echo "Copying .aliases to $(whoami)'s home folder..."
cp $DIR/.aliases ~/.aliases
