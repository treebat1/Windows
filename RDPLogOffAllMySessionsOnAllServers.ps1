Import-Module ServerManager
#Add-WindowsFeature RSAT-AD-PowerShell

#Get your list of servers that you may ever log in to and save them to a TXT file (ie, servers.txt), then import that list via:
$serverList = Get-Content -Path “C:\servers.txt”

$ServerList

#The username to check against each server
$username = "aub70848"

#Get all Servers' names in the Domain that are not enabled.
#$serverList=(Get-ADComputer -Filter ('(OperatingSystem -Like "*SERVER*") -AND (Enabled -Eq "True")') | select-object Name).Name

#Write-Host "Pre-ForEach Loop"

#Start a foreach cycle which will go through each Server in the ServerList
foreach ($Server in $serverList)
                {
        Write-Host $Server
                                #Ping the Server
                                $ping = Test-Connection $Server -Count 1 -EA Silentlycontinue

                                #If Ping is successfull then keep going
                                if($ping)
                                {
                                                #Get server session ID if $username is logged on - cmd /c is needed for the 2>NUL to avoid quser to write "No User exists for *" when nobody is logged on a server.
                                                $sessionID = ((cmd /c quser /server:$server "2>NUL"| ? { $_ -match $username }) -split ' +')[2]
            
            Write-Host "Session ID ="$sessionID

            #Write-Host "After Ping, pre-session check"
                                                
                                                #If sessionsID exists, write it to console and to the output file but exclude any live RDP connection or console (ie: rdp-tcp#1)
                                                                If ($sessionID -AND $sessionID -NotLike "*rdp*" -AND $sessionID -ne "console")
                                                                {
                                                                                #Write to console
                                                                                #Write-Host "$($Username) is logged on $($Server) with ID: $($sessionID)"
                                                                                #Write into $csvOutput
                                                                                #             Add-Content -Path $csvOutput -Value "$($Server),$($sessionID)"
                                                                                Write-Host "$($_.Hostname)"
                                                                                #Log off user from server based on server ID
                                                                                #logoff $SessionID /server:$_.Hostname
                    reset session $SessionID /server:$Server
                                                                }
                                }
                }
