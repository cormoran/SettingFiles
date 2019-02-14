#!/bin/sh
echo """====> install zsh


     PREFIX : ${PREFIX:=$HOME/local}
     VERSION : ${ZSH_INSTALL_VERSION:=5.7.1}
     WORKDIR : ${MY_INSTALL_WORKDIR:=$HOME/tmp}

"""

mkdir -p $MY_INSTALL_WORKDIR
cd $MY_INSTALL_WORKDIR

if [ ! -e zsh-${ZSH_INSTALL_VERSION}.tar.gz ]; then
    echo "=> downloading"
    wget -q https://github.com/zsh-users/zsh/archive/zsh-${ZSH_INSTALL_VERSION}.tar.gz
else
    echo "=> downloaded file found"
fi

TMP_DIR=`mktemp -d zsh.${ZSH_INSTALL_VERSION}.XXXX`
echo "=> working in ${TMP_DIR}"
tar zxf zsh-${ZSH_INSTALL_VERSION}.tar.gz -C $TMP_DIR
cd $TMP_DIR/zsh-zsh-${ZSH_INSTALL_VERSION}
./Util/preconfig
mkdir build
cd build
echo "=> configuring"
../configure -q --prefix=$PREFIX || exit -1
echo "=> building"
make -j `grep -c processor /proc/cpuinfo` > make.log || exit -1
echo "=> installing"
make install > make.install.log

echo '====> zsh OK'
