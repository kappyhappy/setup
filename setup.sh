#!/bin/bash

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install git, vim
brew install git vim neovim

# vim setup
mkdir -p $HOME/.vim/{colors,undo}
git clone https://raw.githubusercontent.com/kappyhappy/setup/master/.vimrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh) ~/.cache/dein"

git clone https://raw.githubusercontent.com/kappyhappy/setup/master/.vimrc
git clone https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim $HOME/.vim/colors/

# zsh setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/plugins/
git clone https://github.com/zsh-users/zsh-completions.git $HOME/.oh-my-zsh/plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/plugins/

git clone https://raw.githubusercontent.com/kappyhappy/setup/master/.zshrc
source $HOME/.zshrc
