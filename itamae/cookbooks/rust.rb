node.reverse_merge!({
    :prefix => "#{ENV['HOME']}/local"
  })
node.reverse_merge!({
    :shell_rc_d => "#{node[:prefix]}/shell_rc.d",
    :rustup_root => "#{node[:prefix]}/rustup",
    :cargo_root => "#{node[:prefix]}/cargo"
  })

env_init = <<-EOS
  export RUSTUP_HOME=#{node[:rustup_root]}
  export CARGO_HOME=#{node[:cargo_root]}
EOS

execute "install rust up" do
    command "#{env_init} curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path"
    not_if "test -e rustup && test -e cargo"
end

template "#{node[:shell_rc_d]}/rust.sh" do
  action :create
  source "templates/rust.erb"
  variables(rustup_root: node[:rustup_root], cargo_root: node[:cargo_root])
end
