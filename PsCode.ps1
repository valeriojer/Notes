#Display the start time of the earliest and latest running processes
  ps | Sort-Object -Property starttime -ErrorAction SilentlyContinue| select -Skip 1 -first 1 -Last 1  | ft name, starttime
#Identify a cmdlet that returns the current date and time then using this cmdlet and Select-object, display only the current day of the week
  date | Select-object -Expandproperty DayOfWeek
#Extend the expression to sort the list by install date, and display only the install date and hotfix ID.
  Get-HotFix | Sort-Object -Property Installedon | ft InstalledOn, hotfixid
#Extend the expression further, but this time sort by description, include description, hotfix ID, and install Date.
  Get-HotFix | Sort-Object -Property Description | ft Description, installedon,hotfixid
  
   
