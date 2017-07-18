#!/usr/bin/osascript
#
# Script to restore the Command and Option keys to their defaults 
# in the System Preferences Keyboard settings.
#

tell application "System Preferences"
    activate
    set current pane to pane "com.apple.preference.keyboard"
	delay 2
end tell


tell application "System Events"
    tell process "System Preferences"
    click button "Modifier Keys…" of tab group 1 of window "Keyboard"

    click button "Restore Defaults" of sheet 1 of window "Keyboard"
    delay 10
    click button "OK" of sheet 1 of window "Keyboard"

    end tell
end tell

tell application "System Preferences"
    quit
end tell
