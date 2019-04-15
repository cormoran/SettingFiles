#!/bin/sh
echo """====> install emacs


     PREFIX : ${PREFIX:=$HOME/local}
     VERSION : ${EMACS_INSTALL_VERSION:=26.1}
     WORKDIR : ${MY_INSTALL_WORKDIR:=$HOME/tmp}

"""

mkdir -p $MY_INSTALL_WORKDIR
cd $MY_INSTALL_WORKDIR

if [ ! -e emacs-${EMACS_INSTALL_VERSION}.tar.gz ]; then
    echo "=> downloading"
    wget -q http://ftp.gnu.org/pub/gnu/emacs/emacs-${EMACS_INSTALL_VERSION}.tar.gz
else
    echo "=> downloaded file found"
fi

TMP_DIR=`mktemp -d emacs.${EMACS_INSTALL_VERSION}.XXXX`
echo "=> working in ${TMP_DIR}"
tar zxf emacs-${EMACS_INSTALL_VERSION}.tar.gz -C $TMP_DIR
cd $TMP_DIR/emacs-${EMACS_INSTALL_VERSION}
echo "=> configuring"
./configure -q --without-x --prefix=$PREFIX > configure.log || exit -1
echo "=> building"
make -j `grep -c processor /proc/cpuinfo` 2>1 > make.log || exit -1
echo "=> installing"
make install > make.install.log || exit -1

echo '====> emacs OK'
