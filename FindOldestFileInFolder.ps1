$FileDate = (Get-Date -Format g)
$path = "D:\SQLAudit"
Get-ChildItem -Path $path -Recurse | ForEach-Object {
if ($_.LastWriteTime -lt $FileDate -and -not $_.PSIsContainer) {
$FileDate = $_.LastWriteTime
$OldFile = $_.FullName
}
}
Write-Host 'The oldest file on the system is: ' $OldFile
$FileDate