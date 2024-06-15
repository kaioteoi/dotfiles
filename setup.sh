#!/usr/bin/env bash


# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# Make sure we’re using the latest Homebrew.
brew update


brew install zsh
chsh -s $(which zsh)


# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

