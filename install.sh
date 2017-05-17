#!/bin/bash

set -eu;

echo "WARNING: This will override your init.vim.";
echo "Hit Ctrl-C in the next 5 seconds to cancel.";
sleep 5;

if [[ ! -d ~/cloud.acm.umn.edu/vim ]]; then
    echo "This should be stored in ~/cloud.acm.umn.edu/vim/install.sh.";
    echo "Instead, it's in $(realpath ${BASH_SOURCE}).";
    exit -1;
fi;

mkdir -p ~/.config/nvim/repos/github.com/Shougo;
git clone https://github.com/Shougo/dein.vim.git ~/.config/nvim/repos/github.com/Shougo/dein.vim;

echo "source ~/cloud.acm.umn.edu/vim/init.vim" > ~/.config/nvim/init.vim;
nvim +'call dein#install()' +qa
