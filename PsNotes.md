get-command
get-command -verb get
get-command -noun service
get-verb
get-service
get-eventlog -logname -security
get-help get-process -full
Update-Help -Force -ErrorAction SilentlyContinue
get-childiten -filter *.exe -path c:\windows -recurse -name 

$Alias:dir
get-alias -definition get-childitem
set-alias edit notepad.exe
remove-item alias:edit
