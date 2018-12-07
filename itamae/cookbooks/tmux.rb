# -*- coding: utf-8 -*-
#
# Mac の場合は、パッチを当てる必要があった
#

node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local2",
                      :work_dir => "#{ENV['HOME']}/tmp"
                    })
node.reverse_merge!({
                      :tmux_conf_root => "#{node[:prefix]}/tmux",
                      :tmux_version => "2.6",

                    })

package "libevent-dev" do
  action :install
end

[node[:tmux_conf_root]].each do |dir|
  execute "prepare directory #{dir}" do
    command "mkdir -p #{dir}"
    not_if "test -e #{dir}"
  end
end



execute "download tmux" do
  cwd node[:work_dir]
  command "wget https://github.com/tmux/tmux/releases/download/#{node[:tmux_version]}/tmux-#{node[:tmux_version]}.tar.gz && tar zxf tmux-#{node[:tmux_version]}.tar.gz"
  not_if "test -e #{node[:work_dir]}/tmux-#{node[:tmux_version]}"
end

execute "install tmux" do
  cwd "#{node[:work_dir]}/tmux-#{node[:tmux_version]}"
  command "rm -rf build; mkdir build && cd build && PKG_CONFIG_PATH=#{node[:prefix]}/lib/pkgconfig ../configure --prefix=#{node[:prefix]} && make && make install"
  not_if "test -e #{node[:prefix]}/bin/tmux"
end

template "#{ENV['HOME']}/.tmux.conf" do
    action :create
    source "templates/tmux.conf.erb"
    variables(tmux_conf_root: "#{node[:tmux_conf_root]}")
end

["osx", "linux-server"].each do |os|
  remote_file "#{node[:tmux_conf_root]}/tmux.conf.#{os}" do
    action :create
    source "files/tmux.conf.#{os}"
  end
end
