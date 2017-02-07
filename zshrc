# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/max/.oh-my-zsh
export EDITOR=/usr/bin/vim

# Powerline
export POWERLINE_COMMAND=powerline
export POWERLINE_CONFIG_COMMAND=powerline-config

# MiniConda  
export PATH="/home/max/miniconda3/bin:$PATH"

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# tmux auto run and reattach
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# --- ALIAS ---
# clean obselete packages
alias sysclean="pacaur -Rns \$(pacaur -Qdtq)"
alias ssu="pacaur -Syu"
alias night="light -S 5"
alias yt="mpsyt"

# coreutils safe commands
alias mv="timeout 8 mv -iv"
alias mkdir="mkdir -p -v"
alias rm="noglob timeout 3 rm -Iv --one-file-system"

# tmux alias
alias tml="tmux ls"
alias tmk="tmux kill-session -a"

# load nvm
alias loadnvm="source /usr/share/nvm/init-nvm.sh"

powerline-daemon -q
. /home/max/miniconda3/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

# search for music on youtube and play on MPV
function mm() {
    mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch10:"$*"
}

# google search
function gs() {
    chromium "google.com/search?q=$*" >/dev/null 2>&1
}
