#!/bin/bash

cur_dir=$(pwd)
# set up Vim config
mv ~/.vimrc ~/.vimrc_backup
cp $(pwd)/.vimrc ~/.vimrc

mv ~/.vim ~/.vim_backup
cp -r $cur_dir/.vim ~/.vim
vim +PluginInstall +qall

mkdir -p ~/.config/nvim/
mv ~/.config/nvim ~/.config/nvim_backup || true
cp -T -r $cur_dir/nvim ~/.config/nvim

# set up Neovim prerequirements
sudo apt update
sudo apt install -y nodejs
sudo apt install -y npm
sudo apt install -y xdg-utils
sudo apt install -y ripgrep
sudo apt install -y snapd snap
sudo apt install -y python3-pygments

# install snap and neovim
if type snap > /dev/null 2>&1; then
    sudo snap refresh snapd
    sudo snap install nvim --classic
else
    echo "Cannot install snap!"
    exit 1
fi

# install language servers
sudo npm i -g pyright
sudo apt install -y ccls
sudo apt-get -y install clang-tools
sudo apt-get -y install clangd  # on some distributions
go install golang.org/x/tools/gopls@latest


# install lua-language-server
sudo apt install -y ninja-build
mkdir -p ~/.config/lsp
cd ~/.config/lsp
git clone https://github.com/LuaLS/lua-language-server
cd lua-language-server
./make.sh
echo 'export PATH="${HOME}/.config/lsp/lua-language-server/bin:${PATH}"' >> ~/.zshrc

# set up NeoVim config path
user_home=$(echo $HOME)
echo "Home directory is '$user_home'"
if [ "$user_home" = "/root" ]; then
    echo 'export XDG_CONFIG_HOME="/root/.config"' >> ~/.zshrc
fi
source ~/.zshrc

nvim +PackerInstall +qall
nvim --headless -c ":TSUpdate cpp c lua vim" -cq
