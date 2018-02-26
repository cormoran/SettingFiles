cd `dirname $0`
local CURDIR=`pwd`

# ctrl + D でのExit抑制
setopt IGNOREEOF

# peco
if type peco > /dev/null 2>&1 ; then
    # zsh の履歴検索にpecoを使う
    function peco-history-selection() {
        # mac には tac ない
        # linux には tail -r ない
        if type tac >/dev/null 2>&1; then
            BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco`
        else
            BUFFER=`history -n 1 | tail -r | awk '!a[$0]++' | peco`
        fi
	    CURSOR=$#BUFFER
	    zle reset-prompt
    }
    zle -N peco-history-selection
    bindkey '^R' peco-history-selection
fi

cd ~
