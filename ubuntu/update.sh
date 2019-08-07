
# https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04


sudo rm /var/lib/dpkg/lock > /dev/null 2>&1
sudo rm /var/lib/dpkg/lock-frontend > /dev/null 2>&1

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install --upgrade alien
sudo apt-get -y install --upgrade cups-pdf
sudo apt-get -y install --upgrade curl
sudo apt-get -y install --upgrade docker.io
sudo apt-get -y install --upgrade dos2unix
sudo apt-get -y install --upgrade flashplugin-installer
sudo apt-get -y install --upgrade git

sudo apt-get -y install --upgrade openjdk-11-jdk

sudo apt-get -y install --upgrade libssl1.0-dev
sudo apt-get -y install --upgrade libcanberra-gtk-module
sudo apt-get -y install --upgrade mongodb-clients
sudo apt-get -y install --upgrade net-tools
sudo apt-get -y install --upgrade nodejs
sudo apt-get -y install --upgrade node-gyp
sudo apt-get -y install --upgrade npm

sudo apt-get -y install --upgrade perl
sudo apt-get -y install --upgrade postgresql
sudo apt-get -y install --upgrade postgresql-contrib
sudo apt-get -y install --upgrade putty
sudo apt-get -y install --upgrade python-virtualenv python-pip
sudo apt-get -y install --upgrade rpm
sudo apt-get -y install --upgrade unity-tweak-tool
sudo apt-get -y install --upgrade vim-gtk
sudo apt-get -y install --upgrade virtualbox-guest-dkms

# https://www.howtoopensource.com/2011/05/installation-of-virtualenv-in-linux
sudo apt-get -y install python-setuptools
# sudo easy_install virtualenv

## create a virtualenv with
# virtualenv -p python python3 <somename>
## launch a virtualenv with
# source ~/bin/<somename>/bin/activate
## stop a virtualenv
# deactivate

# pip stuff here
#pip install pydbgen

# mongodb install steps here
#  from : https://www.howtoforge.com/tutorial/install-mongodb-on-ubuntu/
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 68818C72E52529D4
# sudo echo "deb http://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
#sudo apt-get -y install --upgrade  mongodb-org
# sudo systemctl start mongod
# sudo systemctl enable mongod
# sudo netstat -plntu
sudo npm install -g -y nodemon

npm install mongoose --save
npm install body-parser --save

sudo npm install -g node-red
#sudo npm install -g --unsafe-perm node-red
sudo npm install -g node-red-node-mongodb



sudo apt -y autoremove
apt list --upgradeable
