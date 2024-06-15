#!/usr/bin/env bash


# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# Make sure we’re using the latest Homebrew.
brew update

brew install coreutils

brew install zsh
chsh -s $(which zsh)


# Install Oh My Zsh
if test ! $(ls ~/.oh-my-zsh); then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "Oh My Zsh already installed, skipped."
fi

# Oh-my-zsh theme setup
# Simplerich
# https://github.com/philip82148/simplerich-zsh-theme?tab=readme-ov-file#install
# cd path/to/where_u_want_to_clone_the_repo
if test ! $(ls ~/.zsh-theme/); then
    git clone --recursive https://github.com/philip82148/simplerich-zsh-theme ~/.zsh-theme/
    cp ~/.zsh-theme/simplerich-zsh-theme/simplerich.zsh-theme ~/.oh-my-zsh/themes/
fi

# Oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

if test ! $(which neovim); then
    brew install neovim
fi

if test! $(which fzf); then
    brew install fzf
fi
