# Desafio de Projeto DIO (Digital Innovation One) - Cluster Swarm com Vagrant

Neste desafio de projeto, criaremos um Cluster Swarm local utilizando máquinas virtuais e aplicaremos nossos conhecimentos em Vagrant. Além disso, aprenderemos uma forma de evitar implementações manuais, melhorando o desempenho dos desenvolvedores.

## Pré-requisitos:

* Instalar o Vagrant
* Fazer o download de uma ferramenta de virtualização.
  * Nesse caso, usamos VirtualBox. Mas há outras ferramentas como VMware, Hyper-V e Libvirt/KVM.

  Links:
  * [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  * [VMware](https://www.vmware.com/)
  * [Hyper-V](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v)
  * [Libvirt/KVM](https://libvirt.org/)

## Passo a Passo

### Criar o Vagrantfile:

* Definir 4 máquinas virtuais, sendo uma máquina com o nome de `master` e as outras com os nomes de `node01`, `node02` e `node03`.
* Cada máquina virtual deve ter um IP fixo.
* Todas as máquinas virtuais devem possuir o Docker pré-instalado.
* A máquina com o nome de `master` deve ser o nó manager do cluster.

### Configuração do Vagrantfile:

Utilize o seguinte código no seu `Vagrantfile` para configurar as máquinas:

```ruby
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

  # Configuração das máquinas worker node01, node02 e node03
  ["node01", "node02", "node03"].each do |node_name|
    config.vm.define node_name do |node|
      node.vm.box = "ubuntu/bionic64"
      node.vm.hostname = node_name
      node.vm.network "private_network", ip: "192.168.56.#{node_name.split("node")[1].to_i + 10}"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
      end
      # Provisionamento para instalar o Docker nas máquinas worker
      node.vm.provision "shell", path: "docker.sh"
      node.vm.provision "shell", inline: "docker swarm join --token <SEU_TOKEN> 192.168.56.10:2377"
    end
  end
end

### Substitua `<SEU_TOKEN>` pelo token de join do seu cluster Swarm.

## Executar o Cluster Swarm:

* Após a execução do comando anterior, verifique se o cluster Swarm foi criado corretamente executando o comando `vagrant ssh master` para acessar a máquina `master` e em seguida execute `docker node ls` para listar os nós do cluster.

## Conclusão:

* Com isso, você terá um Cluster Swarm local configurado e pronto para uso, utilizando o Vagrant para facilitar o processo de criação e gerenciamento das máquinas virtuais.

### PS: Para conferir via console o resultado da execução acima:

* Use o comando `docker node ls`, conforme ilustrado abaixo:

![image](https://github.com/Pilgriman/vagrant-docker-cluster/assets/62913993/2b23e72f-611d-4a54-957d-28bb3cb717d5)


