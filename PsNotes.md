get-command
get-command -verb get
get-command -noun service
get-verb
get-service
get-eventlog -logname -security
get-help get-process -full
Update-Help -Force -ErrorAction SilentlyContinue
get-childiten -filter *.exe -path c:\windows -recurse -name 
get-host

$Alias:dir
get-alias -definition get-childitem
set-alias edit notepad.exe
remove-item alias:edit

(get-process).processname
(get-process notepad).kill()
get-process | get-member

Get-Service | Format-Table Name, Status, starttype

write-host
write-output  #will be able to pike 

get-variable  $a = 10   $b,$c,$d = 12,24,12 
Get-variable home 
test-path variable:a
remove-variable:b
del variable:c
