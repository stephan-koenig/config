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

# Docker CLI completions
fpath=(/Users/stephankoenig/.docker/completions $fpath)

# Load completions
autoload -Uz compinit && compinit

# jj completions
source <(COMPLETE=zsh jj)

# Activate Oh My Posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/base.toml)"
fi

# Yazi switches to the current working directory when exiting
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

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
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd --tree --depth 1 --color always --icon always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'lsd --tree --depth 1 --color always --icon always $realpath'
zstyle ':fzf-tab:complete:*:*' fzf-preview ' \
  if [ -d $realpath ]; then \
    lsd --tree --depth 1 --color always --icon always $realpath; \
  else \
    bat -n --color=always --line-range :500 $realpath; \
  fi'

# Aliases
for file in ~/.config/zsh/*; do
    source "$file"
done

# Shell integrations
# fzf
source <(fzf --zsh)
# fzf theme 
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
# Use fd in fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview=" \
  if [ -d {} ]; then \
    lsd --tree --depth 1 --color always --icon always {}; \
  else \
    bat -n --color=always --line-range :500 {}; \
  fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'lsd --tree --depth 1 --color always --icon always $realpath'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'lsd --tree --depth 1 --color always --icon always {}' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"                                      "$@" ;;
    ssh)          fzf --preview 'dig {}'                                               "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview"                            "$@" ;;
  esac
}

# zoxide
eval "$(zoxide init --cmd cd zsh)"
export _ZO_FZF_OPTS="--preview 'lsd --tree --depth 1 --color always --icon always {2}'"

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

. "$HOME/.local/bin/env"

# uv completions
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# marimo completions
eval "$(_MARIMO_COMPLETE=zsh_source marimo)"

# Atuin
eval "$(atuin init zsh)"
