if type peco > /dev/null ; then
    if type ghq > /dev/null ; then
        alias g='cd `ghq root`/`ghq list | peco`'
    fi
    if type ghq > /dev/null ; then
        alias gh='hub browse `ghq list | peco | cut -d "/" -f 2,3`'    
    fi
fi
