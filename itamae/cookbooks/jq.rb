node.reverse_merge!({
                      'prefix' => "#{ENV['HOME']}/local2",
                      'jq_version' => "1.5"
                    })


directory "#{node[:prefix]}/bin" do
  action :create
end

execute "download and install jq" do
  command "wget https://github.com/stedolan/jq/releases/download/jq-#{node[:jq_version]}/jq-linux64 -O #{node[:prefix]}/bin/jq && chmod +x #{node[:prefix]}/bin/jq"
  not_if "test -e #{node[:prefix]}/bin/jq"
end
