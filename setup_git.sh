#!/bin/bash

mv ~/.gitconfig ~/.gitconfig_backup
mv ~/.gitignore_global ~/.gitignore_global_backup

ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.gitignore_global ~/.gitignore_global
