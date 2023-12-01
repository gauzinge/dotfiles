# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


###########################################################################
# FZF integration
###########################################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###########################################################################
# Better history search
###########################################################################
# for pattern search (the wildcard `*` will use zsh completion)
bindkey "^R" history-incremental-pattern-search-backward
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

# Up arrow
# bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search

# Down arrow
# bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

###########################################################################
# Environment
###########################################################################

export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";

# User configuration
export PATH="/usr/local/bin:/Users/schurl/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

#colorful terminal
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=''
export LSCOLORS='Bxgxfxfxcxdxdxhbadbxbx'

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# italic fonts
export TERM=alacritty

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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
### LESS ###
###########################################################################
# Enable syntax-highlighting in less.
# brew install source-highlight
# First, add these two lines to ~/.bashrc
# export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
# export LESS=' -R '
# alias less='less -m -N -g -i -J -R --underline-special --SILENT'
alias more='less'

###########################################################################
# Aliases
###########################################################################
alias vim='nvim'
alias rm='rm'

#better ls
alias la='exa -a --icons'
alias ls='exa -1 -G --icons'
alias lt='exa -a -T --level=2 --icons'
alias ll='exa -a -l --icons'
alias cd..='cd ..'

#better cat
alias cat='bat'
alias less='bat'

#better cd using zoxide
alias cd='z'
alias zz='z -'



#git aliases
alias gs='git status'
alias gl='git log'
alias gc=git_commit

alias edit="fe"

alias python='python3'

eval "$(zoxide init zsh)"

###########################################################################
# ZSH syntax highlighting and autocompltion
###########################################################################
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# source /usr/local/opt/powerlevel10k/share/powerlevel10k/powerlevel10k.zsh-theme
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
