#!/bin/bash

# Instal·lació bàsica de VMwareTools
#
# Ramon Àngel Garcia Adell
# 13 de Novembre de 2020

if [[ $EUID -ne 0 ]]; then
  echo "Heu de ser root per a executar aquest script." 1>&2
  exit 1
fi

mkdir /mnt/cdrom -p
mount /dev/cdrom /mnt/cdrom
cd /tmp
tar zxpf /mnt/cdrom/VMwareTools-*.tar.gz
umount /dev/cdrom
cd vmware-tools-distrib
sudo ./vmware-install.pl -d
vmware-config-tools.pl -h 2>&1 | grep "VMware Tools"
