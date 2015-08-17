# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
set __fish_prompt_hostname "pothead"

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/

Theme "agnoster"
# Theme "bobthefish"

# Theme settings
set -g theme_display_git yes
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose no
set -g theme_display_hg no
set -g theme_display_virtualenv yes
set -g theme_display_ruby no
set -g theme_display_user yes
# set -g default_user your_normal_user

# Plugin "fish_plugins"
Plugin "git-flow"
Plugin "brew"
# Plugin "powerline"
Plugin "theme"
# Plugin "autojump"

set fish_key_bindings fish_vi_key_bindings
set fish_bind_mode insert
#LOCAL
set homebrew "/usr/local/bin"

set -gx PATH $homebrew $PATH
set -gx PATH /Users/schurl/bin $PATH
set -gx CC "clang"
set -gx ARCHFLAGS "-arch x86_64"
set BROWSER open
set -gx EDITOR vim
set -gx VISUAL vim

set -gx PYTHONDIR /usr/local/bin/python
set ROOTVERSION 6
set -gx ROOTSYS /Users/schurl/root$ROOTVERSION
set -gx PATH $ROOTSYS/bin $PATH
set -gx PYTHONPATH $ROOTSYS/lib $PYTHONPATH
set -gx LD_LIBRARY_PATH $ROOTSYS/lib $PYTHONDIR/lib $LD_LIBRARY_PATH

if test -f /Users/schurl/.autojump/share/autojump/autojump.fish; . /Users/schurl/.autojump/share/autojump/autojump.fish; end

#local commands
alias cernconnect='kinit --afslog -f --renewable gauzinge@CERN.CH'
alias ll='ls -lh'
alias la='ls -aG'
alias cd..='cd ..'
alias ls='ls -Gh'
alias root='root -l'
alias cbc='cd /Users/schurl/Documents/Projects/CBC'
alias code='cd /Users/schurl/Code'
alias ma='mate'
alias rmate='mate'
alias rsub='subl'
alias afs='cd /afs/cern.ch/user/g/gauzinge'

#alias vim="/Users/user/Applications/MacVim.app/Contents/MacOS/Vim"
alias dirs='dirs -v'
alias p='pushd'
alias o='popd'
alias cat='vimcat'
#alias vim='mvim'
alias ccat='pygmentize -O style=monokai -f console256 -g'

#remote hosts
alias lxplus='ssh -XYR 52698:localhost:52698 gauzinge@lxplus.cern.ch'
# alias gauzinge='ssh -XYR 52698:localhost:52698 gauzinge@gauzinge.cern.ch'
alias xtaldaq002='ssh -XYR 52698:localhost:52698 xtaldaq@cmsuptracker002.cern.ch'
alias xtaldaq003='ssh -XYR 52698:localhost:52698 xtaldaq@cmsuptracker003.cern.ch'
alias cmsuptracker003='ssh -XYR 52698:localhost:52698 gauzinge@cmsuptracker003.cern.ch'
alias cmsuptracker002='ssh -XYR 52698:localhost:52698 gauzinge@cmsuptracker002.cern.ch'
alias cmsuptracker006='ssh -XYR 52698:localhost:52698 gauzinge@cmsuptracker006.cern.ch'
alias gauzinge='ssh -XYR 52698:localhost:52698 gauzinge@gauzinge.cern.ch'
alias cmsuppixpc='ssh -XYR 52698:localhost:52698 fectest@cmsuppixpc001.cern.ch'
alias cmspixp1='ssh -XYR 52698:localhost:52698 cmspixp1@pixp1daq.cern.ch'
