# Nathan's Vim Config

## Screenshots

![](http://imgur.com/l2WOqLW.png)

## Installation on Vim

```
git clone https://github.com/remexre/vimrc.git ~/.vim
~/.vim/install-vim.sh
```

## Installation on Neovim

```
git clone https://github.com/remexre/vimrc.git ~/.config/nvim
~/.config/nvim/install-neovim.sh
```

## Things To Know

Keybinds:

 - `C-N` -- Multiple cursors, like Atom's `C-D`
 - `C-P` -- Open the File Finder
 - `Tab` -- Open/Close NERDTree

Commands:

 - `colorscheme <name of color scheme>` -- Set the color scheme. You can
   change the default color scheme in `vimrc` (for Vim) or `init.vim` (for
   Neovim).
 - `Gcommit` -- Start a git commit. You can use `-` to add or remove files
   from the set to be committed, and `cc` to write the commit message.
   Save and quit the commit message editor to finish the commit.
 - `Gpush` -- Pushes.
 - `Startify` -- Return to the start screen.

## Features

 - Autocomplete with deocomplete/neocomplete
 - Codi, which is cool
 - Encrypted File Support
   - GPG
   - Keybase
 - Git Support
 - Haskell character transformation (e.g. `\` to `λ`)
 - Multiple cursors, like Atom and Sublime Text
 - Pretty
   - Airline (best with nerd-fonts)
   - Colorschemes
   - Devicons
 - Prose Helpers:
   - goyo -- Distraction-free writing mode
   - limelight -- Highlight the paragraph you're on
   - pencil -- Automatic word wrap
   - wordy -- English Language Linting
   - writegood -- More English Language Linting
 - Support for:
   - Alex and Happy
   - CoffeeScript
   - Common and Emacs Lisp
   - Rust (some features neovim-only)
   - TOML
 - Useful start screen (startify)
