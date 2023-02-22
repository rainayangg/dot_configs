#!/bin/bash

# set up Vim config
mv ~/.vimrc ~/.vimrc_backup
cp $(pwd)/.vimrc ~/.vimrc

mv ~/.vim ~/.vim_backup
cp -r $(pwd)/.vim ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PluginInstall +qall

# set up NeoVim config
mkdir -p ~/.config/nvim/
mv ~/.config/nvim ~/.config/nvim_backup
cp -r $(pwd)/nvim ~/.config/nvim
