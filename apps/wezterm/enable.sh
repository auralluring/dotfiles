#!/bin/env bash

# find dir of script
DIR=${0%/*}

# get theme data
THEME=`yq '.theme.variables' ~/src/dotfiles/.dotter/themes/catppuccin-macchiato.toml -oj`

# install wezterm

# make sure config dir exists
mkdir -p ~/.config/wezterm

# link main config
ln -s${LINKOPTS} $DIR/wezterm.lua ~/.config/wezterm/wezterm.lua

# template color config
echo $THEME | template --template $DIR/colors.lua.template --configuration - > ~/.config/wezterm/colors.lua
