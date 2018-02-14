#!/bin/sh
echo """====> install ghq


     PREFIX : ${PREFIX:=$HOME/local}
     VERSION : ${GHQ_INSTALL_VERSION:=v0.8.0}
     WORKDIR : ${MY_INSTALL_WORKDIR:=$HOME/tmp}

"""

mkdir -p $MY_INSTALL_WORKDIR/ghq
cd $MY_INSTALL_WORKDIR/ghq

wget https://github.com/motemen/ghq/releases/download/$GHQ_INSTALL_VERSION/ghq_linux_386.zip
unzip ghq_linux_386.zip
cp ghq $PREFIX/bin/
mkdir -p $PREFIX/share/zsh/site-functions
mv zsh/_ghq $PREFIX/share/zsh/site-functions/
