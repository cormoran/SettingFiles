#
# rbenv を $rbenv_root にインストールして、$shell_rc_d に、設定ファイルを追加
# rbenv に $ruby_versions をインストール
#

node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local2"
                    })
node.reverse_merge!({
                      :shell_rc_d => "#{node[:prefix]}/shell_rc.d",
                      :rbenv_root => "#{node[:prefix]}/rbenv",
                      :ruby_versions => %w(2.5.0)
                    })

[node[:shell_rc_d], File.dirname(node[:rbenv_root])].each do |dir|
  execute "prepare directory #{dir}" do
    command "mkdir -p #{dir}"
    not_if "test -e #{dir}"
  end
end

git "#{node[:rbenv_root]}" do
  repository "https://github.com/rbenv/rbenv.git"
end

git "#{node[:rbenv_root]}/plugins/ruby-build" do
  repository "https://github.com/rbenv/ruby-build.git"
end

execute "build rbenv" do
  cwd node[:rbenv_root]
  command "src/configure && make -C src"
  not_if "test -e #{node[:rbenv_root]}/libexec/rbenv-realpath.dylib"
end

template "#{node[:shell_rc_d]}/rbenv.sh" do
  action :create
  source "templates/rbenv.erb"
  variables(rbenv_root: node[:rbenv_root])
end


rbenv_init = <<-EOS
  export RBENV_ROOT=#{node[:rbenv_root]}
  export PATH="#{node[:rbenv_root]}/bin:${PATH}"
  eval "$(rbenv init -)"
EOS

node[:ruby_versions].each do |version|
  execute "rbenv install #{version}" do
    command "#{rbenv_init} rbenv install #{version}"
    not_if "#{rbenv_init} rbenv versions --bare | grep -x #{version}"
  end
end
