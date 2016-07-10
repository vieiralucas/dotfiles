#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

# config tmux
cp $DIR/.* ~/

# add tmux plugin manager to tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
