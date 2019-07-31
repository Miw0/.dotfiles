ZSH=$HOME/.oh-my-zsh

ZSH_THEME="miw0"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# sets aliases
source $HOME/.aliases-basic

# job related settings
source $HOME/.aliases-job
PATH=~/bin:$PATH

# start in project dir
if [ -d "$HOME/projects" ]; then
  cd $HOME/projects;
fi
