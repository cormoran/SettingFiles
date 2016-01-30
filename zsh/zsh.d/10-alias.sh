# if [ "$(uname)" == 'Darwin' ]; then
#     OS='Mac'
# elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
#     OS='Linux'
# elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
#     OS='Cygwin'
# else
#     echo "Your platform ($(uname -a)) is not supported."
#     exit 1
# fi

#rm
if type 'rmtrash' > /dev/null ; then
    alias rm='rmtrash'
else
    colored-echo $YELLOW "info : rmtrash does not installed."
fi


if type 'python2' > /dev/null || type 'python3' > /dev/null ; then
    colored-echo $BLUE 'both python2 and 3 are installed.'
    alias python='colored-echo $RED "please use python2 or python3"'
    alias pip='colored-echo $RED "please use pip2 or pip3"'
fi

#alias openocd='openocd -f /usr/local/Cellar/open-ocd/0.9.0/share/openocd/scripts/board/st_nucleo_f3.cfg'
#alias openrtm-eclipse='open ~/Programing/OpenRTM-aist/eclipse/Eclipse.app'
#alias hoogle='open https://www.haskell.org/hoogle/'

echo 'loaded .bash_aliases'
