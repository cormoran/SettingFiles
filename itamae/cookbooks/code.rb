#
# $vscode_path に vscode がインストールされているとき、 code コマンドを $prefix/bin に追加
#

node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local2",
                      :vscode_path => "#{ENV['HOME']}/Dropbox/Apps/Linux/VSCode-linux-x64/bin/code"
                    })

["#{node[:prefix]}/bin"].each do |dir|
  execute "prepare directory #{dir}" do
    command "mkdir -p #{dir}"
    not_if "test -e #{dir}"
  end
end

execute "install code command" do
  command "ln -s #{node[:vscode_path]} #{node[:prefix]}/bin/code"
  only_if "test -e #{node[:vscode_path]}"
  not_if "test -e #{node[:prefix]}/bin/code"
end
