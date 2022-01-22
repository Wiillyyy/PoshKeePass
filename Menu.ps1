#Install-Module -Name PoShKeePass

function Show-MenuList {

    Clear-host
    Write-Host "=========================" | out-host
    Write-Host "----  Liste des BDD  ----" | out-host
    Write-Host "=========================" | out-host
    Get-ChildItem -Path "\\keepass\Keepass" -Recurse | Where-Object {$_.Name -like '*.kdbx'}
    $valid = Read-Host "Appuyez sur 'R' pour revenir au menu"
        if ($valid -eq 'R') {
            Show-ScriptMenu
        }
}

#================================================================================================#
#Fonction qui affiche le menu de l'accueil
function Show-Menu {

    Clear-host
    Write-Host "=========================" | out-host
    Write-Host "-------  Accueil  -------" | out-host
    Write-Host "=========================" | out-host

    Write-host "1: Se connecter a sa base de donnees"
    Write-host "2: Creer sa base de donnees"
    Write-host "3: Supprimer sa base de donnees"
    Write-host "4: Lister les bases de donnees"
    Write-Host "Q: Quitter"
}

#================================================================================================#
#Fonction qui affiche le menu de connexion à la BDD ((( NE MARCHE PAS N'EST PAS UTILISE )))
function Show-MenuLogIn {
 
    Start-ConnexionBDD

    Write-Host "====================================================================" | out-host
    Write-Host "-------------- Menu de la base de donnees KeeRest --------------" | out-host
    Write-Host "====================================================================" | out-host

    Write-Host "1: Acceder aux mots de passe"
    Write-Host "2: Modifier un mot de passe"
    Write-Host "3: Supprimer un mot de passe"
    Write-Host "R: Retour"
        
}

#================================================================================================#
#Fonction qui affiche le menu de l'accueil
function Show-MenuSignIn {
    
    Clear-Host
    Write-Host "===================================================================="
    Write-Host "-------------- Creation de la base de donnees KeeRest --------------"
    Write-Host "===================================================================="

    Start-CreateBDD
}

#================================================================================================#
#Fonction qui affiche le menu de l'accueil
function Show-MenuRemove {
    
    Clear-Host
    Write-Host "======================================================================"
    Write-Host "-------------- Suppresion de la base de donnees KeeRest --------------"
    Write-Host "======================================================================"

    Start-RemoveBDD
}

#================================================================================================#
#Script menu interactif pour l'accueil
function Show-ScriptMenu {
    Show-Menu
    $selection = Read-Host "Faites un choix"
    if ($selection -eq '1') {

        Show-MenuLogIn
    }
    elseif ($selection -eq '2') {

        Show-MenuSignIn
    }
    elseif ($selection -eq '3') {

        Show-MenuRemove
    }
    elseif ($selection -eq '4') {

        Show-MenuList
    }
    elseif ($selection -eq 'Q') {
        Write-Host "Au revoir et a bientot !"
        exit(1)    
    }
    else {
        Write-Host "Ce n'est pas une commande valide. Veuillez reessayer !"
        Start-Sleep -s 2
        Show-ScriptMenu
    }
}

#================================================================================================#
#Script menu interactif pour le menu Log In 
function Show-ScriptMenuLogIn {

    Clear-host

    Write-Host "===================================================================="
    Write-Host "-------------- Connexion a la base de donnees KeeRest --------------"
    Write-Host "===================================================================="

    Write-Host "Bienvenue sur $db"

    Write-Host "1: Ajouter un nouveau mot de passe"
    Write-Host "2: Changer un mot de passe"
    Write-Host "3: Supprimer un mot de passe"
    Write-Host "4: Afficher vos mots de passe"
    Write-Host "R: Retour"

    $selection = Read-Host "Faites un choix"


    if ($selection -eq '1') {
        ./1.addMDP.ps1
        
    } elseif ($selection -eq '2') {
        ./2.editMDP.ps1

    } elseif ($selection -eq '3') {
        ./3.dellMDP.ps1

    }  elseif ($selection -eq '4') {
        Clear-Host
        ./4.AfficheMDP.ps1
    
    } elseif ($selection -eq 'R') {
        Show-ScriptMenu
    } else {
        Write-Host ""
        Write-Host "Ce n'est pas une commande valide. Veuillez réssayer !"
        Start-Sleep -s 2
        Show-ScriptMenuLogIn
    }
}

