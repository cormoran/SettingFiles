#!/usr/bin/env bash

cd `dirname $0`
CURDIR=`pwd`

case ${OSTYPE} in
    darwin*)
	LN='gln'
        ;;
    linux*)
	LN='ln'
        ;;
esac

mkdir -p $HOME/.emacs.d
mkdir -p $HOME/.emacs.backup/
$LN --backup=numbered -s $CURDIR/ $HOME/.emacs.d/mysetting
$LN --backup=numbered -s $CURDIR/Cask $HOME/.emacs.d/Cask
touch $HOME/.emacs
echo "(load (expand-file-name \"~/.emacs.d/mysetting/init.el\"))" >> $HOME/.emacs

echo "Installing emacs cask"
curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
export PATH=$PATH:$HOME/.cask/bin
cd ~/.emacs.d/
cask install

if [ "$(uname)" == 'Darwin' ]; then
    # Mac
    echo """
     To enable irony:
     (Mac OS 10.12.2, 2016/12/29)
     1. brew install llvm38
     2. run following command (example)
          mkdir build && cd build
          cmake \\
              -DLIBCLANG_INCLUDE_DIR=/usr/local/Cellar/llvm38/3.8.1/lib/llvm-3.8/include \\
              -DLIBCLANG_LIBRARY=/usr/local/Cellar/llvm38/3.8.1/lib/llvm-3.8/lib/libclang.dylib \\
              -DCMAKE_INSTALL_PREFIX\=/Users/ukai/.emacs.d/irony/  \\
              < path to irony CMakeLists.txt such as ~/.emacs.d/.cask/25.1/elpa/irony-20161227.348/server/>
          cmake --build . --use-stderr --config Release --target install
"""

elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    # Linux
    :
else
    echo "Your platform ($(uname -a)) is not supported."
fi
