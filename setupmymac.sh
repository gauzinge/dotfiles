#!/bin/bash
echo 'Installing homebrew & packages'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/science
brew install git
brew install wget
brew install astyle
brew install atk
brew install autoconf
brew install automake
brew install base64
brew install bash
brew install brew-rmtree
brew install cairo
brew install cmake
brew install ctags
brew install fontconfig
brew install freetype
brew install fzf
brew install gcc
brew install gdbm
brew install gdk-pixbuf
brew install gettext
brew install glib
brew install gmp
brew install gnome-icon-theme
brew install gobject-introspection
brew install grc
brew install gsettings-desktop-schemas
brew install gsl
brew install gtk+3
brew install gtksourceview3
brew install harfbuzz
brew install hicolor-icon-theme
brew install htop
brew install icdiff
brew install icu4c
brew install isl
brew install jpeg
brew install libepoxy
brew install libevent
brew install libffi
brew install libgit2
brew install libmpc
brew install libpng
brew install libssh2
brew install libtermkey
brew install libtiff
brew install libtool
brew install libuv
brew install libvterm
brew install llvm
brew install lua
brew install luajit
brew install mpfr
brew install msgpack
brew install neovim/neovim/neovim
brew install /homebrew/dupes/openssh
brew install openssl
brew install pango
brew install pcre
brew install pixman
brew install pkg-config
brew install py2cairo
brew install pygobject3
brew install python
brew install python3
brew install readline
brew install reattach-to-user-namespace
brew install root6
brew install ruby-build
brew install rust
brew install s-lang
brew install scons
brew install shared-mime-info
brew install sqlite
brew install sshfs
brew install sshrc
brew install the_silver_searcher
brew install tig
brew install tmux
brew install tree
brew install unibilium
brew install utf8proc
brew install zsh
brew install exa
brew install doxygen
#zsh-completions
#zsh-syntax-highlighting

#quick
echo 'Installing quicklook plugins'
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install webpquicklook
brew cask install suspicious-package

#apps
echo 'Installing apps!'
brew cask install appcleaner
brew cask install meld
brew cask install caffeine
brew cask install dropbox
brew cask install flux
brew cask install 1password
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
brew cask install basictex
brew cask install cheatsheet
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

echo 'Done, you still need to install spotify bluetooth headset listener,  bettersnaptool, cernbox, twitter?'
