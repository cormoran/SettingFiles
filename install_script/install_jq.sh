#!/bin/sh
echo """====> install jq

     PREFIX : ${PREFIX:=$HOME/local}

"""

wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -O $PREFIX/bin/jq
chmod +x $PREFIX/bin/jq
