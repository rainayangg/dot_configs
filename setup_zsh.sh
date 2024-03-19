#!/bin/bash
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./.zshrc ~/.zshrc

git clone https://github.com/jeffreytse/zsh-vi-mode ~/.oh-my-zsh/plugins/zsh-vi-mode
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
zsh
source ./.zshrc

chsh -s $(which zsh)

# if chsh failed:
touch ~/.bash_profile
cat <<EOT >> ~/.bash_profile
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
EOT
source ~/.bash_profile

cat <<EOT >> ~/.bashrc
[ -z "$PS1" ] && return
if [ "$SHELL" != "/usr/bin/zsh" ]
then
 export SHELL="/usr/bin/zsh"
      exec /usr/bin/zsh
fi
EOT
source ~/.bashrc
