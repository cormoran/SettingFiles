#
# basic aliases
#

alias c='cd'


# emacs
alias emacs='emacsclient -nw -a ""'
alias ekill='emacsclient -e "(kill-emacs)"'
alias em='emacs'
alias e='emacs'

alias gcc='gcc-6'
alias g++='g++-6'

if type 'rmtrash' > /dev/null ; then
    alias rm='rmtrash'
else
    echo "info : rmtrash does not installed."
fi
