node.reverse_merge!({
                      :prefix => "#{ENV['HOME']}/local2"
                    })
node.reverse_merge!({
                      :zdotdir => "#{node[:prefix]}/zsh",
                      :shell_rc_d => "#{node[:prefix]}/shell_rc.d"
                    })

["zsh"].each do |p|
    package p do
        action :install
    end
end

git "#{node[:zdotdir]}/.zprezto" do
    repository "https://github.com/sorin-ionescu/prezto.git"
    recursive true
end

[node[:zdotdir], node[:shell_rc_d]].each do |dir|
    execute "prepare directory #{dir}" do
      command "mkdir -p #{dir}"
      not_if "test -e #{dir}"
    end
  end

execute "copy zsh init files" do
    command_str = <<-EOS
for rcfile in #{node[:zdotdir]}/.zprezto/runcoms/z*; do
  ln -s "$rcfile" "#{node[:zdotdir]}/.`basename ${rcfile}`"
done
EOS
    command command_str
    not_if "test -e #{node[:zdotdir]}/.zshrc"
end

remote_file "#{node[:zdotdir]}/.zpreztorc" do
    action :create
    source "files/zpreztorc"
end

template "#{node[:shell_rc_d]}/zsh.sh" do
    action :create
    source "templates/zsh.erb"
end

template "#{ENV['HOME']}/.zshenv" do
    action :create
    source "templates/zshenv.erb"
    variables(zdotdir: "#{node[:zdotdir]}")
end

execute "load ~/.zshrc from zprezto's zshrc" do
    command "echo 'source #{ENV['HOME']}/.zshrc' >> #{node[:zdotdir]}/.zshrc"
    not_if "grep 'source #{ENV['HOME']}/.zshrc' #{node[:zdotdir]}/.zshrc"
end
