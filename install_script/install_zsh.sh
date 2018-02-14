#!/bin/sh
echo """====> install zsh


     PREFIX : ${PREFIX:=$HOME/local}
     VERSION : ${ZSH_INSTALL_VERSION:=5.4.2}
     WORKDIR : ${MY_INSTALL_WORKDIR:=$HOME/tmp}

"""

mkdir -p $MY_INSTALL_WORKDIR
cd $MY_INSTALL_WORKDIR
wget https://github.com/zsh-users/zsh/archive/zsh-${ZSH_INSTALL_VERSION}.tar.gz
tar zxf zsh-${ZSH_INSTALL_VERSION}.tar.gz
cd zsh-zsh-${ZSH_INSTALL_VERSION}
./Util/preconfig
mkdir build
cd build
../configure --prefix=$PREFIX
make
make install

echo '====> zsh OK'
