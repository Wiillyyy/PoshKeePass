Write-Output "Ajout de mot de passe"
$title = Read-Host -Prompt 'Rentrez le titre, nom du site(Par ex: Google)'
$id = Read-Host -Prompt 'Rentrez un username/e-mail (Par ex: jawad74@gmail.com)'
$pwdd = Read-Host -Prompt 'Rentrez un MDP [F O R T]'
New-KeePassEntry -DatabaseProfileName $db -Title $title -UserName $id -KeePassPassword $pwdd -KeePassEntryGroupPath $db/General
