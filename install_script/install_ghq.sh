#!/bin/sh
WORKDIR=$HOME/tmp
PREFIX=$HOME/local
VERSION=v0.8.0

mkdir -p $WORKDIR/ghq
cd $WORKDIR/ghq
wget https://github.com/motemen/ghq/releases/download/$VERSION/ghq_linux_386.zip
unzip ghq_linux_386.zip
mv ghq $PREFIX/bin/
mkdir -p $PREFIX/share/zsh/site-functions
mv zsh/_ghq $PREFIX/share/zsh/site-functions/
