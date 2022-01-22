<# Créer un script pour modifier le mot de passe #>

Write-Output "Editer un mot de passe..."

$AMDP = Get-KeePassEntry -AsPlainText -DatabaseProfileName $db -KeePassEntryGroupPath $db/General
Write-Host "=== Listing de la BDD ==="
Write-Output $AMDP | out-host

$KeePassEntryObject = Read-Host -Prompt 'Veuillez choisir l\'ID de l\'entrée à modifier'

Update-KeePassEntry -KeePassEntry $KeePassEntryObject -DatabaseProfileName db1 -KeePassEntryGroupPath 'General/TestAccounts' 
-Title 'Test Title' -UserName 'Domain\svcAccount' -KeePassPassword $(New-KeePassPassword -upper -lower -digits -length 20)


