$productNames = @("*WebEx*")
$UninstallKeys = @('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
                    'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall',
                    'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'
                    )
$uninstallKeys = foreach ($key in (Get-ChildItem $UninstallKeys) ) {

    foreach ($product in $productNames) {
        if ($key.GetValue("DisplayName") -like "$product") {
            [pscustomobject]@{
                KeyName = $key.Name.split('\')[-1];
                DisplayName = $key.GetValue("DisplayName");
                UninstallString = $key.GetValue("UninstallString");
                Publisher = $key.GetValue("Publisher");
            }
        }
    }
}

foreach ($key in $uninstallkeys) {
    $uninstallString = $key.UninstallString
        if ($uninstallString.StartsWith('MsiExec.exe')) {
            $uninstallString = $uninstallString.replace('/I','/X') + ' /qb- /quiet /passive /norestart'
        } else {
            $uninstallString += ' /quiet /silent'
        }
    Write-Output "Uninstalling $($UninstallKeys.DisplayName)"
    # Uncomment to run the uninstall
    #& cmd /c $uninstallString
}