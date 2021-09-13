#!/bin/bash
#Simple scan for enumerating a web server
#Rename to fullscan.sh 
#chmod +x fullscan.sh
#Usage:          ./fullscan.sh <ip>

B='\033[0;96m' #${B}
G='\033[0;92m' #${G}
R='\033[0;91m' #${R}
Y='\033[0;33m' #${Y}
N='\033[0m'    #${N}


echo ${Y}'IP = '$1 >> scanresults
date >> scanresults
printf "${N}\n----------------------------------Start----------------------------------\n\n${B}" >> scanresults
printf "\n----------------------------------nmap quick----------------------------------\n\n${G}" >> scanresults
printf "${N}\nScanning...\n\n${G}"
nmap -sC -sV $1 >> scanresults
cat scanresults
echo ${Y}"1/15 Completed" >> scanresults
printf "${B}\n----------------------------------banner----------------------------------\n\n${G}" >> scanresults
curl -I  $1 >> scanresults
echo ${Y}"2/15 Completed" >> scanresults
printf "${B}\n----------------------------------nmap vuln----------------------------------\n\n${R}" >> scanresults
sudo nmap -sC -sV --script vuln $1 >> scanresults
echo ${Y}"3/15 Completed" >> scanresults
printf "${B}\n----------------------------------gobuster----------------------------------\n\n${G}" >> scanresults
gobuster dir -e -u http://$1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -q >> scanresults
gobuster vhost -w /usr/share/secLists/Discovery/DNS/subdomains-top1million-20000.txt -u $1 >> scanresults
cat scanresults
echo ${Y}"4/15 Completed" >> scanresults
printf "${B}\n----------------------------------robots----------------------------------\n\n${R}" >> scanresults
sudo curl http://$1/robots.txt >> scanresults
echo ${Y}"5/15 Completed" >> scanresults
printf "${B}\n----------------------------------wpscan----------------------------------\n\n${G}" >> scanresults
wpscan --url http://$1 -e u >> scanresults 
echo ${Y}"6/15 Completed" >> scanresults
printf "${B}\n----------------------------------whatweb----------------------------------\n\n${G}" >> scanresults
whatweb $1 >> scanresults
echo ${Y}"7/15 Completed" >> scanresults
printf "${B}\n----------------------------------file upload----------------------------------\n\n${R}" >> scanresults
curl -X PUT -d @test.txt $1/test.txt -vv >> scanresults
curl -X GET $1/test.txt >> scanresults
echo ${Y}"8/15 Completed" >> scanresults
printf "${B}\n----------------------------------sqlmap----------------------------------\n\n${R}" >> scanresults
sqlmap -u http://$1 --forms --dump --batch >> scanresults
echo ${Y}"9/15 Completed" >> scanresults
printf "${B}\n----------------------------------SQLi----------------------------------\n\n${R}" >> scanresults
python3 dsss.py -u $1 >> scanresults
echo ${Y}"10/15 Completed" >> scanresults
printf "${B}\n----------------------------------Mysql root----------------------------------\n\n${R}" >> scanresults
mysql -h $1 -u root  >> scanresults 
echo ${Y}"11/15 Completed" >> scanresults
printf "${B}\n----------------------------------nikto----------------------------------\n\n${G}" >> scanresults
nikto -h $1 >> scanresults
cat scanresults
echo ${Y}"12/15 Completed" >> scanresults
if nc -w1 -z $1 445; then
printf "${B}\n----------------------------------SMB enum----------------------------------\n\n${R}" >> scanresults
smbclient -N -L //$1 >> scanresults
nmap -p 139,445 --script=smb-enum-shares.nse,smb-enum-users.nse $1 >> scanresults
crackmapexec smb $1 --shares >> scanresults
smbclient \\\\$1\\wwwroot >> scanresults
smbget -R smb://$1/anonymous >> scanresults
cat scanresults
echo ${Y}"13/15 Completed" >> scanresults
else
  echo "Port 445 is closed" >> scanresults
fi
printf "${B}\n----------------------------------nmap UDP----------------------------------\n\n${G}" >> scanresults
sudo nmap -sU $1 >> scanresults
echo ${Y}"14/15 Completed" >> scanresults
printf "${B}\n----------------------------------nmap full----------------------------------\n\n${G}" >> scanresults
nmap -sV -p- $1 >> scanresults
echo ${Y}"15/15 Completed" >> scanresults
printf "${B}\n----------------------------------Finished----------------------------------\n\n" >> scanresults
echo "Check Source Code of webpage" >> scanresults
echo "Check request through Burp" >> scanresults
echo "Check CMS" >> scanresults
echo "Enumerate Domain" >> scanresults
clear
cat scanresults
