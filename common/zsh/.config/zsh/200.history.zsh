# HISTORY

HISTSIZE=1000000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history # Update History in all windows on command execution
setopt share_history

