#!/bin/env bash
# host script order
HOST_SCRIPTS="env pre play post"

# host defaults name - runs each script before the corresponding one on the host 
DEFAULTS_HOSTNAME=_default

# what options should be set on virtually every link made (with ln)
# helps to make it consistent and fix bugs with broken links across all the scripts.
LINKOPTS=-srf

if [[ ${0%/*} == ~/.local/bin ]]; then
    EXECUTABLE=$(readlink -f $0)
else
    EXECUTABLE=$0
    mkdir -p ~/.local/bin
    ln $LINKOPTS $0 ~/.local/bin/auto
fi

DOTFILES_DIR=${EXECUTABLE%/*}
cd $DOTFILES_DIR

# function source() {
#     if [[ ! -f $1 ]]; then
#         echo "$1 does not exist"
# 	return 1
#     fi
#     builtin source $1
# }

# run host scripts
for script in $HOST_SCRIPTS; do
    source hosts/$DEFAULTS_HOSTNAME/$script.sh
    source hosts/$HOSTNAME/$script.sh
done
