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
                      :libevent_version => "2.1.8-stable"
                    })

directory node[:work_dir] do
    action :create
end

[node[:tmux_conf_root]].each do |dir|
  execute "prepare directory #{dir}" do
    command "mkdir -p #{dir}"
    not_if "test -e #{dir}"
  end
end

execute "download libevent" do
  cwd node[:work_dir]
  command "wget https://github.com/libevent/libevent/releases/download/release-#{node[:libevent_version]}/libevent-#{node[:libevent_version]}.tar.gz && tar zxf libevent-#{node[:libevent_version]}.tar.gz"
  not_if "test -e libevent-#{node[:libevent_version]}.tar.gz"
end

execute "install libevent" do
  cwd "#{node[:work_dir]}/libevent-#{node[:libevent_version]}"
  command "rm -rf build && mkdir build && cd build && ../configure --prefix=#{node[:prefix]} && make && make install"
  not_if "test -e #{node[:prefix]}/lib/libevent.a"
end

execute "download tmux" do
  cwd node[:work_dir]
  command "wget https://github.com/tmux/tmux/releases/download/#{node[:tmux_version]}/tmux-#{node[:tmux_version]}.tar.gz && tar zxf tmux-#{node[:tmux_version]}.tar.gz"
  not_if "test -e #{node[:work_dir]}/tmux-#{node[:tmux_version]}"
end

execute "install tmux" do
  cwd "#{node[:work_dir]}/tmux-#{node[:tmux_version]}"
  command "rm -rf build; mkdir build && cd build && ../configure --prefix=#{node[:prefix]} LDFLAGS='-L#{node[:prefix]}/lib' CFLAGS='-I#{node[:prefix]}/include' && make && make install"
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

template "#{node[:shell_rc_d]}/tmux.sh" do
  action :create
  source "templates/tmux.erb"
  variables(prefix: node[:prefix])
end