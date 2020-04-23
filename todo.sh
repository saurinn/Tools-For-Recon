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
                        echo "verificando que este todo en orden"
                        go version
					              sleep 1
					              break
					              ;;
                        
                  no)
                  
                        echo "\033[1;33m[+]\033[m Instala go y vuelve a correr el script (exiten tools en el script que estan escritas en go)"
					              echo "\033[1;33m[+]\033[m Abortando la instalacion..."
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
echo "\033[1;33m[+]\033[m Instalando Sublist3r..."
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
sudo pip install -r requirements.txt 
cd ~/tools/
echo "\033[1;33m[+]\033[m Done"

#subfinder
echo "\033[1;33m[+]\033[m Instalando subfinder"
go get -v github.com/projectdiscovery/subfinder/cmd/subfinder
cd ~/tools/
echo "\033[1;33m[+]\033[m Done"

#aquatone
echo "\033[1;33m[+]\033[m Instalando aquatone"
go get github.com/michenriksen/aquatone
cd ~/tools/
echo "\033[1;33m[+]\033[m Done"

#


