# Audit de l'infrastructure BillU

## 🪟 Résultats audit AD

## 🐧 Résultats audit serveurs Linux pré-fix

### OpenScap

Les résultats d'audit OpenScap sont contenus dans les fichiers `report_LINSRV0X.html` du dossier **Ressources**. Il est possible de les télécharger puis de les ouvrir avec un navigateur afin de consulter l'audit dans son intégralité.

### Lynis

* **LINSRV02 (mail)** : 1 Warning, 53 suggestions

![Audit Lynis serveur mail](Ressources/lynis_linsrv02.png)

* **LINSRV03 (Zabbix)** : 0 Warning, 44 suggestions

![Audit Lynis serveur Zabbix](Ressources/lynis_linsrv03.png)

* **LINSRV04 (Bastion)** : 0 Warning, 54 suggestions

![Audit Lynis serveur FreePBX](Ressources/lynis_linsrv04.png)

## 🐧 Résultats audit serveurs Linux post-fix

Afin d'améliorer la sécurité de notre infrastructure, nous avons suivi certaines recommandations de nos rapports d'audit. Pour nous assurer que notre infrastructure progresse bien vers plus de sécurité, nous avons ensuite réévalué l'infrastructure avec les mêmes outils.

### OpenScap

Les résultats d'audit OpenScap sont contenus dans les fichiers `report_LINSRV0X_post.html` du dossier **Ressources**. Il est possible de les télécharger puis de les ouvrir avec un navigateur afin de consulter l'audit dans son intégralité.

### Lynis

Le but principal pour Lynis est de nous débarasser sur Warning qui a été trouvé sur le serveur de mail. Certaines autres tâches ont été réalisées et ont pu également réduire le nombre de suggestions.

Il s'agissait pour cela de s'assurer qu'il n'y avait pas d'informations dans le paramètre `smtpd_banner` de la configuration Postfix de notre serveur mail.
