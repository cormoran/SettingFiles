if type peco > /dev/null ; then
    alias g='cd `ghq root`/`ghq list | peco`'
    alias gh='hub browse `ghq list | peco | cut -d "/" -f 2,3`'    
fi