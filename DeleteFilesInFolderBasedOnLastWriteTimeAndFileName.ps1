$limit = (Get-Date).AddDays(-1)
$path = "D:\Wherescape\DataMartDEV\Work"

# Delete files older than the $limit.
Get-ChildItem -Path $path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.LastWriteTime -lt $limit -and  $_.Name -like "*.dat" } | Remove-Item -Force