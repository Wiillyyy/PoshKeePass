#Install-Module -Name PoShKeePass
#================================================================================================#
#Fonction qui affiche le menu de l'accueil
function Show-Menu {

    Clear-host
    Write-Host "========================="
    Write-Host "-------  Accueil  -------"
    Write-Host "========================="

    Write-host "1: Se connecter a sa base de donnees"
    Write-host "2: Creer sa base de donnees"
    Write-host "3: Supprimer sa base de donnees"
    Write-Host "Q: Quitter"
}

#================================================================================================#
#Fonction qui affiche le menu de connexion à la BDD ((( NE MARCHE PAS N'EST PAS UTILISE )))
function Show-MenuLogIn {
 
    Start-ConnexionBDD

    Write-Host "===================================================================="
    Write-Host "-------------- Connexion a la base de donnees KeeRest --------------"
    Write-Host "===================================================================="

    Write-Host "1: Acceder aux mots de passe"
    Write-Host "2: Changer un mot de passe"
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
    elseif ($selection -eq 'Q') {
        Write-Host "Au revoir et à bientôt !"
        return     
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
        Clear-Host
        Write-Output "Ajout de mot de passe.."
                    
        $title = Read-Host -Prompt 'Rentrez le titre, nom du site(Par ex: Google)'
        $id = Read-Host -Prompt 'Rentrez un username/e-mail (Par ex: jawadhebergeur420@gmail.com)'
        $pwdd = Read-Host 'Rentrez un MDP [F O R T]' -AsSecureString
        New-KeePassEntry -DatabaseProfileName $db -Title $title -UserName $id -KeePassPassword $pwdd -KeePassEntryGroupPath $db/General
        Remove-KeePassDatabaseConfiguration -DatabaseProfileName $db
        

    } elseif ($selection -eq '2') {
        Clear-Host
        Write-Host "Vous avez choisis de changer un de vos mots de passe"

    } elseif ($selection -eq '3') {
        Clear-Host
        Write-Host "Vous avez choisis de supprimer un de vos mots de passe"

    }  elseif ($selection -eq '4') {
            Get-KeePassEntry -AsPlainText -DatabaseProfileName $db -KeePassEntryGroupPath $db/General
    
    } elseif ($selection -eq 'R') {
        Show-ScriptMenu
    } else {
        Write-Host ""
        Write-Host "Ce n'est pas une commance valide. Veuillez réssayer !"
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
        Start-Loader
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
    $db = Read-Host "Entrez le nom de votre nouvelle base de donnees "
    if (Test-Path -Path "C:\Users\aymen\Documents\BDDKeePass\$db.kdbx") {
        Write-Host "Cette base de donnee n'existe pas"
        Start-Sleep -s 2
        Show-ScriptMenu
    } else {
        New-Item -Path "C:\Users\aymen\Documents\BDDKeePass\$db.kdbx" -ItemType File
        #Creer un mot de passe
        Write-Host "Connexion a la bdd..."
        Start-Loader
        Show-ScriptMenuLogIn
    }
    
}

function Start-RemoveBDD {
    
    $db = Read-Host "Entrez le nom de la base de donnees que vous voulez supprimer "
    if (Test-Path -Path "C:\Users\aymen\Documents\BDDKeePass\$db.kdbx") {
        $valid = Read-Host "Etes vous sur de vouloir supprimer la basse de donnee $db ? /n Tapez [O] oui [N] non"
        if ($valid -eq 'O') {
            Remove-Path -Path "C:\Users\aymen\Documents\BDDKeePass\$db.kdbx"
            Write-Host "Suppression de la base de donnee en cours..."
            Start-Loader
            Show-ScriptMenu
        } elseif ($valid -eq 'N') {
            Show-ScriptMenu
        } else {
            Write-Host "Ce n'est pas une commance valide. Veuillez réssayer !"
            Start-Sleep -s 2
            return
            exit
        }
    } else {
        Write-Host "Cette base de donnee n'existe pas"
        Start-Sleep -s 2
        Show-ScriptMenu
    }
    #demander le mot de passe de la bdd
}
Show-ScriptMenu