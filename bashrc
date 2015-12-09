#local commands
#aliases
alias cernconnect='kinit --afslog -f --renewable gauzinge@CERN.CH'
alias la='ls -aG'
alias ls='ls -G'
alias ll='ls -hl'
alias cd..='cd ..'
alias ls='ls -Gh'
alias root='root -l'
alias cbc='cd /Users/schurl/Documents/Projects/CBC'
alias code='cd /Users/schurl/Code'
alias ma='mate'
alias rmate='mate'
alias rsub='subl'
alias dirs='dirs -v'
alias p='pushd'
alias o='popd'
alias cat='vimcat'
alias ccat='pygmentize -O style=monokai -f console256 -g'

#remote hosts
alias lxplus='ssh -XYR 52698:localhost:52698 gauzinge@lxplus.cern.ch'
alias cmsuptracker002='ssh -XYR 52698:localhost:52698 gauzinge@cmsuptracker002.cern.ch'
alias cmsuptracker003='ssh -XYR 52698:localhost:52698 gauzinge@cmsuptracker003.cern.ch'
alias cmsuptracker006='ssh -XYR 52698:localhost:52698 gauzinge@cmsuptracker006.cern.ch'
alias gauzinge='ssh -XYR 52698:localhost:52698 gauzinge@gauzinge.cern.ch'


# colorful terminal
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=''
export LSCOLORS='Bxgxfxfxcxdxdxhbadbxbx'
# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
#sets up the prompt color (currently a green similar to linux terminal)
export PS1='\[\033[01;32m\]\u@pothead\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
#enables color for iTerm
export TERM=xterm-color
#sets up proper alias commands when called


#PATH
export ROOTSYS=/Users/schurl/root
export PATH=$ROOTSYS/bin:$PATH
export LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH

export PATH=/Users/schurl/bin:$PATH
export PATH=/usr/local/bin:$PATH

#functions
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

function _update_ps1() {
PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux"  ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
