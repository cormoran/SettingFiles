#!/usr/bin/env sh
echo "====> install nodebrew"
curl -L git.io/nodebrew | perl - setup
export PATH="$HOME/.nodebrew/current/bin:$PATH"
nodebrew install-binary v9.5.0
