node.reverse_merge!({
                      'prefix' => "#{ENV['HOME']}/local",
                      'work_dir' => "#{ENV['HOME']}/tmp",
                      'peco_version' => "v0.5.1"
                    })
node.reverse_merge!({
                        :shell_rc_d => "#{node[:prefix]}/shell_rc.d"
                    })

execute "prepare directory #{node[:shell_rc_d]}" do
  command "mkdir -p #{node[:shell_rc_d]}"
  not_if "test -e #{node[:shell_rc_d]}"
end

directory node[:work_dir] do
  action :create
end

case node[:platform]
when 'osx', 'darwin'
  os = 'darwin_amd64'
when 'debian', 'ubuntu', 'redhat'
  os = 'linux_amd64'
end

execute "download peco" do
  cwd node[:work_dir]
  command "wget https://github.com/peco/peco/releases/download/#{node[:peco_version]}/peco_#{os}.tar.gz && tar zxf peco_#{os}.tar.gz"
  not_if "test -e #{node[:work_dir]}/peco_#{os}.tar.gz"
end

directory "#{node[:prefix]}/bin" do
  action :create
end

execute "install peco" do
  cwd node[:work_dir]
  command "cp peco_#{os}/peco #{node[:prefix]}/bin/"
  not_if "test -e #{node[:prefix]}/bin/peco"
end

template "#{node[:shell_rc_d]}/peco.sh" do
  action :create
  source "templates/peco.erb"
end
