function Clear-UserRecycleBin ($domain, $username, $drive) {
    $sidObj = New-Object System.Security.Principal.NTAccount("$domain", "$username") 
    $sid = $sidObj.Translate([System.Security.Principal.SecurityIdentifier]).Value
    if ( ! $sid ) { Write-Output "SID not found" ; break ; }
    if ( ! $drive ) { $drive = 'C:\' }

    $RecycleBinPaths = @('\$Recycle.Bin\','\RECYCLER')
    
    foreach ($path in $RecycleBinPaths) {
        if (Test-Path $path) {
            Remove-Item -Force "$drive\$path\$sid\*"
        }
    }
}