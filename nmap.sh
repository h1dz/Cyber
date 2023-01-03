#!/bin/bash
GF='\033[5;32m' #${GF} 
G='\033[0;92m' #${G}  
Y='\033[0;33m' #${Y}
N='\033[0m'    #${N}
rm -rf NMAPscanTCPfull.txt 2>/dev/null
rm -rf NMAPscanTCPq.txt 2>/dev/null
rm -rf NMAPscanUDPq.txt 2>/dev/null
rm -rf NMAPscanUDPfull.txt 2>/dev/null
clear
tput bold; printf "${GF}IP = "$1
tput sgr0; printf " \n"
tput bold; printf "\n${Y}[+] Starting Quick TCP Scan at: ${N}" | tee -a -i NMAPscanTCPq.txt
date | tee -a -i NMAPscanTCPq.txt
sudo nmap -Pn -T5 --top-ports 5000 --min-rate 100 -n --open $1 --max-retries 1 --defeat-rst-ratelimit -oN NMAPscanTCPq.txt 2>/dev/null
clear 
tput bold; printf "${GF}IP = "$1
tput sgr0; printf " \n"
tput bold; printf "\n${G}[-] Quick TCP Scan Completed at: ${N}" | tee -a -i NMAPscanTCPq.txt
date | tee -a -i NMAPscanTCPq.txt
cat NMAPscanTCPq.txt
tput bold; printf "\n\n${Y}[+] Starting Full TCP Scan at: ${N}" | tee -a -i NMAPscanTCPfull.txt
date  | tee -a -i NMAPscanTCPfull.txt
tput sgr0; printf " \n"  | tee -a -i NMAPscanTCPfull.txt
ports1=$(sudo nmap -p- -T3 --open $1 | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//); sudo nmap -sC -sV -p$ports1 --script=vuln $1 -oN NMAPscanTCPfull.txt 2>/dev/null
clear 
tput bold; printf "${GF}IP = "$1
tput sgr0; printf " \n"
tput bold; printf "\n${G}[-] Full TCP Scan Completed at: ${N}" | tee -a -i NMAPscanTCPfull.txt
date  | tee -a -i NMAPscanTCPfull.txt
tput bold; printf "${Y}[+] Starting Quick UDP Scan at: ${N}"
date  | tee -a -i NMAPscanUDPq.txt
sudo nmap -sU -n --top-ports 5000 -T5 --open $1 --max-retries 1 --defeat-rst-ratelimit -oN NMAPscanUDPq.txt
clear 
tput bold; printf "${GF}IP = "$1
tput sgr0; printf " \n"
tput bold; printf "\n${G}[-] Quick UDP Scan Completed at: ${N}" | tee -a -i NMAPscanUDPq.txt
date  | tee -a -i NMAPscanUDPq.txt
tput bold; printf "\n\n${Y}[+] Starting Full UDP Scan at: ${N}" | tee -a -i NMAPscanUDPfull.txt
date  | tee -a -i NMAPscanUDPfull.txt
printf " \n"  | tee -a -i NMAPscanUDPfull.txt
ports3=$(sudo nmap -sU -p- -T5 --open $1 | grep ^[0-9] | cut -d '/' -f1 | tr '\n' ',' | sed s/,$//)
if [ -z "$ports3" ]
then
tput bold; printf "${G}[+] NMAP script complete! Displaying the full TCP results, no open UDP ports found:${N}"
sleep 2
clear
tput bold; printf "${GF}IP = "$1
tput sgr0; printf " \n"
cat NMAPscanTCPfull.txt
tput bold; printf "${GF}Run this scan again to confirm output!${N}"
sudo rm -rf NMAPscanUDPq.txt
exit 1
else
sudo nmap -sU -sV -p$ports3 --script=vuln $1 -oN NMAPscanUDPfull.txt 2>/dev/null
clear 
tput bold; printf "${GF}IP = "$1
tput sgr0; printf " \n"
tput bold; printf "\n${G}[-] Full UDP Scan Completed at: ${N}" | tee -a -i NMAPscanUDPfull.txt
date  | tee -a -i NMAPscanUDPfull.txt
tput bold; printf "${G}[+] NMAP script complete! Displaying the full TCP & UDP results:${N}"
sleep 2
clear
tput bold; printf "${GF}IP = "$1
tput sgr0; printf " \n"
cat NMAPscanTCPfull.txt
tput sgr0; printf " \n"
cat NMAPscanUDPfull.txt
tput bold; printf "\n${GF}Run this scan again to confirm output!${N}"
fi
