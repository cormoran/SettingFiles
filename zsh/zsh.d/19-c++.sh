#!/usr/bin/env sh

alias clang++-with-libstdcpp="\
clang++-3.8 \
-stdlib=libstdc++ \
-nostdinc++ \
-I/usr/local/Cellar/gcc/5.3.0/include/c++/5.3.0/x86_64-apple-darwin15.0.0/ \
-I/usr/local/Cellar/gcc/5.3.0/include/c++/5.3.0/ \
-L/usr/local/Cellar/gcc/5.3.0/lib/gcc/5/ \
"

alias clang++-3.8--with-libcpp="\
clang++-3.8 \
-stdlib=libc++ \
-nostdinc++ \
-I/usr/local/opt/llvm38/lib/llvm-3.8/include/c++/v1 \
-L/usr/local/opt/llvm38/lib/llvm-3.8/lib \
"
