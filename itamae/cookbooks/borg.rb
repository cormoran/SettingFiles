# coding: utf-8
node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local",
                      :work_dir => "#{ENV['HOME']}/tmp",
                      :borg_version => "1.1.10",
                      :borg_root => "#{ENV['HOME']}/Program/src"
                    })


directory node[:work_dir] do
  action :create
end

case node[:platform]
when 'osx', 'darwin'
  os = 'macosx64'
when 'debian', 'ubuntu', 'redhat'
  os = 'linux64'
end

execute "download and install borg" do
  command "wget https://github.com/borgbackup/borg/releases/download/#{node[:borg_version]}/borg-#{os} -O #{node[:prefix]}/bin/borg && chmod +x #{node[:prefix]}/bin/borg"
  not_if "test -e #{node[:prefix]}/bin/borg"
end
