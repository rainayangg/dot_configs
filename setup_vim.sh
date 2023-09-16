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
sudo apt install -y xdg-utils
sudo apt install -y ripgrep
sudo apt install -y snap
if type snap > /dev/null 2>&1; then
    sudo snap refresh snapd
    sudo snap install nvim --classic
else
    echo "Cannot install snap!"
    exit 1

sudo npm i -g pyright
sudo apt install ccls

# set up NeoVim config
user_home=$(echo $HOME)
echo "Home directory is '$user_home'"
if [ "$user_home" = "/root" ]; then
    export PATH="/root/.config/lsp/lua_language_server/bin/lua-language-server:$PATH" >> ~/.zshrc
    export XDG_CONFIG_HOME="/root/.config" >> ~/.zshrc
fi

mkdir -p ~/.config/nvim/
mv ~/.config/nvim ~/.config/nvim_backup
cp -r $(pwd)/nvim ~/.config/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
      ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim +PackerInstall +qall
