#!/usr/bin/env sh

read -p "What is your email? " email
ssh-keygen -t ed25519 -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
