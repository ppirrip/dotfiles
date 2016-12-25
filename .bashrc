#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux # for tmux

# TMUX
if which tmux >/dev/null 2>&1; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# useful alias
# https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions
alias ll="ls -lhA"
alias la="ls -la"
alias ls="ls -CF" # this has to be the last of the ls ...

alias df="pydf"
#alias df="df -Tha --total" # original df

alias du="ncdu"
#alias du="du -ach | sort -h" # original du

alias free="free -mt"
alias ps="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

alias mkdir="mkdir -p"

alias wget="wget -c"

alias top="htop" # new and improve top

# show ip address behind router
alias myip="curl http://ipecho.net/plain; echo"

# setup $PATH variable
export PATH=$PATH:~/.local/bin/

# set vim as the default editor
export VISUAL=vim
export EDITOR="$VISUAL"
alias vi="vim"

# for 256 colour
export TERM=xterm-256color
