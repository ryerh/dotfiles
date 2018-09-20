#!/bin/bash

if [[ $(uname) != 'Darwin' ]]; then
  echo 'macOS only, exiting...'
  exit 1
fi

if [[ -x /usr/local/bin/brew ]]; then
  echo 'brew command detected, exiting...'
  exit 1
fi

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

cd "$(brew --repo)"
git remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git

cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git

cat <<'EOF'
done...

echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles' >> ~/.bash_profile
EOF
