#!/bin/bash
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./.zshrc ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
source ./.zshrc

# if chsh failed:
# cat <<EOT >> ~/.bashrc
# if [ "$SHELL" != "/usr/bin/zsh" ]
# then
#  export SHELL="/usr/bin/zsh"
#       exec /usr/bin/zsh
# fi
# EOT
# source ~/.bashrc
