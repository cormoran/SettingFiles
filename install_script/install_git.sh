#!/usr/bin/env sh
#!/bin/sh
echo """====> install git


     PREFIX : ${PREFIX:=$HOME/local}
     VERSION : ${GIT_INSTALL_VERSION:=2.18.0}
     WORKDIR : ${MY_INSTALL_WORKDIR:=$HOME/tmp}
"""

mkdir -p $MY_INSTALL_WORKDIR
cd $MY_INSTALL_WORKDIR
wget https://github.com/git/git/archive/v${GIT_INSTALL_VERSION}.tar.gz
tar zxf v${GIT_INSTALL_VERSION}.tar.gz
cd git-${GIT_INSTALL_VERSION}
make prefix=$PREFIX all
make prefix=$PREFIX install
echo '====> git OK'
