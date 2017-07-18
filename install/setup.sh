#!/usr/bin/env bash

# Common functions
source "../functions/function"

echo "Starting setup"
# XCode
sudo softwareupdate -i -a
xcode-select --install
sleep 240
# full Xcode
#mas install 497799835
sudo xcodebuild -license accept

# open Keychain Access
./lock.scpt
sleep 60
# keychain more info for man security(1)
