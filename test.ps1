Clear-Host

$db = Read-Host -Prompt 'Merci de rentrer le nom de votre DB !sensible casse! '
Write-Output "Bonjour et bienvenue sur KeeScript, connexion à votre ddb en cours..."
New-KeePassDatabaseConfiguration -DatabaseProfileName $db -DatabasePath "\\keepass\Keepass\$db.kdbx" -UseMasterKey
Write-Output "Connexion Reussie"

Write-Output "Ajout de mot de passe..."
            
$title = Read-Host -Prompt 'Rentrez le titre, nom du site (Par ex: Google)'
$id = Read-Host -Prompt 'Rentrez un username/e-mail (Par ex: jawadhebergeur420@gmail.com)'


$valid = Read-Host "Voulez vous que le MDP soit aleatoire ? Tapez [O]ui [N]on"
        if ($valid -eq 'O') {
            $password = New-KeePassPassword -UpperCase -LowerCase -Digits -SpecialCharacters -Length 20
            New-KeePassEntry -DatabaseProfileName $db -Title $title -UserName $id -KeePassPassword $password -KeePassEntryGroupPath $db/General
            Write-Host "Le MDP est == $password == notez le bien !" | out-host
            Start-Sleep -Seconds 17
            Show-ScriptMenuLogIn


        } elseif ($valid -eq 'N') {
            $pwdd = Read-Host 'Rentrez un MDP [F O R T]' -AsSecureString
            New-KeePassEntry -DatabaseProfileName $db -Title $title -UserName $id -KeePassPassword $pwdd -KeePassEntryGroupPath $db/General
            Write-Host "Le MDP a ete ajoute !" | out-host
            Start-Sleep -Seconds 7
            Show-ScriptMenuLogIn


        } else {
            Write-Host "Ce n'est pas une commande valide. Veuillez réssayer !"
            Start-Sleep -s 2
            return
            exit
        }
