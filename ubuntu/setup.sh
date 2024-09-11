# perform system update
sudo apt update -y  && sudo apt upgrade -y
sudo apt-get dist-upgrade -y


# install media codecs
sudo apt install -y ubuntu-restricted-extras


# install tpl for battery performance
sudo apt-get install -y tlp tlp-rdw
sudo tlp start


# cleaning
sudo apt-get autoclean
sudo apt-get clean
sudo apt-get autoremove -y


## Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable


# enable mimize on click for dock
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'


# install gnoem shell extensions
sudo apt install -y chrome-gnome-shell


# gnome tweaks
sudo apt install -y gnome-tweaks


# install dev tools
sudo apt install -y git curl build-essential wget net-tools vim vim-gtk3 ssh xclip


## Flatpak support
# install flatpak
sudo apt-get install -y flatpak

# flatpak plugin for software store
sudo apt-get install -y gnome-software-plugin-flatpak

# adding  flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


# install gdebi
sudo apt install -y gdebi


# app image launcher
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update
sudo apt install -y appimagelauncher


## Homebrew installation
# requirments
sudo apt-get install -y build-essential curl file git ssh

# installation
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#Follow the Next steps instructions to add Homebrew to your PATH and to your bash shell rcfile, either ~/.bashrc for bash or ~/.zshrc for zsh.

test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc


## Terminal Configuration
# case insensitive tab completion
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi

echo 'set completion-ignore-case On' >> ~/.inputrc

#install tmux
sudo apt install -y tmux


# git configuration
git config --global user.name "vasanthanbdev"
git config --global user.email "vasanthanbdev@gmail.com"
git config --global init.defaultBranch 'main'
git config --global credential.helper store


## VSCode (APT)
sudo apt install -y software-properties-common apt-transport-https
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update -y
sudo apt install -y code

## C++
sudo apt-get update -y
sudo apt-get install -y gcc g++ build-essential

## Python
sudo apt-get install -y python3-pip build-essential libpq-dev libssl-dev libffi-dev python3-dev ipython3
pip install --upgrade pip

### NodeJS
sudo apt install -y nodejs npm

## MySQL
sudo apt-get install -y mysql-server
sudo mysql_secure_installation


## PostgreSQL
sudo apt install -y postgresql postgresql-contrib 
sudo systemctl start postgresql.service
sudo apt install -y postgresql-client 

# create user
sudo -u postgres createuser --interactive
sudo -u postgres createdb ${USER} -O ${USER}

# pgadmin
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install -y pgadmin4 


## Docker 
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt install -y docker-compose

# add user to docker group
sudo usermod -aG docker ${USER}

# Docker Desktop
cd Downloads
curl -fL -o docker-desktop-amd64.deb "https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64" & \ 
sudo apt-get install ./docker-desktop-amd64.deb


## SSh key generation
# generate key
ssh-keygen -t rsa -b 4096 -C "vasanthanbdev@gmail.com"

# add to key agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# copy the key to local machine
shh-copy-id ${USER}@$(hostname -I)

# authenticate using ssh key
ssh ${USER}@$(hostname -I)


## Install Snap Packages
# Obsidian
sudo snap install -y obsidian --classic
