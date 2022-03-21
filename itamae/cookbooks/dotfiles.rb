remote_file "#{ENV['HOME']}/.clang-format" do
    source "files/clang-format"
end

remote_file "#{ENV['HOME']}/.gitignore_global" do
    source "files/gitignore_global"
end

# remote_file "#{ENV['HOME']}/.python_startup" do
#     source "files/python_startup"
# end

# @note : ghq で一部上書きされる
remote_file "#{ENV['HOME']}/.gitconfig" do
    source "files/gitconfig"
end