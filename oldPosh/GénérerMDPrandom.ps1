Write-Output "Ajout de mot de passe automatique"

$title = Read-Host -Prompt 'Rentrez le titre, nom du site(Par ex: Google)'
$id = Read-Host -Prompt 'Rentrez un username/e-mail (Par ex: jawad74@gmail.com)'

$password = New-KeePassPassword -UpperCase -LowerCase -Digits -SpecialCharacters -Length 10
New-KeePassEntry -DatabaseProfileName $db -Title $title -UserName $id -KeePassPassword $password -KeePassEntryGroupPath $db/General