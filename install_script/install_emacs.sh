#!/bin/sh
echo """====> install emacs


     PREFIX : ${PREFIX:=$HOME/local}
     VERSION : ${EMACS_INSTALL_VERSION:=25.3}
     WORKDIR : ${MY_INSTALL_WORKDIR:=$HOME/tmp}

"""

mkdir -p $MY_INSTALL_WORKDIR
cd $MY_INSTALL_WORKDIR

wget http://ftp.gnu.org/pub/gnu/emacs/emacs-${EMACS_INSTALL_VERSION}.tar.gz
tar zxvf emacs-${EMACS_INSTALL_VERSION}.tar.gz
cd emacs-${EMACS_INSTALL_VERSION}
./configure --without-x --prefix=$PREFIX
make && make install
