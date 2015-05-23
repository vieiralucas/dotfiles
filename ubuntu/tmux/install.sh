#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# install tmux
sudo apt-get install -y tmux > /dev/null

# config tmux
cp $DIR/.tmux.conf ~/.tmux.conf
cp $DIR/.tmux-theme.sh ~/.tmux-theme.sh
cp $DIR/.battery-indicator.sh ~/.battery-indicator.sh
cp $DIR/.dev-tmux-session ~/.dev-tmux-session

