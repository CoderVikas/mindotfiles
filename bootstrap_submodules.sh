#!/usr/bin/env bash

mkdir -p submodules
pushd submodules
git submodule add https://github.com/robbyrussell/oh-my-zsh oh-my-zsh.symlink
git submodule add https://github.com/seebi/dircolors-solarized dircolors-solarized
git submodule add https://github.com/junegunn/vim-plug vim-plug
mkdir -p zsh_custom.symlink/plugins
mkdir -p zsh_custom.symlink/themes
pushd zsh_custom.symlink/plugins
git submodule add https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions
#git submodule add https://github.com/sindresorhus/pure pure
popd
pushd zsh_custom.symlink/themes
git submodule add https://github.com/bhilburn/powerlevel9k.git powerlevel9k
#git submodule add https://github.com/tylerreckart/hyperzsh hyperzsh
popd
mkdir -p tmux-plugins-tpm
pushd tmux-plugins-tpm 
git submodule add https://github.com/tmux-plugins/tpm tpm
popd
mkdir -p theme/solarized
pushd theme/solarized
git submodule add https://github.com/mbadolato/iTerm2-Color-Schemes
git submodule add https://github.com/altercation/solarized altercation-solarized
git submodule add https://github.com/jkaving/intellij-colors-solarized
popd
popd
