#!/usr/bin/env bash

# Colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT_GRAY='\033[0;37m'
DARK_GRAY='\033[1;30m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
WHITE='\033[1;37m'
RESET='\033[0m'

# Check for Homebrew,
# Install if we don't have it
if [ ! $(which brew) ]; then
  echo -e "${GREEN}Installing Homebrew...${RESET}"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# Make sure we’re using the latest Homebrew.

brew update
brew install coreutils

# region chezmoi
if [ ! $(which chezmoi) ]; then
    echo -e "${GREEN}Installing Chezmoi...${RESET}"
    brew install chezmoi
fi
# endregion

# region ZSH
if [ ! $(which zsh) ]; then
    echo -e "${GREEN}Installing ZSH...${RESET}"
    brew install zsh
    chsh -s $(which zsh)
fi

if [ ! -d ~/.oh-my-zsh ]; then
    echo -e "${GREEN}Installing Oh My Zsh...${RESET}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo -e "${ORANGE}Oh My Zsh already installed, skipped.${RESET}"
fi

ZSH_CUSTOM_PATH=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
ZSH_PATH=${ZSH:-~/.oh-my-zsh}

# Oh-my-zsh theme setup
if [ ! -d "$ZSH_CUSTOM_PATH/themes/spaceship-prompt/" ]; then
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM_PATH/themes/spaceship-prompt/" --depth=1
    ln -s "$ZSH_CUSTOM_PATH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM_PATH/themes/spaceship.zsh-theme"
fi

# Oh-my-zsh plugins
if [ ! -d "$ZSH_CUSTOM_PATH/plugins/zsh-autosuggestions/" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM_PATH/plugins/zsh-autosuggestions/"
fi

if [ ! -d "$ZSH_CUSTOM_PATH/plugins/zsh-syntax-highlighting/" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM_PATH/plugins/zsh-syntax-highlighting/"
fi

if [ ! -d "$ZSH_CUSTOM_PATH/plugins/zsh-completions/" ]; then
    git clone https://github.com/zsh-users/zsh-completions "$ZSH_CUSTOM_PATH/plugins/zsh-completions/"
fi

if [ ! -d "$ZSH_CUSTOM_PATH/plugins/zsh-history-substring-search/" ]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search "$ZSH_CUSTOM_PATH/plugins/zsh-history-substring-search/"
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

infocmp alacritty &> /dev/null;
if [ $? -eq 0 ]; then
    echo -e "${ORANGE}Alacritty term already configured, skipped.${RESET}"
else
    echo -e "${GREEN}Configuring Alacritty terminfo...${RESET}"
    git clone https://github.com/alacritty/alacritty.git /tmp/alacritty
    sudo tic -xe alacritty,alacritty-direct /tmp/alacritty/extra/alacritty.info
    rm -rf /tmp/alacritty
fi

if [ ! -f ~/.config/alacritty/catpuccin-mocha.toml ]; then
    curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
fi

if [ $(ls ~/Library/Fonts | grep -c FiraCode) -eq 0 ]; then
    brew install font-fira-code-nerd-font
fi
# endregion

# region tmux
if [ ! $(which tmux) ]; then
    brew install tmux
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
# endregion

# region Language specifics

## region Lua
if [ ! $(which stylua) ]; then
    brew install stylua
fi
## endregion Lua

# endregion Language specifics

# region Bash tools
## region bat
if [ ! $(which bat) ]; then
    brew install bat
fi
## endregion bat
#
