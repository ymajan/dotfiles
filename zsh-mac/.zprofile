# HOMEBREW
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# DOOM EMACS
export DOOMDIR="$HOME/dotfiles/doom"

# Add this Shi to path
export PATH="$HOME/.config/emacs/bin:$PATH"

# Created by `pipx`
export PATH="$PATH:/Users/ymajan/.local/bin"