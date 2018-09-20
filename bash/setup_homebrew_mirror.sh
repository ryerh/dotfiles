#!/bin/bash -ex
BREW_PATH="$(brew --repo)"
CORE_PATH="$(brew --repo)/Library/Taps/homebrew/homebrew-core"

ALIYUN_BREW="https://mirrors.aliyun.com/homebrew/brew.git"
ALIYUN_CORE="https://mirrors.aliyun.com/homebrew/homebrew-core.git"

OFFICIAL_BREW="https://github.com/Homebrew/brew"
OFFICIAL_CORE="https://github.com/Homebrew/homebrew-core"

setup() {
  cd $BREW_PATH
  git remote set-url origin $ALIYUN_BREW
  cd $CORE_PATH
  git remote set-url origin $ALIYUN_CORE

  brew update
}

restore() {
  cd $BREW_PATH
  git remote set-url origin $OFFICIAL_BREW
  cd $CORE_PATH
  git remote set-url origin $OFFICIAL_CORE

  brew update
}

eval "${1}"
