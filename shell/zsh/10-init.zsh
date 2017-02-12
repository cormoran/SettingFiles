cd `dirname $0`
local CURDIR=`pwd`

# ctrl + D でのExit抑制
setopt IGNOREEOF

# peco
if type peco > /dev/null ; then
    # zsh の履歴検索にpecoを使う
    function peco-history-selection() {
	    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
	    CURSOR=$#BUFFER
	    zle reset-prompt
    }   
    zle -N peco-history-selection
    bindkey '^R' peco-history-selection    
fi

cd ~
