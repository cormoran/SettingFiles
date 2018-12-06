node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local2",
                      :work_dir => "#{ENV['HOME']}/tmp"
                    })
node.reverse_merge!({
                      :shell_rc_d => "#{node[:prefix]}/shell_rc.d",
                      :anaconda_root => "#{node[:prefix]}/anaconda3",
                      :anaconda_version => "5.3.1"
                    })

[node[:work_dir], File.dirname(node[:anaconda_root])].each do |dir|
    execute "prepare directory #{dir}" do
    command "mkdir -p #{dir}"
      not_if "test -e #{dir}"
    end
  end


execute "download anaconda" do
  cwd node[:work_dir]
  command "wget https://repo.anaconda.com/archive/Anaconda3-#{node[:anaconda_version]}-Linux-x86_64.sh"
  not_if "test -e Anaconda3-#{node[:anaconda_version]}-Linux-x86_64.sh"
end

execute "install anaconda" do
  cwd node[:work_dir]
  command "bash Anaconda3-#{node[:anaconda_version]}-Linux-x86_64.sh -b -p #{node[:anaconda_root]}"
  not_if "test -e #{node[:anaconda_root]}"
end

template "#{node[:shell_rc_d]}/anaconda.sh" do
  action :create
  source "templates/anaconda.erb"
  variables(anaconda_root: "#{node[:anaconda_root]}")
end
