#
# 1. $shell_rc_d 以下にある *.sh が自動的に読み込まれて実行されるように設定
# 2. $prefix/bin を環境変数に追加
#

node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local2",
                    })

node.reverse_merge!({
                      :bin_d => "#{node[:prefix]}/bin.d"
                    })


execute "prepare directory #{node[:bin_d]}" do
  command "mkdir -p #{node[:bin_d]}"
  not_if "test -e #{node[:bin_d]}"
end

remote_directory "#{node[:bin_d]}" do
    source "files/bin"
end

%w(.bash_profile .zshrc).each do |file|
  file_path = "#{ENV['HOME']}/#{file}"
  file file_path do
    action :create
  end
  execute "add #{node[:prefix]}/bin to PATH" do
    command "echo 'export PATH=#{node[:bin_d]}:$PATH' >> #{file_path}"
    not_if "grep 'export PATH=#{node[:bin_d]}:$PATH' #{file_path}"
  end
end
