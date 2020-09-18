# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
## Default to human readable figures
#alias df='df -h'
#alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias l='ls -CF'                              #
alias ls='ls -hF --color=tty'                 # classify files in colour
alias ll='ls -l'                              # long list
alias lA='ls -A'                              # all but . and ..
alias la='ls -a'

# my stuff
alias icCallmeAnalyticsController='cp "C:\Users\eloy98104\OneDrive - TeleTech Holdings, Inc\git_branch_storage\portal\FrontEnd\22761_bug_am_ftp_test\portal\src\main\java\com\ttec\prototype\icCallmeAnalyticsController.java" "C:\gjs\git_stuff\portal\FrontEnd\portal\src\main\java\com\ttec\prototype\IcCallmeAnalyticsController.java" ; git status'
alias b='cd ..'
alias backend='cd /cygdrive/c/gjs/git_stuff/portal/BackEnd; idea64 pom.xml &'
alias bashalias='gvim c:/cygwin64/home/eloy98104/.bash_aliases'
alias ides='frontend ; backend'
alias escrow='cd "C:/Users/eloy98104/OneDrive - TeleTech Holdings, Inc/PortalProject/externalDeliverables/escrow"'
alias frontend='cd /cygdrive/c/gjs/git_stuff/portal/FrontEnd; idea64 pom.xml &'
alias findjava='grep -r "services" --include=*.java . --exclude=Test*.java'
#alias findall=' grep -wrl "Server Name" --include=*.java --include=*.js --include=*.jsp --include=*.prop* --exclude-dir=target .'
alias flow='pushd /cygdrive/c/cygwin64/home/eloy98104/.node-red'
alias gitBranch='git clone --single-branch --branch develop https://github.com/humanifydev/HIP-Ops.git'
#alias gitDevelop='git reset --hard origin/develop; git status'
alias gitDevelop='git reset --hard origin/develop; git status'
alias gitDevelopFE='git reset --hard origin/develop; gitTmpPom; git status'
#alias gitDevelop='git reset --hard origin/develop; gitTmpPom; git status'
alias gitTmpPom='cp /cygdrive/c/gjs/git_stuff/portalFE-pom.xml /cygdrive/c/gjs/git_stuff/portal/FrontEnd/pom.xml'
alias gitStatus='git status|grep -v icCallMe-CLI'
alias gjs='cd /cygdrive/c/gjs'
alias home='cd /cygdrive/c/cygwin64/home/eloy98104'
alias tomcat_logs='cd /cygdrive/c/Users/eloy98104/AppData/Local/JetBrains/IntelliJIdea2020.2/tomcat/Unnamed_FrontEndProjects/logs'
alias wildfly_logs='cd /cygdrive/c/gjs/wildfly/wildfly-19.1.0.Final/standalone/log'
#alias ides='cd /cygdrive/c/gjs/git_stuff/portal/FrontEnd; idea64 pom.xml &; cd /cygdrive/c/gjs/git_stuff/portal/BackEnd; idea64 pom.xml &'
alias oned='cd "C:/Users/eloy98104/OneDrive - TeleTech Holdings, Inc/PortalProject"'
alias reminder='gvim c:/gjs/bin/reminders/.remember'

## GIT aliases
alias gs='git status '
alias ga='git add '
alias gaa='git add -A '
alias gb='git branch '
alias gc='git commit '
alias gcm='git commit -m '
alias gd='git diff origin/develop'
alias git_current_branch=' rev-parse --abbrev-ref HEAD'
alias gm='git merge origin/develop'
alias go='git checkout '

alias mvnd='mvn dependency:tree -Dverbose > deptree; more deptree'
alias portalBE='mvn clean install -Dmaven.test.skip=true'
alias portalFE='mvn clean package -Dmaven.test.skip=true'


##### https://www.tldp.org/LDP/abs/html/sample-bashrc.html

# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'


alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.

alias mypsql='psql -U postgres -p 5432'
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

#-------------------------------------------------------------
# Spelling typos - highly personnal and keyboard-dependent :-)
#-------------------------------------------------------------

alias xs='cd'
alias vf='cd'
alias moer='more'
alias moew='more'
alias kk='ll'

#-------------------------------------------------------------
# A few fun ones
#-------------------------------------------------------------

# example with a cmd line arg
myfunction() {
    #do things with parameters like $1 such as
    mv "$1" "$1.bak"
    cp "$2" "$1"
}

# grep for a string
#alias findall=' grep -wrl "Server Name" --include=*.java --include=*.js --include=*.jsp --include=*.prop* --exclude-dir=target .'
#alias findjava='grep -r "services" --include=*.java . --exclude=Test*.java'
##findall() {
##	findme="$1"
##	#grep -wrl "$findme" --include=*.java --include=*.xml --include=*.js --include=*.jsp --include=*.html --include=*.prop* --include=*.sql --exclude-dir=target .
##	grep -wrl "$findme" --include=*.java --include=*.xml --include=*.js --include=*.jsp --include=*.html --include=*_en.*  --include=*.prop* --include=*.sql --exclude-dir=target --exclude-dir=dist .
##}

