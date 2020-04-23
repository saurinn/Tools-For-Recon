#!/bin/bash

echo "Full update and upgrade..."
sudo apt-get -y update
sudo apt-get -y upgrade

Yellow='\033[1;33m'
Red='\033[1;31m'

sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y snapd
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full

# Instalar golang
if [[ -z "$GOPATH" ]];then
echo "Al parecer no tienes instalado go, quieres instalarlo ahora?..."
PS3="Seleciona una opcion:  "
opciones=("yes" "no")
select opcion in "${opciones[@]}"; do
        case $opcion in
        
                  yes)
                
                        echo "Instalando Golang"
			cd /tmp
                        wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
			sudo tar -xvf go1.13.4.linux-amd64.tar.gz
                        rm go1.13.3.linux-amd64.tar.gz
			sudo mv go /usr/local
			export GOROOT=/usr/local/go
			export GOPATH=$HOME/go
			export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
			echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
			echo 'export GOPATH=$HOME/go'	>> ~/.bashrc			
			echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc		            
			source ~/.bashrc
                        echo " Verificando que este todo en orden"
                        go version
			echo -e "\e[1;33m[+]\e[0m Instalacion exitosa..."
			sleep 1
			break
			;;		              
                        
                  no)
                  
                        echo "\e[1;33m[+]\e[0m Instala go y vuelve a correr el script (exiten tools en el script que estan escritas en go)"
			echo "\e[1;31m[+]\e[0m Abortando la instalacion..."
			sleep 2
			exit 1
			;;
	esac	
done
fi

                
# Carpeta de herramientas

mkdir ~/tools
cd ~/tools/

# Instalacion de tools

#Sublist3r
echo "\e[1;33m[+]\033[m Instalando Sublist3r..."
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
sudo pip install -r requirements.txt 
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"

#subfinder
echo "\e[1;33m[+]\033[m Instalando subfinder..."
go get -v github.com/projectdiscovery/subfinder/cmd/subfinder
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"

#aquatone
echo "\e[1;33m[+]\e[0m Instalando aquatone..."
go get github.com/michenriksen/aquatone
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"

#assetfinder
echo "\e[1;33m[+]\e[0m Instalando assetfinder..."
go get -u github.com/tomnomnom/assetfinder
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"


#amass
echo "\e[1;33m[+]\e[0m Instalando Amass..."
sudo snap install amass
export PATH=$PATH:/snap/bin
echo "export PATH=$PATH:/snap/bin" >> ~/.bashrc
echo -e "\e[1;33m[+]\e[0m Done"


#dirsearch
echo "\e[1;33m[+]\e[0m Instalando dirsearch..."
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"

#ffuz
echo "\e[1;33m[+]\e[0m Instalando ffuz..."
go get github.com/ffuf/ffuf
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"

#wfuzz
echo -e "\e[1;33m[+]\e[0m Instalando wfuzz..."
pip install wfuzz
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"

#masscan
echo -e "\e[1;33m[+]\e[0m Instalando masscan..."
sudo apt-get install git gcc make libpcap-dev
git clone https://github.com/robertdavidgraham/masscan
cd masscan* 
make -j8
mv bin/masscan /usr/local/bin
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"

#Linkfinder
echo -e "\e[1;33m[+]\e[0m Instalando LinkFinder..."
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
pip3 install -r requirements.txt
python setup.py install
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"

#waybackurls
echo -e "\e[1;33m[+]\e[0m Instalando waybackurls..."
go get github.com/tomnomnom/waybackurls
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"

#Arjun
echo -e "\e[1;33m[+]\e[0m Instalando Arjun..."
git clone https://github.com/s0md3v/Arjun.git
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"

#nmap
echo -e "\e[1;33m[+]\e[0m Instalando nmap..."
sudo apt-get install -y nmap
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"

#httprobe
echo -e "\e[1;33m[+]\e[0m Instalando httprobe..."
go get -u github.com/tomnomnom/httprobe 
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"

#findomain
echo -e "\e[1;33m[+]\e[0m Instalando findomain..."
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
mv findomain-linux findomain
chmod +x findomain
cd ~/tools/
echo -e "\e[1;33m[+]\e[0m Done"


#wordlists
mkdir ~/wordlists
cd ~/wordlists/

#Seclist
echo -e "\e[1;33m[+]\e[0m Instalando wordlists"
sleep 1
echo -e "\e[1;33m[+]\e[0m Seclists..."
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
#Este archivo corrompe massdns, se limpian las lineas que causan el problema
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/wordlists/
echo -e "\e[1;33m[+]\e[0m Done"


#fuzzdb
echo -e "\e[1;33m[+]\e[0m fuzzdb..."
git clone https://github.com/fuzzdb-project/fuzzdb.git --depth 1
cd ~/wordlists/
echo -e "\e[1;33m[+]\e[0m Done"

#all.txt jason haddix
echo -e "\e[1;33m[+]\e[0m all.txt de jhaddix..."
wget https://gist.github.com/jhaddix/f64c97d0863a78454e44c2f7119c2a6a
cd ~/wordlists/
echo -e "\e[1;33m[+]\e[0m Done"

echo -e "\e[1;33m[+]\e[0m\n\n\n\n\n\n\n\n\n\n\nScript completado!"


