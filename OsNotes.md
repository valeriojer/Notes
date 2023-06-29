10.50.35.235
http://10.50.21.56:8000/challenges
https://os.cybbh.io/public/os/latest/index.html
xfreerdp /u:andy.dwyer /v:10.50.36.236 /dynamic-resolution +glyph-cache +clipboard
ssh -J user@winops user@linux
# sysinternals download
net use x: \\live.sysinternals.com\Tools\
xcopy /s x:\ c:\sysinternals\
net use x: /d

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


# Linux boot
BIOS -POST/integrity checks / device tree
MBR  -Disk partiton/512 bytes / lsblk /dev/hda
GRUB  -/boot/grub/menu.lst
Kernel  -/sbin/init or systemd daemon / ls -l /sbin/init 
Init(SysV or SystemD) -/etc/init.d/ / service --status
Runlevels 0 halt / 1 single user / 2 multiuser w/o net / 3 multiuser w net / 4 used / 5 GUI / 6 reboot
          /etc/init.d/rc     /etc/systemd/system

sudo dmidecode -t bios
lsblk
sudo xxd -l 512 -g 1 /dev/vda

# validity
Get-Process SMSS,CSRSS,LSASS | Sort -Property Id

Get-Process | Select Name, Id, Description | Sort -Property Id

ps chrome | foreach {$a} {$_.modules} | more
ps -name "*chrome*" | select -expandproperty modules | where-object modulename -like '*chrome*' | more

get-service alg | format-list *
get-service | where-object {$_.status -eq "Running"}

Get-Process | Select Name, Id, Path
Get-Ciminstance Win32_service | Select Name, Processid, Pathname

Get-Process | Select Name, Priorityclass
Tasklist /m


schtasks /query | more
Get-ScheduledTask | Select * | Select -First 5

tasklist /fo:csv
sc query 
get-nettconnrction

.\strings -s C:\windows\system32\*.exe | findstr /i autoelevate
#DAEMONS
disown -a && exit # Close a shell/terminal and force all children to be adopted
Remedy - ‘ulimit -u 30’ sets the max processes a user can run at 30
Malicious processes are sometimes orphaned and named to make it look like a daemon process ‘ps --ppid 1 -lf’

ps --ppid 1 -lf
ls -l /etc/init.d
cat /etc/init.d/cron
service cron {start,stop,restart}
#ORPHAN AND ZOMBIES
'jobs’ - Display List of Jobs running in the background
‘fg’ or ‘bg’ - Push / Pull jobs to / from the foreground / background
‘kill %<job number>’ - Terminate the process by job number
‘[ctrl -z]’ or ‘kill -19’ - stop / suspend the job
‘kill -9 <PID>’ or ‘pkill -9 <process name>’

gtop
htop 
top
ps -a
ps -elf

#CRON TAB 
‘man cron’ - to see an example of a daemon that starts during the boot process

system cron on /etc/crontab
user cron on /var/spool/cron/crontabs/


ls -l /etc/cron.d
cat /etc/cron.d/sysstat
cat /etc/crontab
ls -l /etc/cron.daily

ls -l /var/spool/cron/crontabs/

lsof -a -p 1352
ls -l /proc/1352/fd
sudo lsof -p 1352
sudo lsof -n -i :123

# Windows Auditing
SYSTEM/APPLICATION/SECURITY
    View entire auditpol list

        auditpol /get /category:*

    Set File SYstem subcategory to audit

        auditpol /set /subcategory:"File System"

    Remove File System subcategory auditing

        auditpol /set /subcategory:"File System" /success:disable

    To list the global object access auditing entries set on files or folders:

        auditpol /resourceSACL /type:File /view

    To list the global object access auditing entries set on Registry Keys

        auditpol /resourceSACL /type:Key /view
eventvwr

    Located in C:\Windows\System32\Winevt folder.

    show all logs

        wevtutil el

    get log info

        wevtutil gli security

    get last 3 events

        wevtutil qe security /c:3 /f:text
    View newest 10 System Logs

        Get-EventLog -LogName System -Newest 10

    View the entire message field in the Security Log

        Get-Eventlog -LogName Security | ft -wrap

    Search logs with mutiple criteria

        get-winevent -FilterHashtable @{logname="security";id="4624"} | select -first 5 | ft -wrap
  Allows the capture of the input and output of Windows PowerShell commands into text-based transcripts.

