ws_dir = "/Users/#{WS_USER}/ws"
vagrant_box_dir = "/Users/#{WS_USER}/.vagrant.d/boxes"

# Needs to set up .ssh/config and initialize and populate ~/ws

cookbook_file "/etc/hosts" do
  source "hosts"
  owner "root"
  group "wheel"
  action :create
end

directory ws_dir do
  owner WS_USER
  action :create
end

execute "Add Precise Vagrant Box" do
  command "vagrant box add precise64 http://files.vagrantup.com/precise64.box"
  creates "#{vagrant_box_dir}/precise64"
  user WS_USER
  action :run
end

cookbook_file "#{ws_dir}/Vagrantfile" do
  source "Vagrantfile"
  owner WS_USER
  action  :create_if_missing
end
