# 🖥️ Guide d'utilisation Sprint 10

Kali Linux et ParrotOS embarquent de nombreux outils utiles pour les pentesters (ou les pirates). Il n'est donc pas nécessaire d'installer de nombreux outils une fois une version de Kali déployée dans notre infrastructure.

## 📍 Utilisation de nmap

nmap a pour objectif de scanner les ports des hôtes ou réseaux cibles. Il permet de détecter quels ports sont ouverts et donc quels ports il est possible de cibler lors d'une attaque.

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
