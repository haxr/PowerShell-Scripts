<#
.Synopsis
   Takes a full file image path as input to compress, uploads to api.tinify.com/shrink, and returns the resulting URL of compressed image to download
.EXAMPLE
   Get-TinifyShrinkURL -FullName "C:\image.png"
.EXAMPLE
   Get-ChildItem -Path "C:\images\*" -Include "*.jpg","*.png" | Get-TinifyURL
.INPUTS
   -FullName : Full path to file
.OUTPUTS
   [String] URL of compressed file
.NOTES
   Need to manually add API key
.EDIT
   Test
#>
function  Get-TinifyShrinkURL
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([String])]
    Param
    (
        # Full path to file
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0)]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({If(Test-Path $_){$true}else{Throw "Invalid path: $_"}})]
        [String]$FullName
    )
    begin {
        #// Need to define API Key
        $apiKey = ""
        if ([String]::IsNullOrEmpty($apiKey)) {
            throw "API Key not specified"
        }
    }

    process {
        foreach ($file in $FullName) {
            $Params = @{
                Method  = "Post"
                Uri     = "https://api.tinify.com/shrink"
                Headers = @{Authorization = "Basic $(([System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("api:$apiKey"))))"}
                InFile  = $file
            }
            
            try {
                $request = Invoke-RestMethod @Params
                if ($request.output.url) {
                    return $request.output.url
                } else {
                    throw "Unable to request $file"
                }
            } catch {
                throw "Unable to request $file"
            }

        }
    }
}
