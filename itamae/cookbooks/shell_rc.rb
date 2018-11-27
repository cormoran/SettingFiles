#
# 1. $shell_rc_d 以下にある *.sh が自動的に読み込まれて実行されるように設定
# 2. $prefix/bin を環境変数に追加
#

node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local2",
                    })

node.reverse_merge!({
                      :shell_rc_d => "#{node[:prefix]}/shell_rc.d"
                    })


execute "prepare directory #{node[:shell_rc_d]}" do
  command "mkdir -p #{node[:shell_rc_d]}"
  not_if "test -e #{node[:shell_rc_d]}"
end

template "#{node[:shell_rc_d]}/shell.sh" do
    action :create
    source "templates/shell.erb"
end


%w(.bashrc .zshrc).each do |file|
  file_path = "#{ENV['HOME']}/#{file}"
  file file_path do
    action :create
  end
  execute "add #{node[:prefix]}/bin to PATH" do
    command "echo 'export PATH=#{node[:prefix]}/bin:$PATH' >> #{file_path}"
    not_if "grep 'export PATH=#{node[:prefix]}/bin:$PATH' #{file_path}"
  end

  execute "load shell_rc.d in #{file_path}" do
    command "echo 'for f in `find #{node[:shell_rc_d]} -name \"*.sh\"`; do echo loading $f && source $f; done' >> #{file_path}"
    not_if "grep 'find #{node[:shell_rc_d]}' #{file_path}"
  end

end
