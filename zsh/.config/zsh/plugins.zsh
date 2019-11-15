# PLUGINS

# Install Antigen
source /nix/store/sg099wl7r282y2z1dj1r39bysgap6s79-antigen-2.2.3/share/antigen/antigen.zsh

# Plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Theme
antigen theme denysdovhan/spaceship-prompt

# Apply Antigen stuff
antigen apply

