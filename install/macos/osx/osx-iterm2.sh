#!/usr/bin/env sh

echo "\n\nSetting OS X iTerm2 settings"
echo "=============================="

echo "Specify the preferences directory"
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm2"
echo "Tell iTerm2 to use the custom preferences in the directory"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
