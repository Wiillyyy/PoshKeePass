$motdpass = Read-Host -AsSecureString "Entrez votre mot de passe"

$AMDP = Get-KeePassEntry -AsPlainText -DatabaseProfileName $db -KeePassEntryGroupPath $db -MasterKey $motdpass
Write-Host "=== Listing de la BDD ==="
Write-Output $AMDP | out-host
$valid = Read-Host "Appuyez sur 'R' pour revenir au menu"
if ($valid -eq 'R') {
    Show-ScriptMenuLogIn
}