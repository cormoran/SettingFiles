# coding: utf-8
node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local",
                      :work_dir => "#{ENV['HOME']}/tmp",
                      :ghq_version => "v1.2.1",
                      :ghq_root => "#{ENV['HOME']}/Program/src"
                    })


directory node[:work_dir] do
  action :create
end

case node[:platform]
when 'osx', 'darwin'
  package "ghq" do
    action :install
  end
when 'debian', 'ubuntu', 'redhat'
  os = 'linux_amd64'
  directory "#{node[:prefix]}/bin" do
    action :create
  end
  directory "#{node[:prefix]}/share/zsh/site-functions" do
    action :create
  end
  execute "download ghq" do
    cwd node[:work_dir]
    command "wget https://github.com/motemen/ghq/releases/download/#{node[:ghq_version]}/ghq_#{os}.zip && unzip -o ghq_#{os}.zip"
    not_if "test -e #{node[:work_dir]}/ghq_#{os}.zip"
  end
  execute "install ghq" do
    cwd node[:work_dir]
    command "cp ghq #{node[:prefix]}/bin/ && cp zsh/_ghq #{node[:prefix]}/share/zsh/site-functions"
    not_if "test -e #{node[:prefix]}/bin/ghq"
  end
end

file "#{ENV['HOME']}/.gitconfig" do
  action :create
end

# @note : dotfiles.rb のあとで実行しないと上書きされる
execute "add ghq root config" do
  config = <<-EOS
[ghq]
        root = #{node[:ghq_root]}
EOS
  command "echo '#{config}' >> #{ENV['HOME']}/.gitconfig"
  not_if "grep 'ghq' '#{ENV['HOME']}/.gitconfig'"
end
