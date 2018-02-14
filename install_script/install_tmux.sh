#!/bin/sh
echo """====> install tmux


     PREFIX : ${PREFIX:=$HOME/local}
     VERSION : ${TMUX_INSTALL_VERSION:=2.6}
     WORKDIR : ${MY_INSTALL_WORKDIR:=$HOME/tmp}

"""

mkdir -p $MY_INSTALL_WORKDIR
cd $MY_INSTALL_WORKDIR
wget https://github.com/tmux/tmux/releases/download/$TMUX_INSTALL_VERSION/tmux-${TMUX_INSTALL_VERSION}.tar.gz
tar zxf tmux-${TMUX_INSTALL_VERSION}.tar.gz
cd tmux-${TMUX_INSTALL_VERSION}
mkdir build
cd build
PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig ../configure --prefix=$PREFIX
make
make install

echo '====> tmux OK'
