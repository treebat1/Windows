[string]$sourceFile  = "\\uboc-mpsc-iis1\ftp\cbis\ORS_OLC_test\test_MASTER.TXT"
[string]$destinationDirectory = "C:\"
Copy-item -Force -Verbose $sourceFile -Destination $destinationDirectory