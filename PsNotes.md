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

$myblock = {get-service | ft name, status}
& $myblock

$a = 1
$c = {1+1}
$a += &$c

get-childitem | sort  -property lenght -descending
Get-Service | Where-Object {$_.status -eq 'running'}
get-childitem *.dll | where-object {$_.length -gt 100}
ps | where {$_.Name -like "*powershell*"} | ft name, Description
ps | where {$_.Name -eq "idle"} | ft name, Descripton
gci | Measure-Object Length

'WORLD' > text.txt 
$before = gci
'4' > text.txt
$after = gci
Compare-Object $before $after -Property length, name

$myTruck = new-object object
Add-member -membertype noteproperty -name color -value Black -inputobject $mytruck
add-member -me NoteProperty -in $mytruck -na make -va Ford
$mytruck | Add-Member NoteProperty -Name Model -Value F150
Add-Member -me ScriptMethod -in $myTruck -name drive -va {"ROAD TRIPPPP"}

$Sold = [PSCustomObject]@{
"Firstname" = "Joe"
"LastName" = "Snuffy"
"MOS" = "1721"
"Rank" = "Lcpl"
}

Get-PSDrive
New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS
cd HKU:
New-PSDrive -Name z -PSProvider FileSystem -Root \\live.sysinternals.com\tools
Start-Service -Name WebClient

2 -eq 2           T
2 -eq 3           F
1,2,3 -eq 2       2
"abc" -eq "abc"   T
"a" -eq "a"       T
"a" -eq "a","b"   F
"a","b" -ep "b"   "b"

-like   -contains   

$x = 11
if($x -gt 10){
  "$x is larger than 10"
  write-host "$x is larger" -foregroundcolor red
}
else{
  write-host "ex1"
}

$fruit = "b"
switch($fruit){
  a{"apple"}
  b{"banana"}
  c{"cranberry"}
}

$num = 0
do{
  $num
  $num++
}while($num -lt 3)
  
do{
  $num
  $num++
}until($num -gt 3)

for($i = 0; $i -le 255; $i++){
  write-host 192.168.0.$i
}

$hash = @{}

Text `"Question marks`"

$text1 = "One Terabyte is $(1TB / 1GB) Gigabytes"
"Hello`nline World"
$text = @"
Here is some text
"$PWD" is your current path
"@

"{0:n3}" -f 123.45678
"{0:d5}" -f 1

gsv | select -First 10 | foreach{"The Service {0} is called '{1}': {2}" -f $_.name,$_.displayname,$_.status}

"Hello John and johnthan" -replace "john ", "World"

(ipconfig) -match 'IPv6'
qprocess -replace '\s{2,}', ',' | select -first 10
-csplit
-split

"cat","dog" -join ""

"10.0.0.12" as [ipaddress] -as [bool]

function Get-Product([int]$num1, [int]$num2, [int]$num3){
    echo ($num1 * $num2 * $num3)
}
Get-Product 5 5 5
