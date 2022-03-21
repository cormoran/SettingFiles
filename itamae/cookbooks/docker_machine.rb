# https://docs.docker.com/machine/install-machine/
node.reverse_merge!({
    :prefix => "#{ENV['HOME']}/local",
    :version => "v0.16.0",
  })

directory "#{node[:prefix]}/bin" do
  action :create
end

execute "download and install docker-machine" do
  command "curl -L https://github.com/docker/machine/releases/download/#{node[:version]}/docker-machine-$(uname -s)-$(uname -m) > #{node[:prefix]}/bin/docker-machine"
  not_if "test -e #{node[:prefix]}/bin/docker-machine"
end
