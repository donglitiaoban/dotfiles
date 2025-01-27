$env:POWERSHELL_TELEMETRY_OPTOUT=1
$env:POWERSHELL_UPDATECHECK='off'
$env:HTTP_PROXY="http://127.0.0.1:55555"
$env:HTTPS_PROXY=$HTTP_PROXY

# a for alias
# function agitstatus { git status }
# function agitadd { git add }
# function agitcommit { git commit }
# function agitpush { git push }
# function agitfetch { git fetch }

New-Alias -Name n -Value nvim
New-Alias -Name c -Value cls
# New-Alias -Name sta -Value agitstatus
# New-Alias -Name add  -Value agitadd
# New-Alias -Name com -Value agitcommit
# New-Alias -Name pus -Value agitpush 
# New-Alias -Name fet -Value agitfetch

$PSStyle.FileInfo.Directory = "`e[35;1m"

Import-Module PSReadLine

# Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# use cursor as Vi mode indictor
# no blinking!
function OnViModeChange {
  if ($args[0] -eq 'Command') {
      # Set the cursor to a block.
      Write-Host -NoNewLine "`e[2 q"
  } else {
      # Set the cursor to a line.
      Write-Host -NoNewLine "`e[6 q"
  }
}

Set-PSReadLineOption -ViModeIndicator Script `
-ViModeChangeHandler $Function:OnViModeChange

# not work
# Set-PSReadLineKeyHandler -Chord 'Ctrl+Oem4' -Function ViCommandMode

# Import-Module PSFzf
# Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

$PSReadLineOptions = @{
  EditMode = 'Vi'
  PredictionSource = 'History'
  PredictionViewStyle = 'ListView'
  Colors = @{
    Command            = 'Magenta'
    Number             = 'DarkGray'
    Member             = 'DarkGray'
    Operator           = 'DarkGray'
    Type               = 'DarkGray'
    Variable           = 'DarkGreen'
    Parameter          = 'DarkGreen'
    ContinuationPrompt = 'Gray'
    Default            = 'DarkGray'
    ListPredictionSelected = "`e[35;47m"
  }
}

Set-PSReadLineOption @PSReadlineOptions

# posh-git prompt display:
# $GitPromptScriptBlock
# Import-Module posh-git

# display time and current working directory
# time in 24-hour format in blue
# time turns red if in admin privilege
function prompt {
  $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator
  # $prompt = Write-Host -NoNewLine $(Get-Date -UFormat "%H:%M ") `
  #   -ForegroundColor $($adminRole ? [ConsoleColor]::Red : [ConsoleColor]::Blue)
  # # the prompt requires posh-git
  # # $prompt += & $GitPromptScriptBlock
  # $prompt += $(Get-Location)
  # $prompt += ">`r`n"
  # if ($prompt) { "$prompt" } else { '' }
  Write-Host -NoNewLine $(Get-Date -UFormat "%H:%M ") `
    -ForegroundColor $($adminRole ? [ConsoleColor]::Red : [ConsoleColor]::Blue)
  "$(Get-Location)>`r`n"
}
