#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "Installing nvm"
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash > /dev/null
echo "Installing rvm"
curl -sSL https://get.rvm.io | bash -s stable --ruby
echo "Installing oh-my-zsh"
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh > /dev/null

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
cp $DIR/zsh/.zshrc ~/.zshrc

# copy aliases to ~/.aliases
echo "Copying .aliases to $(whoami)'s home folder..."
cp $DIR/.aliases ~/.aliases

bash $DIR/zsh/install.sh
bash $DIR/vim/install.sh
bash $DIR/nvim/install.sh
bash $DIR/tmux/install.sh

# source .zshrc
echo "Source .zshrc"
source ~/.zshrc
