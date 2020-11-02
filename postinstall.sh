#!/bin/bash

# Script de posta a punt base amb instal·lació de paquets comuns
# Esborrat de paquets innecessaris
# Configuració de seguretat

# Esborrat de protocols de connexió insegurs
apt-get --purge remove xinetd nis yp-tools tftpd atftpd tftpd-hpa telnetd rsh-server rsh-redone-server

# Esborra les X Window (x11)
apt-get remove xserver-xorg-core

# Actualització dels paquets de distribució i del propi kernel
apt-get update && apt-get upgrade

# Activació de SELinux
#if ($(getenforce) == "Disabled") { setenforce 1}

# Instal·lació dels paquets habituals
apt-get install -y wget git vim bash-completion
