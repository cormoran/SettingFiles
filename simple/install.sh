#!/usr/bin/env bash

script=`basename $0`
cd `dirname $0`

for f in *; do
    if [ "$f" == "$script" ]; then
	continue
    fi
    ../scripts/backup.sh "${HOME}/.${f}"
    ln -s "`pwd`/$f" "${HOME}/.${f}" 
done

