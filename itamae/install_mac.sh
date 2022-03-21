#!/usr/bin/env sh
if [ ! -e mitamae-aarch64-darwin ]; then
    curl -L https://github.com/itamae-kitchen/mitamae/releases/download/v1.12.9/mitamae-aarch64-darwin.tar.gz | tar xvz
fi

./mitamae-aarch64-darwin local cookbooks/shell_rc.rb
./mitamae-aarch64-darwin local cookbooks/dotfiles.rb
./mitamae-aarch64-darwin local cookbooks/zsh.rb
# chsh -s /opt/homebrew/bin/zsh
./mitamae-aarch64-darwin local cookbooks/node_brew.rb
./mitamae-aarch64-darwin local cookbooks/go.rb
./mitamae-aarch64-darwin local cookbooks/rbenv.rb
./mitamae-aarch64-darwin local cookbooks/ghq.rb
./mitamae-aarch64-darwin local cookbooks/peco.rb