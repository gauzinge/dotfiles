# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

#function fish_prompt


# Path to your custom folder (default path is ~/.oh-my-fish/custom)

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
set __fish_prompt_hostname "pothead"

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/

Theme "agnoster"

# Theme settings
set -g theme_display_git yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose no
set -g theme_display_hg no
set -g theme_display_virtualenv yes
set -g theme_display_ruby no
set -g theme_display_user yes

# Plugin "fish_plugins"
Plugin "git-flow"
Plugin "brew"
#Plugin "powerline"
Plugin "theme"

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
set -gx ROOTSYS /Users/schurl/root
set -gx PATH $ROOTSYS/bin $PATH
set -gx PYTHONPATH $ROOTSYS/lib $PYTHONPATH
set -gx LD_LIBRARY_PATH $ROOTSYS/lib $PYTHONDIR/lib $LD_LIBRARY_PATH
set -gx DYLD_LIBRARY_PATH $ROOTSYS/lib $DYLD_LIBRARY_PATH


#local commands
alias cernconnect='kinit --afslog -f --renewable gauzinge@CERN.CH'
alias ll='ls -lh'
alias la='ls -aG'
alias cd..='cd ..'
alias ls='ls -Gh'
alias root='root -l'
alias code='cd /Users/schurl/Code'
alias rsub='subl'
alias afs='cd /afs/cern.ch/user/g/gauzinge/'

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
#alias mvim="/Applications/MacVim.app/Contents/MacOS/MacVim"
alias dirs='dirs -v'
alias p='pushd'
alias o='popd'
alias cat='vimcat'
alias ccat='pygmentize -O style=monokai -f console256 -g'

#remote hosts
alias lxplus='ssh -XYR 52698:localhost:52698 gauzinge@lxplus.cern.ch'
alias cmsusr='ssh -XY gauzinge@cmsusr.cern.ch'
alias cmsuptracker003='ssh -XYR 52698:localhost:52698 gauzinge@cmsuptracker003.cern.ch'
alias cmsuptracker002='ssh -XYR 52698:localhost:52698 gauzinge@cmsuptracker002.cern.ch'
alias cmsuptracker006='ssh -XYR 52698:localhost:52698 gauzinge@cmsuptracker006.cern.ch'
alias gauzinge='ssh -XYR 52698:localhost:52698 gauzinge@gauzinge.cern.ch'
alias cmsuppixpc='ssh -XYR 52698:localhost:52698 fectest@cmsuppixpc001.cern.ch'
alias cmsuppixch='ssh -XY xtaldaq@cmsuppixch.cern.ch'
alias cmspixp1='ssh -XYR 52698:localhost:52698 cmspixp1@pixp1daq.cern.ch'
