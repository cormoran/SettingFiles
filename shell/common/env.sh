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
export CLICOLOR=1
alias ls='ls -F'
alias ll='ls -lh'
alias la='ls -A'
alias lla='ls -Alh'
alias l='ls'

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

# golang
export GOPATH=~/Program/
export PATH="$GOPATH/bin:$PATH"

# nodejs (nodebrew)
export PATH="$HOME/.nodebrew/current/bin:$PATH"


