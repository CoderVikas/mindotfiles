#!/usr/bin/osascript
#
# Script to swap the Command and Option keys
# in the System Preferences Keyboard settings.
#
# Helpful if using a PC keyboard
#

tell application "System Preferences"
    activate
    set current pane to pane "com.apple.preference.keyboard"
    delay 1
end tell

tell application "System Events"
    tell process "System Preferences"
    click button "Modifier Keys…" of tab group 1 of window "Keyboard"

    # Select keyboard: pop up button
    #click pop up button 5 of sheet 1 of window "Keyboard"
    # The 4th choice there.. my USB Keyboard
    #click menu item 4 of menu 1 of pop up button 5 of sheet 1 of window "Keyboard"
	
    # The Option Key pop up
    click pop up button 2 of sheet 1 of window "Keyboard"
    # Change it to Command, the 5th choice
    click menu item 5 of menu 1 of pop up button 2 of sheet 1 of window "Keyboard"
    delay 10
    click button "OK" of sheet 1 of window "Keyboard"

    end tell
end tell

tell application "System Preferences"
    quit
end tell
