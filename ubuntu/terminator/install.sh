#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "Installing terminator config file..."
cp $DIR/config ~/.config/terminator/config
