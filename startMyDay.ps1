$accountName = "a" + $env:UserName
#variables for confirming user's A account dialogue
$accountMessage  = 'Confirm your account'
$accountQuestion = "Is your Admin account: $accountName"
$accountChoice = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$accountChoice.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$accountChoice.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

#variables for obtaining user's program launch choice dialogue
$programMessage  = 'Choose the program launch option'
$programQuestion = "Do you want to launch all programs or choose?"
$programChoice = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$programChoice.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&All'))
$programChoice.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Choose'))

#gets user input admin account
function Get-userInputAdminAccount {
$accountNameEntered = Read-Host "What is your A account name?" -AsSecureString
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($accountNameEntered)
$accountName = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
}

#gets user input admin password
function Get-userInputAdminPassword {
$accountPassword = Read-Host "What is your A account password?" -AsSecureString
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($accountPassword)
$accountPass = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
}

#asks if user wants to run all programs or selected ones
function Get-programSelection {
$decision = $Host.UI.PromptForChoice($programMessage, $programQuestion, $programChoice, 1)
if ($decision -eq 0) {
  Write-Host All
} else {
  Write-Host Choose
}
}

# 1 confirms user's A account
$decision = $Host.UI.PromptForChoice($accountMessage, $accountQuestion, $accountChoice, 1)
if ($decision -eq 0) {
  Get-userInputAdminPassword
  Get-programSelection
} else {
  Get-userInputAdminAccount
  Get-userInputAdminPassword
  Get-programSelection
}


#runs selected programs - calls only user selected



#runs all programs - calls all of the programs





#command for each program

function Run-ADUC {
}

function Run-ADAC {
}

function Run-IEasAdmin {
}

function SimpleHelp {
}



Start-Process powershell.exe $accountName -NoNewWindow -ArgumentList "Start-Process powershell.exe -Verb runAs"

C:\Windows\System32\runas.exe /user:steve /savecred "mmc %SystemRoot%\system32\dsa.msc"



# Kept junk code:
<# $account = Read-Host "What is your A account name?" -AsSecureString
$SecureString = Read-Host "Enter a password for user account" -AsSecureString
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString)            
$PlainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)            
Write-Host "Entered password is $PlainPassword and the account to use is $account"
#>