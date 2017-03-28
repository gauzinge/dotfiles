 ###########################################################################
# Prezto
###########################################################################
# Source Prezto.
#
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

###########################################################################
# ZSH syntax highlighting
###########################################################################
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

###########################################################################
# FZF integration
###########################################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###########################################################################
# Iterm2 Shell integration
###########################################################################
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


###########################################################################
# Zgen plugin manager
###########################################################################
# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then

  # specify plugins here
  # prezto and modules
  zgen prezto
  zgen prezto environment
  zgen prezto terminal
  zgen prezto editor
  zgen prezto history
  zgen prezto directory
  zgen prezto spectrum
  zgen prezto utility
  zgen prezto ssh
  zgen prezto completion
  zgen prezto autosuggestions
  zgen prezto prompt
  zgen prezto homebrew
  zgen prezto osx
  zgen prezto git
  zgen prezto syntax-highlighting
  zgen prezto history-substring-search
  zgen prezto tmux

  #fzf bookmarks
  zgen load junegunn/fzf shell
  zgen load uvaes/fzf-marks
  #zgen pmodule <reponame> <branch>

  # generate the init script from plugins above
  zgen save
fi

###########################################################################
# Vi Mode
###########################################################################
#vi mode
#bindkey -v
#export KEYTIMEOUT=1
#bindkey -M viins 'jk' vi-cmd-mode
#bindkey -M viins 'kj' vi-cmd-mode

#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down
#bindkey "^R" history-incremental-search-backward

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

###########################################################################
# Environment
###########################################################################

export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";

# User configuration
export PATH="/usr/local/bin:/Users/schurl/bin:/Users/schurl/root/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin:/Users/schurl/.cargo/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

#colorful terminal
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=''
export LSCOLORS='Bxgxfxfxcxdxdxhbadbxbx'

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# italic fonts
export TERM=xterm-256color-italic

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export ONEPASSWORD_KEYCHAIN=~/Dropbox/1Password/1Password.agilekeychain

export PATH=/opt/openafs/bin:/opt/openafs/sbin:$PATH

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
#export SSH_KEY_PATH="~/.ssh/dsa_id"

###########################################################################
# ROOT
###########################################################################

#ROOT
pushd $(brew --prefix root6) >/dev/null; . libexec/thisroot.sh; popd >/dev/null
fpath=(/usr/local/share/zsh-completions $fpath)


###########################################################################
# Functions
###########################################################################
#open_dash()
#{
    #open dash://$1
#}
myssh(){
    sshrc -XY $1
}
mytunnel()
{
    ssh -N -D 1031 $1
}
normalssh()
{
    ssh $1
}

runNvim() {
  NAME=nvimdefault_$RANDOM
  #save exsisting labels
  /Users/schurl/bin/it2setkeylabel.sh push $NAME
  /Users/schurl/bin/it2setkeylabel.sh set F1 esc
  /Users/schurl/bin/it2setkeylabel.sh set F2 w
  /Users/schurl/bin/it2setkeylabel.sh set F3 wq
  /Users/schurl/bin/it2setkeylabel.sh set F4 bd
  /Users/schurl/bin/it2setkeylabel.sh set F5 open
  /Users/schurl/bin/it2setkeylabel.sh set F6 tag
  /Users/schurl/bin/it2setkeylabel.sh set F7 comment
  nvim "$@"
  #Restore labels to previous state
  /Users/schurl/bin/it2setkeylabel.sh pop $NAME
}

git_commit() {
    git commit -am "$1"
}


###########################################################################
# Aliases
###########################################################################
#alias vim='nvim'
alias rm='rm'
alias vim=runNvim
alias connect='kinit --afslog -f --renewable gauzinge@CERN.CH'
#alias la='ls -aG'
#alias ls='ls -G'
#alias ll='ls -hl'
#alias ls='ls -Gh'
alias la='exa -a'
alias ls='exa'
alias lt='exa -T -L 3'
alias ll='exa --long --header --git'
alias cd..='cd ..'
alias root='root -l'
alias cat='vimcat'
#alias dash=open_dash
alias ssh=myssh
alias tunnel=mytunnel
alias normalssh=normalssh

#grc aliases
#alias ping='grc ping'
#alias traceroute='grc traceroute'
#alias gcc='grc gcc'
#alias make='grc make -j7'
#alias netstat='grc netstat'
#alias diff='grc diff'

#git aliases
alias gs='git status'
alias gl='git log'
alias gc=git_commit


alias afs='cd /afs/cern.ch/user/g/gauzinge/'

#mounts via sshfs
alias mountcmstracker004='sshfs xtaldaq@cmstracker004.cern.ch:/home/xtaldaq/GetGlobalCoordinatesTests/CMSSW_3_9_5/src/XtalAnalysis /Users/schurl/remote'
alias umountcmsup='fusermount -u /Users/schurl/remote'

alias tmux='tmux -2'
alias pipecms='tunnel gauzinge@cmsusr.cern.ch'

zle -N zle-line-init
zle -N zle-keymap-select

