# 📜 Synthèse des éléments du schéma  


| ID matériel       | Nom matériel Proxmox | Nom matériel machine | VM / CT      | OS                        | Fonction principale              | Carte réseau | Adresse IP        | Disque | Disque - Espace libre (Go) | Disque - Espace total (Go) | Disque - Espace libre (%) | Mémoire vive - Utilisée (%) | Mémoire vive - Totale (Go)  |
| ----------------- | -------------------- | -------------------- | ------------ | ------------------------- | -------------------------------- | ------------ | ----------------- | --- | -------------------------- | ---- | --- | --- | --- |
| 520               | GLPI                 | GLPI                 | CT           | Debian 12                 | Gestion de parc informatique     | vmbr100      | 172.16.10.12      | 1/1 | 5,6     | 8    | 70 | 40 | 0,512 |
| 521               | intranet             | intranet             | CT           | Debian 12                 | Serveur web                      | vmbr110      | 172.20.10.2       | 1/1 |  6,8     | 8    | 85 | 6 | 0,512 |
| 522               | Mail                 | Mail                 | CT           | Debian 12                 | Serveur mail                     | vmbr110      | 172.20.10.10      | 1/1 |  6       | 10   | 60 | 60 | 4 |
| 525               | G1-ZABBIX            | G1-ZABBIX            | CT           | Debian 12                 | Surveillance                     | vmbr100      | 172.16.10.8       | 1/1 |  28      | 32   | 87,5 | 14 | 4 |
| 551               | G1-pfsense           | pfSense.home.arpa    | VM           | pfsense                   | pfSense                          | vmbr100      | 172.16.10.251     | 1/1 |  6,6     | 10   | 66 | 10 | 1 |
| 552               | G1-WINSRVGUI01       | WINSRVGUI01          | VM           | Windows serveur 2022      | AD-DS / DHCP / DNS / Sauvegardes | vmbr100      | 172.16.10.1       | 1/2 |  11,8    | 32   | 36,875 | 52 | 4 |
| 552               | G1-WINSRVGUI01       | WINSRVGUI01          | VM           | Windows serveur 2022      | AD-DS / DHCP / DNS / Sauvegardes | vmbr100      | 172.16.10.1       | 2/2 |  7       | 32   | 21,875 | 52 | 4 |
| 553               | G1-Ubuntu-defense    | defense              | VM           | Ubuntu 24.04 LTS          | Défense cyberattaque             | vmbr110      | 172.20.10.10      | 1/1 |  14      | 32   | 43,75 | 1,9 | 4 |
| 554               | G1-WINSRVCORE01      | WINSRVCORE01         | VM           | Windows serveur core 2022 | Replicate AD-DS                  | vmbr100      | 172.16.10.2       | 1/1 |  9,7     | 20   | 48,5 | 55 | 2 |
| 557               | G1-WINSRVCORE02      | SRVWINCORE02         | VM           | Windows serveur core 2022 | Replicate AD-DS                  | vmbr100      | 172.16.10.5       | 1/1 |  10.2    | 20   | 31.7 | 55 | 2 |
| 559               | G1-LINSRV04-bastion  | LINSRV04             | VM           | Debian 12                 | Bastion                          | vmbr110      | 172.20.10.4       | 1/1 |  4,8     | 9    | 53,33333333 | 25 | 4 |
| 560               | G1-PBX01             | freepbx              | VM           | FreePBX                   | Communication VoIP               | vmbr110      | 172.20.10.3       | 1/1 |  1,8     | 2    | 90 | 50 | 2 |
| 562               | PC-Admin             | PCADMIN              | VM           | Windows 10                | PCADMIN                          | vmbr100      | 172.16.10.6       | 1/1 |  13,9    | 50   | 27,8 | 55 | 4 |
| 564               | G1-WINCLI02          | WINCLI02             | VM           | Windows 10                | WINCLI02                         | vmbr100      | dhcp 172.16.10.22 | 1/1 |  9,6     | 50   | 19,2 | 60 | 4 |
| 565               | G1-WINCLI01          | WINCLI01             | VM           | Windows 10                | WINCLI01                         | vmbr100      | dhcp 172.16.10.21 | 1/1 |  18,9    | 50   | 37,8 | 60 | 4 |
| 566               | G1-KALI              | kali                 | VM           | Kali                      | Attaque cyber                    | vmbr100      | dhcp 172.16.10.20 | 1/1 |  12      | 30   | 40 | 20 | 8 |
| 568               | G1-WINSRVGUI02       | WINSRVGUI02          | VM           | Windows serveur 2022      | Déploiement                      | vmbr100      | 172.16.10.11      | 1/1 |  6,9     | 23,5 | 29,36170213 | 62 | 4 |
