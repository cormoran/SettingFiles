#!/usr/bin/env sh
echo """====> install golang


     PREFIX : ${PREFIX:=$HOME/local}
     VERSION : ${GO_INSTALL_VERSION:=1.9.4}
     WORKDIR : ${MY_INSTALL_WORKDIR:=$HOME/tmp}

"""

mkdir -p $MY_INSTALL_WORKDIR
cd $MY_INSTALL_WORKDIR

wget https://dl.google.com/go/go${GO_INSTALL_VERSION}.linux-amd64.tar.gz
tar -zxf go${GO_INSTALL_VERSION}.linux-amd64.tar.gz
mv go ${PREFIX}/
export GOROOT=${PREFIX}/go
export PATH=$PATH:$GOROOT/bin
