["wget", "git", "unzip", "tar", "curl", "coreutils", "findutils"].each do |p|
  package p do
    action :install
  end
end