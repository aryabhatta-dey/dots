# Enabling Powerlevel10k instant prompt
# Code that require user input like passwords or yes/no confirmation must go above this
# Everything else goes below
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Prompt plugin. git:https://github.com/romkatv/powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit $ZDOTDIR/.p10k.zsh
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle :compinstall filename '$ZDOTDIR/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# History
HISTFILE=$ZDOTDIR/.histfile
# Maximum number of lines to save in the history file
SAVEHIST=10000
# Maximum number of lines to save in a session
HISTSIZE=10000
# Ignore all duplicates
setopt hist_ignore_all_dups
# Remove duplicates first
setopt hist_expire_dups_first
# Share histories between multiple zsh shells
setopt share_history

# Use vi mode
bindkey -v

# Do not beep
setopt nobeep

# Automatically cd by only typing the path
setopt autocd

# For kitty
alias icat="kitty +kitten icat"

# fzf needs to be sourced before zsh-autocomplete. https://github.com/marlonrichert/zsh-autocomplete/issues/4
# Sourcing fzf as given in Arch Wiki. https://wiki.archlinux.org/index.php/Fzf#zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# Use <c-t> to start context aware fzf completion. https://github.com/junegunn/fzf/wiki/Configuring-fuzzy-completion
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
# Use <c-r> to start fuzzy search history
# Use <alt-c> to change directories 
# Up srearches through history using fzf
bindkey '^[[A' fzf-history-widget

# Clipboard
yanktoclipboard(){
    echo $BUFFER | wl-copy -n 
}
pastefromclipboard(){
    RBUFFER=$(wl-copy -n </dev/null)$RBUFFER
}
zle -N yanktoclipboard
zle -N pastefromclipboard
bindkey -a 'cp' yanktoclipboard
bindkey -a 'cv' pastefromclipboard
