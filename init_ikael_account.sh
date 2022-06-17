#!/usr/bin/env bash

ME=$(whoami)

# Check goinfre link
GOINFRE=~/goinfre
if [[ ! -h $GOINFRE ]]; then
    # some kind of ternary operator (if true && works, else || works)
    [[ -d /opt/goinfre/$ME ]] && GOINFRE_DIR=/opt/goinfre/$ME || GOINFRE_DIR=/goinfre/$ME
    ln -s $GOINFRE_DIR $GOINFRE
fi

# add brew to PATH
# Load Homebrew config script
export PATH=$GOINFRE/.brew/bin:$PATH
DIR=$GOINFRE    # that's important variable!
source $DIR/.brewconfig.zsh

# add my scripts and binaries to PATH
export PATH=/Users/$ME/.my_binaries:$PATH

# rails gem installation requires this env. var.
MIME_INFO="$GOINFRE/.brew/Cellar/shared-mime-info/2.2/share/shared-mime-info/packages/freedesktop.org.xml"
export FREEDESKTOP_MIME_TYPES_PATH=$MIME_INFO

# init rbenv
IS_RBENV_HERE=$(rbenv --version 2>&1 > /dev/null)
if [[ $? -eq 0 ]]; then; eval "$(rbenv init -)"; fi

# vscode simple `code` command
alias code="open -a 'visual studio code'"

# grep IP-address
alias ip_address="grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])'"

# show process info
alias proc_info="ps aux | grep -v grep | grep"

# TODO if default $GOINFRE path changes
# 1. Create link ~/.rbenv -> $GOINFRE/.rbenv
# 2. Create docker/.docker inside $GOINFRE
# 3. Create .vagrant[.d] inside $GOINFRE
# 4. Create link ~/.vscode -> $GOINFRE/.vscode