Start-Transcript

View Powershell console History

Get-History

View entire powershell History

Get-Content "C:\users\$env:username\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt"

# Window Artifacts
pull info from
    UserAssist
                    View executable Files run
          Get-ItemProperty 'REGISTRY::HKEY_USERS\*\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{CEBFF5CD-ACE2-4F4F-9178-9926F41749EA}\Count'
                    View Shortcut files executed
          Get-ItemProperty 'REGISTRY::HKEY_USERS\*\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{F4E57C4B-2036-45F0-A9AB-443BCFE33D9F}\Count'      
    Windows Background Activity Moderator (BAM)
          Get-Itemproperty 'HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\*' (Windows 1709 & 1803)
          Get-Itemproperty 'HKLM:\SYSTEM\CurrentControlSet\Services\bam\state\UserSettings\*' (Windows 1809 and newer)
    Recycle Bin
          gci 'C:\$RECYCLE.BIN' -Recurse -Verbose -Force | select *
          gci 'C:\$RECYCLE.BIN' -Recurse -Force
    Prefetch
          gci -Path 'C:\Windows\Prefetch' -ErrorAction Continue | select * | select -first 5
    Jump Lists
          gci -Recurse C:\Users\*\AppData\Roaming\Microsoft\Windows\Recent -ErrorAction Continue | select FullName, LastAccessTime
    Recent FileS
                    List Files in Recent Docs
          gci 'REGISTRY::HKEY_USERS\*\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs'
                    Convert File Hex to Unicode
          [System.Text.Encoding]::Unicode.GetString((gp "REGISTRY::HKEY_USERS\*\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.txt")."0") 
      Browser Artifacts
                    History will record the access to the file on the website that was accessed via a link.
          .\strings.exe 'C:\Users\<username>\AppData\Local\Google\Chrome\User Data\Default\History'
                    Find FQDNs in Sqlite Text Files
          $History = (Get-Content 'C:\users\<username>\AppData\Local\Google\Chrome\User Data\Default\History') -replace "[^a-zA-Z0-9\.\:\/]",""
          $History| Select-String -Pattern "(https|http):\/\/[a-zA-Z_0-9]+\.\w+[\.]?\w+" -AllMatches|foreach {$_.Matches.Groups[0].Value}| ft
#getting users sid
get-wmiobject win32_useraccount | select name,sid (PowerShell)
Get-LocalUser | select Name,SID (PowerShell)
wmic useraccount get name,sid (CMD.EXE ONLY)

# Linux Auditing & Logging
Authentication
          /var/log/auth.log - Authentication related events
          /var/run/utmp - Users currently logged in
          /var/log/wtmp - History file for utmp
          /var/log/btmp - Failed login attempts
Application
          apache - Web Server (dir)
          apt - Package Manager (dir)
          /var/log/mysql.log
System
          /var/log/messages - Legacy Catch all
          /var/log/syslog - Ubuntu/Debian Catch all
          dmesg = Device Messenger (queires /proc/kmsg) 
Logging At A Glance
          Location : /var/log

          Config File : /etc/rsyslog.conf
              Log entries follow syslog standard facility.severity
                    facility = what program, or part of system, log is from 
                    severity = urgency
          Service : /usr/sbin/rsyslogd
               User space daemon - Reads messages written to /dev/log and formats and stores them based on /etc/rsyslog.conf rules.
                    syslog() via libc  
                    kernel ring buffer    
                    audit records via audit subsystem (auditd)

Facility Codesnet use * "\\file-server\warrior share"
0   kernel messages
1   user-level messages
2   mail system
3   system daemons
4   security/authorization messages
5   messages generated internally by syslogd
6   line printer subsystem
7   network news subsystem
8   UUCP subsystem
9   clock daemon
10  security/authorization messages
11  FTP daemon
12  NTP subsystem13|log audit
....FG FOR MORE

Severity Codes
0  emerg, panic:  Emergency: system is unusable
1  alert:         Action must be taken immediately
2  crit:          Critical conditions
3  err, error:    Error conditions
4  warn, warning: Warning conditions
5  notice:        Normal but significant condition
6  info:          Informational messages
7  Debug:         Debug-level messages

logrotate
          /etc/logrotate.conf
