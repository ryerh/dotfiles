#!/bin/bash -ex
#
# Install bash environment.

# Create dirs
mkdir -p $HOME/.config
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.ssh

# Link config files
ln -sfn $PWD/docker         ~/.docker
ln -sfn $PWD/git            ~/.config/git
ln -sfn $PWD/npm/npmrc      ~/.npmrc
ln -sfn $PWD/pip            ~/.pip
ln -sfn $PWD/polipo/config  ~/.polipo
ln -sfn $PWD/ssh/config     ~/.ssh/config
ln -sfn $PWD/tmux           ~/.config/tmux
ln -sfn $PWD/tmux/tmux.conf ~/.tmux.conf
ln -sfn $PWD/vim            ~/.vim

if [[ $(uname) == 'Darwin' ]]; then
  ln -sfn $PWD/bash/bash_profile  ~/.bash_profile
else
  ln -sfn $PWD/bash/bash_profile  ~/.bash_aliases
fi

# Install VIM Plugins
VIM_PLUG_REPO='https://github.com/junegunn/vim-plug.git'
VIM_PLUG_PATH="$PWD/vim/plugged/vim-plug"
if [[ ! -d $VIM_PLUG_PATH ]]; then
  git clone $VIM_PLUG_REPO $VIM_PLUG_PATH
  ln -sfn "$VIM_PLUG_PATH/plug.vim" "$PWD/vim/autoload/plug.vim"
  vim +PlugInstall +qall
fi

# Install Tmux Plugins
TPM_REPO="https://github.com/tmux-plugins/tpm.git"
TPM_PATH="$PWD/tmux/plugins/tpm"
if [[ ! -d $TPM_PATH ]]; then
  git clone $TPM_REPO $TPM_PATH
  bash tmux/plugins/tpm/bin/install_plugins
fi

echo 'Success !'
