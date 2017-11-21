#!/usr/bin/env zsh

cd `dirname $0`
local CURDIR=`pwd`

if [ ! $ZSH_VERSION ]; then
    echo "zsh/install.sh : please run on zsh!"
    exit 1
fi

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  if [ -e "${ZDOTDIR:-$HOME}/.${rcfile:t}" ]; then
      mv "${ZDOTDIR:-$HOME}/.${rcfile:t}" "${ZDOTDIR:-$HOME}/.${rcfile:t}".org
  fi
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "source $CURDIR/init.sh" >> $HOME/.zshrc
rm $HOME/.zpreztorc
ln -s $CURDIR/zsh/zpreztorc $HOME/.zpreztorc


