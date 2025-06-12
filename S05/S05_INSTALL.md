# 🖥️ Guide installation sprint 5

## 📊 Installation et configuration de Zabbix

Pour installer le gestionnaire de supervision Zabbix, une nouvelle machine virtuelle a été créée. Cette machine a pour OS Ubuntu. Elle est présente sur le réseau LAN de l'entreprise à l'adresse 172.16.10.8.

Afin de suivre les différentes machines de notre infrastructure, il faut installer Zabbix serveur sur le serveur de supervision, et Zabbix agent sur les machines à superviser.

### Zabbix serveur

https://www.zabbix.com/download?zabbix=7.2&os_distribution=ubuntu&os_version=24.04&components=server_frontend_agent&db=mysql&ws=apache

### Zabbix agent Windows

L'installation de Zabbix agent sur Windows se fait en téléchargeant l'utilitaire d'installation [ici](https://www.zabbix.com/fr/download_agents). 

Sur une version GUI de Windows, l'installation se fait simplement en suivant les étapes de l'utilitaire d'installation. Il faut renseigner l'adresse IP du serveur (172.16.10.8) et laisser le port par défaut (10050).

Sur une version CORE de Windows, l'utilitaire d'installation peut être téléchargé à l'aide de la commande [Invoke-WebRequest](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.5), puis installé en laissant la commande suivante :

```powershell
msiexec.exe l*v "C:\Package.log" /i "zabbix_agent-7.2.6-windows-amd64-openssl.msi" /qn+ SERVER=172.16.10.8
```

### Zabbix agent Linux

```bash
wget https://repo.zabbix.com/zabbix/7.2/release/debian/pool/main/z/zabbix-release/zabbix-release_latest_7.2+debian12_all.deb
dpkg -i zabbix-release_latest_7.2+debian12_all.deb
apt update 
```

```bash
apt install zabbix-agent
```

```bash
nano /etc/zabbix/zabbix_agentd.conf
```

```bash
Server=172.16.10.8
ServerActive=172.16.10.8
```

```bash
systemctl restart zabbix-agent
```

### Ajout d'un hôte à superviser dans Zabbix serveur

## 💾 Mise en place de sauvegarde
