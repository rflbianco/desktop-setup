#!/bin/sh
user=$USER

# Install and set ZSH as default shell
sudo apt install zsh
sudo -u $user chsh -s $(which zsh)

# Install oh-my-zsh framework
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sudo -u $user zsh

sudo -u $user sed -i 's,ZSH_THEME=.*,ZSH_THEME="maran",' ~/.zshrc
