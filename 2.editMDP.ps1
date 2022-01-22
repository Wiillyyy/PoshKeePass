<# Créer un script pour modifier le mot de passe #>
$motdpass = Read-Host -AsSecureString "Entrez votre mot de passe"
$AMDP = Get-KeePassEntry -AsPlainText -DatabaseProfileName $db -KeePassEntryGroupPath $db -MasterKey $motdpass
Clear-Host
Write-Host "=== Listing de la BDD ==="
Write-Output $AMDP | out-host
$title = Read-Host "Tapez le titre que vous souhaitez changer"
$Entry = Get-KeePassEntry -Title "$title" -KeePassEntryGroupPath $db -AsPlainText -DatabaseProfileName $db -MasterKey $motdpass

Write-Host "==! Vous allez maintenant choisir vos valeurs !=="
$newtitle = Read-Host "Nouveau Titre : nom du site (Par ex: Google)"
$newusername = Read-Host "Nouveau username/e-mail (Par ex: totoleboss@gmail.com)"

$motdpass2 = Read-Host -AsSecureString "Reconfirmation du mot de passe"
Update-KeePassEntry -KeePassEntryGroupPath $db -DatabaseProfileName $db -KeePassEntry $Entry -MasterKey $motdpass2 -Title $newtitle -UserName $newusername -KeePassPassword $(New-KeePassPassword -upper -lower -digits -length 20)
Show-ScriptMenuLogIn

