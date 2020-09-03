# add ~/bin to path
export PATH=$PATH:~/bin
#export CATALINA_HOME='/opt/tomcat/latest'
#export CATALINA_BASE=$CATALINA_HOME
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'
export MAVEN_HOME='/opt/maven/latest'
export WILDFLY_HOME='/opt/wildfly/latest'

#export PATH=$PATH:$CATALINA_HOME/bin
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$MAVEN_HOME/bin
export PATH=$PATH:$WILDFLY_HOME/bin



# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# my aliases
alias b='cd ..'
alias ducks='du -cks * |sort -rn |head -11'
alias free='free -ht'
alias gitDevelop='git clone -b develop  https://github.com/humanifydev/HIP-Ops.git'
alias gitBranch='git clone --single-branch --branch develop https://github.com/humanifydev/HIP-Ops.git'
alias gitReset='git reset --hard origin/develop'
alias hipops_env='env|grep MON; env|grep POST; env|grep RUNTIME'
alias mavenBE='mvn clean install -Dmaven.test.skip=true'
alias mavenFE='mvn clean package -Dmaven.test.skip=true'
alias mountshare='sudo mount -t vboxsf vboxSharedDrive /home/gsimpson/vboxSharedDrive/'
alias tc_logs='cd ${CATALINA_BASE}/logs'
alias virt='source ~/bin/anacondaPython3/bin/activate'
alias virtx='deactivate'



# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
#alias l='ls -CF'                              #
#alias la='ls -a'
#alias ll='ls -l'                              # long list
#alias lr='ls -lart'                           # reverse time
#alias ls='ls -hF --color=tty'                 # classify files in colour
#alias lt='lr'


#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias lx='ls -lXB'         #  Sort by extension.

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





# my stuff
alias b='cd ..'
alias bashalias='gvim ~/.bash_aliases'
alias gjs='cd ~/gjs'
#alias flow='pushd /cygdrive/c/cygwin64/home/eloy98104/.node-red'
alias reminder='gvim ~/bin/reminders/.remember'


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
# A few fun ones
#-------------------------------------------------------------

# https://superuser.com/questions/362227/how-to-change-the-title-of-the-mintty-window
function settitle() {
      export PS1="\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n$ "
      echo -ne "\e]0;$1\a"
}

#settitle "cygwin window"

function settitlepath() {
      export PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n$ "
}
settitlepath

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
#alias make='xtitle Making $(basename $PWD) ; make'


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
    #MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
    MY_IP=$(ip address show | awk '/inet/ { print $2 } ' |
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



#cd /home/hipops-dev/git_stuff/HIP-Ops
#cd /opt/HIP-Ops
cd /home/gsimpson/git-stuff/portal


