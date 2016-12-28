#
# environment
#

umask 022

export EDITOR='emacs'
export VISUAL='emacs'


#
# programing language env
#



#
# c++ compiler
#
# installed by brew install llvm38 --withasan
#              brew install gcc-5
#


alias clang++-3.8-with-libstdc++="\
clang++-3.8 \
-stdlib=libstdc++ \
-nostdinc++ \
-isystem /usr/local/Cellar/gcc/6.2.0/lib/gcc/6/gcc/x86_64-apple-darwin16.0.0/6.2.0/../../../../../../include/c++/6.2.0 \
-isystem /usr/local/Cellar/gcc/6.2.0/lib/gcc/6/gcc/x86_64-apple-darwin16.0.0/6.2.0/../../../../../../include/c++/6.2.0/x86_64-apple-darwin16.0.0 \
-isystem /usr/local/Cellar/gcc/6.2.0/lib/gcc/6/gcc/x86_64-apple-darwin16.0.0/6.2.0/../../../../../../include/c++/6.2.0/backward \
-isystem /usr/local/Cellar/gcc/6.2.0/include \
-isystem /usr/local/Cellar/gcc/6.2.0/lib/gcc/6/gcc/x86_64-apple-darwin16.0.0/6.2.0/include-fixed \
-L /usr/local/Cellar/gcc/6.2.0/lib/gcc/6/gcc/x86_64-apple-darwin16.0.0/6.2.0 \
-L /usr/local/Cellar/gcc/6.2.0/lib/gcc/6 \
"

alias clang++-3.8-with-libc++="\
clang++-3.8 \
-stdlib=libc++ \
-nostdinc++ \
-isystem /usr/local/opt/llvm38/lib/llvm-3.8/include/c++/v1 \
-L /usr/local/opt/llvm38/lib/llvm-3.8/lib \
"


export GOPATH=~/Program/
path=($path $GOPATH/bin)

export PYTHONSTARTUP=~/.python_startup

