#####Practical Exercise: Find Cmdlets
    #Ensure that you have the latest copy of help by updating your help system.
update help -force
    #Which cmdlets deal with the viewing/manipulating of processes?
ps
    #Display a list of services installed on your local computer.
set-service
    #What cmdlets are used to write or output objects or text to the screen?
write-output "!Hello "
write-host "World!"
    #What cmdlets can be used to create, modify, list, and delete variables?
new-variable -name dog -value devil
set-variable -name dog -value devil
remove-variable -name dog
    #What cmdlet can be used, other than Get-Help, to find and list other cmdlets?
get-command
    #Find the cmdlet that is used to prompt the user for input.
read-host -prompt "write your name"
_______________________________________________________________________________________________________
#####Practical Exercise: Running Cmdlets
    #Display a list of running processes.
ps
    #Display a list of all running processes that start with the letter "s".
ps "s*"
    #Find the cmdlet and its purpose for the following aliases
get-alias gal, dir, echo, ?, %, ft
    #Display a list of Windows Firewall Rules.
get-netfirewallrule
    #Create a new alias called "gh" for the cmdlet "Get-Help"
set-alias gh get-help
_______________________________________________________________________________________________________
#####Practical Exercise: Variables
    #Create a variable called "var1" that holds a random number between 25-50.
$var1= get-random -maximum 50 -minimum 25
    #Create a variable called "var2" that holds a random number between 1-10.
$var2= get-random -maximum 10 -minimum 1
invoke-expression $var2
    #Create a variable called "sum" that holds the sum of var1 and var2.
$sum = $var1 + $var2
    #Create a variable called "sub" that holds the difference of var1 and var2.
$sub = $var1 - $var2
    #Create a variable called "prod" that holds the product of var1 and var2.
$prod= $var1 * $var2 
    #Create a variable called "quo" that holds the quotient of var1 and var2.
$quo = $var1 / $var2
    #Replace the variables in text with their values in the following format: "var1" + "var2" = "sum"
"$var1 + $var2 = $sum"
    #Replace the variables in text with their values in the following format: "var1" - "var2" = "sub"
"$var1 - $var2 = $sum"
    #Replace the variables in text with their values in the following format: "var1" * "var2" = "prod"
"$var1 * $var2 = $prod"
    #Replace the variables in text with their values in the following format: "var1" / "var2" = "quo"
"$var1 / $var2 = $quo"

_______________________________________________________________________________________________________
#####Practical Exercise: The Pipeline
    #Display the start time of the earliest and latest running processes
ps | Sort-Object -Property starttime -ErrorAction SilentlyContinue| select -Skip 1 -first 1 -Last 1  | ft name, starttime
    #Identify a cmdlet that returns the current date and time then using this cmdlet and Select-object, display only the current day of the week
date | Select-object -Expandproperty DayOfWeek   
    #Extend the expression to sort the list by install date, and display only the install date and hotfix ID.
Get-HotFix | Sort-Object -Property Installedon | ft InstalledOn, hotfixid   
    #Extend the expression further, but this time sort by description, include description, hotfix ID, and install Date.
Get-HotFix | Sort-Object -Property Description | ft Description, installedon,hotfixid
_______________________________________________________________________________________________________
#####Practical Exercise: Reverse Arrays
    #Create an array containing a range with a random starting and stopping point. The starting point will be a random number from -10 through 0. The ending point will be a random number from 1 through 20.
$randArray=(Get-Random -Minimum -10 -Maximum 0)..(get-random -Minimum 1 -Maximum 20) 
    #Create a variable that contains the contents of the array in reverse
$revranarray = $randArray
[array]::Reverse($revranarray)
_______________________________________________________________________________________________________
#####Practical Exercise: Custom Object
    #Create a custom object that contains information about the host system using the following:
    #Win32_ComputerSystem    Win32_BIOS  Win32_OperatingSystem   Win32_LogicalDisk
    #Use the cmdlet Get-WmiObject to obtain the needed information

