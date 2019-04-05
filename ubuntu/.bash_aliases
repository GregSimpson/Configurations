# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# my aliases
alias b='cd ..'
alias virt='source ~/bin/anacondaPython3/bin/activate'
alias virtx='deactivate'



# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


