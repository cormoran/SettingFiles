node.reverse_merge!({
                      :font_path => "#{ENV['HOME']}/.local/share/fonts",
                      :work_dir => "#{ENV['HOME']}/tmp",
                      :cica_font_version => "v4.1.1"
                    })


[node[:font_path], node[:work_dir]].each do |dir|
  execute "prepare directory #{dir}" do
    command "mkdir -p #{dir}"
    not_if "test -e #{dir}"
  end
end


execute "download cica font" do
  cwd node[:work_dir]
  command "wget https://github.com/miiton/Cica/releases/download/#{node[:cica_font_version]}/Cica-#{node[:cica_font_version]}.zip && unzip -d cica Cica-#{node[:cica_font_version]}.zip"
  not_if "test -e cica"
end

execute "install cica font" do
  cwd node[:work_dir]
  command "cp cica/*.ttf #{node[:font_path]}"
  not_if "test -e #{node[:font_path]}/Cica-Bold.ttf"
end
