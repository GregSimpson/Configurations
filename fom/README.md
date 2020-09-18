# Configurations

AFTER you make copies of the original files ...

cp .bashrc ~

cp .bash_aliasas ~

cp .magicbutton_env ~


mkdir ~/bin

cp the files under THIS bin dir to ~/bin


##  As ROOT
ln -s ~<username>/.bash_aliases ~/.

ln -s ~<username>/.magicbutton_env ~/.


### Add this to the end of the ~/.bashrc file

if [ -f ~/.bash_aliases ]; then

    . ~/.bash_aliases

fi


if [ -f ~/.magicbutton_env ]; then

    . ~/.magicbutton_env

fi



