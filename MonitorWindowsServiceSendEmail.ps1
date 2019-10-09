try {
$service = Get-Service "DATAMARTDEV" -ComputerName "chdc-car-thsql2"
}
catch [system.exception] {
    $_ | fl * -force >> d:\Scripts\MonitorWherescapeSchedulerService_out.txt
}
if ($Service.Status -ne "Running") { 
    $Body = "Wherescape Scheduler Service $($service.name) IS NOT RUNNING" 
    $Subject  = "FAILURE - Wherescape Scheduler Service Monitor"
} else { 
    $Body = "Wherescape Scheduler Service $($service.name) is running " 
    $Subject = "SUCCESS - Wherescape Scheduler Service Monitor"
}
$To = "christopher.riley@unionbank"
Send-MailMessage -From 'DoNotReply@unionbank.com' -To $To -Subject $Subject -Body $Body  -SmtpServer 'smtp.uboc.com' 




$service = Get-Service "DATAMARTDEV" -ComputerName "chdc-car-thsql2"
if ($Service.Status -ne "Running") { 
    $Body = "Wherescape Scheduler Service $($service.name) IS NOT RUNNING" 
    $Subject  = "FAILURE - Wherescape Scheduler Service Monitor"
} else { 
    $Body = "Wherescape Scheduler Service $($service.name) is running " 
    $Subject = "SUCCESS - Wherescape Scheduler Service Monitor"
}
$To = "christopher.riley@unionbank"
Send-MailMessage -From 'DoNotReply@unionbank.com' -To $To -Subject $Subject -Body $Body  -SmtpServer 'smtp.uboc.com' 