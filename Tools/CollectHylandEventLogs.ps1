<#
Powershell script to 
- collect all event logs.
- Collect Top 20 event logs
The contents will be saved into a text file.

The results will be saved inside the Jenkins TestResults folder as OnBaseEventLogs.log

Note, you can customize the extract to only report on Errors by adding "-EntryType Error" into the Get-EventLog text

In Jenkinsfile you can call this powershell script via (batch command)
		powershell -file Tools/CollectHylandEventLogs.ps1
#>

# Get Full Path
$logPath = (Get-Item -Path '.\' -Verbose).FullName + '\\Out\\TestResults\\OnBaseEventLogs.txt'

$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
# Powershell scripts to get OnBase Event Log info
Get-EventLog -LogName "OnBase Log" -Newest 30 | select TimeGenerated,Type,Message | Format-Table TimeGenerated,Type,Message -AutoSize | Out-String -Width 500 | Out-File -FilePath $logPath

