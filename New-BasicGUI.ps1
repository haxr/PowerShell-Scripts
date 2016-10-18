$title = "Simple Menu"
$message = "What do you want to do?"

[System.Management.Automation.Host.ChoiceDescription[]]$options = @()
$options += New-Object System.Management.Automation.Host.ChoiceDescription "Option [&1]","Opt1"
$options += New-Object System.Management.Automation.Host.ChoiceDescription "Option [&2]","Opt2"
$options += New-Object System.Management.Automation.Host.ChoiceDescription "Option [&3]","Opt3"
$options += New-Object System.Management.Automation.Host.ChoiceDescription "Option [&4]","Opt4"

$result = $host.ui.PromptForChoice($title, $message, $options, 0) 
switch ($result)
    {
        0 { # Option 1
            "You selected $($options[0].HelpMessage)"
            "Running commands 2,3,4"
            }
        1 { # Option 2
            "You selected $($options[1].HelpMessage)"
            "Running commmand 2"
            }
        2 { # Option 3
            "You selected $($options[2].HelpMessage)"
            "Running command 3"
            }
        3 { # Option 4
            "You selected $($options[3].HelpMessage)"
            "Running command 4"
            }
    }