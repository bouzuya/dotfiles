#!/bin/bash

script_dir=$(cd $(dirname $0); pwd)
dotfiles_dir=$(dirname $script_dir)

for f in $($script_dir/list.sh)
do
  echo rm -rf $HOME/$f
  rm -rf $HOME/$f
done

