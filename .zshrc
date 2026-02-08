# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- OH-MY-ZSH SETUP ---
export ZSH="$HOME/.oh-my-zsh"

# zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# --- USER PREFERENCES ---

export EDITOR='nano'
export LANG=en_US.UTF-8

# --- CUSTOM ALIASES ---

# Navigation since color scheme is embedded into the terminal
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias x='exit'

# Better LS (With Colors)
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'

# Config Shortcuts
alias zshconf="nano ~/.zshrc"
alias alaconf="nano ~/.config/alacritty/alacritty.toml"

# Safety
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Btop alias
alias m="btop"

# --- ZELLIJ WORKFLOW ---

# Quick Shortcuts
alias zj="zellij"
alias zjl="zellij list-sessions"
alias zjn="zellij -s"
alias zjk="zellij kill-session"
alias zjka="zellij kill-all-sessions"
alias zjd="zellij delete-session"
alias zjda="zellij delete-all-sessions"

# Tries to attach to a session, If the session doesn't exist, it creates it.
za() {
    if [ -z "$1" ]; then
        zellij list-sessions
    else
        zellij attach "$1" || zellij --session "$1"
    fi
}

# Syntax Highlighting for ZSH
ZSH_HIGHLIGHT_STYLES[command]='fg=#7aa2f7,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#bb9af7,bold'

# --- OTHERS ---

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fnm
FNM_PATH="/home/gokul/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# opencode
export PATH=/home/gokul/.opencode/bin:$PATH
