#!/bin/bash

# Script de posta a punt base amb instal·lació de paquets comuns
# Esborrat de paquets innecessaris
# Configuració de seguretat

# Esborrat de protocols de connexió insegurs
apt-get --purge remove xinetd nis yp-tools tftpd atftpd tftpd-hpa telnetd rsh-server rsh-redone-server

# Esborra les X Window (x11)
apt-get remove xserver-xorg-core

# Actualització dels paquets de distribució i del propi kernel
apt-get update && apt-get upgrade -y

# Instal·lació dels paquets habituals
apt-get install -y sudo curl wget git vim bash-completion

# Afegeix l'usuari al grup sudo
user=$(who | cut -f1 -d' ')
echo 'afegim a '$user' dintre del grup SUDO'
usermod -aG sudo $user

# Instal·lació de SELinux
apt install selinux-basics selinux-policy-default -y

# Activació de SELinux
selinux-activate && setenforce 1



# Reiniciem l'equip
#shutdown -r now
