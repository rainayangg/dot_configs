mv ~/.gitconfig ~/.gitconfig_backup
mv ~/.gitignore_global ~/.gitignore_global

ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.gitignore_global ~/.gitignore_global
