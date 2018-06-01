ZSH_TMUX_AUTOSTART=true

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme name
ZSH_THEME="af-magic"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git z tmux pip virtualenv taskwarrior)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vimconfig="vim ~/.vimrc"
alias kclip="xclip -sel cli <"
alias gdestroy="gsta -u && gstd"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=/opt/loggi/ops/ansible/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export KEYTIMEOUT=1

# Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source $HOME/.local/bin/virtualenvwrapper.sh
source $HOME/.local/bin/aws_zsh_completer.sh
