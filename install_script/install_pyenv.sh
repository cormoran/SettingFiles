#! /bin/sh
echo """====> install pyenv

     PREFIX : ${PYENV_PREFIX:=$HOME/.pyenv}
     DEFAULT_PYTHON : ${DEFAULT_PYTHON:=anaconda3}
     NOTE:
        you need to write following setting to .bash_profile (or .zshrc)

        export PYENV_ROOT=\"\$HOME/.pyenv\"
        export PATH=\"\$PYENV_ROOT/bin:\$PATH\"
        eval \"\$(pyenv init -)\"

"""

git clone https://github.com/pyenv/pyenv.git $PYENV_PREFIX

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

pyenv install `pyenv install --list | grep $DEFAULT_PYTHON | tail -n 1`
pyenv global `pyenv versions --bare | grep $DEFAULT_PYTHON | tail -n 1`

echo '====> pyenv OK'
