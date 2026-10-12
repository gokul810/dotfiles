# --- OH-MY-ZSH SETUP ---
export ZSH="$HOME/.oh-my-zsh"

# zsh theme
ZSH_THEME="gozilla"

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
alias ls='eza --icons=auto'
alias ll='eza -lh --icons=auto'
alias la='eza -a --icons=auto'
alias lla='eza -lha --icons=auto'
alias lt='eza --tree --icons=auto'

# Config Shortcuts
alias zshconf="nano ~/.zshrc"
alias alaconf="nano ~/.config/alacritty/alacritty.toml"

# Safety
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Btop alias
alias m="btop"

# OpenCode
alias oc="opencode"

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
ZSH_HIGHLIGHT_STYLES[command]='bold'
ZSH_HIGHLIGHT_STYLES[alias]='bold'

# --- OTHERS ---

# fnm
FNM_PATH="/home/gokul/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell zsh)"
fi


# Added by Antigravity CLI installer
export PATH="/home/gokul/.local/bin:$PATH"


# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

# flutter
export PATH=$PATH:$HOME/dev/flutter/bin

# bun completions
[ -s "/home/gokul/.bun/_bun" ] && source "/home/gokul/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
