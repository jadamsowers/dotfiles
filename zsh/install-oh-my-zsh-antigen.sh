#!/bin/bash

echo "Installing oh-my-zsh"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "Installing antigen"
mkdir ~/.antigen && curl -L https://git.io/antigen > ~/.antigen/antigen.zsh

echo "symlinking .zshrc"
#DIR=dirname "$0"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/zshrc ~/.zshrc