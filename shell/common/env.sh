umask 022
export EDITOR='emacs'
export VISUAL='emacs'

#
# alias
#

alias c='cd'
alias emacs='emacsclient -nw -a ""'
alias ekill='emacsclient -e "(kill-emacs)"'
alias em='emacs'
alias e='emacs'
alias ct='column -t'

# ls (BSD)
LS='ls'
if [ "$(uname)" = 'Darwin' ]; then
    LS='/bin/ls -G'
elif [ "$(expr substr $(uname -s) 1 5)" = 'Linux' ]; then
    if type /usr/bin/ls > /dev/null; then
        LS='/usr/bin/ls --color=auto'
    else
        LS='/bin/ls --color=auto'
    fi
fi
alias ls="$LS -F"
alias sl="$LS -F"
alias ll="$LS -lhF"
alias la="$LS -AF"
alias lla="$LS -AlhF"
alias l="$LS"

# color
export TERM="xterm-256color"
#export CLICOLOR=1

#
# rm
#

mkdir -p "${HOME}/Trash"
alias rm='echo "You should not use rm command!"; false'
alias trash='mv --backup=numbered --target-directory=${HOME}/Trash --suffix=. -f'
alias rmtrash='trash'
echo 'rm is disabled. use trash instead.'

#
# 環境変数
#

# 共通
export PATH="$HOME/local/bin:$PATH"
export PATH="$HOME/SettingFiles/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/local/lib:$LD_LIBRARY_PATH"

# golang

if [ -e $HOME/local/go ]; then
    export GOROOT=$HOME/local/go
    export PATH=$PATH:$GOROOT/bin
fi
if [ -e $HOME/local/go ]; then
    export GOROOT=$HOME/local/go
    export PATH=$PATH:$GOROOT/bin
fi
export GOPATH=~/Program/
export PATH="$GOPATH/bin:$PATH"

# nodejs (nodebrew)
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# emacs
export PATH="$HOME/.cask/bin:$PATH"

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
anaconda=`ls ~/.pyenv/versions | grep anaconda`
if [ -n $anaconda ]; then
    alias conda-activate="source $HOME/.pyenv/versions/$anaconda/bin/activate"
    alias conda-deactivate="source $HOME/.pyenv/versions/$anaconda/bin/deactivate"
fi

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
