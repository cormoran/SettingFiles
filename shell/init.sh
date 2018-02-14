#
# install:
#    echo "/path/to/thisfile" >> .bash_profile
#    echo "/path/to/thisfile" >> .zshrc
# bash, zsh で動いて欲しい

ORGDIR=`pwd`
cd `dirname ${BASH_SOURCE:-$0}`
CURDIR=`pwd`

for f in $CURDIR/common/*.sh; do
    echo "loading `basename $f`"
    source $f
done

# if [[ -n $BASH_VERSION ]]; then
#     echo "<=== LOADING BASH SETTINGS ===>"
#     for f in $CURDIR/bash/*.bash; do
#         echo "loading `basename $f`"
#         source $f
#     done
#     if [ -e $HOME/.bash_local ]; then
#         source $HOME/.bash_local
#     fi
# elif [[ -n $ZSH_VERSION ]]; then
#     echo "<=== LOADING ZSH SETTINGS ===>"
#     for f in $CURDIR/zsh/*.zsh; do
#         echo "loading `basename $f`"
#         source $f
#     done
#     if [ -e $HOME/.zsh_local ]; then
#         source $HOME/.zsh_local
#     fi
# fi

# if [ -e $HOME/.shell_local ]; then
#     source $HOME/.shell_local
# fi
cd $ORGDIR
