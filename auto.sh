#!/bin/env bash

DOTFILES_DIR=${0%/*}

LINKOPTS=-srf

# gather data, put in env
source $DOTFILES_DIR/hosts/$HOSTNAME.sh

# run core
source $DOTFILES_DIR/core.sh

# run common
source $DOTFILES_DIR/common/*.sh

# run rices based on data
if [[ -z $RICES ]]; then
    echo No rices specified, no graphical environment will be installed.
else
    source $DOTFILES_DIR/rices/{$RICES,}.sh
fi

# run apps based on data
source $DOTFILES_DIR/apps/{$APPS,}.sh
