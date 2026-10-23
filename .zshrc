# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select                      # arrow-key menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # case-insensitive

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history hist_ignore_dups

# Keybindings
bindkey -e                       # emacs-style, like bash
bindkey '^[[1;3C' forward-word   # Alt-→: accept one word of suggestion
bindkey '^[[1;5C' forward-word   # Ctrl-→: accept one word of suggestion

# Carried over from .bashrc
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Fish-style suggestions: from history, then completions (→ to accept)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Plugins (syntax-highlighting must be sourced last)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt
eval "$(starship init zsh)"
