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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"

export BASH_SILENCE_DEPRECATION_WARNING=1

SCALA_PATH="/usr/local/opt/scala@2.12/bin"
COURSIER_PATH="/Users/didadadida93/Library/Application Support/Coursier/bin"
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
elif [ "$TERM_PROGRAM" == "tmux" ] && [ "$TMUX_SESSION_NAME" == "muchamadr" ]; then
  git config --global user.name "Muchamad Rohman"
  git config --global user.email "muchamad.rohman@ir.com"
else
  git config --global user.name "didadadida93"
  git config --global user.email "didadadida93@gmail.com"
fi

# IR AWS CLI Login: Begin ===== ===== =====
export AWS_CLI_LOGIN_SCRIPT_PATH="/Users/didadadida93/g/git-local/aws-cli-login/login.py"
export AWS_CLI_LOGIN_PYTHON_PATH="/Users/didadadida93/.local/share/virtualenvs/aws-cli-login-j598tT0S/bin/python"
source "/Users/didadadida93/g/git-local/aws-cli-login/alias.sh"
# IR AWS CLI Login: End ===== ===== =====
