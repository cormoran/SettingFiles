#emacs
if type 'emacs'> /dev/null ; then
    alias emacs='emacs -nw'
    alias em='emacs'
else
    colored-echo $YELLOW "info : emacs does not installed."
fi

#vim
if type 'vim'> /dev/null ; then
    alias v='vim'
else
    colored-echo $YELLOW "info : vim does not installed."
fi
