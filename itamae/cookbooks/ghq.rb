node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local2",
                      :work_dir => "#{ENV['HOME']}/tmp",
                      :ghq_version => "v0.8.0",
                      :ghq_root => "#{ENV['HOME']}/Dropbox/Program/src"
                    })

package "wget" do
  action :install
end

directory node[:work_dir] do
  action :create
end

execute "download ghq" do
  cwd node[:work_dir]
  command "wget https://github.com/motemen/ghq/releases/download/#{node[:ghq_version]}/ghq_linux_386.zip && unzip ghq_linux_386.zip"
  not_if "test -e #{node[:work_dir]}/ghq_linux_386.zip"
end

directory "#{node[:prefix]}/bin" do
  action :create
end

directory "#{node[:prefix]}/share/zsh/site-functions" do
  action :create
end

execute "install ghq" do
  cwd node[:work_dir]
  command "cp ghq #{node[:prefix]}/bin/ && cp zsh/_ghq #{node[:prefix]}/share/zsh/site-functions"
  not_if "test -e #{node[:prefix]}/bin/ghq"
end

file "#{ENV['HOME']}/.gitconfig" do
  action :create
end

# @note : dotfiles.rb のあとで実行する
execute "add ghq root config" do
  config = <<-EOS
[ghq]
        root = #{node[:ghq_root]}
EOS
  command "echo '#{config}' >> #{ENV['HOME']}/.gitconfig"
  not_if "grep 'ghq' '#{ENV['HOME']}/.gitconfig'"
end
