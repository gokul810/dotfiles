set -g fish_greeting ''

# ------------------------------------------------------------
# User preferences
# ------------------------------------------------------------

set -gx EDITOR nano
set -gx LANG en_US.UTF-8


# ------------------------------------------------------------
# Navigation
# ------------------------------------------------------------

alias .. 'cd ..'
alias ... 'cd ../..'
alias c clear
alias x exit


# ------------------------------------------------------------
# Eza
# ------------------------------------------------------------

alias ls 'eza --icons=auto'
alias ll 'eza -lh --icons=auto'
alias la 'eza -a --icons=auto'
alias lla 'eza -lha --icons=auto'
alias lt 'eza --tree --icons=auto'


# ------------------------------------------------------------
# Config shortcuts
# ------------------------------------------------------------

alias fishconf 'nano ~/.config/fish/config.fish'
alias alaconf 'nano ~/.config/alacritty/alacritty.toml'


# ------------------------------------------------------------
# Safety
# ------------------------------------------------------------

alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'


# ------------------------------------------------------------
# Applications
# ------------------------------------------------------------

alias m btop
alias oc opencode


# ------------------------------------------------------------
# Zellij
# ------------------------------------------------------------

alias zj zellij
alias zjl 'zellij list-sessions'
alias zjn 'zellij -s'
alias zjk 'zellij kill-session'
alias zjka 'zellij kill-all-sessions'
alias zjd 'zellij delete-session'
alias zjda 'zellij delete-all-sessions'

function za
    if test (count $argv) -eq 0
        zellij list-sessions
    else
        zellij attach $argv[1]; or zellij --session $argv[1]
    end
end


# ------------------------------------------------------------
# FNM
# ------------------------------------------------------------

if test -d "$HOME/.local/share/fnm"
    fish_add_path "$HOME/.local/share/fnm"

    if type -q fnm
        fnm env --use-on-cd | source
    end
end


# ------------------------------------------------------------
# Antigravity CLI
# ------------------------------------------------------------

fish_add_path "$HOME/.local/bin"


# ------------------------------------------------------------
# Android SDK
# ------------------------------------------------------------

set -gx ANDROID_HOME "$HOME/Android/Sdk"
set -gx ANDROID_SDK_ROOT "$ANDROID_HOME"

fish_add_path "$ANDROID_HOME/cmdline-tools/latest/bin"
fish_add_path "$ANDROID_HOME/platform-tools"
fish_add_path "$ANDROID_HOME/emulator"


# ------------------------------------------------------------
# Flutter
# ------------------------------------------------------------

fish_add_path "$HOME/dev/flutter/bin"


# ------------------------------------------------------------
# Bun
# ------------------------------------------------------------

set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

# Starship
starship init fish | source
