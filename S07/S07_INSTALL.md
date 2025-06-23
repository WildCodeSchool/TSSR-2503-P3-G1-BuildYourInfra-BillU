# Guide d'installation Sprint 7

## 📜 Sommaire

### 1. [Distribution des rôles FSMO](#fsmo)
### 2. [PC d'administration](#admin)

## 🎭 Distribution des rôles FSMO
<span id="fsmo"></span>

Afin de distribuer les rôles FSMO, nous allons créer une nouvelle machine Windows Server Core.

Les rôles seront répartis de la manière suivante entre nos 3 machines :

| Rôle | Machine |
| ---- | ---- | 
| RID Master | WINSRVGUI01 |
| Domain Naming Master | WINSRVGUI01 |
| Infrastructure Master | WINSRVCORE01 |
| Schema Master | WINSRVCORE01 |
| PDC | WINSRVCORE02 |


### Création d'un nouveau Windows Server Core

Pour la machine Windows Server Core, nous avons fait un clone de la machine template Windows Server Core sur Proxmox.

#### Réseau

- Configuration IP du serveur Windows Core  

`New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "172.16.10.5" -PrefixLength 24 -DefaultGateway "172.16.10.254"`

- Paramétrage du DNS via le choix n°8 dans le menu du serveur.

Nous avons ajouté l'IP du contrôleur de domaine en DNS principal soit : 

`172.16.10.1`

En DNS secondaire nous avons indiqué la boucle locale du Windows Server Core

`127.0.0.1`

#### Intégration au domaine billu.lan 

L'ajout a été fait via le controleur de domaine sur Windows Server Core.

### Transfert des rôles avec NTDSUTIL

```powershell
ntdsutil.exe
```

```powershell
role
```

```powershell
connections
```

```powershell
connect to server WINSRVCORE01
```

```powershell
connect to server WINSRVCORE02
```

```powershell
q
```

```powershell
transfer schema master
```

```powershell
transfer infrastructure master
```

```powershell
transfer pdc
```

## 🖥️ PC d'administration
<span id="admin"></span>
