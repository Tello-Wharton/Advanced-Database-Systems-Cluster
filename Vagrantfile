# -*- mode: ruby -*-
# vi: set ft=ruby :

%x(vagrant plugin install vagrant-vbguest) unless Vagrant.has_plugin?('vagrant-vbguest')

Vagrant.configure("2") do |config|

	slaves = (1..3)

	config.vm.define "adb-master" do |node|

		node.vm.box_url = "https://vagrantcloud.com/ubuntu/trusty64"
		node.vm.box = "ubuntu/trusty64"

  		node.ssh.username = "vagrant"
  		node.ssh.password = "vagrant"

		node.vm.provider "virtualbox" do |v|
		  v.name = "adb-master"
		  v.memory = 2048
		  v.cpus = 1
		end

		node.vm.network :private_network, ip: "10.211.55.200", virtualbox__intnet: true
		node.vm.network :private_network, ip: "10.211.54.200"
		node.vm.hostname = "node0"

		node.vm.provision "shell",	path: "scripts/update.sh"

		node.vm.provision "shell", path: "scripts/generate-ssh-key.sh", args: "0"
		slaves.each do |i|
			node.vm.provision "shell", path: "scripts/generate-ssh-key.sh", args: "#{i}"
		end
		node.vm.provision "shell", path: "scripts/add-keys.sh", args: "0"

		node.vm.provision "shell",  run: "always", path: "scripts/network_setup.sh"

		node.vm.provision "shell", path: "scripts/setup-java.sh"

		node.vm.provision "shell", path: "scripts/setup-hadoop-1.sh"
        node.vm.provision "shell",  run: "always", path: "scripts/start-hadoop.sh"
		node.vm.provision "shell", path: "scripts/setup-hadoop-2.sh"

	end


	slaves.each do |i|

		config.vm.define "adb-slave#{i}" do |node|

			node.vm.box = "ubuntu/trusty64"

  			node.ssh.username = "vagrant"
  			node.ssh.password = "vagrant"

			node.vm.provider "virtualbox" do |v|
			  v.name = "adb-slave#{i}"
			  v.memory = 1024
			  v.cpus = 1
			end

			node.vm.network :private_network, ip: "10.211.55.20#{i}", virtualbox__intnet: true
			node.vm.hostname = "node#{i}"

			node.vm.provision "shell", path: "scripts/update.sh"
			node.vm.provision "shell", path: "scripts/add-keys.sh", args: "#{i}"

			node.vm.provision "shell",  run: "always", path: "scripts/network_setup.sh"

			node.vm.provision "shell", path: "scripts/setup-java.sh"

        	node.vm.provision "shell", path: "scripts/setup-hadoop-1.sh"
        	node.vm.provision "shell",  run: "always", path: "scripts/start-hadoop.sh"
        	
		end

	end

end
