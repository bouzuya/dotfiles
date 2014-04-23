#!/bin/bash

scripts_dir=$(cd $(dirname $0); pwd)
dotfiles_dir=$(dirname $scripts_dir)

for f in $($scripts_dir/list.sh)
do
  echo rm -rf $HOME/.$f
  rm -rf $HOME/.$f
done

