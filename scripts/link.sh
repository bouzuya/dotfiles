#!/bin/bash

script_dir=$(cd $(dirname $0); pwd)
dotfiles_dir=$(dirname $script_dir)

for f in $(ls $dotfiles_dir -A -I 'scripts' -I 'install.sh' -I '.git')
do
  if [ -f $HOME/$f ]
  then
    echo $HOME/$f already exists.
  else
    echo ln -s $dotfiles_dir/$f $HOME/$f
    ln -s $dotfiles_dir/$f $HOME/$f
  fi
done

