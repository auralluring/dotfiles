#!/bin/env bash

# install zsh (bash should already be installed)

# link bashrc, zshrc, and sourced scripts
ln $LINKOPTS $DOTFILES_DIR/common/shell/bashrc ~/.bashrc
ln $LINKOPTS $DOTFILES_DIR/common/shell/zshrc ~/.zshrc
ln $LINKOPTS $DOTFILES_DIR/common/shell/vars.sh ~/.vars.sh

# make dir for oh my posh config, then link it
mkdir -p ~/.config/ohmyposh
ln $LINKOPTS $DOTFILES_DIR/common/shell/omp.yaml ~/.config/ohmyposh/zen.yaml
