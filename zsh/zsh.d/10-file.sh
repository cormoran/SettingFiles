# File

umask 022

alias ls='ls -GCF'
alias sl='ls'
alias l='ls'
alias la="ls -Ah"
alias lsd='ls -d'
alias ll="ls -lh"
alias lld="ls -dlh"
alias lla="ls -Alh"
alias lal="ls -Alh"

alias c='cd'
alias up='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias du='du -h'


function mkcd(){
    mkdir -p "$@" && cd "$@"
}
