#!/bin/bash
DIR=$(dirname $0)
windows() { [[ -n "$WINDIR" ]]; }

for dir in $DIR/home/.*; do
  dir_name=$(basename $dir)

  if [ $dir_name != '.' ] && [ $dir_name != '..' ] && [ -d "$dir" ]; then
    if windows; then
      cp -rf "$dir" "$HOME/$dir_name"
    else
      ln -i -s "$dir" "$HOME/$dir_name"
    fi

    init_script="$dir/install.sh"
    if [ -f "$init_script" ]; then
      chmod +x "$init_script"
      source "$init_script"
    fi

    echo "Installed $dir_name"
  fi
done
