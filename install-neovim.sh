#!/bin/bash

set -eu;

mkdir -p ~/.config/nvim/repos/github.com/Shougo;
git clone https://github.com/Shougo/dein.vim.git ~/.config/nvim/repos/github.com/Shougo/dein.vim;
nvim +'call dein#install()' +qa
