![](https://visitor-badge.glitch.me/badge?page_id=biden2020prez.CusromLG-Hotkeys&left_color=green&right_color=red)
# CustomLG-Hotkeys
Modify the launcher hotkeys on the LG Classic Flip to ANY CUSTOM APP Activity!

## Why?
Because the LG Classic Flip only supports pre-configured apps for the launcher shortcut keys. But using ADB we can fully customize these hotkeys!

## What?
CustomLG-Hotkeys will fully customize which activities you want to launch using the shortcut keys. Say goodbye to limitations!

## How?
Connect your device to ADB, put the batch file somewhere in ADB's path, and run!

## What does it do
CustomLG-Hotkeys works using the following logic:  

1. It pushes a bash script to /data/local/tmp. The bash script uses `dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'` to find the current activity (with `sed` to narrow it down to exact text). 
2. It instructs the user to navigate to the screen he wants to set as the shortcut key.
3. It runs the script and saves the output.
4. It gives the user the option to choose a key.
5. It runs `settings list system` commands to set the package and class name of the keys.
6. It force stops the launcher app so the settings can take effect.
  
# License
This is free to use, distribute, sell, brick your phone, or do whatever else you want with it.
