#!/bin/bash

script_dir=$(cd $(dirname $0); pwd)
dotfiles_dir=$(dirname $script_dir)

for f in $(ls $dotfiles_dir -A -I 'scripts' -I 'install.sh' -I '.git' -I '.gitignore' -I '.gitmodules' -I 'README.md')
do
  echo $f
done

