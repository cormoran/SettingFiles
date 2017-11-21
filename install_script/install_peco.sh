#!/bin/sh
WORKDIR=$HOME/tmp
PREFIX=$HOME/local
VERSION=v0.5.1

mkdir -p $WORKDIR
cd $WORKDIR
wget https://github.com/peco/peco/releases/download/$VERSION/peco_linux_386.tar.gz
tar zxf peco_linux_386.tar.gz
mv peco_linux_386/peco $PREFIX/bin/
