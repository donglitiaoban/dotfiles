# not use pwsh as daily driver anymore
$env:POWERSHELL_TELEMETRY_OPTOUT=1
$env:POWERSHELL_UPDATECHECK='off'
$env:HTTP_PROXY="http://127.0.0.1:7897"
$env:HTTPS_PROXY=$HTTP_PROXY

# New-Alias -Name n -Value nvim
# New-Alias -Name c -Value cls
# 
# $PSStyle.FileInfo.Directory = "`e[35;1m"
# 
# Import-Module PSReadLine
# 
# # Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
# 
# # use cursor as Vi mode indictor
# # no blinking!
# function OnViModeChange {
#   if ($args[0] -eq 'Command') {
#       # Set the cursor to a block.
#       Write-Host -NoNewLine "`e[2 q"
#   } else {
#       # Set the cursor to a line.
#       Write-Host -NoNewLine "`e[6 q"
#   }
# }
# 
# Set-PSReadLineOption -ViModeIndicator Script `
# -ViModeChangeHandler $Function:OnViModeChange
# 
# # not work
# # Set-PSReadLineKeyHandler -Chord 'Ctrl+Oem4' -Function ViCommandMode
# 
# # Import-Module PSFzf
# # Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
# 
# $PSReadLineOptions = @{
#   EditMode = 'Vi'
#   PredictionSource = 'History'
#   PredictionViewStyle = 'ListView'
#   Colors = @{
#     Command            = 'Magenta'
#     Number             = 'DarkGray'
#     Member             = 'DarkGray'
#     Operator           = 'DarkGray'
#     Type               = 'DarkGray'
#     Variable           = 'DarkGreen'
#     Parameter          = 'DarkGreen'
#     ContinuationPrompt = 'Gray'
#     Default            = 'DarkGray'
#     ListPredictionSelected = "`e[35;47m"
#   }
# }
# 
# Set-PSReadLineOption @PSReadlineOptions
# 
# # Import-Module posh-git
# 
# function prompt {
#   $prompt = Write-Prompt $(Get-Date -UFormat "%H:%M ") `
#     -ForegroundColor ([ConsoleColor]::Blue)
#   # $prompt += & $GitPromptScriptBlock
#   $prompt += Get-Location
#   $prompt += " >`r`n"
#   if ($prompt) { "$prompt" } else { '' }
# }
