alias l="ls -la"
alias ls="ls -G"

alias sc="script/console"
alias ss="script/server -p `available_rails_port`"
alias sg="script/generate"

alias gb="git branch"
alias gba="git branch -a"
alias gc="git commit -v"
alias gd="git diff | $EDITOR"
alias gl="git pull"
alias gp="git push"
alias gst="git status"
alias gcav="git commit -a -v"
alias gcp="git cherry-pick"

alias ec="emacsclient --no-wait"

alias sl='screen -list'
alias sdr='screen -d -r'
alias s='screen -D -R'

alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add'
alias svnrmall='svn status | grep "^\!" | awk "{print \$2}" | xargs svn rm'

alias gemdocs="gem server >/dev/null 2>&1 & sleep 1 ; open http://localhost:8808"

alias gorm="cd ~/code/rm/main"
alias  gob="cd ~/code/rm/board"

function opengem {
  gem which $1 | xargs dirname | xargs dirname | xargs $EDITOR;
}

function mategem {
  EDITOR='mate'
  opengem $1;
}

function yank { \cat $1 | pbcopy; }

function gems { pushd `gem env home`; }

function parse_git_dirty
{
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch
{
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

