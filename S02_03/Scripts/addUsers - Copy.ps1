# Script ajout utilisateurs

# Fonction  pour le formatage des chaînes de caractères
Function Remove-StringSpecialCharacters
{
    Param([string]$String)

    $String -replace '-',''`
            -replace "'",""`
            -replace " ",""
}

# On importe le tableau .csv des utilisateurs
$Data = Import-Csv -Path C:\Users\Administrator\Desktop\billu_users.csv

# Pour chaque utilisateur dans ce tableau :
foreach ($User in $Data) {
    # On récupère le nom
    $Nom = Remove-StringSpecialCharacters -String $User.Nom
    # On récupère le prénom
    $Prenom = Remove-StringSpecialCharacters -String $User.Prenom

    # On définit son OU (DSI ou Employes)
    if ($User.Departement -eq "DSI"){
        $OU = "OU=DSI,OU=Utilisateurs,OU=BillU,DC=BillU,DC=lan"
    }
    else {
        $OU = "OU=Employes,OU=Utilisateurs,OU=BillU,DC=BillU,DC=lan"
    }

    # On définit son mot de passe par défaut
    $Password = ConvertTo-SecureString -AsPlainText Azerty1* -Force

    # On définit son nom de compte au format NomPrénom (ex: MeunierAlan)
    $AccountName = "$Nom$Prenom"
    # Si le nom de compte est trop long, on le raccourcit
    if ($AccountName.length -gt 20){
        $AccountName = "$Nom$Prenom".Substring(0,19)
    }

    # On définit les options pour la commande New-ADUser
    $splat = @{
        Name                    = "$Nom$Prenom"
        SamAccountName          = $AccountName
        ChangePasswordAtLogon   = $True
        Enabled                 = $True         
        AccountPassword         = $Password
        Path                    = $OU
    }

    # On ajoute l'utilisateur à l'AD
    New-ADUser @splat

    # On définit son groupe (i.e le Département de l'entreprise)
    $groupe = $User.Departement
    # On l'ajoute au groupe correspondant
    Add-ADGroupMember -Identity $groupe -Members $AccountName

    # Tu l'ajoutes quelque part par ici
    Set-ADUser -Identity $AccountName -HomeDirectory "\\WINSRVGUI01\DataPartagé\Dossier_Individuel\$AccountName" -HomeDrive "I:"
}
