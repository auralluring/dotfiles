#!/bin/env bash

DIR=${0%/*}/shell

# install and zsh (bash should already be installed)

# link bashrc, zshrc, and sourced scripts
ln -$LINKOPTS $DIR/bashrc ~/.bashrc
ln -$LINKOPTS $DIR/zshrc ~/.zshrc
ln -$LINKOPTS $DIR/vars.sh ~/.vars.sh
ln -$LINKOPTS $DIR/helpers.sh ~/.helpers.sh

# make dir for oh my posh config, then link it
mkdir -p ~/.config/ohmyposh
ln -$LINKOPTS $DIR/omp.yaml ~/.config/ohmyposh/zen.yaml
