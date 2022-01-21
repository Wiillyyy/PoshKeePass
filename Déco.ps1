#$db = Read-Host "Nom db ?"
#Write-Host "Déconnexion de la DB réussie"
Remove-KeePassDatabaseConfiguration -DatabaseProfileName $db -Confirm:$false