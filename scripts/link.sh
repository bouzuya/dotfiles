#!/bin/bash

scripts_dir=$(cd $(dirname $0); pwd)
dotfiles_dir=$(dirname $scripts_dir)

for f in $($scripts_dir/list.sh)
do
  if [ -f $HOME/.$f ]
  then
    echo $HOME/.$f already exists.
  else
    echo ln -s $dotfiles_dir/$f $HOME/.$f
    ln -s $dotfiles_dir/$f $HOME/.$f
  fi
done