#================================================================================================#
#Script menu interactif pour le menu Sign In 
function Show-ScriptMenuSignIn {
    do {
        Show-MenuSignIn
        $selection = Read-Host "Faites un choix"
        switch -CaseSensitive ($selection) {
            '1' {
                
                }
            }
    } until ($selection -eq 'R')
}

#================================================================================================#
#Script menu interactif pour le menu Remove 
function Show-ScriptMenuRemove {
    do {
        Show-MenuRemove
        $selection = Read-Host "Faites un choix"
        switch -CaseSensitive ($selection) {
            '1' {
                 
            }
        }
    } until ($selection -eq 'R')
}

#================================================================================================#
#Fonction chargement...

function Start-Loader {
    for ($i = 1; $i -le 100; $i++ ) {
        Write-Progress -Activity "Progession de la connexion" -Status "$i% Complete:" -PercentComplete $i
        Start-Sleep -Milliseconds 50
    }
}
#================================================================================================#
#Fonction connexion BDD
function Start-ConnexionBDD {
    $db = Read-Host "Entrez le nom de votre base de donnees"
    if (Test-Path -Path "\\keepass\Keepass\$db.kdbx") {
        ./Deco.ps1
        New-KeePassDatabaseConfiguration -DatabaseProfileName $db -DatabasePath "\\keepass\Keepass\$db.kdbx" -UseMasterKey
        Write-Host "Connexion a la bdd..."
        <# Start-Loader #>
        Show-ScriptMenuLogIn
    } else {
        Write-Host "Cette base de donnee n'existe pas"
        Start-Sleep -s 2
        Show-ScriptMenu
    }
}

#================================================================================================#
#Fonction connexion BDD

function Start-CreateBDD  {
    $db = Read-Host "Entrez le nom de votre nouvelle base de donnees"
    if (Test-Path -Path "\\Keepass\keepass\$db.kdbx") {
        Write-Host "Cette base de donnee existe deja"
        Start-Sleep -s 2
        Show-ScriptMenu
    } else {
        Write-Host "==> Veuillez saisir le mot de passe de la base de donnees <== "
        New-KeePassDatabase -DatabasePath "\\Keepass\keepass\$db.kdbx" -MasterKey $db
        Write-Host "Votre BDD a ete ajoute, vous pouvez vous y connecter a ajouter vos mdp !"
        Start-Sleep -s 6
        Show-ScriptMenu
    }
    
}

function Start-RemoveBDD {

Clear-Host
Write-Host "=== Listing des BDD ==="
Get-ChildItem -Path "\\keepass\Keepass" -Recurse | Where-Object {$_.Name -like '*.kdbx'}
    
    $db = Read-Host "Entrez le nom de la base de donnees que vous voulez supprimer (sans .kbdx) "
    if (Test-Path -Path "\\keepass\Keepass\$db.kdbx") {
        $valid = Read-Host "ATTENTION TOUTE DONNEE SERA PERDUE, Etes vous VRAIMENT sur de vouloir supprimer la bdd $db ? Tapez [O]ui / [N]on"
        if ($valid -eq 'O') {
            Remove-Item -Force "\\keepass\Keepass\$db.kdbx"
            Write-Host "Suppression de la base de donnee en cours..."
            Start-Loader
            Show-ScriptMenu
        } elseif ($valid -eq 'N') {
            Show-ScriptMenu
        } else {
            Write-Host "Ce n'est pas une commande valide. Veuillez réssayer !"
            Start-Sleep -s 2
            return
            exit
        }
    } else {
        Write-Host "Cette base de donnee n'existe pas"
        Start-Sleep -s 2
        Show-ScriptMenu
    }
}
Show-ScriptMenu

