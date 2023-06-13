10.50.36.85

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
