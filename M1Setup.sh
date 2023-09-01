#!/bin/bash

# Greeting message
echo "Welcome to the Mac setup automation script!"
echo "This script will customize your desktop and install various applications."

# Check if Homebrew is already installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Customizing desktop
defaults write com.apple.dock "tilesize" -int "28" && killall Dock
defaults write com.apple.dock "orientation" -string "right" && killall Dock
defaults write com.apple.dock "scroll-to-open" -bool "true" && killall Dock
defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" && killall Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv" && killall Finder
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true" && killall Finder

# Installing Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi

# Installing software using Homebrew
brew install --cask warp discord alt-tab keka notion whatsapp visual-studio-code android-file-transfer logitech-g-hub zoom microsoft-office microsoft-auto-update mongodb-compass appcleaner figma hiddenbar

# Installing essential tools
brew install node openjdk

echo "Script execution completed."
