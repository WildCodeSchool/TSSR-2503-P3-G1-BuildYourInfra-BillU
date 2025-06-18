# 🖥️ Guide d'installation sprint 6

## 📞 Installation de FreePBX et 3CX

L'installation de FreePBX se fait à partir de l'ISO disponible sur le serveur Proxmox.

Nous utilisons pour cela l'iso _SNG7-PBX16-64bit-2302-1.iso_. 

### Installation de FreePBX

Une fois la VM Proxmox créée, on peut la lancer pour installer FreePBX. A chaque étape de l'installation, choisit la première option, comme suit :

![FreePBX étape 1](Ressources/freePBX-01.png)

![FreePBX étape 2](Ressources/freePBX-02.png)

![FreePBX étape 3](Ressources/freePBX-03.png)

### Configuration de l'IP 

### Configuration comptes

On accède à l'interface de gestion de FreePBX en se connectant depuis un client à l'adresse _172.20.10.3_

Compte admin FreePBX :
 - Admin / Azerty1*


### Lignes

| CLIENT | NUM | NOM | MDP |
| ----- | ----- | ---------- | -------- |
| CLI01 | 80100 | Yara Abadi | 1234 
| CLI02 | 80101 | Remi Advezekt | 1234

### Installation de 3CX Phone

https://3cxphone.software.informer.com/6.0/

Set accounts -> Ajout des comptes sur le serveur FreePBX
Check appel : nickel
