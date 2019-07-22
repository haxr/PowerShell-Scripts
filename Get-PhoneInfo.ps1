    <#
    Cisco IP Phone XML Extractor

    .Synopsis
    This script will go through a list of IP Addresses and verify they are online Cisco IP Phones, then extract 
    and return a list of the relevant information from the XML documents.

    Originally used to verify all phones have been updated to the newest TFTP server post-upgrade

    .TODO Run in parallel to speed up the process
    #>

    # Setup the output table
    $phoneOutput = New-Object System.Collections.Generic.List[object]
    
    # Generate IP Addresses to $ipList
    # Quick and dirty IP range calculations, leave off last octect
    # (or you know, write a proper function or just replace $ipList with an actual array of IP Addresses
    $ipRange = "172.18.143."
    $ipList = ForEach ($range in $ipRange) {
    1..254 | ForEach-Object { "$range$_"}
    }

    Function TestPort {
        Param(
            [parameter(ParameterSetName='IP', Position=0)]
            [System.Net.IPAddress]
            $IPAddress,

            [parameter(Mandatory=$true , Position=1)]
            [int]
            $Port,

            [parameter(Mandatory=$false , Position=2)]
            [int]
            $Timeout=2000
            )

        $RemoteServer = If ([string]::IsNullOrEmpty($ComputerName)) {$IPAddress} Else {$ComputerName};

            $test = New-Object System.Net.Sockets.TcpClient;
            Try
            {
                Write-Host "Connecting to "$RemoteServer":"$Port;
                $conn = $test.BeginConnect($RemoteServer, $Port, $null, $null);
                $conn.AsyncWaitHandle.WaitOne($Timeout,$true)
                if(!$conn){$tcp.close()}
            }
            Catch
            {        }
            Finally
            {
                $test.Dispose();
            }

    }

    # Check if phone is online
    Function Get-PhoneStatus ($phoneIP) {
        Return (TestPort -IP $phoneIP -Port 80 -Timeout 25) 
    }

    # Get phone XML info
    Function Get-PhoneXML ($phoneIP) {
    # These are the pages that return the XML document from the Cisco IP Phone
    $urlDevInfo      = "/CGI/Java/Serviceability?adapterX=device.statistics.device"
    $urlDevNetConfig  = "/CGI/Java/Serviceability?adapterX=device.statistics.configuration"

    [xml]$docDevInfo = Invoke-WebRequest "http://$phoneIP$urlDevInfo" -UseBasicParsing

    If ($docDevInfo.DeviceInformation.phoneDN) {

    [xml]$docDevNetConfig = Invoke-WebRequest "http://$phoneIP$urlDevNetConfig" -UseBasicParsing

    Write-Host "Checking $phoneIP"
    $phoneOutput.Add([PSCustomObject]@{
            ipAddr      = $phoneIP
            phoneDN     = $docDevInfo.DeviceInformation.phoneDN
            SerialNumber= $docDevInfo.DeviceInformation.serialNumber
            HostName    = $docDevInfo.DeviceInformation.HostName
            versionID   = $docDevInfo.DeviceInformation.versionID
            AltTFTP     = $docDevNetConfig.NetworkConfiguration.AltTFTP
            TFTPServer1 = $docDevNetConfig.NetworkConfiguration.TFTPServer1
            TFTPServer2 = $docDevNetConfig.NetworkConfiguration.TFTPServer2
        })
    }
    }

    Function Get-PhoneList() {
        
        ForEach ($ip in $ipList) {
                If (Get-PhoneStatus($ip)) {
                try {
                    Get-PhoneXML($ip) } 
                catch { 
                    }
                }
        }

    }

    Get-PhoneList

    $phoneOutput | Select-Object ipAddr, phoneDN, SerialNumber, HostName, AltTFTP, TFTPServer1, TFTPServer2, versionID | Export-Csv -Path $home\Desktop\phone.csv -NoTypeInformation

    Invoke-Item $home\Desktop\phone.csv
