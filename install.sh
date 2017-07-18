#!/usr/bin/env bash

mkdir ~/.ssh
sudo -v

echo "Installing dotfiles."

# system
command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Initializing submodule(s)"
git submodule update --init --recursive

mkdir -p $HOME/go/src/github.com/$USER
source install/link.sh

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"
    pushd install
    ./brew.sh
    ./npm.sh
    ./pip.sh
    ./osx-iterm2.sh
    popd
    #./osx.sh - untested yet
fi

if ! command_exists zsh; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    # following does not work without /etc/shells edit 
    # chsh -s $(which zsh)
    
    # following works
    sudo dscl . -create /Users/$USER UserShell $(which zsh)
    dscl . -read /Users/$USER UserShell
fi

echo "Done. Reload your terminal."
