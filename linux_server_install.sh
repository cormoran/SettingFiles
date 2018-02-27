#! /usr/bin/env bash
cd `dirname $0`

install_script/install_zsh.sh
install_script/install_libevent2.sh
install_script/install_tmux.sh
install_script/install_emacs.sh
install_script/install_pyenv.sh
install_script/install_peco.sh
install_script/install_ghq.sh
install_script/install_dmd.sh
export PATH=$HOME/local/bin:$PATH
./install all
