#!/bin/bash -ex
#
# Update bash environment.

vim +PlugUpgrade +qall
vim +PlugUpdate +qall

bash tmux/plugins/tpm/bin/update_plugins all

echo 'Success !'
