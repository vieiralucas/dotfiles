#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

if [[ $1 == "ubuntu" ]]; then
    echo "Installing on ubuntu"
    bash $DIR/ubuntu/install.sh
fi

if [[ "$(uname)" == "Darwin" ]] || [[ $1 == "osx" ]]; then
    echo "Installing on osx"
    bash $DIR/osx/install.sh
fi

bash $DIR/common/install.sh
