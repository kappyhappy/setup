#!/bin/bash

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install git, vim
brew install git vim neovim

# vim setup
mkdir -p $HOME/.vim/{colors,undo}
curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
chmod 755 installer.sh
./installer.sh ~/.cache/dein
rm installer.sh

git clone https://raw.githubusercontent.com/kappyhappy/setup/master/.vimrc $HOME/.vimrc
git clone https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim $HOME/.vim/colors/hybrid.vim

# zsh setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions.git $HOME/.oh-my-zsh/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/plugins/zsh-autosuggestions

git clone https://raw.githubusercontent.com/kappyhappy/setup/master/.zshrc $HOME/.zshrc

# pr jumper
git clone https://github.com/kappyhappy/open-pull-request-URL.git
cp open-pull-request-URL/pr /usr/local/bin/pr
rm -rf open-pull-request-URL

# install goenv
git clone https://github.com/syndbg/goenv.git $HOME/.goenv
mkdir $HOME/go

# install nodenv
git clone https://github.com/nodenv/nodenv.git ~/.nodenv
mkdir -p "$(nodenv root)"/plugins
git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build

# install other env
brew install tfenv pyenv rbenv ruby-build nodenv

# instal kubens
brew install kubectx

# instal tmux
brew install tmux

# instal jq
brew install jq

source $HOME/.zshrc
