node.reverse_merge!({
                      'prefix' => "#{ENV['HOME']}/local2",
                      'work_dir' => "#{ENV['HOME']}/tmp",
                      'peco_version' => "v0.5.1"
                    })
node.reverse_merge!({
                        :shell_rc_d => "#{node[:prefix]}/shell_rc.d"
                    })

package "wget" do
  action :install
end

execute "prepare directory #{node[:shell_rc_d]}" do
  command "mkdir -p #{node[:shell_rc_d]}"
  not_if "test -e #{node[:shell_rc_d]}"
end

directory node[:work_dir] do
  action :create
end

execute "download peco" do
  cwd node[:work_dir]
  command "wget https://github.com/peco/peco/releases/download/#{node[:peco_version]}/peco_linux_386.tar.gz && tar zxf peco_linux_386.tar.gz"
  not_if "test -e #{node[:work_dir]}/peco_linux_386.tar.gz"
end

directory "#{node[:prefix]}/bin" do
  action :create
end

execute "install peco" do
  cwd node[:work_dir]
  command "cp peco_linux_386/peco #{node[:prefix]}/bin/"
  not_if "test -e #{node[:prefix]}/bin/peco"
end

template "#{node[:shell_rc_d]}/peco.sh" do
  action :create
  source "templates/peco.erb"
end