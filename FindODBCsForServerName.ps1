$ServerToSearch = 'chdc-sql07'

Get-OdbcDsn -DsnType System | Where-Object {$_.PropertyValue -like "*$ServerToSearch*"} 
