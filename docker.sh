#!/bin/bash

# Atualiza a lista de pacotes
sudo apt-get update

# Instala as dependências necessárias
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Adiciona a chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adiciona o repositório do Docker às fontes APT
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Atualiza a lista de pacotes novamente (após adicionar o repositório)
sudo apt-get update

# Instala o Docker
sudo apt-get install -y docker-ce
