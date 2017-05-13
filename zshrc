# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Supress Java Options
_SILENT_JAVA_OPTIONS="$_JAVA_OPTIONS"
unset _JAVA_OPTIONS
alias java='java "$_SILENT_JAVA_OPTIONS"'

# React-Native
export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Path to your oh-my-zsh installation.
export ZSH=/home/max/.oh-my-zsh
export EDITOR=/usr/bin/vim

# Powerline
export POWERLINE_COMMAND=powerline
export POWERLINE_CONFIG_COMMAND=powerline-config

# MiniConda  
export PATH="/home/max/miniconda3/bin:$PATH"

# npm-prefix
#PATH="$HOME/.node_modules/bin:$PATH"
#export npm_config_prefix=~/.node_modules

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

# refresh-mirrors
alias update-mirror="sudo reflector --latest 10 --protocol https --protocol https --sort rate --save /etc/pacman.d/mirrorlist"

# pip upgrade all
alias pip-upgrade-all="sudo pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip3 install -U"

# Developments alias
# load nvm
alias loadnvm="source /usr/share/nvm/init-nvm.sh"

# temporarily resize tmpfs to 4G (default half RAM)
alias tmpup="sudo mount -o remount,size=4G,noatime /tmp"

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

function md5() {
    md5sum -c <<<"$2  $1"
}
