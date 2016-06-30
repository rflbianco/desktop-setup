#!/bin/sh
user=$USER

# Install and set ZSH as default shell
sudo apt install zsh
sudo -u $user chsh -s $(which zsh)

# Install oh-my-zsh framework
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sudo -u $user zsh

# Install powerlevel9k theme into oh-my-zsh
sudo -u $user git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/themes/powerlevel9k
sudo -u $user sed -i 's,ZSH_THEME=.*,ZSH_THEME="powerlevel9k/powerlevel9k",' ~/.zshrc

# Install Powerline fonts system-wide
sudo apt install powerline
