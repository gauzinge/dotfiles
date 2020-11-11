#!/bin/bash
echo 'Installing homebrew & packages'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install astyle
brew install bash
brew install boost
brew install coreutils
brew install ctags
brew install docker
brew install docker-machine
brew install fzf
brew install gcc
brew install git
brew install htop
brew install llvm
brew install neovim
brew install openssh
brew install readline
brew install reattach-to-user-namespace
brew install sshrc
brew install tmux
brew install tree
brew install wget
brew install zsh

#quick
echo 'Installing quicklook plugins'
#brew cask install qlcolorcode
#brew cask install qlstephen
#brew cask install qlmarkdown
#brew cask install quicklook-json
#brew cask install qlprettypatch
#brew cask install quicklook-csv
#brew cask install betterzipql
#brew cask install webpquicklook
#brew cask install suspicious-package

#apps
echo 'Installing apps!'
brew cask install miniconda
brew cask install vimr
brew cask install virtualbox
brew cask install appcleaner
#brew cask install meld
brew cask install caffeine
brew cask install dropbox
brew cask install flux
#brew cask install 1password
brew cask install vlc
brew cask install cleanmymac
brew cask install firefox
brew cask install fantastical
brew cask install mailmate
brew cask install skype
brew cask install slack
brew cask install spotify
#brew cask install sonos
brew cask install whatsapp
#brew cask install iterm2
brew cask install monolingual
#brew cask install basictex
#brew cask install cheatsheet
brew cask install xquartz

brew tap caskroom/fonts
brew cask install font-droidsansmono-nerd-font
brew cask install font-droidsansmono-nerd-font-mono
brew cask install font-dejavusansmono-nerd-font
brew cask install font-dejavusansmono-nerd-font-mono

echo 'setting up vim-plug'
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'setting up zgen'
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

echo 'setting up tmux plugin manager'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#echo 'Done, you still need to install spotify bluetooth headset listener,  bettersnaptool, cernbox, twitter?'

echo 'Install conda packages'
conda install awkward                
conda install backcall               
conda install binutils-meta          
conda install c-compiler             
conda install ca-certificates        
conda install cachetools             
conda install clang                  
conda install clang_osx-64           
conda install clangxx                
conda install clangxx_osx-64         
conda install compiler-rt            
conda install compiler-rt_osx-64     
conda install compilers              
conda install conda                  
conda install conda-package-handling 
conda install cryptography           
conda install cxx-compiler           
conda install hdf5
conda install ipython                
conda install jupyter                
conda install krb5                   
conda install matplotlib             
conda install neovim                 
conda install numpy                  
conda install pygments               
conda install pynvim                 
conda install root                   
conda install root-binaries          
conda install root-dependencies      
conda install root_base              
conda install uproot                 
