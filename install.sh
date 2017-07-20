#!/usr/bin/env bash

echo "Installing dotfiles."

# system
command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
    export PATH=$HOME/homebrew/bin:$PATH
    echo -e "\n\nRunning on OSX"
    pushd install
    ./brew.sh
    ##./npm.sh
    ./pip.sh
    ./macos/osx/osx-iterm2.sh
    #./macos/osx/osx.sh - untested yet
    popd
fi

if ! command_exists zsh; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    # only perform macOS-specific install
    if [ "$(uname)" == "Darwin" ]; then
	# following does not work without /etc/shells edit 
	# chsh -s $(which zsh)
	
	# following works
	sudo dscl . -create /Users/$USER UserShell $(which zsh)
	dscl . -read /Users/$USER UserShell
    fi
fi

echo "Done. Reload your terminal."
