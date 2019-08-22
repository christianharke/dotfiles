#!/usr/bin/env bash

# Infinite history
export HISTSIZE=
export HISTFILESIZE= 
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND='history -a'

# Prevent entering passphrases all the time
eval `keychain --quiet --agents gpg,ssh --eval 630966F4 id_rsa` # gpg, ssh keys

# Aliases
alias fa="fontawesome-menu -f icon-list.txt"
alias grep="grep --color=auto" # Color grep - highlight desired sequence
alias lg="lazygit"
alias mupdf="mupdf-x11"
