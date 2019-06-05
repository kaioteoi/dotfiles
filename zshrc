########################################
# Tmux-zsh options
########################################
ZSH_TMUX_AUTOSTART=true

########################################
# Theme
########################################
ZSH_THEME="spaceship"
# Spaceship specific options
[ -s $HOME/.spaceshiprc ] && source $HOME/.spaceshiprc

########################################
# Plugins
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
########################################
plugins=(git z tmux pip virtualenv docker-compose ruby zsh-syntax-highlighting)

########################################
# ssh
########################################
 export SSH_KEY_PATH="~/.ssh/keygo"

########################################
# Aliases
########################################
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias spaceshiprc="vim ~/.spaceshiprc"
alias kclip="xclip -sel cli <"
alias gdestroy="gsta -u && gstd"
alias s=source
alias gri="git rebase -i (git rev-parse origin/master)"

########################################
# General exports and sources
########################################
export LANG=en_US.UTF-8
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/sbin

# Loggi~
export PATH=/opt/loggi/ops/ansible/bin:$PATH

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs

########################################
# oh-my-zsh
########################################
export ZSH=~/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

########################################
# General configs
########################################
# 10ms for key sequences
KEYTIMEOUT=1

# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true

# Node version manager (NVM)
export NVM_DIR="$HOME/.nvm"
#[ -s "/usr/local/opt/nvm/nvm.sh"] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use lts/carbon

# History search bind
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

########################################
# Android configs
########################################
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
