# Delete any empty directories left behind after deleting the old files.
# Get-ChildItem -Path $path -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse


$limit = (Get-Date).AddDays(-7)
$path = "P:\FileExtracts\Inbound\GreenplumImport"

# Delete files older than the $limit.
Get-ChildItem -Path $path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item -Force



$limit = (Get-Date).AddDays(-7)
$path = "P:\FileExtracts\Inbound\GreenplumImport"

# Delete files older than the $limit.
Get-ChildItem -Path $path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.LastWriteTime -lt $limit -and -Like $_.Name "*.dat" } | Remove-Item -Force


