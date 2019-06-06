
execute "change apt source" do
    command "sed -i -e \"s%http://archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g\" /etc/apt/sources.list"
end

execute "apt update" do
    command "apt update"
end

["wget", "git", "unzip", "tar", "curl", "gcc" , "make", "libncurses5-dev", "libssl-dev", "libreadline-dev", "zlib1g-dev", "python", "gnutls-dev", "zsh", "emacs", "pkg-config"].each do |p|
    package p do
      action :install
    end
end

include_recipe "local.rb"
