#!/usr/bin/env sh
echo """====> install ghq
     PREFIX : ${PREFIX:=$HOME/local}
     VERSION : ${GHQ_INSTALL_VERSION:=v0.8.0}

"""
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
mkdir -p $PREFIX/bin
cd $PREFIX/bin
wget https://www.dropbox.com/download?dl=packages/dropbox.py -O dropbox
chmod +x dropbox
