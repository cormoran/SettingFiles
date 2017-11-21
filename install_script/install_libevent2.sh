#!/bin/sh
WORKDIR=$HOME/tmp
PREFIX=$HOME/local
VERSION=2.1.8-stable

echo """
====> install libevent
install settings:
    PREFIX : $PREFIX
    VERSION : $VERSION
    WORKDIR : $WORKDIR
"""

mkdir -p $WORKDIR
cd $WORKDIR
wget https://github.com/libevent/libevent/releases/download/release-${VERSION}/libevent-${VERSION}.tar.gz
tar zxf libevent-${VERSION}.tar.gz
cd libevent-${VERSION}
mkdir build
cd build
../configure --prefix=$PREFIX
make
make install

echo '====> libevent install ok'

