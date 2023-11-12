#!/usr/bin/env sh

read -p "What is your name? " name

git config --global user.name "$name"

read -p "What is your email? " email

git config --global user.email "$email"

git config --global core.editor vim

git config --global merge.tool vimdiff

git config --global color.ui true
