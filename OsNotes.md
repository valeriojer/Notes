10.50.35.235
http://10.50.21.56:8000/challenges
https://os.cybbh.io/public/os/latest/index.html
xfreerdp /u:andy.dwyer /v:10.50.36.236 /dynamic-resolution +glyph-cache +clipboard


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
### paths for persistence
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

Get-ChildItem 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\ProfileList'


# UNIX
which -path for a exe 
hostname -box name
whoami -users signed in
who -everyone signed in
ifconfig -network config on box
arp/ip neigh -mac addr on the network
ip route show/route -where the packets are going
ss -ports
netstat -anop 
sudo iptables -L -firewall rules
sudo -l -shows rules
--help 
a="100"
dir=$(ls -lisa)
stderr = 2 
stdout = 1
stdinr = 0
/bin -binary exeacutable
/sbin -system manitance
/home -users home
/usr -the users binary
/etc -system configs
/var -variable data
/boot -boot files
/dev -device files
/lib -kernal mod
/mout -gernic mout point for device
/proc -procees 
/opt -packet software
/media -removeable media 
id -id info 
ls -lisa /bin/dd
find / -perm / 4000 2>
