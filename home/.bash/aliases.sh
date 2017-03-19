alias ascii="figlet"
alias matrix="cmatrix"

alias grep="grep --color=auto"

function http-server() {
  if [[ $# == 1 ]]; then
    python -m http.server "$1"
  else
    python -m http.server 8080
  fi
}

# Make cat display invisible characters (if any)
alias dog="cat -v"

alias vi="vim"
alias v="vim"
alias g="git"

alias c="clear"

alias ls="ls -hp"
alias lsa="ls -hpa"
alias ll="ls -lah"
alias lsl="ll"

alias d="docker"
alias dc="docker-compose"

# Makes tab-width in less be 4 and searches case-insensitive if they only contain lowercase letters
alias less="less --tabs=4 -i"

alias s="sudo"
alias sv="sudo vim"

alias svc="brew services"

function be() {
  if [[ $# == 0 ]]; then
    command bundle
  elif [[ $@ == "rspecf" ]]; then
    be rspec --next-failure
  elif [[ $@ == "rspecff" ]]; then
    be rspec --only-failures
  elif [[ $@ == "rspecc" ]]; then
    modified_spec_files=$(git ls-files -m | grep _spec.rb | xargs)

    be rspec $modified_spec_files
  elif [[
    $1 == "rake"  && -f bin/rake  ||
    $1 == "rspec" && -f bin/rspec ||
    $1 == "rails" && -f bin/rails
  ]]; then
    cmd=$1
    shift

    bin/$cmd $@
  else
    command bundle exec $@
  fi
}

function bundle() {
  if [[ -f bin/bundle ]]; then
    bin/bundle $@
  else
    command bundle $@
  fi
}

function git_current_branch() {
  git rev-parse --abrev-ref HEAD
}

function gyolo() {
  if git diff-index --quiet --cached HEAD; then
    echo "No staged changes"
  else
    git commit --amend && git push --force-with-lease origin $(git_current_branch)
  fi
}

function gsetupstream() {
  if [[ $# == 0  ]]; then
    gsetupstream origin/$(git_current_branch)
  else
    git branch --set-upstream-to $@
  fi
}

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

alias gcommita="git commit --amend"
__git_complete gcommita _git_commit

SHORT_LOG_FORMAT="--date=relative --pretty=\"format:%Cblue%h %x09 %C(Yellow)%<(14)%ad %Cgreen%<(16)%an %Creset%s\""
GIT_DIFF_OPTIONS="--patience"
GIT_DIFF_ENV="GIT_PAGER=\"less --tabs=10\""

# Default log
alias gl="$GIT_DIFF_ENV git log --graph $SHORT_LOG_FORMAT"
__git_complete gl _git_log

# Log in long form
alias glf="git log --graph"
__git_complete glf _git_log

# Log all refs (all branches)
alias gla="$GIT_DIFF_ENV git log --graph --all $SHORT_LOG_FORMAT"
__git_complete gla _git_log

# Log changes in the current branch but not in master
alias gll="$GIT_DIFF_ENV git log --graph $SHORT_LOG_FORMAT ^master HEAD"
__git_complete gll _git_log

# Long form of `gll`
alias gllf="git log --graph ^master HEAD"
__git_complete gllf _git_log

# Log changes in master, but not in the current branch
alias glr="$GIT_DIFF_ENV git log --graph $SHORT_LOG_FORMAT ^HEAD master"
__git_complete glr _git_log

# Long form of `glr`
alias glrf="git log --graph ^HEAD master"
__git_complete glrf _git_log

# Log unpushed changes
function glp() {
  CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`

  gl "origin/$CURRENT_BRANCH".."$CURRENT_BRANCH" $@
}

alias greflog="git log $SHORT_LOG_FORMAT --walk-reflogs"
__git_complete greflog _git_log

alias gs="git status"
alias gstat="git status"
alias gstatus="git status"
alias gbranch="git branch"
__git_complete gbranch _git_branch

# alias gsetupstream="git branch --set-upstream-to"
__git_complete gsetupstream _git_branch

alias gc="git checkout"
__git_complete gc _git_checkout

alias grevert="git revert"
__git_complete grevert _git_revert

alias ga="git add"
__git_complete ga _git_add

alias gr="git reset"
__git_complete gr _git_reset

alias gd="git diff $GIT_DIFF_OPTIONS"
__git_complete gd _git_diff

alias gdl="git diff $GIT_DIFF_OPTIONS master...HEAD"
__git_complete gdl _git_diff

alias gdf="git diff $GIT_DIFF_OPTIONS --no-index"
__git_complete gdf _git_diff

alias gdc="git diff --cached $GIT_DIFF_OPTIONS"
__git_complete gdc _git_diff

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
