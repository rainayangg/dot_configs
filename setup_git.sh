#!/bin/bash

mv ~/.gitconfig ~/.gitconfig_backup
mv ~/.gitignore_global ~/.gitignore_global_backup

cp $(pwd)/.gitconfig ~/.gitconfig
cp $(pwd)/.gitignore_global ~/.gitignore_global