$myhost= New-Object object
$myhost | Add-Member NoteProperty -name ComputerName -Value (Get-WmiObject -Class Win32_ComputerSystem).name
$myhost | Add-Member NoteProperty -Name OperatingSystem -value (Get-WmiObject -Class Win32_operatingsystem).Caption 
$myhost | Add-Member NoteProperty -Name Version -value (Get-WmiObject -Class Win32_operatingsystem).version
$myhost | Add-Member NoteProperty -Name Manufacturer -va (Get-WmiObject -Class Win32_bios).manufacturer
$myhost | Add-Member NoteProperty -Name Disks -va (Get-WmiObject -Class Win32_logicalDisk).path
$myhost
_______________________________________________________________________________________________________
#####Practical Exercise: Arrays & Hash Tables
    #sing the following table of key-value pairs, apply each key-value to the empty hash tables.
$employee1 = [ordered]@{First='Mary'
                Last='Hopper'
                Id='001'
                Job='Software Developer'
                }
$employee2 = [ordered]@{First='John'
                Last='Williams'
                Id='002'
                Job='Web Developer'
                }
$employee1.Add('Username','mhopper001')
$employee2.Add('Username','jwilliams002')
$employee1.Job = 'Software Lead'
$employee3 =  @{First='Alex'
                Last='Moran'
                Id='003'
                Job='Software Developer'
                }
$employee1.Add('Status','Management')
$employee2.Add('Status','Interediate')
$employee3.Add('Status','Entry Level')
_______________________________________________________________________________________________________
#####Practical Exercise: Comparison and Condition
    #Find and extract the model number from the provided lines of text. If there isn’t a model number then display to the user that a model number wasn’t found
    #Check both lines for model numbers and report individually the line and model number if found.
$line1 = "Do you have model number: MT5437 for john.doe@sharklasers.com?"
$line2 = "What model number for john.doe@sharklasers.com?"
$pattern = '[A-Za-z]{2}\d{2,5}'

$line1,$line2 | ForEach-Object{
    if ($_ -match $pattern){
        write-host $matches[0]": $_"

    }else{
        Write-Host "No matches founded on $_"
    }
}
___________________________________________________________________________________________________
#####Practical Exercise: Looping & Iteration
    Part 3
    Use an array to iterate and open 
    Notepad
    MS Edge
    MSpaint
    Query the processes and display only the following information in order by process ID
    Process ID
    Process Name
    The time the process started
    The amount of time the process has spent on the processor
    The amount of memory assigned to the process
    
foreach ($app in "notepad", "msedge", "mspaint")
{
    Start $app
    ps $app | ft -Property id, name, starttime, TotalProcessorTime, VirtualMemorySize
    (ps $app).Id > procs.txt
    Stop-Process -Id (Get-Content procs.txt) -Force
}
_____________________________________________________________________________________________________
#####Practical Exercise: Create Functions   
    #
function Get-OrdinalDate(){
    Write-Host (Date -UFormat %Y-%j)
}
Get-OrdinalDate   
    #
function Get-SquareNum([float]$num1){    
    echo ($num1 * $num1)
}
Get-SquareNum 10  
    #
function Get-Product([int]$num1, [int]$num2, [int]$num3){   
    echo ($num1 * $num2 * $num3)
}
Get-Product 5 5 5
_____________________________________________________________________________________________________
#####Practical Exercise: Function Parameters
    #
function Get-Hypotenuse([int]$a, [int]$b ){
    $c=(($a * $a) + ($b * $b))
    $c=[Math]::Sqrt($c)
    Write-host $c 
}
Get-Hypotenuse 3 4  
    #
function Get-TriAngle([int]$a, [int]$b ){
    $c=(180 - ($a  + $b))
    Write-host $c 
}
Get-TriAngle 30 60    
    #
function Get-KgTolbs([parameter(Mandatory = $true)][string]$fname, [parameter(Mandatory = $true)][string]$lname, [parameter(Mandatory = $true)][int]$age, [parameter(Mandatory = $true)][float]$weight){
    $info= [ordered]@{"First Name" = $fname
                      "Last Name" = $lname
                       Age=$age
                      Weight=$weight    
                     }
    $info.Weight = [math]::Round(($weight * 2.2))
    echo $info
}
Get-KgTolbs Jeremy Valerio 19 97.0
_______________________________________________________________________________________________________
#####Practical Exercise: Regex
    #
