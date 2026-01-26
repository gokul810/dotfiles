# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
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

# Bat alias
alias bat='batcat'

# Syntax Highlighting
ZSH_HIGHLIGHT_STYLES[command]='fg=#7aa2f7,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#bb9af7,bold'

# --- STARTUP ---
# Run fastfetch if installed to show that Arch logo on launch
#if command -v fastfetch &> /dev/null; then
#    fastfetch
#fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
