#!/bin/sh

##################################################
# Binary manager
##################################################
# nodebrew
curl -L git.io/nodebrew | perl - setup

# goenv
git clone https://github.com/syndbg/goenv.git ~/.goenv

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# plenv
git clone https://github.com/tokuhirom/plenv.git ~/.plenv

##################################################
# macOS
##################################################
if [ "$(uname)" = "Darwin" ]; then
    # Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # neovim
    brew install nvim
fi