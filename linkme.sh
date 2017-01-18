#!/bin/bash
echo 'creating symlinks for dotfiles'
rm ~/.zshrc
ln -s ~/cernbox/dotfiles/zshrc ~/.zshrc
rm ~/.vimrc
ln -s ~/cernbox/dotfiles/vimrc_osx ~/.vimrc
rm ~/.gitconfig
ln -s ~/cernbox/dotfiles/gitconfig ~/.gitconfig
rm ~/.bashrc
ln -s ~/cernbox/dotfiles/bashrc ~/.bashrc
rm ~/.astylerc
ln -s ~/cernbox/dotfiles/astylerc ~/.astylerc
rm ~/.agignore
ln -s ~/cernbox/dotfiles/agignore ~/.agignore
rm ~/.fzf.zsh
ln -s ~/cernbox/dotfiles/fzf.zsh ~/.fzf.zsh
rm ~/.iterm2_shell_integration.zsh
ln -s ~/cernbox/dotfiles/iterm2_shell_integration.zsh ~/.iterm2_shell_integration.zsh
rm ~/.sshrc 
ln -s ~/cernbox/dotfiles/sshrc ~/.sshrc
rm ~/.tmux.conf
ln -s ~/cernbox/dotfiles/tmux.conf ~/.tmux.conf
rm ~/.zpreztorc
ln -s ~/cernbox/dotfiles/zpreztorc ~/.zpreztorc
ln -s ~/cernbox/bin ~/bin
mkdir ~/cernbox_shares
echo 'source ~/.vimrc' > ~/.config/nvim/init.vim
rm -rf ~/.sshrc.d
ln -s ~/cernbox/dotfiles/sshrc.d ~/.sshrc.d

echo 'taking care of documents and projects'
#ln -s ~/cernbox/Projects ~/Projects
#rm -rf Documents/
#ln -s ~/cernbox/Documents ~/Documents

ln -s ~/cernbox/dotfiles/bookmarks ~/.bookmarks

ln -s ~/cernbox/dotfiles/ssh_config ~/.ssh/ssh_config
