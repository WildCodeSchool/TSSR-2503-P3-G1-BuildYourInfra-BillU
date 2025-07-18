# On importe le tableau .csv des utilisateurs
$Data = Import-Csv -Path C:\Users\Administrator\Desktop\billu_users.csv

# Pour chaque utilisateur dans ce tableau :
foreach ($User in $Data) {
    New-Item -ItemType Directory