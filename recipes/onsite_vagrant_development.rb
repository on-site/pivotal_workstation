ws_dir = "/Users/#{WS_USER}/ws"
vagrant_box_dir = "/Users/#{WS_USER}/.vagrant.d/boxes"

file "/etc/hosts" do
  owner "root"
  group "wheel"
  contents <<EOTXT
127.0.0.1	localhost
255.255.255.255	broadcasthost
::1             localhost 
fe80::1%lo0	localhost
10.10.10.10 vagrant
10.10.10.10 dev.on-site.com
10.10.10.10 dev.rentaladdress.com
10.10.10.10 local.on-site.com
10.10.10.10 local.rentaladdress.com
10.10.10.10 awesomeapts.local.rentaladdress.com
10.10.10.10 awesomeapts.dev.rentaladdress.com
EOTXT
  action :create
end

directory ws_dir do
  owner WS_USER
  action :create
end

execute "Create Vagrant Box" do
  command "vagrant box add precise64 http://files.vagrantup.com/precise64.box"
  creates "#{vagrant_box_dir}/precise64"
  user WS_USER
  action :run
end
