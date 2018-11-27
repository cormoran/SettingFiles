# shell
include_recipe "cookbooks/shell_rc.rb"
include_recipe "cookbooks/dotfiles.rb"
include_recipe "cookbooks/zsh.rb"
include_recipe "cookbooks/tmux.rb"

# languages
include_recipe "cookbooks/rbenv.rb"
include_recipe "cookbooks/node_brew.rb"
include_recipe "cookbooks/go.rb"
include_recipe "cookbooks/anaconda.rb"

# tools
include_recipe "cookbooks/peco.rb"
include_recipe "cookbooks/jq.rb"
include_recipe "cookbooks/ghq.rb"
include_recipe "cookbooks/code.rb"
include_recipe "cookbooks/emacs.rb"

include_recipe "cookbooks/cica_font.rb"
