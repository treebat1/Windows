Get-Content modelingupdater_error_20170321.txt -TotalCount 1KB;


Get-Content Subject_Lookup_UpThru20160208.txt -TotalCount 2KB ;


get-content C:\ProgramData\WhereScape\Scheduler\WslSched_PROD.log -Tail 50

get-content C:\ProgramData\WhereScape\Scheduler\WslSched_PROD.log -Tail 50 | Set-Content u:\target\WherescapeLog.txt