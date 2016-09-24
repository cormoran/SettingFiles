if type peco > /dev/null ; then
    #
    # peco
    #
    
    # zsh の履歴検索にpecoを使う
    function peco-history-selection() {
	BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
	CURSOR=$#BUFFER
	zle reset-prompt
    }
    
    zle -N peco-history-selection
    bindkey '^R' peco-history-selection


    # ghq, hub の検索にpecoを使う
    alias g='cd $(ghq root)/$(ghq list | peco)'
    alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
    
fi
