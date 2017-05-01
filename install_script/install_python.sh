#! /bin/sh

# -- install settings --
TMPDIR=$HOME/tmp
PREFIX=$HOME/local
PYVER=3.6.1

echo """

install settings:
    TMPDIR : $TMPDIR
    PREFIX : $PREFIX
    PYVER  : $PYVER

"""

# -- install --
mkdir -p $TMPDIR/src
cd $TMPDIR/src
# get python
wget https://www.python.org/ftp/python/$PYVER/Python-$PYVER.tar.xz
tar xvf Python-$PYVER.tar.xz
# rm ./Python-$PYVER.tar.xz
cd Python-$PYVER
./configure --prefix=$PREFIX --enable-shared LDFLAGS=-Wl,-rpath,$PREFIX/lib
make -j
make install

echo """
you need to set PATH
ex)
echo "export PATH=$PREFIX/bin:PATH" >> .bashrc
"""
