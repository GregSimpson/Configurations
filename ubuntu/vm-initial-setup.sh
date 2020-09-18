
#! /bin/bash

## IF guest additions didnt load - do this - after the initial 'load gueat' attempt
##  the failure might say something like:
##   "Please install the gcc make perl ..."
#sudo apt install -y build-essential dkms linux-headers-generic
#sudo rcvboxadd setup


BIN_DIR=~/bin
GIT_DIR=~/git_stuff
CLONE_DIR=${GIT_DIR}/Configurations/ubuntu
GIT_UBUNTU=${GIT_DIR}/Configurations/ubuntu
REMEMBER_DIR=${BIN_DIR}/reminders

# sudo apt install git
#mkdir -p ${GIT_DIR}
#cd  ${GIT_DIR}
#git clone https://github.com/GregSimpson/Configurations.git
#cd ${GIT_UBUNTU}

# add aliases - only run this once
cp ~/.bashrc ~/.bashrc-orig
###cat .cat_this_into_bashrc >> ~/.bashrc
cp .bash_aliases ~/.

mkdir -p ${REMEMBER_DIR}
touch ${REMEMBER_DIR}/.remember

cp ${CLONE_DIR}/recall ${BIN_DIR}
cp ${CLONE_DIR}/store ${BIN_DIR}
cp ${CLONE_DIR}/update ${BIN_DIR}

source ${CLONE_DIR}/../git-credentials.sh
source ~/.bashrc
