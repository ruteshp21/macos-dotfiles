#!/bin/zsh

# =============================================================================
# macos.sh — Sensible macOS defaults for developers
# Tested on: macOS 26 Tahoe
# Run: bash ~/dotfiles/scripts/macos.sh
#
# ⚠️  Close System Settings before running.
# ⚠️  A logout/restart is required for all changes to take effect.
# =============================================================================

set -Eeuo pipefail

echo "🍏 Applying macOS Tahoe (26) defaults..."
echo "   Some settings require sudo — you may be prompted."
echo ""

# Close System Settings to prevent overwriting changes
osascript -e 'tell application "System Settings" to quit' 2>/dev/null || true

# Keep sudo session alive for the duration of the script
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# =============================================================================
# SYSTEM
# =============================================================================

echo "⚙️  System..."

# Disable the startup chime (Apple Silicon)
sudo nvram StartupMute=%01

# Enable Touch ID for sudo (sudo_local method)
SUDO_LOCAL="/private/etc/pam.d/sudo_local"

if [ -f "${SUDO_LOCAL}.template" ]; then
  if ! grep -q "pam_tid.so" "$SUDO_LOCAL" 2>/dev/null; then
    sudo cp "${SUDO_LOCAL}.template" "$SUDO_LOCAL"
    sudo sed -i '.bak' 's/^#auth/auth/' "$SUDO_LOCAL"
    echo "   ✅ Touch ID for sudo enabled"
  else
    echo "   ✅ Touch ID for sudo already configured"
  fi
fi

# =============================================================================
# DOCK
# =============================================================================

echo "🚀 Dock..."

# Set dock position
defaults write com.apple.dock "orientation" -string "bottom"

# Set icon size
defaults write com.apple.dock "tilesize" -int "96"

# Enable auto-hide
defaults write com.apple.dock "autohide" -bool "true"

# Set the auto-hide delay
defaults write com.apple.dock "autohide-time-modifier" -float "0.5"
defaults write com.apple.dock "autohide-delay" -float "0.2"

# Don't show recently used apps in Dock
defaults write com.apple.dock "show-recents" -bool "false"

# Minimize animation effect to scale
defaults write com.apple.dock "mineffect" -string "scale"

# Enable Scroll to Exposé app
defaults write com.apple.dock "scroll-to-open" -bool "true"

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock "showhidden" -bool "true"

# Minimize into app icon
defaults write com.apple.dock "minimize-to-application" -bool "true"

# Shows small dots under running apps
defaults write com.apple.dock "show-process-indicators" -bool "true"

# Disable launch animation
defaults write com.apple.dock "launchanim" -bool "false"

# =============================================================================
# MISSION CONTROL
# =============================================================================

echo "⌨️  Mission Control..."

# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock "mru-spaces" -bool "false"

# Disable Group windows by application.
defaults write com.apple.dock "expose-group-apps" -bool "false"

# Switch to Space with open windows
defaults write NSGlobalDomain "AppleSpacesSwitchOnActivate" -bool "true"

# Displays have separate Spaces
defaults write com.apple.spaces "spans-displays" -bool "true"

# =============================================================================
# SCREENSHOTS
# =============================================================================

echo "📸 Screenshots..."

# Save screenshots to ~/Documents/Screenshots
mkdir -p ~/Documents/Screenshots
defaults write com.apple.screencapture "location" -string "~/Documents/Screenshots"

# Save as PNG (options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture "disable-shadow" -bool "true"

# Include date and time in screenshot filenames
defaults write com.apple.screencapture "include-date" -bool "true"

# Enable Display thumbnail
defaults write com.apple.screencapture "show-thumbnail" -bool "true"

# =============================================================================
# SAFARI
# =============================================================================

echo "🌐 Safari..."

# Enable Show full website URL (not working)
# defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "false" && killall Safari

# =============================================================================
# FINDER
# =============================================================================

echo "📁 Finder..."

# Add a quit option to the Finder. Behaves strangely when activated, would not recommend.
defaults write com.apple.finder "QuitMenuItem" -bool "false"

# Show all filename extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Show hidden files by default
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

