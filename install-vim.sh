#!/bin/bash

set -eu;

mkdir -p ~/.vim/repos/github.com/Shougo;
git clone https://github.com/Shougo/dein.vim.git ~/.vim/repos/github.com/Shougo/dein.vim;
vim -e +'call dein#install()' +qa
