$ODCBConnections = Get-OdbcDsn -DSNType "System" | sort Name 

foreach($ODBCConnection in $ODCBConnections){
    $RemoveScript = {Remove-OdbcDsn -InputObject $ODBCConnection}
    Invoke-Command -ComputerName "MPSC-CAR-CHSQL1" -Scriptblock {Remove-OdbcDsn -InputObject $using:ODBCConnection}
    
    $ODBCConnection.name
  
    [System.Collections.ArrayList]$PropertyArray = @()
    foreach ($Prop in $ODBCConnection.PropertyValue) {
        if ($Prop.Substring($Prop.length - 1) -ne "="){
            $t = $PropertyArray.Add($Prop)
        }
    }

    invoke-command -computername "MPSC-CAR-CHSQL1" -Scriptblock {Add-OdbcDsn -Name $using:ODBCConnection.name -DriverName $using:ODBCConnection.driverName -DsnType $using:ODBCConnection.DsnType -Platform $using:ODBCConnection.Platform -SetPropertyValue $using:PropertyArray }
} 
