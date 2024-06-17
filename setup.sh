#!/usr/bin/env bash


# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# Make sure we’re using the latest Homebrew.
brew update
brew install chezmoi
brew install coreutils

# region ZSH
if [ ! $(which zsh) ]; then
    brew install zsh
    chsh -s $(which zsh)
fi

# Install Oh My Zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "Oh My Zsh already installed, skipped."
fi

# Oh-my-zsh theme setup
# Simplerich
# https://github.com/philip82148/simplerich-zsh-theme?tab=readme-ov-file#install
# cd path/to/where_u_want_to_clone_the_repo
if [ ! -d ~/.zsh-theme ]; then
    git clone --recursive https://github.com/philip82148/simplerich-zsh-theme ~/.zsh-theme/
    cp ~/.zsh-theme/simplerich.zsh-theme ~/.oh-my-zsh/themes/
fi

# Oh-my-zsh plugins
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ ! -d ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions ]; then
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
fi

if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search ]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
fi
# endregion ZSH

if [ ! $(which nvim) ]; then
    brew install neovim
fi

if [ ! $(which fzf) ]; then
    brew install fzf
fi

# region Alacritty
if [ ! $(mdfind "kMDItemKind == 'Application'" | grep /Applications/Alacritty.app) ]; then
    brew install --cask alacritty
fi

if [ ! -f ~/.config/alacritty/catpuccin-mocha.toml ]; then
    curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
fi
# endregion
