#!/usr/bin/env bash

# Use vi mode
set -o vi

# Infinite history
export HISTSIZE=
export HISTFILESIZE= 
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND='history -a'

# Aliases
alias fa="fontawesome-menu -f icon-list.txt"
alias grep="grep --color=auto" # Color grep - highlight desired sequence
alias jshell="nix-shell -p openjdk12 --command jshell"
alias lg="lazygit"
alias l="exa -hl --git --icons"
alias la="exa -ahl --git --icons"
alias mupdf="mupdf-x11"

# tmuxinator
source ~/.config/tmuxinator/bin/bash-completion

# fzf
if command -v fzf-share >/dev/null; then
  source "$(fzf-share)/key-bindings.bash"
fi

