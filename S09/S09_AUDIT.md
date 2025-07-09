# Audit de l'infrastructure BillU

## Serveurs Linux

## OpenScap

L'installation de OpenScap se fait à l'aide de la commande suivante :

```apt install openscap-scanner```

Une fois l'installation effectuée, nous pouvons générer un rapport d'audit à l'aide des commandes suivantes selon la distribution du serveur.

Peu importe l'OS, les résultats seront dans un fichier HTML consultable avec navigateur.

### Debian

```oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_anssi_bp29_minimal --report report.html ssg-debian12-ds.xml```

### Ubuntu

oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_cis_level1_workstation --results-arf results.xml --report report.html ssg-OS-ds.xml

## Lynis

Peu importe la distribution, l'Audit via Lynis est réalisable à l'aide de la commande suivante :

```sudo lynis audit system```

# Résultats de l'Audit
