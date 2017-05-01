cd `dirname $0`
local CURDIR=`pwd`

# ctrl + D でのExit抑制
setopt IGNOREEOF

# peco
if type peco > /dev/null ; then
    # zsh の履歴検索にpecoを使う
    function peco-history-selection() {
        # mac には tac ない
        # linux には tail -r ない
        if which tac >/dev/null; then
           tac="tac"
        else
           tac="tail -r"
        fi
	    BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco`
	    CURSOR=$#BUFFER
	    zle reset-prompt
    }   
    zle -N peco-history-selection
    bindkey '^R' peco-history-selection    
fi

cd ~
