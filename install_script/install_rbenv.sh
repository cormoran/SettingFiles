#!/usr/bin/env sh
echo """====> install rbenv

     PREFIX : ${RBENV_PREFIX:=$HOME/.rbenv}
     NOTE:
        you need to write following setting to .bash_profile (or .zshrc)

        export PATH=\"\$HOME/$RBENV_PREFIX/bin:\$PATH\"
        eval \"\$(rbenv init -)\"

"""

git clone https://github.com/rbenv/rbenv.git $RBENV_PREFIX
git clone https://github.com/rbenv/ruby-build.git $RBENV_PREFIX/plugins/ruby-build
cd $RBENV_PREFIX && src/configure && make -C src
export PATH="$HOME/$RBENV_PREFIX/bin:$PATH"
eval "$(rbenv init -)"
rbenv install 2.5.0
