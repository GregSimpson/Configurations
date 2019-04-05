
sudo rm /var/lib/dpkg/lock > /dev/null 2>&1

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install --upgrade alien
sudo apt-get -y install --upgrade cups-pdf
sudo apt-get -y install --upgrade curl
sudo apt-get -y install --upgrade dos2unix
sudo apt-get -y install --upgrade flashplugin-installer
sudo apt-get -y install --upgrade git

sudo apt-get -y install --upgrade nodejs
sudo apt-get -y install --upgrade node-gyp libssl1.0-dev
sudo apt-get -y install --upgrade libssl1.0-dev
sudo apt-get -y install --upgrade npm
sudo npm install -g --unsafe-perm node-red

sudo apt-get -y install --upgrade perl
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
pip install pydbgen

sudo apt -y autoremove
apt list --upgradeable
