# !/usr/bin/env bash
cd `dirname $0`
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install coreutils # for ln, mv with --backup
brew install wget cmake peco ghq
brew install zsh emacs
install_script/install_tmux.sh
brew install pyenv rbenv nodebrew go gcc
brew cask install osxfuse xquartz
brew install sshfs
brew install reattach-to-user-namespace
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

DEFAULT_PYTHON=anaconda3
pyenv install `pyenv install --list | grep $DEFAULT_PYTHON | tail -n 1`
pyenv global `pyenv versions --bare | grep $DEFAULT_PYTHON | tail -n 1`
