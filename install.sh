#!/bin/bash

set -e
set -x

# Installs dotfiles and helpers

realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

file_link(){
    local src="$1"
    local dest="$HOME/${src#${DOTFILES}/dotfiles/}"
    [[ -f "${src}" ]] && ln -sf "$src" "$dest"
}

# Get root
SCRIPT_PATH=`realpath $0`
DOTFILES=`dirname $SCRIPT_PATH`

mkdir -p $HOME/bin

# Install neovim
wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage
chmod +x ./nvim.appimage
mv nvim.appimage $HOME/bin/nvim
mkdir -p $HOME/.config/nvim

# Install vim-plug
curl -fLo \
    $HOME/.local/share/nvim/site/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Install nodejs
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs


# Install dotfiles
for f in $(find "${DOTFILES}/dotfiles" -type f); do
    file_link "${f}"
done

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


# Create persistent undo dir for vim
mkdir -p ~/.vim/undo

git config --global merge.tool meld
git config --global diff.tool meld


# Disable ".orig" backups
git config --global mergetool.keepBackup false

# Automatically track new branches
git config --global push.default tracking
git config --global branch.autosetupmerge true

# Always rebase when pulling
git config --global branch.autosetuprebase always

# Colored output
git config --global color.ui auto

# Git aliases
_git_lg="log --format='%C(green)%h %C(red)%cd %C(reset)%s %C(blue)%an%C(yellow)%d' --date=relative"
