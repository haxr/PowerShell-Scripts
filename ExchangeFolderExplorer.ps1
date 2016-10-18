<#
.SYNOPSIS
    Lists Exchange Folders/Subfolders For Selected User

.TODO Include folder and document count as well as folder size
#>

$exCAS = Read-Host "Exchange CAS Name"

# Includes
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void][System.Windows.Forms.Application]::EnableVisualStyles();
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://$exCAS/PowerShell/ -Authentication Kerberos
Import-PSSession $session -AllowClobber | Out-Null
Add-PSSnapin microsoft.exchange*

# User Functions
function Add-Node ($Nodes, $Path) { # Add \ Separated List To TreeView Nodes
  $cleanPath = $Path -replace '@{Identity=','' `
                     -replace '}','' `
                     -replace ' \\ ',' -_- ' `
                     -split   '\\' `
                     -replace ' -_- ', ' \ '
   $cleanPath | %{
    $searchResult = $Nodes.Find($_, $false)
    If ($searchResult.Count -eq 1) {
      $Nodes = $searchResult[0].Nodes
    } else {
      $Node = New-Object Windows.Forms.TreeNode($_)
      $Node.Name = $_
      $Nodes.Add($Node)
    }
  }
}

function Expand-Nodes ($treeView) {
    $treeView.Expand()
        if ($treeView.Parent) {
            Expand-Nodes $treeView.Parent
        }
}

function Set-NodeBackColor ($treeView) {
    $treeView.BackColor = [System.Drawing.Color]::White
        foreach ($node in $treeView.Nodes) {
            Set-NodeBackColor $node
        }
}

# Initialize Form
$objForm = New-Object System.Windows.Forms.Form
$objForm.Text = "Exchange Folder Explorer"
$objForm.Size = New-Object System.Drawing.Size(500,600)
$objForm.StartPosition = "CenterScreen"
$objForm.KeyPreview = $True
# Combo Box
$objCBox = New-Object System.Windows.Forms.ComboBox
$objCBox.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::Simple
$objCBox.AutoCompleteMode = [System.Windows.Forms.AutoCompleteMode]::Append
$objCBox.Dock = [System.Windows.Forms.DockStyle]::Top
#$objCBox.BringToFront()
$objCBox.Height = '200'
$objCBox.Text = "Select a mailbox"
# TreeView
$objTree = New-Object System.Windows.Forms.TreeView
$objTree.Dock = [System.Windows.Forms.DockStyle]::Fill
$objTree.BringToFront()
# TextBox Search
$objText = New-Object System.Windows.Forms.TextBox
$objText.Dock = [System.Windows.Forms.DockStyle]::Top
$objText.Text = "Exact Search - Press Enter To Search"

# Populate Combox Box
echo "Loading Exchange Mailboxes, please wait..."
$UserList = Get-Mailbox -Filter '(ExchangeUserAccountControl -ne "AccountDisabled")' | Sort-Object Name
 foreach($user in $UserList){
    [void] $objCBox.Items.Add($user)
    }
echo "Mailboxes loaded, opening form."

# Handle ComboBox Selection
$objCBox.Add_SelectedIndexChanged({
    $objtree.Nodes.Clear() # Clear TreeView
    $userFolders = foreach-object {Get-MailboxFolderStatistics -Identity $objCBox.Text | select-object Identity}
        foreach ($folder in $userFolders){ # Loop
            Add-Node $objTree.Nodes "$folder"
        }
        $objTree.Nodes[0].Expand()
        $objForm.Refresh()  
    })

$objText.Add_KeyDown({
    if ($_.KeyValue -eq 13) {
    Set-NodeBackColor $objTree
    $objTree.CollapseAll()
    $objTree.Nodes[0].Expand()
    $searchFolder = $null
    $searchFolder = $objTree.Nodes.Find($objText.Text,$true)
    foreach($item in $searchFolder){
        $item.BackColor = [System.Drawing.Color]::LightBlue
        Expand-Nodes $item
        }
    $objTree.SelectedNode = $searchFolder.Item(0)
    $objTree.Focus()
    }
})

$objForm.Add_Load({
    $objCBox.TabIndex = 0
    $objCBox.Select()
    $objCBox.Focus()
})

# Show Form
$objForm.Controls.Add($objTree)
$objForm.Controls.Add($objText)
$objForm.Controls.Add($objCBox)
$objForm.Add_Shown({$objForm.Activate()})
$objForm.ShowDialog() # Code Processing Stops After .ShowDialog()