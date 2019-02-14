node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local2"
                    })
node.reverse_merge!({
                      :shell_rc_d => "#{node[:prefix]}/shell_rc.d",
                      :cask_root => "#{node[:prefix]}/emacs_cask",
                    })

# ["emacs"].each do |p|
#   package p do
#     action :install
#   end
# end

remote_directory "#{node[:prefix]}/install_script" do
  source "../../install_script"
end

execute "build & install emacs" do
  command "#{node[:prefix]}/install_script/install_emacs.sh"
  not_if "test -e #{ENV['prefix']}/bin/emacsa"
end

[node[:shell_rc_d], File.dirname(node[:cask_root])].each do |dir|
  execute "prepare directory #{dir}" do
    command "mkdir -p #{dir}"
    not_if "test -e #{dir}"
  end
end

git "#{node[:cask_root]}" do
  repository "https://github.com/cask/cask.git"
end

template "#{node[:shell_rc_d]}/emacs_cask.sh" do
  action :create
  source "templates/cask.erb"
  variables(cask_root: node[:cask_root])
end

remote_directory "#{ENV['HOME']}/.emacs.d" do
  source "files/emacs"
end

execute "install cask" do
  cwd "#{ENV['HOME']}/.emacs.d"
  command "#{node[:cask_root]}/bin/cask install"
  not_if "test -e #{ENV['HOME']}/.emacs.d/.cask"
end

directory "#{ENV['HOME']}/.emacs.backup" do
    action :create
end

file "#{ENV['HOME']}/.emacs" do
    action :create
end

execute "add emacs config" do
    command "echo '(load (expand-file-name \"~/.emacs.d/init.el\"))' >> #{ENV['HOME']}/.emacs"
    not_if "grep '(load (expand-file-name \"~/.emacs.d/init.el\"))' #{ENV['HOME']}/.emacs"
end
