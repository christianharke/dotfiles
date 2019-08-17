HISTSIZE= HISTFILESIZE= # Infinite history

# Prevent entering the ssh key passphrase all the time
eval `keychain --agents ssh --eval id_rsa --quiet`

# Aliases
alias fa="fontawesome-menu -f icon-list.txt"
alias grep="grep --color=auto" # Color grep - highlight desired sequence
alias lg="lazygit"
alias mupdf="mupdf-gl"
