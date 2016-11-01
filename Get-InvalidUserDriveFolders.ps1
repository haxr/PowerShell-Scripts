<#
.SYNOPSIS
    Search a directory named with user's sAMAccountName against AD enabled accounts
#>

    $fileShare = Read-Host "Directory to search"
    if (!(Test-Path $fileShare)) { Write-Output "Invalid directory"; break }
    $arrInvalidFolder = New-Object System.Collections.Generic.List[object]
        foreach($share in $fileShare){
                foreach ($folder in (Get-ChildItem -Directory "$share")){
                    $userExists = $null
                    # Remove: "| ? { $_.Enabled }" from the below to look at Enabled & Disabled accounts
                    try { $userExists = Get-ADUser $folder.Name -Filter {Enabled -eq $true} } } catch {}
                        If ($userExists -eq $null){
                            $arrInvalidFolder.Add($folder)
                            try {$size = (Get-ChildItem -Recurse $folder.FullName -ErrorAction Stop | Measure-Object -property length -sum -ErrorAction SilentlyContinue)
                                 $size = "{0:N2}" -f ($size.sum / 1MB) + " MB"
                                } catch [System.IO.PathTooLongException] { Write-Host "Folder `"$($folder.Name)`" Path too long!!" }
                            Write-Host "Folder $($folder.Name) ($size) is invalid or the user is disabled / deleted."
                        }
                }
        }
    # Uncomment the below to delete all folders
    #$arrInvalidFolder.FullName | Remove-Item -Force
