#!/bin/bash
if [ -n $BASH_DOTFILES_INCLUDED ]; then
  mv $HOME/.bashrc $HOME/.bashrc.backup

  echo "export BASH_DOTFILES_INCLUDED=1" > $HOME/.bashrc
  echo "source $HOME/.bash/.bashrc" >> $HOME/.bashrc
fi
