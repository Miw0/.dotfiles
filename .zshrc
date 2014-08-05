ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"
COMPLETION_WAITING_DOTS="true"
plugins=(git bundler)

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# sets aliases
source $HOME/.aliases

# loads rbenv
source /etc/profile.d/rbenv.sh

# start in project dir
cd projects
