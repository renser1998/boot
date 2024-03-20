
Vagrant.configure("2") do |config|

    config.vm.define "boot" do |server|
    config.vm.box = 'centos/7'
    config.vm.box_version = "1804.02"
    config.ssh.insert_key = 'false'
      server.vm.host_name = 'boot'
      server.vm.network :private_network, ip: "192.168.56.210" 
      
      server.vm.provider "virtualbox" do |vb|
        vb.memory = 4096
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--vram", "128"]
      end
     
      server.vm.provision "shell",
      name: "task2",
      privileged: true,
      path: "task2.sh"

      server.vm.provision "shell",
      name: "task3",
      privileged: true,
      path: "task3.sh"
      end
    end