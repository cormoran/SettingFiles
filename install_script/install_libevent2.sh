#!/bin/sh
echo """====> install libevent
    PREFIX : ${PREFIX:=$HOME/local}
    VERSION : ${LIBEVENT2_INSTALL_VERSION:=2.1.8-stable}
    MY_INSTALL_WORKDIR : ${MY_INSTALL_WORKDIR:=$HOME/tmp}
"""

mkdir -p $MY_INSTALL_WORKDIR
cd $MY_INSTALL_WORKDIR
wget https://github.com/libevent/libevent/releases/download/release-${LIBEVENT2_INSTALL_VERSION}/libevent-${LIBEVENT2_INSTALL_VERSION}.tar.gz
tar zxf libevent-${LIBEVENT2_INSTALL_VERSION}.tar.gz
cd libevent-${LIBEVENT2_INSTALL_VERSION}
mkdir build
cd build
../configure --prefix=$PREFIX
make
make install

echo '====> libevent OK'
