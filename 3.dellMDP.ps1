$AMDP = Get-KeePassEntry -AsPlainText -DatabaseProfileName $db -KeePassEntryGroupPath $db/General
Write-Host "=== Listing de la BDD ==="
Write-Output $AMDP | out-host
Write-Host "=== Selectionner le TITRE pour choisir une entree ==="

$KeePassEntryObject = Read-Host -Prompt "Quel est le titre de l'entree ?"

Remove-KeePassEntry -DatabaseProfileName $db -KeePassEntry $KeePassEntryObject -Confirm:$false

Write-Host "=== Entree supprimee ==="
Start-Sleep -Seconds 10
Show-ScriptMenuLogInfo