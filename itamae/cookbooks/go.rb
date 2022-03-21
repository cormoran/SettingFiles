node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local",
                      :work_dir => "#{ENV['HOME']}/tmp"
                    })
node.reverse_merge!({
                      :shell_rc_d => "#{node[:prefix]}/shell_rc.d",
                      :go_root => "#{node[:prefix]}/go",
                      :go_path => "#{ENV['HOME']}/Program",
                      :go_version => "1.80.0"
                    })


[node[:shell_rc_d], node[:work_dir], "#{node[:prefix]}/bin", File.dirname(node[:go_root])].each do |dir|
  execute "prepare directory #{dir}" do
    command "mkdir -p #{dir}"
    not_if "test -e #{dir}"
  end
end

#
# download & install
#

case node[:platform]
when 'osx', 'darwin'
  package "go" do
    action :install
  end
when 'debian', 'ubuntu', 'redhat'
  os = 'linux-amd64'
  execute "download go" do
    cwd node[:work_dir]
    command "wget https://dl.google.com/go/go#{node[:go_version]}.#{os}.tar.gz && tar -zxf go#{node[:go_version]}.#{os}.tar.gz && mv go go#{node[:go_version]}"
    not_if "test -e go#{node[:go_version]}"
  end
  execute "install go" do
    cwd node[:work_dir]
    command "cp -rfTb go#{node[:go_version]} #{node[:go_root]}"
    not_if "test -e #{node[:go_root]} && (go version | grep #{node[:go_version]})"
  end
end

template "#{node[:shell_rc_d]}/go.sh" do
  action :create
  source "templates/go.erb"
  variables(go_root: node[:go_root], go_path: node[:go_path])
end
