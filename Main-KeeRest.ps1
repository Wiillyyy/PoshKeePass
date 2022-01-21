Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
Remove-KeePassDatabaseConfiguration -DatabaseProfileName $db -Confirm:$false


$rnd = Get-Random -Minimum 2 -Maximum 5

function Show-Menu {
   param (
       [string]$Titre = 'KeeRest'
   )
    Clear-host
    Write-Host "=============== $Titre ==============="

    Write-host "1: Se connecter a une Base de Données"
    Write-host "2: Créer une Base de Données"
    Write-Host "Q: Quitter"
}


<# ======================================================== #> 

function Show-MenuKeeRest {
    param (
        [string]$Titre = 'Menu KeeRest'
    )
    Clear-Host
    Write-Host "=============== $Titre ==============="

    Write-Host "1: Lister les mots de passe"
    Write-Host "2: Ajouter un mot de passe"
    Write-Host "3: Supprimer un mot de passe"
    Write-Host "Q: Quitter"
}

<# ======================================================== #> 

function Show-MenuMDP {
    param (
        [string]$Titre = 'Ajouter Mot de Passe'
    )
    Clear-Host
    Write-Host "=============== $Titre ==============="

    Write-Host "1: Ajouter un mot de passe manuellement"
    Write-Host "2: Ajouter un mot de passe généré aléatoirement"
    Write-Host "Q: Quitter"
}



<# ======================================================== #> 

Show-Menu -Titre 'Acceuil'
$selection = Read-Host "Faites un choix"
switch ($selection) {
    '1' {   

            $db = Read-Host -Prompt 'Merci de rentrer le nom de votre DB !sensible casse! '
            Write-Output "Bonjour et bienvenue sur KeeScript, connexion à votre ddb en cours..."
            Start-Sleep -s $rnd
            New-KeePassDatabaseConfiguration -DatabaseProfileName $db -DatabasePath "\\keepass\Keepass\$db.kdbx" -UseMasterKey
            Write-Output "Connexion Reussie !" 
            Start-Sleep -s 3


            Show-MenuKeeRest -Titre 'Menu KeeRest'
            Write-Output "==| Connecté à : $db |=="
            $selection = Read-Host "Fais un choix"
            switch ($selection) {
                '1' {
                    Get-KeePassEntry -AsPlainText -DatabaseProfileName $db -KeePassEntryGroupPath $db/General
                }
                '2' {
                    Show-MenuMDP -Titre 'Ajouter Mot de Passe'
                    Write-Output "==| Connecté à : $db |=="
                    $selection = Read-Host "Fais un choix"
                    switch ($selection) {
                         '1' {
                            Write-Output "Ajout de mot de passe"
                    
                            $title = Read-Host -Prompt 'Rentrez le titre, nom du site(Par ex: Google)'
                            $id = Read-Host -Prompt 'Rentrez un username/e-mail (Par ex: jawadhebergeur420@gmail.com)'
                            $pwdd = Read-Host 'Rentrez un MDP [F O R T]' -AsSecureString
                            New-KeePassEntry -DatabaseProfileName $db -Title $title -UserName $id -KeePassPassword $pwdd -KeePassEntryGroupPath $db/General
                            Remove-KeePassDatabaseConfiguration -DatabaseProfileName $db
                        }
                         '2' {
                            Write-Output "Ajout de mot de passe automatique"

                            $title = Read-Host -Prompt 'Rentrez le titre, nom du site(Par ex: Google)'
                            $id = Read-Host -Prompt 'Rentrez un username/e-mail (Par ex: jawad74@gmail.com)'
                            $password = New-KeePassPassword -UpperCase -LowerCase -Digits -SpecialCharacters -Length 10
                            New-KeePassEntry -DatabaseProfileName $db -Title $title -UserName $id -KeePassPassword $password -KeePassEntryGroupPath $db/General
                            Remove-KeePassDatabaseConfiguration -DatabaseProfileName $db
                        }
                         'Q' {
                        Write-Host "Vous avez fais le choix 1"
                        }
                    }
                }
                '3' {

                }
                'Q' {
                    Write-Host "Déconnexion de la DB réussie"
                    Remove-KeePassDatabaseConfiguration -DatabaseProfileName $db -Confirm:$false
                    return
                }
            }
    }
    '2' {
        $dbName = Read-Host "Veuillez entrer le nom de votre Base de Donnée"

        New-KeePassDatabaseConfiguration -DatabaseProfileName $dbName -DatabasePath "\\keepass\Keepass\$db.kdbx" -KeyPath "C:\dev\git\PSKeePass\Test\Includes\AuthenticationDatabases\KeyFile.key"
    }
    'Q'{
        return
    }
}