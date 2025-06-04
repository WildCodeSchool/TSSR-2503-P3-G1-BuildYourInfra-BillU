# 🖥️ Guide installation sprint 4

## 🧱 Installation machine pfSense

Cette partie du guide d'installation explique comment nous avons installé et configuré notre pare-feu pfSense.

Nous créons d'abord une machine pfSense sur Proxmox. Nous utilisons pour cela l'ISO déjà présent sur l'infrastructure.

Nous ajoutons trois interfaces réseau à la machine créée :
* **vmbr1** : utilisé pour le WAN 
* **vmbr100** : utilisé pour le LAN
* **vmbr110** : utilisé pour la DMZ

L'installation de l'OS conserve les options par défaut de pfSense.

Une fois installé, nous configurons les interfaces réseau comme suit :

| Type de sortie pfSense | Nom interface Proxmox | Nom interface pfSense | Adresse réseau | Adresse IP       | Passerelle (si existence) | Rmq                  | Adresse à ne pas utiliser                                       |
| ---------------------- | --------------------- | --------------------- |-------------- | ---------------- | ------------------------- | -------------------- | --------------------------------------------------------------- |
| WAN                    | vmbr1                 | vtnet0                | 10.0.0.0/29    | 10.0.0.2/29      | 10.0.0.1                  | Ne pas changer l'@IP | Toute la plage. Si besoin demander au formateur/à la formatrice |
| LAN                    | vmbr100               | vtnet1                | 172.16.10.0/24 | 172.16.10.254/24 | -                         | Accès console web    | 172.16.10.1                                                     |
| DMZ                    | vmbr110               | vtnet2                | 172.20.10.0/24 | 172.20.10.254/24 | -                         | -                    | 172.20.10.1                                                     |

Une fois ces configurations effectuées, il est possible de se connecter à l'interface de configuration du pare-feu pfSense depuis les machines clients (ou serveurs) graphiques présentes sur le réseau. Pour cela, il faut se connecter à l'adresse *172.16.10.254* depuis son navigateur.

## 📂 Installation dossiers partagés
