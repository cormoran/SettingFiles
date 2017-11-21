#!/bin/sh
WORKDIR=$HOME/tmp
PREFIX=$HOME/local
VERSION=5.4.2

echo """
====> install zsh
install settings:
    PREFIX : $PREFIX
    VERSION : $VERSION
    WORKDIR : $WORKDIR
"""

mkdir -p $WORKDIR
cd $WORKDIR
wget https://github.com/zsh-users/zsh/archive/zsh-${VERSION}.tar.gz
tar zxf zsh-${VERSION}.tar.gz
cd zsh-zsh-${VERSION}
./Util/preconfig
mkdir build
cd build
../configure --prefix=$PREFIX
make
make install

echo '====> zsh install ok'

