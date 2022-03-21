# coding: utf-8
#
# nodebrew を $nodebrew_root にインストールして、$shell_rc_d に、設定ファイルを追加
# nodebrew に $node_versions をインストール
#

node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local"
                    })
node.reverse_merge!({
                      :shell_rc_d => "#{node[:prefix]}/shell_rc.d",
                      :nodebrew_root => "#{node[:prefix]}/nodebrew",
                      :node_versions => %w(v10.15)
                    })

#
# prepare
#


execute "prepare directory #{node[:shell_rc_d]}" do
  command "mkdir -p #{node[:shell_rc_d]}"
  not_if "test -e #{node[:shell_rc_d]}"
end

execute "prepare directory #{File.dirname(node[:nodebrew_root])}" do
  command "mkdir -p #{File.dirname(node[:nodebrew_root])}"
  not_if "test -e #{File.dirname(node[:nodebrew_root])}"
end

#
# download & install
#

execute "download nodebrew" do
  command "curl -L git.io/nodebrew | NODEBREW_ROOT=#{node[:nodebrew_root]} perl - setup"
  not_if "test -e #{node[:nodebrew_root]}"
end

template "#{node[:shell_rc_d]}/nodebrew.sh" do
  action :create
  source "templates/nodebrew.erb"
  variables(nodebrew_root: "#{node[:nodebrew_root]}")
end

#
# install node versions
#

nodebrew_init = <<-EOS
  export PATH=#{node[:nodebrew_root]}/current/bin:$PATH
  export NODEBREW_ROOT=#{node[:nodebrew_root]}
EOS

node[:node_versions].each do |version|
  execute "install node #{version}" do
    command "#{nodebrew_init} nodebrew install-binary #{version}"
    not_if "#{nodebrew_init} nodebrew ls | grep '#{version}'"
  end
end
