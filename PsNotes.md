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

(ps).gettype()
$proc = ps
$proc[-1]
$proc -is [array]
$proc.count
$proc.length

$array = 1..4
$array[0] -is [int] 

$array = "he", 5, (date)
($array[-1]).gettype()

$array2=@()-max

$jagarray = "jim", "joe", "jon", (1,('apple' , 'people'),4), "jan"
$jagarry[3][1][1]

$a = 1,2,3
$a += @(4,5,6)
$a += , @(7,8,9)
$a[-1] 

// loop through checking the last index of arrays
foreach ($line in $a){
  if ($line[-1] -eq 'apple'){
    wirte-output $line
  }
}
