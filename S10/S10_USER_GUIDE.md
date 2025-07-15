# 🖥️ Guide d'utilisation Sprint 10

Kali Linux et ParrotOS embarquent de nombreux outils utiles pour les pentesters (ou les pirates). Il n'est donc pas nécessaire d'installer de nombreux outils une fois une version de Kali déployée dans notre infrastructure.

## 📍 Utilisation de nmap

**nmap** a pour objectif de scanner les ports des hôtes ou réseaux cibles. Il permet de détecter quels ports sont ouverts et donc quels ports il est possible de cibler lors d'une attaque.

Une commande qu'il est possible d'utiliser est la suivante :

```bash
nmap -A 172.16.10.0/24 -v
```

Les paramètres sont les suivants :

* **nmap** : appel de l'utilitaire nmap
* **-A** : détecte également l'OS, la version, les scripts, et le traceroute
* **172.16.10.0/24** : le réseau ciblé, ici notre LAN
* **-v** : verbose, rend la sortie de nmap plus explicite et "verbeuse"

Ce scan global du réseau permet de trouver tous les ordinateurs qui auraient des ports ouverts intéressants pour le pirate, mais également les noms de OS, du domaine...

La totalité des options possibles pour nmap peut être trouvée sur la [documentation officielle](https://nmap.org/man/fr/index.html).

## 👾 Utilisation de medusa

**medusa** est un utilitaire permettant de tenter de [bruteforce](https://fr.wikipedia.org/wiki/Attaque_par_force_brute) des identifiants.

Partant du principe que le scan nmap a trouvé un port 22 ouvert sur une machine, on peut lancer une attaque avec la commande suivante :

```bash
medusa -h 172.20.10.4 -u root -p Azerty1* -M ssh
```

Les paramètres sont les suivants :

* **medusa** : appel de l'utilitaire medusa
* **-h 172.20.10.4** : cible l'hôte 172.20.10.4
* **-u root** : cible l'utilisateur root
* **-p Azerty1*** : tente d'entrer le mot de passe Azerty1*
* **-M ssh** : utilise le protocole ssh pour tenter la connexion

Ceci tentera de se connecter en ssh à la machine ciblée, avec le mot de passe **Azerty1***.

L'intérêt de Medusa est de fournir, à la place du mot de passe unique _Azerty1*_, un fichier contenant un ensemble de (très) nombreux mots de passe. Medusa effectuera alors des tests à la chaîne (et parallélisés) pour trouver si certains des mots de passe fournis fonctionnent. 

Il faut alors remplacer l'argument **-p** par **-P** et lui passer le chemin vers le fichier contenant les mots de passe. 

Il est également possible de spécifier un argument **-t** suivi d'un nombre, permettant à Medusa de paralléliser (i.e utiliser en même temps plusieurs threads) les processus afin d'obtenir une exécution plus rapide.

Un exemple de commande possible serait alors :

```bash
medusa -h 172.20.10.4 -u root -P motdepasses.txt -M ssh -t 1
```
