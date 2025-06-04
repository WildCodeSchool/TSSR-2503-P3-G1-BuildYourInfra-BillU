# 1. Objectifs

1. SÉCURITÉ - Gestion d'un firewall pfSense
	1. Mise en place de règles de pare-feu WAN, LAN, DMZ (ex.: https://docs.netgate.com/pfsense/en/latest/recipes/example-basic-configuration.html)
	2. Utiliser les principes de gestion de règles suivant :
		1. **Deny all**
		2. **Least privilege** (ex.: https://www.checkpoint.com/fr/cyber-hub/network-security/what-is-the-principle-of-least-privilege-polp/)
		3. **Order of rules** (ex. : https://www.tufin.com/blog/firewall-rules-order-intricacies-navigating-best-practices)
2. SÉCURITÉ - Gestion de la télémétrie sur les clients Windows 10/11
	1. Utilisation de script(s) PowerShell
	2. Script(s) exécuté(s) depuis un serveur Windows ou directement sur les clients
	3. Exécution par tâches AT
3. SÉCURITÉ - Gestion de la télémétrie sur un client Windows 10/11
	1. Utilisation de GPO (Utilisateur/Ordinateur)
4. DOSSIERS PARTAGES - Mettre en place des dossiers réseaux pour les utilisateurs
	1. Stockage des données sur un volume spécifique
	2. Sécurité de partage des dossiers par groupe AD
	3. Mappage des lecteurs sur les clients (au choix) :
		1. GPO
		2. Script PowerShell/batch
		3. Profil utilisateur AD
	4. Chaque utilisateur a accès à :
		1. Un **dossier individuel** , avec une lettre de mappage réseau **I**, accessible uniquement par cet utilisateur
		2. Un **dossier de service**, avec une lettre de mappage réseau **J**, accessible par tous les utilisateurs d'un même service.
		3. Un **dossier de département**, avec une lettre de mappage **K**, accessible par tous les utilisateurs d'un même département.
5. STOCKAGE AVANCÉ - Mettre en place du RAID 1 sur un serveur
6. STOCKAGE AVANCÉ - Mettre en place LVM sur un serveur Debian

# 2. VM pfSense

- Nom de la VM : **G1-pfsense-P3** (renommage possible)
- Connexion : `admin` / `pfsense` (Mot de passe classique de formation à remettre)
	- Si le mot de passe ne fonctionne pas, à remettre à 0 en CLI
- Interfaces réseau :

| Type de sortie pfSense | Nom interface Proxmox | Adresse réseau | Adresse IP       | Passerelle (si existence) | Rmq                  | Adresse à ne pas utiliser                                       |
| ---------------------- | --------------------- | -------------- | ---------------- | ------------------------- | -------------------- | --------------------------------------------------------------- |
| WAN                    | vmbr1                 | 10.0.0.0/29    | 10.0.0.2/29      | 10.0.0.1                  | Ne pas changer l'@IP | Toute la plage. Si besoin demander au formateur/à la formatrice |
| LAN                    | vmbr100               | 172.16.10.0/24 | 172.16.10.254/24 | -                         | Accès console web    | 172.16.10.1                                                     |
| DMZ                    | vmbr110               | 172.20.10.0/24 | 172.20.10.254/24 | -                         | -                    | 172.20.10.1                                                     |

# 3. Identification des machines dans Proxmox

## a. Notes

Pour l'identification des VM/CT, remplissage **obligatoire** de la partie **Notes** dans le **Summary** de chaque machine.
Le template markdown ci-dessous doit être utilisé :

```markdown
# Nom de la machine

- Propriétaire : Groupe X (Nom de société)
- Utilisateur :
	- `<Login>` / `<mot de passe>`
- Usage principal : xxx
- @IP/CIDR (vmbrX)

## Services/Rôles/Logiciels (détails)

- Service/Rôle/Logiciel 1
- Service/Rôle/Logiciel 2
- ...

## Source

- Pour les CT : Nom du template d'origine
- Pour les VM : Nom du template d'origine (ou de l'ISO)
```

Toutes les machines **non-identifiées** au début de sprint suivant **seront supprimées**.
Rmq : Pour l'ajout d'informations, voir avec le formateur/la formatrice.

## b. Tags

Pour l'identification des VM/CT, utilisation **obligatoire** des tags suivant (1 de chaque tableau) :

**Gestion de l'environnement** :

| Tag à utiliser | Signification         |
| -------------- | --------------------- |
| env-prod       | Machine en production |
| env-test       | Machine en test       |

**Gestion de la criticité** :

| Tag à utiliser    | Signification                                                                                                                         |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| priority-critical | Machine critique pour l'infrastructure, sans elle plus rien ne fonctionne                                                             |
| priority-high     | Machine avec priorité haute, qui en cas d'arrêt, amène un arrêt complet sur des zones de l'infrastructure                             |
| priority-medium   | Machine avec priorité moyenne, qui en cas d'arrêt, amène des dysfonctionnement sur certains logiciels et/ou zones de l'infrastructure |
| priority-low      | Machine avec priorité basse, qui n'amène aucun autre problème que ceux engendrés par l'arrêt de cette machine                         |
Toutes les machines **non-taguées** au début de sprint suivant **seront supprimées**.
Rmq : Pour l'utilisation d'autres tags, voir avec le formateur/la formatrice.