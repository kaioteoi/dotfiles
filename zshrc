########################################
# Tmux-zsh options
########################################
ZSH_TMUX_AUTOSTART=true

########################################
# oh-my-zsh
########################################
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

########################################
# Theme
########################################
ZSH_THEME="spaceship"

########################################
# Plugins
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
########################################
plugins=(git z tmux pip virtualenv docker-compose rust cargo ruby)


########################################
# ssh
########################################
# export SSH_KEY_PATH="~/.ssh/rsa_id"

########################################
# Aliases
########################################
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimconfig="vim ~/.vimrc"
alias kclip="xclip -sel cli <"
alias gdestroy="gsta -u && gstd"

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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
