#!/bin/sh
WORKDIR=$HOME/tmp
PREFIX=$HOME/local
VERSION=25.3

mkdir -p $WORKDIR
cd $WORKDIR

wget http://ftp.gnu.org/pub/gnu/emacs/emacs-${VERSION}.tar.gz
tar zxvf emacs-${VERSION}.tar.gz
cd emacs-${VERSION}
./configure --without-x --prefix=$PREFIX
make && make install
