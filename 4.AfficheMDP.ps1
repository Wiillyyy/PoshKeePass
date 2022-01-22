$AMDP = Get-KeePassEntry -AsPlainText -DatabaseProfileName $db -KeePassEntryGroupPath $db/General
Write-Host "=== Listing de la BDD ==="
Write-Output $AMDP | out-host
Write-Host "Appuyez sur entree pour continuer (attention deco. auto 20 secondes)"
Start-Sleep -Seconds 20
Write-Host "========================="
Show-ScriptMenuLogIn