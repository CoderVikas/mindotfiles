#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

pushd $DOTFILES
echo -e "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

echo -e "\n\ntmux/vim misc directories"
MISCDIRS=(
    "$HOME/.vim_plugged"
    "$HOME/.vim_bundle"
    "$HOME/.npm-packages"
    "$HOME/.config"
    "$HOME/.tmux"
    "$HOME/.tmux/plugins"
    "$HOME/.ssh"
    "$HOME/git-downloads"
    )
echo "=============================="
for dir in "${MISCDIRS[@]}"; do
    if [ ! -d $dir ]; then
        echo "Creating $dir"
	    echo "mkdir -p $dir"
        mkdir -p $dir 
    else 
        echo "~${dir#$HOME} already exists... Skipping."
    fi
done

echo -e "\n\ninstalling to ~/.config"
echo "=============================="
for config in $DOTFILES/config/*; do
    target=$HOME/.config/$( basename $config )
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done


# config contains .tmux.conf sister files and .tmux.conf refers to them using ~/.tmux/config path
# submodule tpm - in same directory as other tmux plugins
echo -e "\n\nCreating tmux/misc symlinks"
echo "=============================="
MISCLINKS=(
    "$HOME/startup:$DOTFILES/startup"
    "$HOME/.tmux/plugins/tpm:$DOTFILES/submodules/tmux-plugins-tpm/tpm"
    "$HOME/.tmux/config:$DOTFILES/tmux/config"
    )

for file in "${MISCLINKS[@]}"; do
    KEY=${file%%:*}
    VALUE=${file#*:}
    if [ -e ${KEY} ]; then
        echo "${KEY} already exists... skipping."
    else
        echo "Creating symlink for $KEY"
        ln -s ${VALUE} ${KEY}
    fi
done

echo -e "\n\nCreating misc empty files"
MISCEMPTY=(
    "$HOME/tmux_no_auto_restore"
    "$HOME/.zsh_alias_active"
    )
echo "=============================="
for empty in "${MISCEMPTY[@]}"; do
    if [ -e $empty ]; then
        echo "$empty already exists... skipping."
    else 
        echo "Creating $empty"
        touch $empty
    fi
done


# create vim symlinks
# symlink ~/.vimrc and ~/.vim over to their neovim equivalent ??
echo -e "\n\nCreating vim symlinks"
echo "=============================="
VIMFILES=(
    "$HOME/.vim:$DOTFILES/vim/vim.symlink"
    "$HOME/.vimrc:$DOTFILES/vim/vimrc.vim"
    "$DOTFILES/vim/vim.symlink/plugged:$HOME/.vim_plugged"
    "$DOTFILES/vim/vim.symlink/bundle:$HOME/.vim_bundle"
    "$DOTFILES/vim/vim.symlink/autoload/plug.vim:$DOTFILES/submodules/vim-plug/plug.vim"
    )

for file in "${VIMFILES[@]}"; do
    KEY=${file%%:*}
    VALUE=${file#*:}
    if [ -e ${KEY} ]; then
        echo "${KEY} already exists... skipping."
    else
        echo "Creating symlink for $KEY"
        ln -s ${VALUE} ${KEY}
    fi
done
