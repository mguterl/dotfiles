#!/bin/bash

brew bundle --no-lock --file=/dev/stdin <<EOF
tap "aws/tap"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-fonts"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "homebrew/services"
tap "melonamin/formulae"
tap "osx-cross/arm"
tap "osx-cross/avr"
tap "qmk/qmk"
brew "coreutils"
brew "asdf"
brew "asimov"
brew "awscli"
brew "brew-cask-completion"
brew "chezmoi"
brew "curl"
brew "fzf"
brew "gawk"
brew "git"
brew "gnupg"
brew "ripgrep"
brew "starship"
brew "wifi-password"
brew "youtube-dl"
cask "1password-beta"
cask "1password-cli"
cask "alfred"
cask "backblaze"
cask "bartender"
cask "daisydisk"
cask "discord"
cask "dropbox"
cask "firefox"
cask "fork"
cask "google-chrome"
cask "istat-menus"
cask "iterm2"
cask "karabiner-elements"
cask "keepingyouawake"
cask "monodraw"
cask "mullvadvpn"
cask "omnifocus"
cask "rectangle"
cask "slack"
cask "soundsource"
cask "spotify"
cask "telegram-desktop"
cask "timemachineeditor"
cask "visual-studio-code"
cask "vlc"
cask "zoom"
EOF
