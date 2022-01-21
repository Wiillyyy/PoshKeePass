Clear-Host

$db = Read-Host -Prompt 'Merci de rentrer le nom de votre DB !sensible casse! '
Write-Output "Bonjour et bienvenue sur KeeScript, connexion à votre ddb en cours..."
New-KeePassDatabaseConfiguration -DatabaseProfileName $db -DatabasePath "\\keepass\Keepass\$db.kdbx" -UseMasterKey
Write-Output "Connexion Reussie"
