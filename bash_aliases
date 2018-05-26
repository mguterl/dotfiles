# git aliases
alias gb="git branch"
alias gba="git branch -a"
alias gc="git commit -v"
alias gd="git diff"
alias gl="git pull --rebase"
alias gp="git push"
alias gst="git status -s"
alias gcp="git cherry-pick"

# color ls
alias ls="ls -G"

# tmux conveniences
alias tml="tmux list-sessions"
alias tma="tmux attach-session -t"
alias tmc="clear && tmux clear-history"
alias tmk="tmux kill-session"
alias tm="tmux new -s"

// https://twitter.com/derrickreimer/status/999667665118605313/photo/1
function branchify {
  git branch $1 && git reset --hard HEAD~ && git checkout $1
}
