# -*- mode: ruby -*-
# vi: set ft=ruby :

%x(vagrant plugin install vagrant-vbguest) unless Vagrant.has_plugin?('vagrant-vbguest')

Vagrant.configure("2") do |config|

	#config.vm.network "public_network", ip: "192.168.56.2"

	config.vm.define "master" do |node|

		node.vm.box = "ubuntu/trusty64"

		node.vm.provider "virtualbox" do |v|
		  v.name = "master"
		  v.memory = 2048
		  v.cpus = 1
		end

		node.vm.network :private_network, ip: "10.211.55.200"
		node.vm.hostname = "10.211.55.200"

		node.vm.provision "shell",  run: "always", path: "scripts/update.sh"
		node.vm.provision "shell",  run: "always", path: "scripts/network_setup.sh"

	end


	(1..3).each do |i|

		config.vm.define "slave#{i}" do |node|

			node.vm.box = "ubuntu/trusty64"

			node.vm.provider "virtualbox" do |v|
			  v.name = "slave#{i}"
			  v.memory = 2048
			  v.cpus = 1
			end

			node.vm.network :private_network, ip: "10.211.55.20#{i}"
			node.vm.hostname = "10.211.55.20#{i}"

			node.vm.provision "shell",  run: "always", path: "scripts/update.sh"
			node.vm.provision "shell",  run: "always", path: "scripts/network_setup.sh"

		end

	end

end
