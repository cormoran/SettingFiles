["which", "wget", "git", "unzip", "tar", "curl"].each do |p|
  package p do
    action :install
  end
end