# random
alias nyan='TERM=ansi telnet nyancat.dakko.us'

# reload the shell
alias reshell='exec $SHELL -l'

# dir
alias ll='ls -alF'
alias ..='cd ..'
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

# gems
alias gunall='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias biv='bundle install --path vendor'
alias cowa='bundle exec compass watch'

# load nvm and nvm completition
# [[ -s /home/mw/.nvm/nvm.sh ]] && . /home/mw/.nvm/nvm.sh
# [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
# nvm use default

# load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"