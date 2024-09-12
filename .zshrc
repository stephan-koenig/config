if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # Set Homebrew `Brewfile` location
  export HOMEBREW_BUNDLE_FILE="${HOME}/.config/brew/Brewfile"
fi

# Include formulae with executables in /usr/local/sbin
export PATH="/usr/local/sbin:$PATH"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
HIST_STAMPS="yyyy-mm-dd"
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Activate and initiate antidote
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

# Load completions
autoload -Uz compinit && compinit

# Activate Oh My Posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/base.toml)"
fi

# Enable vi keybindings in Zsh terminal
# bindkey -v
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Prevent tab completion from ~/.ssh/known_hosts
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' hosts $hosts

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
for file in ~/.config/zsh/*; do
    source "$file"
done

# Shell integrations
# fzf
eval "$(fzf --zsh)"
# zoxide
eval "$(zoxide init --cmd cd zsh)"
# Activate direnv
eval "$(direnv hook zsh)"
export DIRENV_LOG_FORMAT=""
# 1password-cli
eval "$(op completion zsh)"
compdef _op op
export SSH_AUTH_SOCK=~/.1password/agent.sock
# Use 1Password for CLI tools
source ~/.config/op/plugins.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='hx'
export VISUAL="$EDITOR"
