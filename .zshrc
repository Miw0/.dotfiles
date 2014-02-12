ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"
COMPLETION_WAITING_DOTS="true"
plugins=(git bundler)

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_profile

# win
export PATH=$PATH:$HOME/.nvm/v0.10.21/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/var/lib/gems/1.8/bin
# mac
#export PATH=$PATH:/Users/michael/.rbenv/shims:/Users/michael/.rbenv/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin