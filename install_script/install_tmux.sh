#!/bin/sh
WORKDIR=$HOME/tmp
PREFIX=$HOME/local
VERSION=2.3
echo """
====> install tmux
install settings:
    PREFIX : $PREFIX
    VERSION : $VERSION
    WORKDIR : $WORKDIR
"""

mkdir -p $WORKDIR
cd $WORKDIR
wget https://github.com/tmux/tmux/releases/download/$VERSION/tmux-${VERSION}.tar.gz
tar zxf tmux-${VERSION}.tar.gz
cd tmux-${VERSION}
mkdir build
cd build
PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig ../configure --prefix=$PREFIX
make
make install

echo '====> tmux install ok'