function Get-Netinfo(){
    $ip= (ipconfig) -match "\s+IPv4 Address.*: ([\d\.]+)" 

    $subnet= (ipconfig /all) -match "\s+Subnet Mask .*: ([\d\.]+)"

    $gateway=(ipconfig /all) -match "\s+Default Gateway .*: ([\d\.]+)"
   

    Write-Host IP: $ip.trimStart("IPv4 Address. . . . . . . . . . . :")
    Write-host Subnet: $subnet.trimStart("Subnet Mask . . . . . . . . . . :")
    Write-Host Gateway: $gateway.trimStart("Default Gateway . . . . . . . . . . :")
}
Get-Netinfo
    #
    
    
______________________________________________________________________________________________________
function q($file,$line){
    $content = get-content $file
    foreach ($i in $content){
        if ($i.startswith($line)){
            return $i
        }
    }
    
    return $null
}


function q($arr){
    ##$arr is an array and need to be put together by a /
    return $arr -join('/')
}

function q(){

    return ps | sort -Property name -Descending
}

function q($arr,$rows,$cols,$key){
##look for the first look of key at index 0 and return the value at col index 9 of the same row
    foreach ($i in $arr){
        if($i[0] -eq $key){
            return $i[9]
        }
    }
return -1
}

function q(){
##PROVIDED ON THE PIPELINE ==== ADVANED
    Process{
        $sum = $Var1 + $Var2
    }
}

#CUSTOM DATE W/ -UFromat
$fmt = "%Y%m%d"
return Date -UFormat $fmt
________________________________________________________________________________________________
PRACT EXAM <# QUESTION 6 CHECKER IS BROKEN #>
________________________________________________________________________________________________
function q1($var1,$var2,$var3,$var4) {
    <# Return the product of the arguments #>
    return $var1*$var2*$var3*$var4
}
function q2($arr,$rows,$cols,$key) {
    <# Search the 2 dimensional array for the first occurance of key at column index 0
       and return the value at column index 9 of the same row.
       Return -1 if the key is not found.
    #>
    foreach ($i in $arr){
            if($i[0] -eq $key){
                return $i[9]
            }
        }
    return -1
}
function q3 {
    <# In a loop, prompt the user to enter positive integers one at time.
       Stop when the user enters a -1. Return the maximum positive
       value that was entered."
	#>
    $userinp = $true
    $maxnum= 0
    while($userinp){
        $cnum = Read-Host("Give a number")
        if ($maxnum -lt $cnum){
            $maxnum = $cnum
        }
        if($cnum -lt 0){
            $userinp = $false
        }
    }
    return $maxnum
}
function q4($filename,$whichline) {
    <# Return the line of text from the file given by the `$filename
	   argument that corresponds to the line number given by `$whichline.
	   The first line in the file corresponds to line number 0."
	#>
    $content = get-content $filename
      
    return $content[$whichline]
            
        
    }
function q5($path) {
    <# Return the child items from the given path sorted
       ascending by their Name
	#>
    return gci $path | sort -Property name 
}
function q6 {
    <# Return the sum of all elements provided on the pipeline
	#>
    Process{
            $sum = 0

            foreach($a in $input){
            $sum += $a
            }
        return $sum
        }
}
function q7 {
	<# Return only those commands whose noun is process #>
    return Get-Command -Noun process
}
function q8($adjective) {
    <# Return the string 'PowerShell is ' followed by the adjective given
	   by the `$adjective argument
	#>    
    return "PowerShell is " + $adjective 
}
function q9($addr) {
	<# Return `$true when the given argument is a valid IPv4 address,
	   otherwise return `$false. For the purpose of this function, regard
	   addresses where all octets are in the range 0-255 inclusive to
	   be valid.
	#>
    if ($addr -match '^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.?\b){4}$'){
    return $true
    }else{
    return $false
    }
}
function q10 ($filepath,$lasthash) {
    <# Return `$true if the contents of the file given in the
       `$filepath argument have changed since `$lasthash was
       computed. `$lasthash is the previously computed SHA256
       hash (as a string) of the contents of the file. #>
       if((Get-FileHash $filepath | select -ExpandProperty hash) -eq $lasthash){
        return $false
       }else{
       return $true
       }
}
