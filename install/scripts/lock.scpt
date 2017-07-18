#!/usr/bin/osascript
activate application "Keychain Access"
tell application "System Events"
	keystroke "," using command down
	tell process "Keychain Access"
		click checkbox "Show keychain status in menu bar" of tab group 1 of window 1
		delay 10
	end tell
end tell
tell application "Keychain Access"
	quit
end tell
