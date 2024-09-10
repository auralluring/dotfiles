#!/bin/env bash

# what options should be set on virtually every link made (with ln)
# helps to make it consistent and fix bugs with broken links across all the scripts.
LINKOPTS=-srf

if [[ ${0%/*} == ~/.local/bin ]]; then
   EXECUTABLE=$(readlink -f $0)
else
   EXECUTABLE=$0
   ln $LINKOPTS $0 ~/.local/bin/auto
fi

DOTFILES_DIR=${EXECUTABLE%/*}
cd $DOTFILES_DIR

# gather data, put in env
source hosts/$HOSTNAME.sh

# get theme
source themes/$THEME.sh

# run core
source core.sh

# run common
source common/*.sh

# run rices based on data
if [[ -z $RICES ]]; then
    echo No rices specified, no graphical environment will be installed.
else
    source rices/{$RICES,}.sh
fi

# run apps based on data
source apps/{$APPS,}.sh
