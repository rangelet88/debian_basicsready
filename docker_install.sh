#!/bin/bash

# Instal·lació bàsica de Docker i inicialització del clúster de SWARM
#
# Ramon Àngel Garcia Adell
# 3 de Novembre de 2020

# Instal·la els paquets de docker
apt install -y git bash-completion
curl https://get.docker.com | sudo bash

# Inicialitza com a clùster swarm
docker swarm init
# Desa el token per a unir els altres nodes en un arxiu per a la posterior utilització
docker swarm join-token manager | grep join  > join.sh
# Afegeix permisos d'execució a l'arxiu
chmod u+x join.sh

# Afegeix l'usuari al grup Docker
dockerUser=$(who | cut -f1 -d' ')
echo 'afegim a '$dockerUser' dintre del grup SUDO'
usermod -aG docker $dockerUser
