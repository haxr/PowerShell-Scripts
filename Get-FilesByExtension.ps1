<#
.Synopsis
   Finds files by file extension
.DESCRIPTION
   Scans a directory and sub-directories for specific file types and returns the counts and size of the matching files
#>

$directory = Read-Host "Directory to scan"

if (!(Test-Path $directory)) { Write-Output "Invalid Directory"; break }

$array = New-Object System.Collections.Generic.List[object]

$commonFileTypes = (
".jpg", ".jpeg", ".tiff", ".gif", ".bmp", ".png", # Images
".webm", ".mkv", ".flv", ".vob", ".ogg", ".gifv", ".avi", ".mov", ".qt", ".wmv", ".rm", # Video / Audio
".asf", ".mp4", ".m4p", ".mpg", ".mpeg", ".mv", ".svi", ".3gp", ".3g2", # Video / Audio
".aa", ".ac", ".aiff", ".flac", ".m4a", ".mp3", ".oga", ".raw", ".wav", ".webm", ".wma", # Video / Audio
".pdf", # PDF
".3ds", ".mdx", ".3ct", ".acis", ".step", ".g", ".dxf", ".dwg", ".iges", ".pln", ".ifc", ".dwf" # CAD
)

robocopy $directory a: /NODD /MIR /FP /NC /NDL /NJH /NJS /L /BYTES /NP | % {
    $entry = $_.TrimStart() -split "`t"
    if ($entry[1] -cmatch '\.[^.]+$') {
    $ext = $matches[0] 
    if ($ext -in $commonFileTypes) {
    $array.Add([PSCustomObject]@{Extension=$ext;Size=$entry[0];}) #| Out-Null
    }}
}

$totals = $array | Group-Object Extension | Select Name, Count, @{n="Size (MB)";e={[math]::Round((($_.Group | Measure-Object -Sum Size).Sum / 1MB),2)}}
$totals
$totals | Measure-Object -Sum "Size (MB)" | Select @{n="Name";e={"Total"}},@{n="Count";e={$array.Count}},@{n="Size (MB)";e={$_.Sum}}