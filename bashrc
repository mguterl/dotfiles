# load bash aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# powerline prompt
function _update_ps1() {
  export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

# node version manager
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
