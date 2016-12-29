#!/usr/bin/env bash
#
# シンボリックリンクでない $1 が存在すれば ~/dotfiles.org/ に移す
#

function get-unique-name() {
    file=$1
    if [ -e $file ]; then
	num=0
	while [ -e "${file}-${num}" ]; do
	    num=`expr ${num} + 1`
	done
	file="${file}-${num}"
    fi
    echo $file
}



file=$1
if [ -e $file -a ! -L $file ]; then
    base=`basename $file`
    mkdir -p "${HOME}/dotfiles.org"
    unique_name=`get-unique-name "${HOME}/dotfiles.org/${base}"`
    mv $file $unique_name
    echo "moved ${file} to ${unique_name}"
fi


