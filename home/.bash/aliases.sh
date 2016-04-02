alias ascii="figlet"
alias matrix="cmatrix"

alias grep="grep --color=auto"

# Make cat display invisible characters (if any)
alias cat="cat -v"

alias vi="vim"
alias v="vim"
alias g="git"

alias c="clear"

alias ls="ls -hp"
alias lsa="ls -hpa"
alias ll="ls -lah"
alias lsl="ll"

alias s="sudo"

alias svc="brew services"

alias be="bundle exec"
alias abe="bundle exec"

alias gpull="git pull"
__git_complete gpull _git_pull
__git_complete gpull _git_checkout

alias gpullr="git pull --rebase"
__git_complete gpullr _git_pull
__git_complete gpullr _git_checkout

alias gfetch="git fetch"
__git_complete gfetch _git_fetch

alias gpush="git push"
__git_complete gpush _git_push
__git_complete gpush _git_checkout

alias gpushf="git push --force-with-lease"
__git_complete gpushf _git_push
__git_complete gpushf _git_checkout

alias gstash="git stash"
__git_complete gstash _git_stash

alias gcommit="git commit"
__git_complete gcommit _git_commit

alias gl="git log"
__git_complete gl _git_log

alias gs="git status"
alias gstat="git status"
alias gstatus="git status"
alias gbranch="git branch"
__git_complete gbranch _git_branch

alias gsetupstream="git branch --set-upstream-to"
__git_complete gsetupstream _git_branch

alias gc="git checkout"
__git_complete gc _git_checkout

alias grevert="git revert"
__git_complete grevert _git_revert

alias ga="git add"
__git_complete ga _git_add

alias gr="git reset"
__git_complete gr _git_reset

alias gd="git diff --patience"
__git_complete gd _git_diff

alias gdf="git diff --patience --no-index"
__git_complete gd _git_diff

alias gdc="git diff --cached --patience"
__git_complete gd _git_diff

alias gshow="git show"
__git_complete gshow _git_show

alias gmerge="git merge"
__git_complete gmerge _git_merge

alias grebase="git rebase"
__git_complete grebase _git_rebase

alias gignore="git update-index --assume-unchanged"
alias gnoignore="git update-index --no-assume-unchanged"

# An "alert" alias for long running commands.
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
