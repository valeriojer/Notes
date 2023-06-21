PC1 Which program starts with every CMD and PowerShell instance in Windows 7 and later?
  Conhost.exe
2 What Windows 10 feature supports installing Linux subsystem?
  WSL
3 Which Windows feature can be used to interact with any CLI on the Windows system concurrently using multiple tabs?
  Window terminal
4 What was the default shell (command line) of Windows versions Windows 2000 through Windows 8.1?
  cmd.exe
5 What data type do all cmd.exe commands return?
  String
6 What framework is PowerShell built on?  
  NET
7 What will all of the below give you? $PSVersionTable.PSVersion
  powershell version
8 After PowerShell Core is installed what CLI command launches it?
  pwsh.exe
9 After PowerShell Core is installed you can still run the built in version of PowerShell side-by-side. What CLI command will launch the built in version?
  powershell.exe
PB1 What syntax do PowerShell cmdlets follow?
  verb and noun
2 What PS command will list all PowerShell cmdlets?
  get-command
3 What PowerShell command will list all verbs?
  get-verb
4 BASH commands output strings. PowerShell commands output what data type?
  object
5 All PowerShell objects are comprised of what two things? Flag format: things,things
  Properties, methods
6 what command will list all things that make up a PowerShell object?
  gm
PA1 
Get-CimInstance win32_service | where name -eq "legoland" | select name,description

dd if=/home/bombadil/mbroken bs=1 skip=446 count=16 | md5sum
