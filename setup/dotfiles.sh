#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo "Copying files"
rsync -a --progress $DIR/.. $HOME/ --exclude $DIR --exclude $DIR/../.git
