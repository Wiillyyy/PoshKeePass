Clear-Host
Write-Output "Ajout de mot de passe..."
            
$title = Read-Host -Prompt 'Rentrez le titre, nom du site (Par ex: Google)'
$id = Read-Host -Prompt 'Rentrez un username/e-mail (Par ex: jawadhebergeur420@gmail.com)'


$valid = Read-Host "Voulez vous que le MDP soit aleatoire ? Tapez [O]ui [N]on"
        if ($valid -eq 'O') {
            $password = New-KeePassPassword -UpperCase -LowerCase -Digits -SpecialCharacters -Length 20
            $mdpbdd = Read-Host "Veuillez saisir le MDP de vote coffre fort" -AsSecureString
            New-KeePassEntry -DatabaseProfileName $db -Title $title -UserName $id -KeePassPassword $password -KeePassEntryGroupPath $db -MasterKey $mdpbdd
            Write-Host "L'entree a ete ajoute !" | out-host
            Start-Sleep -Seconds 5
            Show-ScriptMenuLogIn


        } elseif ($valid -eq 'N') {
            $pwdd = Read-Host 'Rentrez un MDP [F O R T]' -AsSecureString
            $mdpbdd = Read-Host "Veuillez saisir le MDP de vote coffre fort" -AsSecureString
            New-KeePassEntry -DatabaseProfileName $db -Title $title -UserName $id -KeePassPassword $pwdd -KeePassEntryGroupPath $db -MasterKey $mdpbdd
            Write-Host "L'entree a ete ajoute !" | out-host
            Start-Sleep -Seconds 5
            Show-ScriptMenuLogIn


        } else {
            Write-Host "Ce n'est pas une commande valide. Veuillez réssayer !"
            Start-Sleep -s 2
            Show-ScriptMenuLogIn
        }