Get-WmiObject Win32_Processor


$property = "systemname","maxclockspeed","addressWidth",

            "numberOfCores", "NumberOfLogicalProcessors"

Get-WmiObject -class win32_processor -Property  $property |

Select-Object -Property $property 


$InstalledRAM = Get-WmiObject -Class Win32_ComputerSystem
[Math]::Round(($InstalledRAM.TotalPhysicalMemory/ 1GB),2)
