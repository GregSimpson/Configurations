#! /bin/sh
alias firefox='/cygdrive/c/Program\ Files\ \(x86\)/Mozilla\ Firefox/firefox.exe'

if (echo $1 | egrep --silent "^file:///") then
    # the file exists in the local machine
    PATH_OF_LOCAL_FILE=`echo $1 | sed 's/file:\/\///'`;
    URL=file:///`cygpath --mixed $PATH_OF_LOCAL_FILE `
elif (echo $1 | egrep --silent "^file://[^/]") then
    # the file exists in the remote machine on network
    PATH_OF_REMOTE_FILE=`echo $1 | sed 's/file://'`;
    URL=file:///`cygpath --mixed $PATH_OF_REMOTE_FILE `
else
    URL=$1
fi

#firefox -remote 'OpenURL('$URL',new-tab)'

firefox -new-tab $URL &

# C:/Program\ Files/Mozilla\ Firefox/firefox.exe -new-window https://pioneerweb.du.edu
# sleep 20
# C:/Program\ Files/Mozilla\ Firefox/firefox.exe -new-tab https://outlook.office365.com
# #/usr/bin/sleep 5
# #C:/Program\ Files/Mozilla\ Firefox/firefox.exe -new-tab https://library.du.edu
# #C:/Program\ Files/Mozilla\ Firefox/firefox.exe -new-tab https://du.edu/pioneercareers
# #C:/Program\ Files/Mozilla\ Firefox/firefox.exe -new-tab https://canvas.du.edu
