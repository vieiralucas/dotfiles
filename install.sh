#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Please inform the OS"
    echo "Options are: 'osx, ubuntu'"
    echo "Example: 'install.sh osx'"
    exit 1
fi

DIR="$( cd "$( dirname "$0" )" && pwd )"

if [ $1 == "ubuntu" ]; then
    echo "Installing on ubuntu"
    bash $DIR/ubuntu/install.sh
fi

if [ "$(uname)" == "Darwin" ]; then
    echo "Installing on osx"
    bash $DIR/osx/install.sh
fi

bash $DIR/common/install.sh
