<#  
.SYNOPSIS  
    Searches Exchange message tracking logs
 
.EXAMPLE
    .\Email-Report.ps1 -Recipient user@domain.com -StartDate 1/1/2012 -EndDate 1/31/2012

.DESCRIPTION
    Will find all HUB/CAS servers, search message tracking logs for a given date range,
    then output "email_report.csv" with the results to the desktop.
#>

Param(
# Search for items to this e-mail address
[Parameter(Mandatory=$true)][String] $Recipient,
# Start date
[Parameter(Mandatory=$true)][String] $StartDate,
# End date
[Parameter(Mandatory=$true)][String] $EndDate
)

# Default output path is desktop
$outputDir  = [Environment]::GetFolderPath("Desktop") 
$outputName = "email_report.csv"


# Append time to start/end dates to include entire day
$StartDate += " 12:00:00 AM"
$EndDate   += " 11:59:59 PM"

try{

Write-Host "Loading Exchange Snap-In"
Add-PSSnapin Microsoft.Exchange.Management.PowerShell.E2010 -ea SilentlyContinue

Write-Host "Searching Hub/CAS Servers"
$serverList = Get-ExchangeServer | Where {
    ($_.ServerRole -like "*Hub*")
    }                                   

$msgTrackLogs = New-Object System.Collections.Generic.List[object]

# Loop through servers and search message tracking logs
foreach ($server in $serverList) {
Get-MessageTrackingLog -Recipients:$Recipient -Server "$server" -Start "$StartDate" -End "$EndDate" -EventID "RECEIVE" -ResultSize UNLIMITED | % { $msgTrackLogs.Add($_) }
Get-MessageTrackingLog -Sender:$Recipient -Server "$server" -Start "$StartDate" -End "$EndDate" -EventID "RECEIVE" -ResultSize UNLIMITED | % { $msgTrackLogs.Add($_) }
}

# Only select timestamp, sender, and subject
$msgTrackLogs | Sort-Object -Property Timestamp `
              | Select Timestamp,Sender,MessageSubject -Unique `
              | Export-Csv "$outputDir\$outputName" -NoTypeInformation
    } catch {}         
if ((Read-Host "File output to: $outputDir\$outputName Open? (y/N)") -ieq "y") {
    Invoke-Item $outputDir\$outputName
    }