if [ "$(uname)" = 'Darwin' ]; then
    alias mv='gmv'
    alias ln='gln'
# elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
fi
