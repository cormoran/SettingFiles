#!/usr/bin/env zsh

cd `dirname $0`
local CURDIR=`pwd`

if [ ! $ZSH_VERSION ]; then
    echo "zsh/install.sh : please run on zsh!"
    exit 1
fi

case ${OSTYPE} in
    darwin*)
	LN='gln'
        ;;
    linux*)
	LN='ln'    
        ;;
esac

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    echo "$rcfile -> .$rcfile"
    $LN --backup=numbered -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

$LN --backup=numbered -s $CURDIR/zsh/zpreztorc $HOME/.zpreztorc
$LN --backup=numbered -s $CURDIR/zshrc $HOME/.zshrc
