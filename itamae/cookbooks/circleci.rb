node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local2",
                    })

directory "#{node[:prefix]}/bin" do
    action :create
end

execute "download and install circle ci" do
  command "curl -fLSs https://circle.ci/cli | DESTDIR=#{node[:prefix]}/bin bash"
  not_if "test -e #{node[:anaconda_root]}/bin/circleci"
end