FIND_TARGET_INCLUDES="--include=*.java --include=*.xml --include=*.js --include=*.jsp --include=*.html --include=*_en.* --include=*.prop* --include=*.sql "
FIND_TARGET_EXCLUDES=" --exclude-dir=target --exclude-dir=dist --exclude-dir=.idea --exclude-dir=test --exclude-dir=node "
#FIND_TARGET_EXCLUDES="  --exclude-dir=dist --exclude-dir=.idea --exclude-dir=test --exclude-dir=node "
FIND_TARGET_STARTDIR=" ."
findfiles() {
	findme="$1"
	#clear; grep -irl "$findme" ${FIND_TARGET_INCLUDES} ${FIND_TARGET_EXCLUDES} ${FIND_TARGET_STARTDIR} | more
	clear; grep -wrl "$findme" ${FIND_TARGET_INCLUDES} ${FIND_TARGET_EXCLUDES} ${FIND_TARGET_STARTDIR} 
}

findlines() {
	findme="$1"
	clear; grep -r "$findme" ${FIND_TARGET_INCLUDES} ${FIND_TARGET_EXCLUDES} ${FIND_TARGET_STARTDIR} 
}

findlinesic() {
	findme="$1"
	clear; grep -ir "$findme" ${FIND_TARGET_INCLUDES} ${FIND_TARGET_EXCLUDES} ${FIND_TARGET_STARTDIR} 
}


# https://superuser.com/questions/362227/how-to-change-the-title-of-the-mintty-window
function settitle() {
      export PS1="\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n$ "
      echo -ne "\e]0;$1\a"
}

settitle "cygwin window"

function settitlepath() {
      export PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n$ "
}

# Adds some text in the terminal frame (if applicable).

function xtitle()
{
    case "$TERM" in
    *term* | rxvt)
        echo -en  "\e]0;$*\a" ;;
    *)  ;;
    esac
}


# Aliases that use xtitle
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'

# .. and functions
function man()
{
    for i ; do
        xtitle The $(basename $1|tr -d .[:digit:]) manual
        command man -a "$i"
    done
}

function xpdf() { command xpdf "$@" & }
function gvim() { command gvim "$@" & }

#-------------------------------------------------------------
# File & strings related functions:
#-------------------------------------------------------------


# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe() { find . -type f -iname '*'"${1:-}"'*' \
-exec ${2:-file} {} \;  ; }

#  Find a pattern in a set of files and highlight them:
#+ (needs a recent version of egrep).
function fstr()
{
    OPTIND=1
    local mycase=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
           i) mycase="-i " ;;
           *) echo "$usage"; return ;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
xargs -0 egrep --color=always -sn ${case} "$1" 2>&- | more

}



function mydf()         # Pretty-print of 'df' output.
{                       # Inspired by 'dfc' utility.
    for fs ; do

        if [ ! -d $fs ]
        then
          echo -e $fs" :No such file or directory" ; continue
        fi

        local info=( $(command df -P $fs | awk 'END{ print $2,$3,$5 }') )
        local free=( $(command df -Pkh $fs | awk 'END{ print $4 }') )
        local nbstars=$(( 20 * ${info[1]} / ${info[0]} ))
        local out="["
        for ((j=0;j<20;j++)); do
            if [ ${j} -lt ${nbstars} ]; then
               out=$out"*"
            else
               out=$out"-"
            fi
        done
        out=${info[2]}" "$out"] ("$free" free on "$fs")"
        echo -e $out
    done
}


function my_ip() # Get IP adress on ethernet.
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}

function ii()   # Get current host related info.
{
    echo -e "\nYou are logged on ${BRed}$HOST"
    echo -e "\n${BRed}Additionnal information:$NC " ; uname -a
    echo -e "\n${BRed}Users logged on:$NC " ; w -hs |
             cut -d " " -f1 | sort | uniq
    echo -e "\n${BRed}Current date :$NC " ; date
    echo -e "\n${BRed}Machine stats :$NC " ; uptime
    echo -e "\n${BRed}Memory stats :$NC " ; free
    echo -e "\n${BRed}Diskspace :$NC " ; mydf / $HOME
    echo -e "\n${BRed}Local IP Address :$NC" ; my_ip
    echo -e "\n${BRed}Open connections :$NC "; netstat -pan --inet;
    echo
}

#-------------------------------------------------------------
# Misc utilities:
#-------------------------------------------------------------

function repeat()       # Repeat n times command.
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}


# cd /cygdrive/c/gjs
# cd /cygdrive/c/gjs/git_stuff/HIP-Ops/postgres/schema
#cd /cygdrive/c/gjs/git_stuff/HIP-Ops/nodeprojects/flows
#cd /cygdrive/c/gjs/git_stuff/HIP-Ops/nodered-docker-api-scripts
#cd /cygdrive/c/gjs/git_stuff/HIP-Ops/node-ms/api-ms
#cd /cygdrive/c/gjs/git_stuff/Fail-Over-Manager/python
#cd /cygdrive/c/gjs/git_stuff/Fail-Over-Manager/postgres
cd /cygdrive/c/gjs/git_stuff/portal/FrontEnd
