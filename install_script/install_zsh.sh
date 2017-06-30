#!/bin/sh
WORKDIR=$HOME/tmp
PREFIX=$HOME/local
VERSION=5.3.1

mkdir $WORKDIR
cd $WORKDIR
wget https://github.com/zsh-users/zsh/archive/zsh-${VERSION}.tar.gz
tar zxvf zsh-${VERSION}.tar.gz
cd zsh-zsh-${VERSION}
./Util/preconfig
mkdir build
cd build
../configure --prefix=$PREFIX
make
make install

