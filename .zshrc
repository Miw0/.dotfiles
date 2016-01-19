# configure oh-my-zsh
export ZSH=/home/miw0/.oh-my-zsh
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
ZSH=$HOME/.oh-my-zsh

# set zsh settings
ZSH_THEME="ys"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# sets aliases
source $HOME/.aliases-basic
