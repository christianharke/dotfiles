#!/usr/bin/env bash

# Infinite history
export HISTSIZE=
export HISTFILESIZE= 
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND='history -a'

# Aliases
alias fa="fontawesome-menu -f icon-list.txt"
alias grep="grep --color=auto" # Color grep - highlight desired sequence
alias lg="lazygit"
alias mupdf="mupdf-x11"
