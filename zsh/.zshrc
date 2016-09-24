
local zshd=$(dirname $(readlink ~/.zshrc))
export ZDOTDIR=$zshd
# Prezto.
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# -- customize -- -- -- -- -- -- -- -- -- -- -- -- -- --

# ctrl + D でのExit抑制
setopt IGNOREEOF

#Common Setting Files
if [ -d "${zshd}/zsh.d" ];then
    for f in "${zshd}"/zsh.d/*.sh;do
	source "$f" && echo "loaded : $f"
    done
fi

source ~/.zsh_local


echo "loaded : .zshrc"
source /Users/ukai/Program/src/github.com/cormoran/CompetitiveProgramming/tool/src/alias.sh
