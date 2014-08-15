# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="~/bin:$PATH"
export PATH="./bin:$PATH"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PS1='\[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '
export EDITOR="vim"
export HISTSIZE=42000

# speed up REE
export RUBY_GC_MALLOC_LIMIT=256000000
export RUBY_GC_HEAP_INIT_SLOTS=500000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_HEAP_SLOTS_INCREMENT=1

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Always append to bash_history
shopt -s histappend

# Always log and reload bash history
export PROMPT_COMMAND="history -a"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Bash completion for changing directories into projects
# https://gist.github.com/searls/9135103
export CDPATH=".:$HOME:$HOME/code"

# Allow C-s to work for saving in CLI vim
stty -ixon
