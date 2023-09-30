#!/bin/bash
# output all the commands running
set -eux

# Install util apps:

# 1. Mos - makes non-apple mouses to work more smooth
if ! brew list mos &> /dev/null; then
  brew install --cask mos
  # configure launch at login
  cat <<EOT >> ~/Library/LaunchAgents/Mos.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>RunAtLoad</key>
    <true />
    <key>KeepAlive</key>
    <false />
    <key>Label</key>
    <string>Mos</string>
    <key>ProgramArguments</key>
    <array>
      <string>/Applications/Mos.app/Contents/MacOS/Mos</string>
    </array>
  </dict>
</plist>
EOT
    launchctl load ~/Library/LaunchAgents/Mos.plist
fi

# 2. Maccy - clipboard buffer
if ! brew list maccy &> /dev/null; then
  brew install --cask maccy
  # configure launch at login
  cat <<EOT >> ~/Library/LaunchAgents/Maccy.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>RunAtLoad</key>
    <true />
    <key>KeepAlive</key>
    <false />
    <key>Label</key>
    <string>Maccy</string>
    <key>ProgramArguments</key>
    <array>
      <string>/Applications/Maccy.app/Contents/MacOS/Maccy</string>
    </array>
  </dict>
</plist>
EOT
      launchctl load ~/Library/LaunchAgents/Maccy.plist
fi

# 3. App-Cleaner - cleaner way to delete apps
if ! brew list app-cleaner &> /dev/null; then
  brew install --cask app-cleaner
fi

# 4. Karabiner-Elements - keyboard remapper
if ! brew list karabiner-elements &> /dev/null; then
  brew install --cask karabiner-elements
  # configure launch at login
  cat <<EOT >> ~/Library/LaunchAgents/Karabiner-Elements.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>RunAtLoad</key>
    <true />
    <key>KeepAlive</key>
    <false />
    <key>Label</key>
    <string>Karabiner-Elements</string>
    <key>ProgramArguments</key>
    <array>
      <string>/Applications/Karabiner-Elements.app/Contents/MacOS/Karabiner-Elements</string>
    </array>
  </dict>
</plist>
EOT
  launchctl load ~/Library/LaunchAgents/Karabiner-Elements.plist
fi

# 5. MonitorControl - adjust external monitor brightness from keyboard
if ! brew list monitorcontrol &> /dev/null; then
  brew install --cask monitorcontrol
  # configure launch at login
  # due to random crashes need to restart automatically, so KeepAlive=true (solution from here: https://github.com/MonitorControl/MonitorControl/issues/902#issuecomment-1026924937)
  cat <<EOT >> ~/Library/LaunchAgents/MonitorControl.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>RunAtLoad</key>
    <true />
    <key>KeepAlive</key>
    <true />
    <key>Label</key>
    <string>MonitorControl</string>
    <key>ProgramArguments</key>
    <array>
      <string>/Applications/MonitorControl.app/Contents/MacOS/MonitorControl</string>
    </array>
  </dict>
</plist>
EOT
launchctl load ~/Library/LaunchAgents/MonitorControl.plist
fi

# 6. Rectangle - window manager
if ! brew list rectangle &> /dev/null; then
  brew install --cask rectangle
  # configure launch at login
  cat <<EOT >> ~/Library/LaunchAgents/Rectangle.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>RunAtLoad</key>
    <true />
    <key>KeepAlive</key>
    <false />
    <key>Label</key>
    <string>Rectangle</string>
    <key>ProgramArguments</key>
    <array>
      <string>/Applications/Rectangle.app/Contents/MacOS/Rectangle</string>
    </array>
  </dict>
</plist>
EOT
  launchctl load ~/Library/LaunchAgents/Rectangle.plist
fi


# Link config files:

# 1. Karabiner
mkdir -p ~/.config/karabiner
ln -sf $(pwd)/karabiner.json ~/.config/karabiner/karabiner.json

# 2. Rectangle
mkdir -p ~/Library/Application\ Support/Rectangle
ln -sf $(pwd)/RectangleConfig.json ~/Library/Application\ Support/Rectangle/RectangleConfig.json


# Git aliases
git config --global alias.cb "rev-parse --abbrev-ref HEAD" # current branch
git config --global alias.st "status"
git config --global alias.nb "checkout -b" # new branch
git config --global alias.back "checkout -"
git config --global alias.ch "checkout"


# Cache git credentials in Keychain app
git config --global credential.helper osxkeychain


# Useful CLI utils
pip3 install shell-gpt