# Show path bar
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Use list view by default (icnv=icon, clmv=column, glyv=gallery, Nlsv=list)
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"

# Keep folders on top when sorting by name
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"

# Open folders destination in new tab or new window (Open folders in a new tab)
defaults write com.apple.finder "FinderSpawnTab" -bool "true"

# Search the current folder by default (SCcf=current folder, SCsp=previous search scope, SCev=search entire mac)
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"

# Disable empty bin items after 30 days
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "false"

# Disable the warning when changing a file extension
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

# Save to iCloud (not Disk) by default
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "true"

# Dont show folder icon before title in the title bar (fails)
# This command requires to grant full disk access to the terminal (System Preferences → Security & Privacy → Full Disk Access)
# defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "false"

# Toolbar title rollover delay
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0.5"

# Sidebar icon size (1=small, 2=medium, 3=large)
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "2"

# Disable Column auto sizing
defaults write com.apple.finder "_FXEnableColumnAutoSizing" -bool "false"

# Show status bar
defaults write com.apple.finder "ShowStatusBar" -bool "true"

# Display full POSIX path as Finder window title (Disabled)
defaults write com.apple.finder "_FXShowPosixPathInTitle" -bool "false"

# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library 2>/dev/null || true

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices "DSDontWriteNetworkStores" -bool "true"
defaults write com.apple.desktopservices "DSDontWriteUSBStores" -bool "true"

# Spring-loaded folders
defaults write NSGlobalDomain com.apple.springing.enabled -bool "true"
defaults write NSGlobalDomain com.apple.springing.delay -float "0.5"

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# =============================================================================
# DESKTOP
# =============================================================================

echo "🖥️ Desktop..."

# Keep folders on top
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"

# Hide all icons on desktop
defaults write com.apple.finder "CreateDesktop" -bool "true"

# Hide hard disks on desktop
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"

# Hide external disks on desktop
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "false"

# Hide removable media (CDs, DVDs and iPods) on desktop
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "false"

# Hide connected servers on desktop
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "false"

# =============================================================================
# MENU BAR
# =============================================================================

echo "📁 Menu Bar..."

# Disable Flash clock time separators (default)
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "false"

# Set the time and date format for the Menu Bar digital clock
#defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\""

# =============================================================================
# TRACKPAD & MOUSE
# =============================================================================

echo "🖱 Trackpad & Mouse..."

# Trackpad

# Click weight (threshold 0=light, 1=medium, 2=firm)
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "1"

# Disable Dragging with drag lock
defaults write com.apple.AppleMultitouchTrackpad "DragLock" -bool "false"

# Enabling Dragging without drag lock
defaults write com.apple.AppleMultitouchTrackpad "Dragging" -bool "true"

# Dragging with three finger drag
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "false"

# Enable tap to click (not working)
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "Clicking" -bool "true"
# defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int "1"

# Enable Right-click (bottom-right corner)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadCornerSecondaryClick" -int "2"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad "TrackpadRightClick" -bool "true"

# Mouse

# Enable mouse acceleration (default value)
defaults write NSGlobalDomain com.apple.mouse.linear -bool "false"

# Set movement speed of the mouse cursor (0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0)
defaults write NSGlobalDomain com.apple.mouse.scaling -float "1.5"

# Enable Focus Follows Mouse (For Terminal Windows only)
defaults write com.apple.Terminal "FocusFollowsMouse" -bool "true"

# =============================================================================
# KEYBOARD & INPUT
# =============================================================================

echo "⌨️  Keyboard & Input..."

# Enable repeat character while key held
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"

# Choose what happens when you press the Fn or 🌐︎ key on the keyboard
# (0=Do Nothing, 1=Change input source, 2=Show Emoji & Symbols, 3=Start Dictation)
defaults write com.apple.HIToolbox AppleFnUsageType -int "2"

# Change the behavior of the function keys (Use Fn Key as special keys, Use Fn Key as standard function keys )
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool "true"

# Enable full keyboard access for all controls (tab through all UI elements)
defaults write NSGlobalDomain AppleKeyboardUIMode -int "2"

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool "false"

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool "false"

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool "false"

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool "false"

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool "false"

