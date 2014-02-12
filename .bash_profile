# sets aliases
source $HOME/.aliases

# loads libs
## load nvm and nvm completition
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
nvm use default

## loads rbenv
source /etc/profile.d/rbenv.sh