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
   
