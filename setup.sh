#!/bin/bash
#Very buggy script | most likely needs to be ran a couple of times and require user input to restart services | 
#I use this to auto install all the tools and setup when making a new Kali VM.
cd /home/kali/
sudo rm -rf Documents/ Videos/ Pictures/ Music/ Templates/ Public/ Desktop/ 2>/dev/null
sudo mkdir Tools
mkdir home
sudo apt remove needrestart -y
sudo apt-get update -y 
sudo apt-get upgrade -y
sudo apt-get install gedit -y
sudo apt-get install rlwrap -y
sudo gem install haiti-hash -y
sudo apt-get install fcrackzip -y
sudo apt-get install gobuster -y
sudo apt-get install evil-winrm -y
sudo apt-get install wpscan -y
sudo apt-get install nikto -y
sudo apt-get install dirsearch -y
sudo apt-get install python3-pip -y
sudo apt-get install amap -y
sudo apt-get install nishang -y
sudo apt-get install docker.io -y
sudo apt-get install feroxbuster -y
sudo apt-get install subfinder -y
sudo apt-get install neo4j -y
sudo apt-get install bloodhound -y  #maybe cause
sudo apt-get install libreoffice-common -y
sudo apt-get install libreoffice-writer -y
sudo apt install kali-wallpapers-all
sudo searchsploit -u
sudo nmap --script-updatedb
sudo apt-get install golang -y
echo "export GOROOT=/usr/lib/go" >> /home/kali/.bashrc
echo "export GOPATH=$HOME/go" >> /home/kali/.bashrc
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> /home/kali/.bashrc
echo "export GOROOT=/usr/lib/go" >> /home/kali/.zshrc
echo "export GOPATH=$HOME/go" >> /home/kali/.zshrc
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> /home/kali/.zshrc
cd /usr/share/wordlists/
sudo wget -c https://github.com/danielmiessler/SecLists/archive/master.zip; sudo unzip master.zip; sudo rm -rf master.zip; sudo mv SecLists-master seclists
sudo gzip -d rockyou.txt.gz
cd /home/kali/Tools/
mkdir web
mkdir linux
mkdir windows
cd windows; sudo mkdir AD
cd /home/kali/Tools/linux
wget https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh
wget https://raw.githubusercontent.com/Anon-Exploiter/SUID3NUM/master/suid3num.py --no-check-certificate && chmod 777 suid3num.py
wget https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh
wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh
wget https://github.com/secnigma/CVE-2021-3560-Polkit-Privilege-Esclation/blob/main/poc.sh; mv poc.sh polkit.sh
wget https://raw.githubusercontent.com/Arinerron/CVE-2022-0847-DirtyPipe-Exploit/main/exploit.c; mv exploit.c dirtypipe.c
wget https://raw.githubusercontent.com/FireFart/dirtycow/master/dirty.c; mv dirty.c dirtycow.c
wget https://raw.githubusercontent.com/diego-treitos/linux-smart-enumeration/master/lse.sh; mv lse.sh LinuxSmartEnum.sh
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64 -O pspy64
wget https://github.com/jpillora/chisel/releases/download/v1.7.3/chisel_1.7.3_linux_amd64.gz -O chisel_linux.gz && gunzip -d *.gz && chmod +x chisel_linux
cd /home/kali/Tools/windows/AD
git clone https://github.com/Ridter/noPac
git clone https://github.com/harshil-shah004/zerologon-CVE-2020-1472.git
wget https://raw.githubusercontent.com/61106960/adPEAS/main/adPEAS.ps1
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -O kerbrute && chmod +x kerbrute
wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.ps1 -O SharpHound.ps1
wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.exe -O SharpHound.exe
git clone https://github.com/fox-it/BloodHound.py.git; cd BloodHound.py/ && pip install .
cd /home/kali/Tools/web
git clone https://github.com/stamparm/DSSS.git
git clone https://github.com/Tuhinshubhra/CMSeeK
wget https://raw.githubusercontent.com/SecureAuthCorp/impacket/master/examples/mssqlclient.py
git clone https://github.com/s0md3v/XSStrike
git clone https://github.com/dievus/msdorkdump.git
cd /home/kali/home/
wget https://raw.githubusercontent.com/h1dz/h1dz/Scripts/nmap.sh; chmod +x NmapScan.sh
wget https://raw.githubusercontent.com/h1dz/h1dz/Scripts/masscan.sh; chmod +x masscan.sh
wget https://raw.githubusercontent.com/h1dz/h1dz/Scripts/vhosts.sh; chmod +x Vhosts.sh
wget https://raw.githubusercontent.com/h1dz/h1dz/Scripts/ping.sh; chmod +x gobuster.sh; mv gobuster.sh go.sh
wget https://raw.githubusercontent.com/h1dz/h1dz/Scripts/gobuster.sh; chmod +x ping.sh
cd /home/kali/Tools/windows/
wget https://github.com/h1dz/Windows-Tools/raw/master/mimikatz.exe -O mimikatz.exe
wget https://github.com/jpillora/chisel/releases/download/v1.7.3/chisel_1.7.3_windows_amd64.gz -O chisel_windows.gz && gunzip -d *.gz && chmod +x chisel_windows
wget https://github.com/carlospolop/PEASS-ng/releases/download/20220203/winPEASx64.exe -O winPEASx64.exe
wget https://github.com/ohpe/juicy-potato/releases/download/v0.1/JuicyPotato.exe -O JuicyPotato.exe
wget https://github.com/antonioCoco/RoguePotato/releases/download/1.0/RoguePotato.zip -O RoguePotato.zip && unzip RoguePotato.zip && rm -rf RoguePotato.zip
wget https://github.com/int0x33/nc.exe/raw/master/nc64.exe -O nc64.exe
cd /home/kali/
echo "alias ipa='ip -br addr show'" >> /home/kali/bash_aliases
echo "alias lll='ls -la --color=auto'" >> /home/kali/bash_aliases
echo "alias scan='sudo /home/kali/home/NmapScan.sh $1'" >> /home/kali/bash_aliases
echo "alias mass='sudo /home/kali/home/masscan.sh $1'" >> /home/kali/bash_aliases
echo "alias s='searchsploit'" >> /home/kali/bash_aliases
echo "alias ncl='sudo rlwrap nc -lvnp 443'" >> /home/kali/bash_aliases
echo "alias home='cd /home/kali/home'" >> /home/kali/bash_aliases
echo "alias tools='cd /home/kali/Tools'" >> /home/kali/bash_aliases
echo "alias pys='sudo python3 -m http.server 80'" >> /home/kali/bash_aliases
echo "alias rmv='sudo rm -rf hash id_rsa exploit.py exploit.sh hash.txt user.txt pass.txt names.txt name.txt sharesSMB.txt smbResults ports3.txt ports2.txt ports1.txt ports0.txtnmap.txt masscan4.txt masscan3.txt masscan2.txt masscan1.txt Gobusterscan.txt GobusterExt_DUMP.txt Gobuster_DUMP.txt'" >> /home/kali/bash_aliases
echo "alias go='sudo /home/kali/home/go.sh $1'" >> /home/kali/bash_aliases
echo "alias drs1='dirsearch -w /usr/share/wordlists/dirb/common.txt -f -r --random-agent --full-url -u $1'" >> /home/kali/bash_aliases
echo "alias drs2='dirsearch -w /usr/share/wordlists/dirb/big.txt -f -r --random-agent --full-url -u $1'" >> /home/kali/bash_aliases
echo "alias gb='gobuster dir -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -k -e -q -f -x php,html,txt -u http://$1'" >> /home/kali/bash_aliases
echo "alias ipa='ip -br addr show'" >> /home/kali/.bash_aliases
echo "alias lll='ls -la --color=auto'" >> /home/kali/.bash_aliases
echo "alias scan='sudo /home/kali/home/NmapScan.sh $1'" >> /home/kali/.bash_aliases
echo "alias mass='sudo /home/kali/home/masscan.sh $1'" >> /home/kali/.bash_aliases
echo "alias s='searchsploit'" >> /home/kali/.bash_aliases
echo "alias ncl='sudo rlwrap nc -lvnp 443'" >> /home/kali/.bash_aliases
echo "alias home='cd /home/kali/home'" >> /home/kali/.bash_aliases
echo "alias tools='cd /home/kali/Tools'" >> /home/kali/.bash_aliases
echo "alias pys='sudo python3 -m http.server 80'" >> /home/kali/.bash_aliases
echo "alias rmv='sudo rm -rf hash id_rsa exploit.py exploit.sh hash.txt user.txt pass.txt names.txt name.txt sharesSMB.txt smbResults ports3.txt ports2.txt ports1.txt ports0.txtnmap.txt masscan4.txt masscan3.txt masscan2.txt masscan1.txt Gobusterscan.txt GobusterExt_DUMP.txt Gobuster_DUMP.txt'" >> /home/kali/.bash_aliases
echo "alias go='sudo /home/kali/home/go.sh $1'" >> /home/kali/.bash_aliases
echo "alias drs1='dirsearch -w /usr/share/wordlists/dirb/common.txt -f -r --random-agent --full-url -u $1'" >> /home/kali/.bash_aliases
echo "alias drs2='dirsearch -w /usr/share/wordlists/dirb/big.txt -f -r --random-agent --full-url -u $1'" >> /home/kali/.bash_aliases
echo "alias gb='gobuster dir -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -k -e -q -f -x php,html,txt -u http://$1'" >> /home/kali/.bash_aliases
echo "alias ipa='ip -br addr show'" >> /home/kali/.zshrc
echo "alias lll='ls -la --color=auto'" >> /home/kali/.zshrc
echo "alias scan='sudo /home/kali/home/NmapScan.sh $1'" >> /home/kali/.zshrc
echo "alias mass='sudo /home/kali/home/masscan.sh $1'" >> /home/kali/.zshrc
echo "alias s='searchsploit'" >> /home/kali/.zshrc
echo "alias ncl='sudo rlwrap nc -lvnp 443'" >> /home/kali/.zshrc
echo "alias home='cd /home/kali/home'" >> /home/kali/.zshrc
echo "alias tools='cd /home/kali/Tools'" >> /home/kali/.zshrc
echo "alias pys='sudo python3 -m http.server 80'" >> /home/kali/.zshrc
echo "alias rmv='sudo rm -rf hash id_rsa exploit.py exploit.sh hash.txt user.txt pass.txt names.txt name.txt sharesSMB.txt smbResults ports3.txt ports2.txt ports1.txt ports0.txt nmap.txt masscan4.txt masscan3.txt masscan2.txt masscan1.txt Gobusterscan.txt GobusterExt_DUMP.txt Gobuster_DUMP.txt'" >> /home/kali/.zshrc
echo "alias go='sudo /home/kali/home/go.sh $1'" >> /home/kali/.zshrc
echo "alias drs1='dirsearch -w /usr/share/wordlists/dirb/common.txt -f -r --random-agent --full-url -u $1'" >> /home/kali/.zshrc
echo "alias drs2='dirsearch -w /usr/share/wordlists/dirb/big.txt -f -r --random-agent --full-url -u $1'" >> /home/kali/.zshrc
echo "alias gb='gobuster dir -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -k -e -q -f -x php,html,txt -u http://$1'" >> /home/kali/.zshrc
xfconf-query -c xsettings -p /Net/IconThemeName -s Flat-Remix-Blue-Dark
xfconf-query -c xsettings -p /Net/ThemeName -s Kali-Dark
xfconf-query -c xfwm4 -p /general/theme -s Kali-Dark
gsettings set org.xfce.mousepad.preferences.view color-scheme Kali-Dark
source .bash_aliases
source bash_aliases
source .zshrc
clear
tput setaf 5; echo "Download Wallpaper: https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/e72f0c31-73e4-4a4c-a550-1bbec53d1629/d9ljjpq-79dc7f0f-6cd0-459d-9f86-fb5d286da4f3.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2U3MmYwYzMxLTczZTQtNGE0Yy1hNTUwLTFiYmVjNTNkMTYyOVwvZDlsampwcS03OWRjN2YwZi02Y2QwLTQ1OWQtOWY4Ni1mYjVkMjg2ZGE0ZjMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.2wtQoOz65L45Vd0g_NqXVLNxK-3ZruP8181vmINxA0o"
tput setaf 3; printf "\n\nUpdates Complete!"
sudo rm -rf setup.sh 2>/dev/null
