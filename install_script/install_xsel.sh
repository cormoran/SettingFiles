#!/bin/sh
echo """====> install xsel


     PREFIX : ${PREFIX:=$HOME/local}
     VERSION : ${XSEL_INSTALL_VERSION:=1.2.0}
     WORKDIR : ${MY_INSTALL_WORKDIR:=$HOME/tmp}

"""

sudo yum install -y libX11-devel libXt-devel

mkdir -p $MY_INSTALL_WORKDIR
cd $MY_INSTALL_WORKDIR
wget http://www.kfish.org/software/xsel/download/xsel-${XSEL_INSTALL_VERSION}.tar.gz
tar zxf xsel-${XSEL_INSTALL_VERSION}.tar.gz
cd xsel-${XSEL_INSTALL_VERSION} && rm -rf build
mkdir build && cd build
../configure --prefix=$PREFIX
make
make install

echo '====> xsel OK'
