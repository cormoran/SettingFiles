#! /bin/sh

PREFIX=$HOME/.pyenv
SETTING_FILE=$HOME/.shell_local

echo """
====> install pyenv
install settings:
    PREFIX : $PREFIX
    SETTING_FILE : $SETTING_FILE
"""

git clone https://github.com/pyenv/pyenv.git $PREFIX
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $SETTING_FILE
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $SETTING_FILE
echo 'eval "$(pyenv init -)"' >> $SETTING_FILE

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

pyenv install `pyenv install --list | grep anaconda3 | tail -n 1`

echo '====> pyenv install ok'
