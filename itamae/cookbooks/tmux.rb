#
# Mac の場合は、パッチを当てる必要があった
#

node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local2"
                    })
node.reverse_merge!({
                      :tmux_conf_root => "#{node[:prefix]}/tmux"
                    })

package "tmux" do
  action :install
end

[node[:tmux_conf_root]].each do |dir|
  execute "prepare directory #{dir}" do
    command "mkdir -p #{dir}"
    not_if "test -e #{dir}"
  end
end

template "~/.tmux.conf" do
    action :create
    source "templates/tmux.conf.erb"
    variables(tmux_conf_root: "#{node[:tmux_conf_root]}")
end

["osx", "linux-server"] do |os|
  remote_file "#{node[:tmux_conf_root]}/tmux.conf.#{os}" do
    action :create
    source "files/tmux.conf.#{os}"
  end
end
