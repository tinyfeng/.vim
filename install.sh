#! /bin/bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/.vim/.vimrc ~/.vimrc
vim +PluginInstall +qall

