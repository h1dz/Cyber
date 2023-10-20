#!/bin/bash
clear
cd /
mkdir /home/kali
mkdir /usr/share/wordlists
cd /home/kali
sudo mkdir /home/kali/Tools; sudo mkdir /home/kali/Tools/web
mkdir /home/kali/bounty/; cd /home/kali/bounty/; mkdir /home/kali/bounty/LoginPortals/; mkdir /home/kali/bounty/UniqueEndpoints/; mkdir /home/kali/bounty/UploadPortals/ 
cd /usr/share/wordlists/; sudo wget -c https://github.com/danielmiessler/SecLists/archive/master.zip; sudo unzip -q master.zip; sudo rm -rf master.zip; sudo mv SecLists-master seclists
cd /home/kali/bounty; 
wget https://raw.githubusercontent.com/0xPugazh/fuzz4bounty/master/api.txt
wget https://raw.githubusercontent.com/0xPugazh/fuzz4bounty/master/cgi.txt
wget https://raw.githubusercontent.com/0xPugazh/fuzz4bounty/master/config.txt
wget https://raw.githubusercontent.com/0xPugazh/fuzz4bounty/master/conf.txt
cat cgi.txt api.txt /usr/share/seclists/Discovery/Web-Content/common.txt > quick0.txt | sort quick0.txt | uniq -u > dirsquick-bf.txt; rm -rf quick0.txt
cat cgi.txt api.txt /usr/share/wordlists/seclists/Discovery/Web-Content/raft-large-words.txt > dirs0.txt | sort dirs0.txt | uniq -u > dirs-bf.txt; rm -rf dirs0.txt cgi.txt api.txt
cat conf.txt config.txt /usr/share/seclists/Discovery/Web-Content/common.txt > quick2.txt | sort quick2.txt | uniq -u > filesquick-bf.txt; rm -rf quick2.txt
cat conf.txt config.txt /usr/share/wordlists/seclists/Discovery/Web-Content/raft-large-files.txt > filez.txt | sort filez.txt | uniq -u > files-bf.txt; rm -rf filez.txt conf.txt config.txt
cat /usr/share/wordlists/seclists/Fuzzing/XSS/XSS-With-Context-Jhaddix.txt /usr/share/wordlists/seclists/Fuzzing/XSS/XSS-OFJAAAH.txt /usr/share/wordlists/seclists/Fuzzing/XSS/XSS-Cheat-Sheet-PortSwigger.txt > xss1.txt | sort xss1.txt | uniq -u > XSSpayloads.txt; rm -rf xss1.txt 
cat /usr/share/wordlists/seclists/Fuzzing/LFI/LFI-LFISuite-pathtotest-huge.txt /usr/share/wordlists/seclists/Fuzzing/LFI/LFI-etc-files-of-all-linux-packages.txt /usr/share/wordlists/seclists/Fuzzing/LFI/LFI-Jhaddix.txt > lfi1.txt | sort lfi1.txt | uniq -u > LFIpayloads.txt; rm -rf lfi1.txt
cat /usr/share/wordlists/seclists/Fuzzing/SQLi/Generic-BlindSQLi.fuzzdb.txt /usr/share/wordlists/seclists/Fuzzing/SQLi/Generic-SQLi.txt /usr/share/wordlists/seclists/Fuzzing/SQLi/quick-SQLi.txt > sql1.txt | sort sql1.txt | uniq -u > SQLpayloads.txt; rm -rf sql1.txt
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install assetfinder -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install subfinder -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install sublist3r -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install arjun -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install jsbeautifier -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install chromium -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install jq -y
sudo apt-get -o DPkg::options::=--force-confdef -o DPkg::options::=--force-confold install ffuf -y
sudo pip install git+https://github.com/xnl-h4ck3r/urless.git
cd /$HOME/Tools/web
sudo git clone https://github.com/cramppet/SDBF; cd SDBF; sudo pip3 install -r requirements.txt; cd /$HOME/Tools/web
sudo git clone https://github.com/xnl-h4ck3r/xnLinkFinder.git; cd xnLinkFinder; sudo python setup.py install; cd /$HOME/Tools/web
sudo wget https://github.com/projectdiscovery/httpx/releases/download/v1.3.5/httpx_1.3.5_linux_amd64.zip; sudo unzip httpx_1.3.5_linux_amd64.zip; sudo rm -rf README.md LICENSE.md httpx_1.3.5_linux_amd64.zip
sudo wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip; sudo unzip aquatone_linux_amd64_1.7.0.zip; sudo rm -rf aquatone_linux_amd64_1.7.0.zip LICENSE.txt README.md 
sudo git clone https://github.com/GerbenJavado/LinkFinder.git; cd LinkFinder; sudo pip install jsbeautifier; sudo python setup.py install; cd /$HOME/Tools/web
sudo git clone https://github.com/m4ll0k/SecretFinder.git; cd SecretFinder; sudo pip install -r requirements.txt; cd /$HOME/Tools/web
sudo git clone https://github.com/1ndianl33t/Gf-Patterns
sudo git clone https://github.com/Dionach/CMSmap; cd CMSmap; sudo pip3 install .; cd /$HOME/Tools/web
sudo git clone https://github.com/lc/gau.git; cd gau; cd cmd; cd gau; sudo go build; sudo mv gau /usr/local/bin/; cd /home/kali/bounty
sudo cp /home/kali/Tools/web/Gf-Patterns/ssti.json .
sudo cp /home/kali/Tools/web/Gf-Patterns/ssrf.json .
sudo cp /home/kali/Tools/web/Gf-Patterns/rce.json .
sudo cp /home/kali/Tools/web/Gf-Patterns/sqli.json .
sudo cp /home/kali/Tools/web/Gf-Patterns/xss.json .
sudo cp /home/kali/Tools/web/Gf-Patterns/lfi.json .
sudo cp /home/kali/Tools/web/httpx .
sudo cp /home/kali/Tools/web/aquatone .
#NOW ADD my own payloads
echo "Add more payloads to these files from notion and encode them with URL encoding!"
rm -rf runeonce.sh
