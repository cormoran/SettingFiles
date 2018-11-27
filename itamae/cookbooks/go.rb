node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local2",
                      :work_dir => "#{ENV['HOME']}/tmp"
                    })
node.reverse_merge!({
                      :shell_rc_d => "#{node[:prefix]}/shell_rc.d",
                      :go_root => "#{node[:prefix]}/go",
                      :go_path => "#{ENV['HOME']}/Dropbox/Program",
                      :go_version => "1.9.4"
                    })

#
# prepare
#

package "wget" do
  action :install
end

[node[:shell_rc_d], node[:work_dir], "#{node[:prefix]}/bin", File.dirname(node[:go_root])].each do |dir|
  execute "prepare directory #{dir}" do
    command "mkdir -p #{dir}"
    not_if "test -e #{dir}"
  end
end

#
# download & install
#

execute "download go" do
  cwd node[:work_dir]
  command "wget https://dl.google.com/go/go#{node[:go_version]}.linux-amd64.tar.gz && tar -zxf go#{node[:go_version]}.linux-amd64.tar.gz"
  not_if "test -e go"
end

execute "install go" do
  cwd node[:work_dir]
  command "cp -r go #{node[:go_root]}"
  not_if "test -e #{node[:go_root]}"
end

template "#{node[:shell_rc_d]}/go.sh" do
  action :create
  source "templates/go.erb"
  variables(go_root: node[:go_root], go_path: node[:go_path])
end
