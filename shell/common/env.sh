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
alias ls='/usr/bin/ls --color=auto -F'
alias ll='/usr/bin/ls --color=auto -lhF'
alias la='/usr/bin/ls --color=auto -AF'
alias lla='/usr/bin/ls --color=auto -AlhF'
alias l='ls'

# color
export TERM="xterm-256color"
#export CLICOLOR=1

#
# rm
#

alias rm='echo "You should not use rm command!"; false'
alias trash='mv --backup=numbered --target-directory=${HOME}/Trash --suffix=. -f'
alias rmtrash='trash'
echo 'rm is disabled. use trash instead.'

#
# 環境変数
#

# 共通
export PATH="$HOME/local/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/local/lib:$LD_LIBRARY_PATH"

# golang

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

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
