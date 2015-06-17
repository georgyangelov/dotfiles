#!/bin/bash
DIR=$(dirname $0)
windows() { [[ -n "$WINDIR" ]]; }

for dir in $DIR/home/.*; do
  dir_name=$(basename $dir)

  if [ $dir_name != '.' ] && [ $dir_name != '..' ] && [ -d "$dir" ]; then
    if windows; then
      cp -rf "$HOME/$dir_name"/* "$dir"
    fi

    package_script="$dir/package.sh"
    if [ -f "$package_script" ]; then
      chmod +x "$package_script"
      source "$package_script"
    fi

    echo "Packaged $dir_name"
  fi
done
