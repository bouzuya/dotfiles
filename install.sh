#!/bin/bash

dotfiles_dir=$HOME/.dotfiles

if [ -d "$dotfiles_dir" ]
then
  echo 'already installed'
  exit 1
fi

echo 'installing...'
if ! which git
then
  echo 'please install "git"'
  exit 1
fi

git clone --recursive git@github.com:bouzuya/dotfiles.git "$dotfiles_dir"

cd "$dotfiles_dir"
chmod +x ./scripts/*.sh
./scripts/link.sh

