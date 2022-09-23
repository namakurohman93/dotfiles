# https://bashrcgenerator.com/
export PS1="\[$(tput bold)\]\w\[$(tput sgr0)\]\[\033[38;5;75m\]_\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
# export EDITOR=/usr/bin/vim
export EDITOR=/usr/local/bin/nvim

alias ls="ls -Gp"
alias ll="ls -alFGp"
alias la="ls -A"
alias l="ls -CF"
alias ldir="ls -alFGpd */ .*/"
# alias ve="vim ~/.vimrc"
alias ve="nvim ~/.config/nvim/init.vim"
alias tmx-ks="tmux kill-server"
alias tmx-ns="tmux new-session -s'didadadida93'"
alias tmx-ws="tmux new-session -s'muchamadr'"
alias cat="bat"
alias be="tmux neww nvim ~/.bash_profile"
alias bs="source ~/.bash_profile"
alias vim="nvim"
alias gf="gofmt -s -w ."

export BASH_SILENCE_DEPRECATION_WARNING=1

PYTHON_PATH="/Users/didadadida93/Library/Python/3.8/bin"
GO_BIN_PATH="/usr/local/go/bin"
export PATH="$SCALA_PATH:$COURSIER_PATH:$PYTHON_PATH:$GO_BIN_PATH:$PATH"

export BAT_THEME="Dracula"

[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

TMUX_SESSION_NAME=$(tmux list-sessions 2>/dev/null | sed -n '/(attached)/s/:.*//p')

if [ "$TERM_PROGRAM" == "tmux" ] && [ "$TMUX_SESSION_NAME" == "didadadida93" ]; then
  git config --global user.name "didadadida93"
  git config --global user.email "didadadida93@gmail.com"
elif [ "$TERM_PROGRAM" == "tmux" ] && [ "$TMUX_SESSION_NAME" == "workprofile" ]; then
  git config --global user.name "Work Profile"
  git config --global user.email "email@work.com"
else
  git config --global user.name "didadadida93"
  git config --global user.email "didadadida93@gmail.com"
fi
