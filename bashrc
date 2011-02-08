# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH="/Users/michaelguterl/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/mongodb/bin:/usr/local/share/npm/bin:$PATH"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Prompt
export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '

# Misc
export EDITOR="emacsclient"
export RUBYOPT='-rubygems'
export HISTSIZE=42000

# speed up REE
export RUBY_GC_MALLOC_LIMIT=256000000
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_HEAP_SLOTS_INCREMENT=1

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