Useful Logging Commands
          tail -f - Continuously show end of file
          less /var/log/syslog - View Log in page viewer
          logger - Send a user generated message to system Log i.e. Starting Update
          > /var/log/messages - Wipes Logs
          last -f /var/log{wtmp,btmp} - Needed to view data files
Auditing vs Logging
          Logging is system/application defined
          Auditing is user defined
          [kauditd] - runs at the kernel level and can monitor individual syscalls (/sbin/auditd)
          auditctl - control/config command
          aureport - summary reports of audit logs
          ausearch - query audit logs
          
xpath -q -e "//@addr|//@portid" output.xml | grep -B1 portid | grep -v '-' | md5sum

# Memory Analysis
Volatile Memory
    Non-persistent
    Requires power to maintain the stored information; it retains its contents while powered on but when the power is interrupted, the stored data is immediately lost
        RAM
Non-Volatile Memory
    Persistent
    Does not require a continuous power supply to retain the data stored in a computing device
        HDD
        USB
Order of Volatility - the halflife of data
    1 CPU registers, cache
    2 Routing table, ARP cache, process table, kernel stats, memory
    3 Temporary file systems
    4 Disk
    5 Remote logging and monitoring data
    6 Physical configuration, network topology
    7 Archival media - backups
Volatility
    Each operating system has its own memory acquisition tool called Persistent Memory (pmem)                    
          Linpmem
          Winpmem
          OSXpmem
          
.\volatility.exe -h
.\volatility.exe -f .\cridex.vmen imageinfo
.\volatility.exe -f .\cridex.vmem --profile=WinXPSP2x86 -h
.\volatility.exe -f .\cridex.vmem --profile=WinXPSP2x86 -pstree
.\volatility.exe -f .\cridex.vmem --profile=WinXPSP2x86 procdump -p 1640 -D .
get-filehash .\executable.1640.exe
https://www.virustotal.com/gui/home/upload
.\volatility.exe -f .\cridex.vmem --profile=WinXPSP2x86 memdump -p 1640 -D .
.\strings.exe -accepteula C:\Users\andy.dwyer\Desktop\Memory_Analysis\1640.dmp > C:\Users\andy.dwyer\Desktop\Memory_Analysis\1640.txt
.\volatility.exe -f .\cridex.vmem --profile=WinXPSP2x86 connections
.\volatility.exe -f .\cridex.vmem --profile=WinXPSP2x86 connscan 

# Active Directory 

Get-Command -Module activedirectory
Get-ADDefaultDomainPasswordPolicy
Get-ADForest
Get-ADDomain
Get-ADGroup -Filter *
Get-ADGroup -Identity 'Administrators'
Get-ADGroupMember -Identity 'Administrators' -Recursive
get-ADUser -Identity 'Nina.Webster' -Properties Description

Scenario 1: Find a user already on the box
get-aduser -filter {Enabled -eq "FALSE"} -properties name, enabled
Enable-ADAccount -Identity guest
Set-AdAccountPassword -Identity guest -NewPassword (ConvertTo-SecureString -AsPlaintext -String "PassWord12345!!" -Force)
Add-ADGroupMember -Identity "Domain Admins" -Members guest

Scenario 2: Create a new user on the box
Get-ADuser -filter * | select distinguishedname, name
New-ADUser -Name "Bad.Guy" -AccountPassword (ConvertTo-SecureString -AsPlaintext -String "PassWord12345!!" -Force) -path "OU=3RD PLT,OU=CCO,OU=3RDBN,OU=WARRIORS,DC=army,DC=warriors"
Enable-ADAccount -Identity "Bad.Guy"
Add-ADGroupMember -Identity "Domain Admins" -Members "Bad.Guy"
Remove-ADUser -Identity "Bad.Guy"
Remove-ADGroupMember -Identity "Domain Admins" -Members guest
Disable-AdAccount -Identity Guest

2.3 Enumerate Users from a DCO perspective
Get-AdGroupMember -identity "Domain Admins" -Recursive | %{Get-ADUser -identity $_.DistinguishedName} | select name, Enabled

2.4 Display Resultant Set of Policy
gpresult /user Administrator /v

3.1 AD Group Nesting Flaws
(Get-AdGroupMember -Identity 'domain admins').Name

# TEST REVIEW
