10.50.35.235
http://10.50.21.56:8000/challenges
https://os.cybbh.io/public/os/latest/index.html

get-help get-process -online
set-alias -name ip -value getpgetnetipdress
get-process| get-member
get-process | select-object name,id,path |ft 
(ps | select-object name, id,path | where-object {$_.id -lt '1000'}).count
get-ciminstance -classname win32_logicaldisk
get-ciminstance -classname win32_logicaldisk -filter "Drivetype = 3" | gm
set-executionpolicy  
winrm get winrm/congif
get-item WSMAN:\localhost|client\TrustedHosts
invoke-command -comptername file-server{get service}
set-item WSMAN:\Localhost\client\TrustedHosts -value "File-Server,Domain-Controll"
$session = New-pssession -computername file-server
enter-pssession -session $session
Invoke-command -session $session {get service}
test-path -path $profile.AllUsersCurrenthost
$profile| gm -type NoteProperty
new-item -itemtype file -path $profile -Force


regedit.exe
reg add, reg query, reg delete

New-PSDrive -name HKU -SSProvider registry -root HKEY_USERS
HKLM\BCD00000000
HKLM\SAM\SAM
HKU\<>\Software\Policies\Microsoft\windows\system\script
# paths for persistence
HKLM\Software\Microsoft\Windows\CurrentVersion\Run
HKU\<SID>\Software\Microsoft\Windows\CurrentVersion\Run
HKLM\SYSTEM\CurrentControlSet\services
HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders
HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders
HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon

gci
get-itemproerty
get-item
set-itemproperty remove-get  

gci HKLM:\Software\Microsoft\Windows\CurrentVersion\
gi HKLM:\Software\Microsoft\Windows\CurrentVersion\
