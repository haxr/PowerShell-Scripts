<#
.SYNOPSIS
    Parse an IIS log file based on date/time and group by requests per minute
#>

$iisLog = Read-Host "Path to IIS Log File"

$iisArray = New-Object System.Collections.Generic.List[object]

switch -Regex -File $iisLog {
    #"^2016-10-01 02:*" { Write-Output $_; $iisArray.Add(($_.split(' ')))} # All lines starting with specific date/time
    #"^2016-10-01 03:*" { Write-Output $_; $iisArray.Add(($_.split(' ')))}
    "^[^#]" { $iisArray.Add(($_.split(' '))) } # All lines not starting with #
}

#$iisArray | Select @{N="IPAddress";E={$_[8]}} | Group-Object "IPAddress" | Sort-Object Count -Descending | Select Name, Count -First 50
$iisArray | Select @{N='Hour';E={$_[1].Split(':')[0]}}, @{N='Minute';E={$_[1].Split(':')[1]}} | Group-Object Hour,Minute | Select Count,Name
