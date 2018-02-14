#!/bin/sh
echo """====> install peco


     PREFIX : ${PREFIX:=$HOME/local}
     VERSION : ${PECO_INSTALL_VERSION:=v0.5.1}
     WORKDIR : ${MY_INSTALL_WORKDIR:=$HOME/tmp}

"""

mkdir -p $MY_INSTALL_WORKDIR/peco
cd $MY_INSTALL_WORKDIR/peco

wget https://github.com/peco/peco/releases/download/$PECO_INSTALL_VERSION/peco_linux_386.tar.gz
tar zxf peco_linux_386.tar.gz
cp peco_linux_386/peco $PREFIX/bin/
