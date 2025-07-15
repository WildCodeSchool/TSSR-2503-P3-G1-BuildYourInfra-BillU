# 🖥️ Guide d'installation Sprint 10

Ce sprint est dédié au pentesting de notre infrastructure. Pour cela nous allons créer deux nouvelles VMs. Une dédiée à l'attaque, et une à la défense. La machine d'attaque tournera sous Kali Linux tandis que la machine de défense tournera sous ParrotOS.

## 🐉 Installation de Kali Linux

Pour installer Kali, nous commençons par uploader l'image _.iso_ obtenue sur le [site officiel de Kali ](https://www.kali.org/get-kali/#kali-platforms) dans les données du serveur Proxmox.

Ensuite, nous créons une VM avec à partir de cette image.

Afin de tester notre réseau, nous ajoutons la carte vmbr100 à cette machine, afin qu'elle soit sur notre réseau LAN.

## 🦜 Installation de ParrotOS
