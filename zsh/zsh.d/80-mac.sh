if [ "$(uname)" != 'Darwin' ]; then
    return 1
fi

#if type 'pbcopy' > /dev/null ; then
#    function copy {
#	cat $@ | pbcopy
#	echo "copied $@ to clipboard"
#    }
#else
#    colored-echo $YELLOW "info : pbcopy does not installed."
#fi
