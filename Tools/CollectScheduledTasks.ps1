<#
Powershell script to 
- collect all scheduled tasks which have run on an environment, nicely formatted into a table.
- Collect Top 20 processes by CPU Runtime
The contents will be saved into a text file.

The results will be saved inside the Jenkins TestResults folder as ScheduledTasks.log

In Jenkinsfile you can call this powershell script via (batch command)
		powershell -file Tools/CollectScheduledTasks.ps1
#>

# Get Full Path
$logPath = (Get-Item -Path '.\' -Verbose).FullName + '\\Out\\TestResults\\ScheduledTasks.log'

$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path $logpath -append
# Powershell scripts to get scheduled task info
# Get scheduled task information ordered by last run time
Get-ScheduledTask | Get-ScheduledTaskInfo | Sort-Object LastRunTime | Select-Object -Property LastRunTime, TaskName, TaskPath | Format-Table LastRunTime,TaskName,TaskPath -AutoSize | Out-String -Width 500
# Get CPU information on whats running, get top 20 tasks based on CPU time
Get-Process | Sort CPU -descending | Select -first 20 -Property Name, ID, PriorityClass, WorkingSet, PagedMemorySize, TotalProcessorTime | Format-Table -AutoSize | Out-String -Width 500


# Get all scheduled tasks which ran in the last 2 hours. Lists duration of task execution
# Collects event logs for 200 (task started) and 201 (task completed), this provides the Start
# and End of a scheduled task and calculates Duration
$endDate = Get-Date
$startDate = (Get-Date).AddHours(-2)

Get-WinEvent -FilterHashtable @{
    'LogName'   = 'Microsoft-Windows-TaskScheduler/Operational'
    'ID'        = 200, 201
    'StartTime' = $startDate
    'EndTime'   = $endDate
}   | Group-Object ActivityID | ForEach-Object {
    $start = $_.Group |
             Where-Object { $_.Id -eq 200 } |
             Select-Object -Expand TimeCreated -First 1
    $end   = $_.Group |
             Where-Object { $_.Id -eq 201 } |
             Select-Object -Expand TimeCreated -First 1

    New-Object -Type PSObject -Property @{
        'TaskName'  = $_.Group[0].Properties[0].Value
        'StartTime' = $start
        'Duration'  = ($end - $start).TotalSeconds
    }
} | Out-String -Width 500

Stop-Transcript