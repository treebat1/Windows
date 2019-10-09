[string]$sourceDirectory  = "C:\Source\*"
[string]$destinationDirectory = "C:\Destination\"
Copy-item -Force -Recurse -Verbose $sourceDirectory -Destination $destinationDirectory