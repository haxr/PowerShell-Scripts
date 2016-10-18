<#
.Synopsis
    GUI application to script out various portions of a Microsoft SQL Server
#>

#region Project Recovery Data (DO NOT MODIFY)
<#RecoveryData:
7QEAAB+LCAAAAAAABACNkV1rwyAUhu8L/Q/Be5ekTTsCxou1axnsqx/sdpzak+EwGjQZ67+fWexI
GYzd+ejr8+KRbVGYD7SnJTTAx6MoYs/WvKNovsHjC1onjeYpi8/LcLKSCu+WvMxhlouJoMk0Q5ol
c0EP+aykE0jEtZhn6RSBxSEcroaO/alGnrB4iAO5CxAw2mKJFrXAR6iwICS6aaU6FiQhfNeAbdr6
qnau7/r76gKUog8g9crY6rV25dB13vey8t+ytTIHUF6VDlTRwlQV6OPtZ4O6G11B9rZFwvu08w3p
RUMP/bt/xtLTk5VvUoPqAl0vX2NDd5t776h9jsW/AuMRiy++9wvY9xaG7QEAAA==#>
#endregion

#region Source: Startup.pss
#region File Recovery Data (DO NOT MODIFY)
<#RecoveryData:
xQQAAB+LCAAAAAAABAC9lMlqwzAQQO+F/oPJ2Xip4jgBxxBSciltQ13aXsf22IhqCSM5wX9fZyEJ
LXQJ1Ogyo5Hm8ZCY5AkLvUZqb8GC0wWGazUd3AzS6yvHSR6J11yBWHCBDyAxzSyQbVbeypjE/1Ld
3ZkZgzIXHM0uP+20adYai9K7BwU1SlTWmzVWS7Ad1HVeDnTmBdvlOvNG2IZwqrCxBMJ1lk3Xt7jD
9lm/Y3cwzCs2jkZQstEQWZT4R9JnsjSFJsHzE2X4W0oexxAV0SicsCEG48k3lL1fHwzvlatSb4y3
0CRNL8TtD+kHRLDhqr6EFbAqquIqDMsoAAY/s96k6MeJExZWU5shrXmBFz3Zn+3mmrAXvYPVknSn
9g9ux3Q/VRL/fGylH3nEhp/FBAAA#>
#endregion
#----------------------------------------------
#region Import Assemblies
#----------------------------------------------
[void][Reflection.Assembly]::Load('mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][Reflection.Assembly]::Load('System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.DirectoryServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][Reflection.Assembly]::Load('System.Core, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[void][Reflection.Assembly]::Load('System.ServiceProcess, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
#endregion Import Assemblies

#Define a Param block to use custom parameters in the project
#Param ($CustomParameter)

function Main {
	Param ([String]$Commandline)
	#Note: This function starts the application
	#Note: $Commandline contains the complete argument string passed to the packager 
	#Note: To get the script directory in the Packager use: Split-Path $hostinvocation.MyCommand.path
	#Note: To get the console output in the Packager (Forms Mode) use: $ConsoleOutput (Type: System.Collections.ArrayList)
	#TODO: Initialize and add Function calls to forms
	
	if((Call-MainForm_psf) -eq "OK")
	{
		
	}
	
	$global:ExitCode = 0 #Set the exit code for the Packager
}

#endregion Source: Startup.pss

#region Source: MainForm.psf
function Call-MainForm_psf
{
#region File Recovery Data (DO NOT MODIFY)
<#RecoveryData:
eiIAAB+LCAAAAAAABADVmltz4jYUgN870/+g8cu+sNwMIbSEGSBJuy3Z0JBu+tYRtgA1suSR5AT3
L+1P2Lf9ZT2ynSsG5CmXZDLDxdbxuX06OhLpXBFP3BEZn2KNEXxQVPATp+50f/wBoc6lpDPKMTun
jHzGAeleYMrPhQzKoZp2Kku3U6HJP8TTSMchOXHGsdIkKN9Q7ot7VTay6WsJ5d0qoS+ZDY1y1fyV
0CBiOpLkhJNIS8xKaBRNGPV+J/G1uCX8ZNJq4abXPKq13QapHrcdxMGUE2cqA2Otg7w5Zb6Ekc5A
cC0FU6l3YOpIipBIHWciA0YJ12P6L3G6rVqjhBpHjU7lYdAKoXN4qNMdYEYnkpZQu9xqhnqj1AXl
NIiCTFe9DrratY1SJshON/Ns4+ixxlKPhKIaAgomgm9Ejj1JyGbZa7IAr34h+uP4jyEaiXuQnBPG
lgXP7uC5mdRQYN/pXnLzbvKZ3OtUkreH8Zvx6EdaC75zQCaJGmCCgz3rMMnJOcN6rGMGyTAfl4Ky
ipIL6kmhxFSjMeYKjYmk05XILD9kKDyc5rLWbpdQrW4hkyLzwlcLqYzL4xJyl6nMoQVPPnGfLJzu
sc3ohK3MmHK5bCHypyJfqIowS6Lex97tQDAhne61jEie/HMqYVp7t69i8Hdy8RWalZRNe1JHmBO2
e1CF9In8FZwuRmmPe/MkRiIsob4A76HqDslUl9AVnc1tOOhFWqQsrAr0K4F+YuvD3KAL4o8pnzEb
0Se668dQDwvA/Rgfa7Ibrqm4brsQ26280ZshuaLe3CDfF4udo6IXGur1ekw2JO2z4HnZWpY6FWZW
wdq/vCisroDDyKM+RmCVEoxA7cstfOvggOhUrURSONKIWAk8oFE1aOQluygcq0rfs/s2QjeQnhuJ
Qwg2Zip3Kr2qXIUL2X6XXEawfHcLLqyFtaM88tauuMbVXa63Tfv11piCvn/b72prlG5nrd1zVxjG
75LQulu4JwzjXQK6vIFa3RCG8d75BJ3vEE/Yl21c5t8goG2zyy3IZ+rqLgm1mTEpod+/IjAH2dmz
PUjTEGwH07HGOlJ9LHdOqtJGTUFGrc5S1kNmGvuG/eYhNdOar6Y5qqnbPP4JMCscDWBoEbCfVIg9
uBBKooi8A5XoimA//hlmHjPJpZA0hbRAypM0hGTPCUcqvfchw/PD8jFNYVIGc+LdEn9I1V52LkwZ
yD8Z54ox8z92nImLlzybbJY73EEklZnGPSnFvcX4dJtktt3WJfdpAljRb1KBtQavzzieMOJb+5KG
+/nWw1x5ScVYS3hyCQXKExLs2kbOu6YcRiE6JXfUI6pTMWoPYIY59Z5gdUALzriPRoJyfUATAGSJ
hmJ2OBOGlEOpMb2F+QnicGaIGeWHU38l2AFJNOf8vVlyXn9oC9BH1GNQpt5AMMCU38TkbRhyCaUb
a3HACXIt6Wy2PEMLdWgrzu/W/kBWS87k6rkHsLld3bNuwrq1S1vHnF/8cgSE1AWW2adWcNnzF43Z
yy89pUgAGSHqYWx2Je5mSb7AHM9IAHiUzUl9kIT4KdOubabd2mTqHjePsO8eNYjb7FQeNb3WvEWe
1mhJ/duHjq03tJs1mq5jP4okvk+KQHFdVXfanLamtZrfrGIXb9b1V8D24xOVMEGEjE2zYJrHvXg3
EJLsxb3MKygS4Np+fDslis749lU9fk0LWKfy/H9Nuv8BIlK8OHoiAAA=#>
#endregion
	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Xml, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.DirectoryServices, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Core, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.ServiceProcess, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	[void][reflection.assembly]::Load('System.Design, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$frmMain = New-Object 'System.Windows.Forms.Form'
	$buttonConnect = New-Object 'System.Windows.Forms.Button'
	$borderHack = New-Object 'System.Windows.Forms.Panel'
	$txtSQL = New-Object 'System.Windows.Forms.RichTextBox'
	$buttonClear = New-Object 'System.Windows.Forms.Button'
	$buttonCopy = New-Object 'System.Windows.Forms.Button'
	$buttonGetSQL = New-Object 'System.Windows.Forms.Button'
	$stsBar = New-Object 'System.Windows.Forms.StatusBar'
	$lstSQLItems = New-Object 'System.Windows.Forms.CheckedListBox'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$OnLoadFormEvent={
	#TODO: Initialize Form Controls here
	
	}
	
	
	
	
	
	$buttonClear_Click={
		$txtSQL.Clear()
		Update-Status('Text cleared')
	}
	
	
	
	$buttonCopy_Click = {
		$txtSQL.Focus()
		$txtSQL.SelectAll()
		$txtSQL.Copy()
		Update-Status('Text copied to clipboard')
	}
	$exitToolStripMenuItem_Click={
		$frmMain.Close()
	}
	
	$buttonGetSQL_Click = {
		If ($lstSQLItems.CheckedItems.Count -eq 0)
		{
			Update-Status("No items selected to script!")
			return 0
		}
		Invoke-Command $buttonClear_Click
		If ($global:srv -eq $null)
		{
			Invoke-Command $buttonConnect_Click
		}
		Update-Status("Connected to SQL Server: $global:srv")
		foreach ($sqlObj in $lstSQLItems.CheckedItems)
		{
			Script-SQLObject($sqlObj)
		}
		
	}
	$buttonConnect_Click = {
		while ($sqlsvr -eq $null -or $sqlsvr -eq "")
		{
			$sqlsvr = [Microsoft.VisualBasic.Interaction]::InputBox("Enter SQL Server name", "SQL Server Prompt", "$global:srv")
		}
		$global:srv = New-Object "Microsoft.SqlServer.Management.Smo.Server" $sqlsvr
		If ($global:srv -ne $null) { Update-Status("Connected to SQL Server: $global:srv") }
	}	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$frmMain.WindowState = $InitialFormWindowState
	}
	
	$Form_StoreValues_Closing=
	{
		#Store the control values
		$script:MainForm_txtSQL = $txtSQL.Text
		$script:MainForm_lstSQLItems = $lstSQLItems.SelectedItems
	}

	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$buttonConnect.remove_Click($buttonConnect_Click)
			$buttonClear.remove_Click($buttonClear_Click)
			$buttonCopy.remove_Click($buttonCopy_Click)
			$buttonGetSQL.remove_Click($buttonGetSQL_Click)
			$frmMain.remove_Load($OnLoadFormEvent)
			$frmMain.remove_Load($Form_StateCorrection_Load)
			$frmMain.remove_Closing($Form_StoreValues_Closing)
			$frmMain.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch [Exception]
		{ }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$frmMain.SuspendLayout()
	$borderHack.SuspendLayout()
	#
	# frmMain
	#
	$frmMain.Controls.Add($buttonConnect)
	$frmMain.Controls.Add($borderHack)
	$frmMain.Controls.Add($buttonClear)
	$frmMain.Controls.Add($buttonCopy)
	$frmMain.Controls.Add($buttonGetSQL)
	$frmMain.Controls.Add($stsBar)
	$frmMain.Controls.Add($lstSQLItems)
	$frmMain.ClientSize = '714, 464'
	$frmMain.Font = "Calibri, 9.75pt"
	$frmMain.MinimumSize = '722, 491'
	$frmMain.Name = "frmMain"
	$frmMain.StartPosition = 'CenterScreen'
	$frmMain.Text = "Get-SQL PowerShell"
	$frmMain.add_Load($OnLoadFormEvent)
	#
	# buttonConnect
	#
	$buttonConnect.FlatStyle = 'Flat'
	$buttonConnect.Font = "Microsoft Sans Serif, 9.75pt"
	$buttonConnect.Location = '199, 12'
	$buttonConnect.Name = "buttonConnect"
	$buttonConnect.Size = '78, 31'
	$buttonConnect.TabIndex = 8
	$buttonConnect.Text = "Connect..."
	$buttonConnect.UseVisualStyleBackColor = $True
	$buttonConnect.add_Click($buttonConnect_Click)
	#
	# borderHack
	#
	$borderHack.Controls.Add($txtSQL)
	$borderHack.Anchor = 'Top, Bottom, Left, Right'
	$borderHack.AutoSize = $True
	$borderHack.BorderStyle = 'FixedSingle'
	$borderHack.Location = '282, 2'
	$borderHack.Name = "borderHack"
	$borderHack.Size = '432, 439'
	$borderHack.TabIndex = 7
	#
	# txtSQL
	#
	$txtSQL.BorderStyle = 'None'
	$txtSQL.Dock = 'Fill'
	$txtSQL.Font = "Lucida Console, 9pt"
	$txtSQL.Location = '0, 0'
	$txtSQL.Name = "txtSQL"
	$txtSQL.Size = '430, 437'
	$txtSQL.TabIndex = 7
	$txtSQL.Text = ""
	$txtSQL.WordWrap = $False
	#
	# buttonClear
	#
	$buttonClear.FlatStyle = 'Flat'
	$buttonClear.Font = "Microsoft Sans Serif, 9.75pt"
	$buttonClear.Location = '198, 160'
	$buttonClear.Name = "buttonClear"
	$buttonClear.Size = '78, 31'
	$buttonClear.TabIndex = 5
	$buttonClear.Text = "Clear »"
	$buttonClear.UseVisualStyleBackColor = $True
	$buttonClear.add_Click($buttonClear_Click)
	#
	# buttonCopy
	#
	$buttonCopy.FlatStyle = 'Flat'
	$buttonCopy.Font = "Microsoft Sans Serif, 9.75pt"
	$buttonCopy.Location = '198, 123'
	$buttonCopy.Name = "buttonCopy"
	$buttonCopy.Size = '78, 31'
	$buttonCopy.TabIndex = 4
	$buttonCopy.Text = "Copy »"
	$buttonCopy.UseVisualStyleBackColor = $True
	$buttonCopy.add_Click($buttonCopy_Click)
	#
	# buttonGetSQL
	#
	$buttonGetSQL.FlatStyle = 'Flat'
	$buttonGetSQL.Font = "Microsoft Sans Serif, 9.75pt"
	$buttonGetSQL.Location = '199, 49'
	$buttonGetSQL.Name = "buttonGetSQL"
	$buttonGetSQL.Size = '78, 31'
	$buttonGetSQL.TabIndex = 3
	$buttonGetSQL.Text = "« Get SQL"
	$buttonGetSQL.UseVisualStyleBackColor = $True
	$buttonGetSQL.add_Click($buttonGetSQL_Click)
	#
	# stsBar
	#
	$stsBar.Font = "Calibri, 9.75pt"
	$stsBar.Location = '192, 442'
	$stsBar.Name = "stsBar"
	$stsBar.Size = '522, 22'
	$stsBar.TabIndex = 1
	$stsBar.Text = " Ready; Select items to script then select 'Get SQL'"
	#
	# lstSQLItems
	#
	$lstSQLItems.BorderStyle = 'FixedSingle'
	$lstSQLItems.CheckOnClick = $True
	$lstSQLItems.Cursor = "Arrow"
	$lstSQLItems.Dock = 'Left'
	$lstSQLItems.Font = "Calibri, 9pt"
	$lstSQLItems.FormattingEnabled = $True
	[void]$lstSQLItems.Items.Add("Backup Devices")
	[void]$lstSQLItems.Items.Add("Databases")
	[void]$lstSQLItems.Items.Add("End Points")
	[void]$lstSQLItems.Items.Add("Error Logs")
	[void]$lstSQLItems.Items.Add("Linked Servers")
	[void]$lstSQLItems.Items.Add("Logins")
	[void]$lstSQLItems.Items.Add("Roles")
	[void]$lstSQLItems.Items.Add("SQL Agent")
	[void]$lstSQLItems.Items.Add("SQL Agent - Alerts")
	[void]$lstSQLItems.Items.Add("SQL Agent - Jobs")
	[void]$lstSQLItems.Items.Add("SQL Agent - Operators")
	[void]$lstSQLItems.Items.Add("Triggers")
	$lstSQLItems.Location = '0, 0'
	$lstSQLItems.MinimumSize = '130, 427'
	$lstSQLItems.Name = "lstSQLItems"
	$lstSQLItems.Size = '192, 464'
	$lstSQLItems.Sorted = $True
	$lstSQLItems.TabIndex = 0
	$borderHack.ResumeLayout($false)
	$frmMain.ResumeLayout($false)
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $frmMain.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$frmMain.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$frmMain.add_FormClosed($Form_Cleanup_FormClosed)
	#Store the control values when form is closing
	$frmMain.add_Closing($Form_StoreValues_Closing)
	#Show the Form
	return $frmMain.ShowDialog()
}
#endregion Source: MainForm.psf

#region Source: Globals.ps1
	#--------------------------------------------
	# Declare Global Variables and Functions here
	#--------------------------------------------
	
	# Load SQL Server PowerShell Assembly
	[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo") | Out-Null
	[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null
	
	$global:srv = $null
	
	#Sample function that provides the location of the script
	function Get-ScriptDirectory
	{ 
		if($hostinvocation -ne $null)
		{
			Split-Path $hostinvocation.MyCommand.path
		}
		else
		{
			Split-Path $script:MyInvocation.MyCommand.Path
		}
	}
	
	#Sample variable that provides the location of the script
	[string]$ScriptDirectory = Get-ScriptDirectory
	
	function Script-SQLObject ($sqlobj)
	{ Update-Status("Scripting object: $sqlobj from $global:srv")
		switch ($sqlobj)
		{
			"Backup Devices" { Append-Text($srv.BackupDevices | foreach {$_.Script() + "GO"}) }
			"Databases" { Append-Text($srv.Databases | foreach { $_.Script() + "GO" }) }
			"End Points" { Append-Text($srv.EndPoints | foreach { $_.Script() + "GO" }) }
			"Error Logs" { Append-Text($srv.ReadErrorLog() | foreach { "$($_.LogDate) $($_.Text ) `n" }) }
			"Linked Servers" { Append-Text($srv.LinkedServers | foreach { $_.Script() + "GO" }) }
			"Logins" { Append-Text($srv.Logins | foreach { $_.Script() + "GO" }) }
			"Roles" { Append-Text($srv.Roles | foreach { $_.Script() + "GO" }) }
			"SQL Agent" { Append-Text($srv.JobServer | foreach { $_.Script() + "GO" }) }
			"SQL Agent - Alerts" { Append-Text($srv.JobServer.Alerts | foreach { $_.Script() + "GO" }) }
			"SQL Agent - Jobs" { Append-Text($srv.JobServer.Jobs | foreach { $_.Script() + "GO" }) }
			"SQL Agent - Operators" { Append-Text($srv.JobServer.Operators | foreach { $_.Script() + "GO" }) }
			"Triggers" { Append-Text($srv.JobServer.Trigger | foreach { $_.Script() + "GO" }) }
			default { "Do Nothing" }
		}
	
	}
	
	function Append-Text($text)
	{ if ($text -ne $null)
		{
			$txtSQL.AppendText($text)
		}
		else { Update-Status ("No objects found") }
	}
	
	function Update-Status($text)
	{
		$stsBar.Text = " $text"
	}
	#endregion Source: Globals.ps1

#Start the application
Main ($CommandLine)
