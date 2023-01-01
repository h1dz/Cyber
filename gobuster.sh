#!/bin/bash
#Usage: ./gobuster.sh http://<url/ip> <extenstions> #extensions are optional
rm -rf GobusterExt_scan.txt Gobusterscan.txt 2>/dev/null
clear
B='\033[0;96m' #${B}
GF='\033[5;32m' #${GF}  
R='\033[0;91m' #${R}
N='\033[0m'    #${N}
tput bold; printf "${GF}Directory = "$1
tput bold; printf "${B}\n\n[+] Directory Brute-forcing Started with Gobuster at: ${N}"
date 
printf "\n\n"
if [ $# -eq 0 ]; then
    echo "Usage: ./gobuster.sh http://<url/ip> <extenstions> (Extensions to try: .php,.html.log,.txt,.sh,.asp,.aspx,.bak,.py)"
    exit 1
fi

for f in /usr/share/wordlists/dirb/common.txt /usr/share/wordlists/dirb/big.txt /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt /usr/share/wordlists/seclists/Discovery/Web-Content/raft-large-directories-lowercase.txt
do
tput setaf 6; echo "--------------------------------------------------------------------------------------------------------------"
  tput bold; echo "Wordlist: " $f
  tput bold; echo "Extensions: " $2; tput sgr0;
  if [ -z "$2" ]; then
    gobuster dir -q -f -k -e --url $1 --wordlist $f -s 200,204,301,302,307,401,403,303 2>/dev/null | tee -a -i Gobusterscan.txt
  else
    gobuster  dir -q -f -k -e --url $1 --wordlist $f -s 200,204,301,302,307,401,403,303 -x $2 | tee -a -i GobusterExt_scan.txt
fi
done
clear
tput bold; printf "${GF}\n\n[+] Directory Brute-forcing Completed at: ${N}"
date
printf "\n\n"
cat Gobusterscan.txt 2>/dev/null
cat GobusterExt_scan.txt 2>/dev/null
