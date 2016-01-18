# configure oh-my-zsh
export ZSH=/home/miw0/.oh-my-zsh
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
ZSH=$HOME/.oh-my-zsh

# set zsh settings
ZSH_THEME="ys"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# sets aliases
source $HOME/.aliases-basic
source $HOME/.aliases-eos
