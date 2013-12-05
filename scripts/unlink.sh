#!/bin/bash

script_dir=$(cd $(dirname $0); pwd)
dotfiles_dir=$(dirname $script_dir)

for f in $(ls $dotfiles_dir -A -I 'scripts' -I 'install.sh' -I '.git')
do
  if [ -f $HOME/$f ]
  then
    echo $HOME/$f
    rm $HOME/$f
  fi
done

