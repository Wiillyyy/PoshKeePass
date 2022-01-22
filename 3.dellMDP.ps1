$motdpass = Read-Host -AsSecureString "Entrez votre mot de passe"
$AMDP = Get-KeePassEntry -AsPlainText -DatabaseProfileName $db -KeePassEntryGroupPath $db -MasterKey $motdpass

Write-Host "=== Listing de la BDD ==="
Write-Output $AMDP | out-host
$title = Read-Host "Tapez le titre que vous souhaitez supprimer"

$Entry = Get-KeePassEntry -Title "$title" -KeePassEntryGroupPath $db -AsPlainText -DatabaseProfileName $db -MasterKey $motdpass

$motdpass2 = Read-Host -AsSecureString "Reconfirmation du mot de passe"
Remove-KeePassEntry -NoRecycle -DatabaseProfileName $db -KeePassEntry $Entry -MasterKey $motdpass2 -Confirm:$true

Write-Host "=== Entree supprimee ==="
Start-Sleep -Seconds 4
Show-ScriptMenuLogIn