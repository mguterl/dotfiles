alias l="ls -la"
alias ls="ls -G"

alias sc="[ -e script/console ] && script/console || rails console"
alias ss="[ -e script/server ] && script/server -p `available_rails_port` || rails server -p `available_rails_port`"
alias sg="[ -e script/generate  ] && script/generate || rails generate"

alias gb="git branch"
alias gba="git branch -a"
alias gc="git commit -v"
alias gd="git diff"
alias gl="git pull --rebase"
alias gp="git push"
alias gst="git status -s"
alias gcav="git commit -a -v"
alias gcp="git cherry-pick"
alias l='git log --pretty=oneline --abbrev-commit'
alias log='git log -v'
alias logg='git log --graph --abbrev-commit --date=relative'

alias ec="emacsclient --no-wait"

alias sl='screen -list'
alias sdr='screen -d -r'
alias s='screen -D -R'

alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add'
alias svnrmall='svn status | grep "^\!" | awk "{print \$2}" | xargs svn rm'

alias gemdocs="gem server >/dev/null 2>&1 & sleep 1 ; open http://localhost:8808"

alias gentags="find . -name "*.rb" | xargs ctags -a -e -f TAGS"

alias b="bundle exec"

alias vg='valgrind --leak-check=full --show-possibly-lost=no --dsymutil=yes'

function opengem {
  if [ -f Gemfile ]
  then
    directory=$(bundle show $1)
  else
    directory=$(gem which $1 | xargs dirname | xargs dirname)
  fi
  echo "$EDITOR $directory"
  $EDITOR $directory
}

function yank { \cat $1 | pbcopy; }

function gems { pushd `gem env home`; }

function parse_git_dirty
{
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch
{
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

function current_git_branch
{
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"
}

function pgrep() {
    ps aux | grep $1 | grep -v grep
}

function pkill() {
    local pid
    pid=$(ps ax | grep $1 | grep -v grep | awk '{ print $1 }')
    kill -9 $pid
    echo -n "Killed $1 (process $pid)"
}

alias serve="python -m SimpleHTTPServer 8000"
alias tmux="tmux -2"
