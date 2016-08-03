#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

bash $DIR/install-stuff.sh

cp -r $DIR/.i3 $HOME/.i3

exit 0
