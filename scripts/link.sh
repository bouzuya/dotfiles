#!/bin/bash

script_dir=$(cd $(dirname $0); pwd)
dotfiles_dir=$(dirname $script_dir)

for f in $($script_dir/list.sh)
do
  if [ -f $HOME/$f ]
  then
    echo $HOME/$f already exists.
  else
    echo ln -s $dotfiles_dir/$f $HOME/$f
    ln -s $dotfiles_dir/$f $HOME/$f
  fi
done

