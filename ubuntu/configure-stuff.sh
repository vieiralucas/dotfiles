#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# set zsh to the default shell
echo "chsh -s $(which zsh) $(whoami)"
chsh -s $(which zsh) $(whoami)

# download dracula theme for zsh
echo "git clone https://github.com/zenorocha/dracula-theme/ $DIR/dracula"
git clone https://github.com/zenorocha/dracula-theme/ $DIR/dracula

# cp dracula theme to oh-my-zsh's theme folder
echo "cp $DIR/dracula/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme"
cp $DIR/dracula/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-them

# remove downloaded dracula theme
echo "rm -rf $DIR/dracula"
rm -rf $DIR/dracula

# install zshrc
echo "cp $DIR/zsh/.zshrc ~/.zshrc"
cp $DIR/zsh/.zshrc ~/.zshrc

# install terminator's config
echo "cp $DIR/terminator/config ~/.config/terminator/config"
cp $DIR/terminator/config ~/.config/terminator/config
