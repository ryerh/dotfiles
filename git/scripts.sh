#!/bin/bash


cln() {
  echo '> git clean -dXn (ignored)'
  git clean -dXn
  echo '> git clean -dxn (all)'
  git clean -dxn
}


bdiff() {
  local branches
  local ret_code

  git pack-refs --all

  branches="$(grep -oP '(?<=refs/heads/).*' .git/packed-refs)"
  for b in $branches; do
    grep -oP "refs/remotes/origin/$b" .git/packed-refs > /dev/null
    ret_code=$?
    if [[ $ret_code -gt 0 ]]; then
      echo $b
    fi
  done
}


bdm() {
  local bname="${1-$(git symbolic-ref --short HEAD)}"
  local branches="$(git branch --merged $bname | grep -v $bname)"

  echo "Removing merged branch for $bname"
  for b in $branches; do
    git branch -d $b
  done
}


lg() {
  git log \
    --color \
    --graph \
    --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
    --abbrev-commit
}


pl() {
  git pull -pv origin $(git symbolic-ref --short HEAD)
}
ps() {
  git push     origin $(git symbolic-ref --short HEAD)
}
psf() {
  git push -f  origin $(git symbolic-ref --short HEAD)
}


pr() {
  git push origin HEAD:refs/for/$1
}


eval "$@"
