["which", "wget", "git", "unzip", "tar", "curl", "gcc" , "make", "ncurses-devel", "ncurses", "bzip2", "openssl-devel", "readline-devel", "zlib-devel"].each do |p|
    package p do
      action :install
    end
end