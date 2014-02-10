ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"
COMPLETION_WAITING_DOTS="true"
plugins=(git bundler)

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_profile

export PATH=$PATH:/Users/michael/.rbenv/shims:/Users/michael/.rbenv/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin