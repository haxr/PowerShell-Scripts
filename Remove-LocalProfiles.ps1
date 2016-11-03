<#
.Synopsis
   Scans a local Windows system for non-system profiles to delete
   Removes profiles via Win32_UserProfile.Delete() method
#>

$deleteProfiles = Get-WmiObject Win32_UserProfile | ? {
    $_.LocalPath -notlike "C:\Windows*" 
        } | Select PSComputerName, LocalPath, LastUseTime, SID | Out-GridView -PassThru -Title "Select profiles to delete"
if ($deleteProfiles) {
    Write-Output "The following profiles will be deleted:"
    $deleteProfiles | % { $_.LocalPath }
    Read-Host "Press ENTER to delete, or CTRL+C to exit"
    Get-WmiObject Win32_UserProfile | ? { ($_.SID -in $deleteProfiles.SID) -and ($_.LocalPath -in $deleteProfiles.LocalPath) } | % { $_.Delete() }
} else {
    Write-Output "No profiles selected"
}
