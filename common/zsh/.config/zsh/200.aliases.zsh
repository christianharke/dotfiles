# ALIASES

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'
alias -g ........='../../../../../../..'

alias d='dirs -v | head -10'                            # List the last ten directories we've been to this session, no duplicates

alias l="exa -hl --git --icons"
alias la="exa -ahl --git --icons"
alias ll='l'
alias ls="ls -sh --color='auto'"
alias lsa='ls -a'

alias grep="grep --color=auto"                          # Color grep - highlight desired sequence

alias fa="fontawesome-menu -f icon-list.txt"            # Open Fontawesome icon selector
alias jshell="nix-shell -p openjdk --command jshell"    # Java REPL
alias lg="lazygit"                                      # Git CLI UI
alias mupdf="mupdf-x11"                                 # PDF viewer
alias pass="source pass"
alias rr="ranger"

cht() {
    curl "cht.sh/${1}"
}

wttr() {
    curl "wttr.in/${1}"
}
