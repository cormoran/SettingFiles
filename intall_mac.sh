# 1. login with apple id
# 2. install 1password via app store
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ukai/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install emacs
brew install --cask karabiner-elements
# setup karabiner-elements

# update keyboard shortcut setting in os
# * input source > disable ^+space, ^+option+space
# * voice input > disable shortcut

# Dock & menu
# * auto hide dock

# Security & privacy
# * allow apple watch to unlock this device

brew install --cask google-chrome
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask intellij-idea-ce
# install xcode from app store

# item2
# color: solarized dark

# vscode enable settings sync
