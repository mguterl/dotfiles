alias ls="ls -G"
alias tun="ssh -N deploy@rm1.recruitmilitary.com -L 8888:127.0.0.1:3306"
alias tags="find . -name *rb | xargs /opt/local/bin/ctags -a -e -f TAGS"
alias sc="script/console"
alias l="ls -la"
alias gb="git branch"
alias gba="git branch -a"
alias gc="git commit -v"
alias gd="git diff | mate"
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
alias jrake="jruby -S rake"
alias gorm="cd ~/code/rm/main"
alias  gob="cd ~/code/rm/board"
alias mategem="env EDITOR='mate' gem open"

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

