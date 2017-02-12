#
# install:
#    echo "source /path/to/thisfile" >> .bash_profile
#    echo "source /path/to/thisfile" >> .zshrc
# bash, zsh で動いて欲しい

cd `dirname $0`
local CURDIR=`pwd`

for f in $CURDIR/common/*.sh; do
    echo "loading `basename $f`"
    source $f
done

if [[ -n $BASH_VERSION ]]; then
    for f in $CURDIR/bash/*.bash; do
        echo "loading `basename $f`"
        source $f
    done
    if [ -e $HOME/.bash_local ]; then
        source $HOME/.bash_local
    fi
elif [[ -n $ZSH_VERSION ]]; then
    for f in $CURDIR/zsh/*.zsh; do
        echo "loading `basename $f`"
        source $f
    done
    if [ -e $HOME/.zsh_local ]; then
        source $HOME/.zsh_local
    fi
fi

if [ -e $HOME/.shell_local ]; then
    source $HOME/.shell_local
fi
