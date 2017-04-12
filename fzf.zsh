# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_COMMAND='ag --follow --hidden --ignore .git -g ""'

export FZF_DEFAULT_OPTS='
  --height 30% --reverse --border --preview-window right:50%
  --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
  --color info:150,prompt:110,spinner:150,pointer:167,marker:174
  --cycle --ansi
  --select-1 --exit-0
'

#Solarized
#--color=,bg:-1,spinner:#719e07,hl:#586e75
#--color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
#--color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07

# with preview of file content
#--color info:150,prompt:110,spinner:150,pointer:167,marker:174
  
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTIONS="--select-1 --exit-0"
#export FZF_ALT_C_COMMAND=
export FZF_ALT_C_OPTIOMS="--select-1 --exit-0 --preview 'tree -C {} | head -200'"

##################################################3
# Git
##################################################3

# Will return non-zero status if the current directory is not managed by git
#is_in_git_repo() {
  #git rev-parse HEAD > /dev/null 2>&1
#}

## fbr - checkout git branch
#fbr() {
  ## "Nothing to see here, move along"
  #is_in_git_repo || return

  #local branches branch
  #branches=$(git branch -vv) &&
  #branch=$(echo "$branches" | fzf +m) &&
  #git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
#}

## fshow - git commit browser
#fshow() {
  #git log --graph --color=always \
      #--format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  #fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      #--bind "ctrl-m:execute:
                #(grep -o '[a-f0-9]\{7\}' | head -1 |
                #xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                #{}
#FZF-EOF"
#}

#gt() {
  ## "Nothing to see here, move along"
  #is_in_git_repo || return

  ## Pass the list of the tags to fzf-tmux
  ## - "{}" in preview option is the placeholder for the highlighted entry
  ## - Preview window can display ANSI colors, so we enable --color=always
  ## - We can terminate `git show` once we have $LINES lines
  #git tag --sort -version:refname |
    #fzf-tmux --multi --preview-window right:70% \
             #--preview 'git show --color=always {} | head -'$LINES
#}


##################################################3
# cd into direcotry
##################################################3

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

##################################################3
# kill process
##################################################3

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

