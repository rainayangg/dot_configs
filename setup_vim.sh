#!/bin/bash

# set up Vim config
mv ~/.vimrc ~/.vimrc_backup
cp $(pwd)/.vimrc ~/.vimrc

mv ~/.vim ~/.vim_backup
cp -r $(pwd)/.vim ~/.vim
vim +PluginInstall +qall

# set up Neovim prerequirements
sudo apt update
sudo apt install -y nodejs
sudo apt install -y npm
sudo npm i -g pyright
sudo apt install ccls

# set up NeoVim config
mkdir -p ~/.config/nvim/
mv ~/.config/nvim ~/.config/nvim_backup
cp -r $(pwd)/nvim ~/.config/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
      ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim +PackerInstall +qall
