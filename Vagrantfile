Vagrant.configure("2") do |config|
    # Configuração da máquina master
    config.vm.define "master" do |master|
      master.vm.box = "ubuntu/bionic64"
      master.vm.hostname = "master"
      master.vm.network "private_network", ip: "192.168.56.10"
      master.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
      end
      # Provisionamento para instalar o Docker na máquina master
      master.vm.provision "shell", path: "docker.sh"
      master.vm.provision "shell", inline: "docker swarm init --advertise-addr 192.168.56.10"
      
    end
    # Configuração da máquina worker node01
    config.vm.define "node01" do |node|
      node.vm.box = "ubuntu/bionic64"
      node.vm.hostname = "node01"
      node.vm.network "private_network", ip: "192.168.56.11"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
      end
      
      # Provisionamento para instalar o Docker na máquina node01
      node.vm.provision "shell", path: "docker.sh"
      node.vm.provision "shell", inline: "docker swarm join --token <SEUTOKEN>"
    end
  
    # Configuração da máquina worker node02
    config.vm.define "node02" do |node|
      node.vm.box = "ubuntu/bionic64"
      node.vm.hostname = "node02"
      node.vm.network "private_network", ip: "192.168.56.12"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
      end
      # Provisionamento para instalar o Docker na máquina node02
      node.vm.provision "shell", path: "docker.sh"
      node.vm.provision "shell", inline: "docker swarm join --token <SEUTOKEN>"
    end
  
    # Configuração da máquina worker node03
    config.vm.define "node03" do |node|
      node.vm.box = "ubuntu/bionic64"
      node.vm.hostname = "node03"
      node.vm.network "private_network", ip: "192.168.56.13"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
      end
      # Provisionamento para instalar o Docker na máquina node03
      node.vm.provision "shell", path: "docker.sh"
      node.vm.provision "shell", inline: "docker swarm join --token <SEUTOKEN>"
      

    end
  end
  
