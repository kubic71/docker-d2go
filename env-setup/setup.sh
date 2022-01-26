#!/bin/bash

RELDIR=`dirname $0`
DIR=`cd $RELDIR;pwd`

# Installing useful packages
sudo apt -y install fish tmux neovim sl htop w3m-img
pip install ipython ranger-fm

echo "Copy dotfiles..."
cp -r $DIR/dotfiles/. ~/.config/

echo "Copying binaries..."
cp -r $DIR/bin ~/.local/

# Set the user-defined PATH
HOME_DIR=$HOME
fish -c "set -U fish_user_paths $HOME/.local/bin"

# set the preferred editor
fish -c 'set -Ux EDITOR nvim'

# set locale
fish -c "set -Ux LANG C.UTF-8"
fish -c "set -Ux LC_ALL C.UTF-8"
