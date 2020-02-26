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
  zgen load urbainvaes/fzf-marks
  zgen load changyuheng/zsh-interactive-cd
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
export PATH="/Users/schurl/brilconda/bin:/usr/local/bin:/Users/schurl/bin:/Users/schurl/root/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin:/Users/schurl/.cargo/bin:/usr/local/bin:$PATH"
export PATH="/usr/local/anaconda3/bin:$PATH"
#export PATH="/usr/local/bin:/Users/schurl/bin:/Users/schurl/root/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin:/Users/schurl/.cargo/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export PYTHONPATH="/usr/local/Cellar/root/6.12.06/lib/root/"

#colorful terminal
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=''
export LSCOLORS='Bxgxfxfxcxdxdxhbadbxbx'

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# italic fonts
export TERM=xterm-256color

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export ONEPASSWORD_KEYCHAIN=~/Dropbox/1Password/1Password.agilekeychain

export PATH=/opt/openafs/bin:/opt/openafs/sbin:$PATH

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

###########################################################################
# ROOT
###########################################################################

#ROOT
#pushd /usr/local >/dev/null; . bin/thisroot.sh; popd >/dev/null
#pushd $(brew --prefix root6) >/dev/null; . libexec/thisroot.sh; popd >/dev/null
fpath=(/usr/local/share/zsh-completions $fpath)

###########################################################################
# DOCKER
###########################################################################
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.64.2:2376"
export DOCKER_CERT_PATH="/Users/schurl/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
#eval $(docker-machine env default)

###########################################################################
# Functions
###########################################################################
myssh(){
    TERM=xterm sshrc -XY $1
}
mytunnel()
{
    echo 'Opening Tunnel to '$1' port 1032!'
    ssh -N -D 1032 $1
}
myothertunnel()
{
    echo 'Opening Tunnel to '$1' port 1033!'
    ssh -N -D 1032 $1
}
mynssh()
# normal ssh without sshRC
{
    TERM=xterm ssh -iXY $1
}

git_commit() {
    git commit -am "$1"
}

###########################################################################
### LESS ###
###########################################################################
# Enable syntax-highlighting in less.
# brew install source-highlight
# First, add these two lines to ~/.bashrc
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
alias less='less -m -N -g -i -J -R --underline-special --SILENT'
alias more='less'

###########################################################################
# Aliases
###########################################################################
alias vim='nvim'
alias rm='rm'
alias kinit='kinit --afslog -f --renewable gauzinge@CERN.CH && aklog'
#alias kinitcmstkph2='kinit --afslog -f --renewable cmstkph2@CERN.CH && aklog'
#alias kinitfnal='kinit --afslog -f --renewable gauzinge@FNAL.GOV && aklog'
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

#ssh handling
alias ssh=myssh
alias tunnel=mytunnel
alias othertunnel=myothertunnel
alias nssh=mynssh

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

alias kill='fkill'
alias edit="fe"

alias afs='cd /afs/cern.ch/user/g/gauzinge/'


#open tmux in the correct mode
alias tmux='tmux -2'

#pipes for point 5 and other daq macines
alias pipecms='tunnel gauzinge@cmsusr.cern.ch'
alias pipep5='tunnel gauzinge@cmsusr.cms'
alias pipecern='tunnel lxplus'

zle -N zle-line-init
zle -N zle-keymap-select


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#customise agnoster theme
export AGNOSTER_PROMPT_SEGMENTS[2]=$whoami

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
