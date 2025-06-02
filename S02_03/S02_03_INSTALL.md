# 🖥️ Guide installation sprint 2-3

## Sommaire

### 1. [Paramétrage des IP](#Paramétrage-des-IP)
### 3. [Installation des rôles sur Windows Server 2022 GUI](#roles_windows_gui)
### 4. [Configuration Serveur Debian](#config-debian)

### 1. Paramétrage des IP  
<span id="Paramétrage-des-IP"></span>
Nous allons configurer les machines pour atteindre cette configuration finale : 

| Nom   | OS       | IP | DNS primaire |
| :-: | :-: | :-: | :-: |
| 552 (G1-WINSRVGUI01) | Windows Server 2022 GUI | 172.16.10.1/24| 127.0.0.1 |
| 553 (G1-LINSRV01) | Debian 12. | 172.16.10.3/24| 172.16.10.1 |
| 554 (G1-WINSRVCORE01) | Windows Server 2022 Core | 172.16.10.2/24| 172.16.10.1 |
| 565 (G1-WINCLI01) | Windows 10 | 172.16.20.10/24| 172.16.10.1 |
| 564 (G1-WINCLI02) | Windows 10 | 172.16.20.10/24| 172.16.10.1 |

### 3. Installation des rôles sur Windows Server 2022 GUI
<span id="roles_windows_gui"></span>
Pour ajouter des roles sur un serveur Windows, il suffit d'aller sur le Server Manager, puis d'aller dans l'onglet **Manage** en haut, et de choisir **Add Roles and Features**.  
Pour le type d'installation, on choisit bien **Role-based or feature-based installation**, **Next**  
On sélectionne le serveur GUI, **Next**  
On séléctionne les rôles voulus : ADDS, DHCP, DNS, **Next** 


![Installation_rôles](Ressources/AD-DS/ADDS-screen-ADDS,DNS,DHCP.png)

Puis on confirme et procède à l'installation.

En haut, on clique sur le drapeau puis sur **Promote this server to a domain controller**


### 4. Configuration Serveur Debian
<span id="config-debian"></span>

Pour la machine serveur Debian, nous avons fait un clone de la machine template Debian sur Proxmox.

#### Réseau

La configuration de l'ip a été faite en ajoutant le texte suivant au fichier ``/etc/network/interfaces`` :

```bash
auto ens18
iface ens18 inet static
    address 172.16.10.3/24
    gateway 172.16.10.254
```

La configuration du DNS pour cette machine a été effectuée en ajoutant le texte suivant au fichier ``/etc/resolv.conf`` :

```bash
nameserver 172.16.10.1
nameserver 8.8.8.8
nameserver 8.8.4.4
```

#### Intégration à l'AD

Afin d'intégrer cette machine à l'AD, nous avons installé les packets ``realmd``, ``sssd`` et ``packagekit``.

L'installation s'est faite avec cette commande :

```bash
apt-get install realmd sssd packagekit
```

Puis, pour rejoindre l'AD, nous avons utilisé la commande ``realm`` suivante :

```bash
realm join billu.lan
```

Pour limiter les accès en ssh au groupe DSI, nous avons modifié le fichier ``/etc/ssh/sshd_config`` en y ajoutant la ligne suivante :

```bash
AllowGroups dsi@billu.lan
```
