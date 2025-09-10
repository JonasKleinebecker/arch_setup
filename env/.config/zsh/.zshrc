# Enable vi mode
bindkey -v
export KEYTIMEOUT=28
bindkey -M viins 'jk' vi-cmd-mode
bindkey "^?" backward-delete-char

bindkey -M viins '^F' autosuggest-accept
bindkey -M vicmd '^F' autosuggest-accept

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.

preexec() {
  echo -ne '\e[5 q'; # Use beam shape cursor for each new prompt.
}

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#make tmux XDG compliant
alias tmux='tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'

alias ls='ls --color'
alias la='ls -a --color'
alias ll='ls -la --color'
alias vi='nvim'

eval "$(zoxide init zsh --cmd k)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
export FZF_DEFAULT_OPTS="--bind 'alt-j:down' --bind 'alt-k:up'"

bindkey -s ^g "tmux-sessionizer\n"
bindkey '^[k' history-search-backward
bindkey '^[j' history-search-forward