# Fast key repeat — essential for Vim/Neovim users
defaults write NSGlobalDomain "KeyRepeat" -int "3"
defaults write NSGlobalDomain "InitialKeyRepeat" -int "15"

# =============================================================================
# SCREEN
# =============================================================================

echo "🔋 Screen..."

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int "1"
defaults write com.apple.screensaver askForPasswordDelay -int "0"

# =============================================================================
# ENERGY
# =============================================================================

echo "🔋 Energy..."

# Disable Power Nap
sudo pmset -a powernap 0

# Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400  # 24 hours

# Enable lid wakeup
sudo pmset -a lidwake 1

# Restart automatically on power loss
sudo pmset -a autorestart 1

# Restart automatically if the computer freezes
# sudo systemsetup -setrestartfreeze on

# Sleep the display after 15 minutes
sudo pmset -a displaysleep 15

# Disable machine sleep while charging
sudo pmset -c sleep 0

# Set machine sleep to 10 minutes on battery
sudo pmset -b sleep 10

# Disable network wakeups
sudo pmset -a tcpkeepalive 0

# Hibernation mode
# 0: Disable hibernation (speeds up entering sleep mode)
# 3: Copy RAM to disk so the system state can still be restored in case of a power failure.
sudo pmset -a hibernatemode 3

# =============================================================================
# UI / ANIMATIONS
# =============================================================================

echo "🎨 UI & Animations..."

# Expand save panel by default
defaults write NSGlobalDomain "NSNavPanelExpandedStateForSaveMode" -bool "true"
defaults write NSGlobalDomain "NSNavPanelExpandedStateForSaveMode2" -bool "true"

# Expand print panel by default
defaults write NSGlobalDomain "PMPrintingExpandedStateForPrint" -bool "true"
defaults write NSGlobalDomain "PMPrintingExpandedStateForPrint2" -bool "true"

# Set Show Scrollbars value ("Automatic", "WhenScrolling", "Always")
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Quit printer app automatically
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool "true"

# =============================================================================
# SOFTWARE UPDATE
# =============================================================================

echo "🔄 Software Update..."

# Download updates in background
defaults write com.apple.SoftwareUpdate "AutomaticDownload" -int "1"

# Install system data files & security updates automatically
defaults write com.apple.SoftwareUpdate "CriticalUpdateInstall" -int "1"

# Ensure automatic update checks are enabled
sudo softwareupdate --schedule on

# =============================================================================
# MISCELLANEOUS
# =============================================================================

echo "🪟 Miscellaneous..."

# Disable Feedback Assistant gathers large files when submitting a report
defaults write com.apple.appleseed.FeedbackAssistant "Autogather" -bool "false"

# Set default document format as rich text (.rtf) or plain text (.txt).
defaults write com.apple.TextEdit "RichText" -bool "false"

# Set if quotation marks should be converted from neutral form to opening/closing variants.
defaults write com.apple.TextEdit "SmartQuotes" -bool "false"

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool "true"

# Set Activity Monitor Update Data Frequency (1=Very often (1s), 2=Often (2s), 5=Normally (5s))
defaults write com.apple.ActivityMonitor "UpdatePeriod" -int "5"

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int "5"

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int "0"

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int "0"

# Show Subject Field in iMessage/Text Message field in Messages (not working)
# defaults write com.apple.MobileSMS "MMSShowSubject" -bool "false"

# Spring loading for all Dock items
defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool "true"

# Show Music song notifications
defaults write com.apple.Music "userWantsPlaybackNotifications" -bool "true"

# Keep windows when quitting an application
defaults write NSGlobalDomain "NSQuitAlwaysKeepsWindow" -bool "true"

# Disable crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# =============================================================================
# RESTART AFFECTED APPS
# =============================================================================

echo ""
echo "🔁 Restarting affected apps..."

for app in "Finder" "Dock" "SystemUIServer" "Activity Monitor" "Safari" "TextEdit" "Messages" "Music"; do
  killall "$app" &>/dev/null || true
done

echo ""
echo "✅ Done! Please log out and back in (or restart) for all changes to take effect."
