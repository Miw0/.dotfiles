ZSH=$HOME/.oh-my-zsh

ZSH_THEME="miw0"
COMPLETION_WAITING_DOTS="true"
plugins=(git composer phing wwwhome svn-fast-info)

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# sets aliases
source $HOME/.aliases-basic

# job related settings
# source $HOME/.aliases-job
# PATH=$PATH:~/bin
# source /etc/profile.d/rbenv.sh
# newsvn
# source /home/mib/projects/mib.docker-runner/dockerhelper.sh

# start in project dir
if [ -d "$HOME/projects" ]; then
  cd $HOME/projects;
fi
