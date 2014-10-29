#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "Please inform the OS"
    echo "Options are: 'ubuntu'"
    echo "Example: 'install.sh ubuntu'"
    exit 1
fi

DIR="$( cd "$( dirname "$0" )" && pwd )"

if [[ $1 -eq "ubuntu" ]]; then
    bash $DIR/ubuntu/install.sh
    exit 0;
fi
