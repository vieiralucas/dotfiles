# By @ieure; copied from https://github.com/garybernhardt/dotfiles/blob/7eca1b7f30b9c1acf12bd2a5d085d351a414eeb9/.zshrc#L86
#
# It finds a file, looking up through parent directories until it finds one.
# Use it like this:
#
#   $ ls .tmux.conf
#   ls: .tmux.conf: No such file or directory
#
#   $ ls `up .tmux.conf`
#   /Users/grb/.tmux.conf
#
#   $ cat `up .tmux.conf`
#   set -g default-terminal "screen-256color"
#
DIR=$PWD
TARGET=$1
while [ ! -e $DIR/$TARGET -a $DIR != "/" ]; do
    DIR=$(dirname $DIR)
done
test $DIR != "/" && echo $DIR/$TARGET
