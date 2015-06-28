# Most of the stuff here is copied from
# https://github.com/kdeldycke/dotfiles/blob/master/.bash_profile

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# If possible, add tab completion for many more commands
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

# Setting history length
export HISTCONTROL="ignoredups:erasedups"
export HISTTIMEFORMAT="[%F %T] "
export HISTSIZE=99999
export HISTFILESIZE=$HISTSIZE;

# Make some commands not show up in history
export HISTIGNORE="ls:pwd:exit:clear:date:* --help:history"

# append to the history file, don't overwrite it
shopt -s histappend

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# CD without cd
shopt -s autocd

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Set user & root prompt
function prompt_callback {
    # After each command, append to the history file and reread it.
    # Source: http://unix.stackexchange.com/a/1292
    history -a
    history -c
    history -r
}

# Make vim the default editor
export EDITOR="vim"
