#!/usr/bin/env sh

cd `dirname $0`
CURDIR=`pwd`

mkdir -p $HOME/.emacs.d
ln -s $CURDIR/ $HOME/.emacs.d/mysetting

if [ "$(uname)" == 'Darwin' ]; then
    # Mac (full install)
    echo "Target: Mac :: installing **full** emacs setting"
    echo "(load (expand-file-name \"~/.emacs.d/mysetting/init.el\"))" >> $HOME/.emacs
    ln -s $CURDIR/Cask $HOME/.emacs.d/Cask
    
    echo """
     TODO :
     brew install cask
     cd ~/.emacs.d/
     cask install

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
    # Linux (simple install)
    echo "Target: Linux :: installing **simple** emacs setting"
    echo "(load (expand-file-name \"~/.emacs.d/mysetting/simple.el\"))" >> $HOME/.emacs
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi


