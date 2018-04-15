#!/usr/bin/env bash
cd $HOME
mkdir -p $HOME/Trash
mv --backup=numbered --target-directory=${HOME}/Trash --suffix=. -f .pyenv .zprezto .tmux .emacs.d .cask local tmp dlang build
