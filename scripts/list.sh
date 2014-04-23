#!/bin/bash

scripts_dir=$(cd $(dirname $0); pwd)
dotfiles_dir=$(dirname $scripts_dir)

for p in ${dotfiles_dir}/*
do
  f=$(basename $p)
  if [ ! $f = 'README.md' -a ! $f = 'install.sh' -a ! $f = 'scripts' ]
  then
    echo $f
  fi
done

