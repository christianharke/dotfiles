# PLUGINS

# Install Antigen
source $HOME/.config/zsh/lib/antigen.zsh

# Plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Theme
antigen theme denysdovhan/spaceship-prompt

# Apply Antigen stuff
antigen apply

