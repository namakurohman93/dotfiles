# https://bashrcgenerator.com/
export PS1="\[$(tput bold)\]\w\[$(tput sgr0)\]\[\033[38;5;75m\]_\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
export EDITOR=/usr/bin/vim

alias ls="ls -Gp"
alias ll="ls -alFGp"
alias la="ls -A"
alias l="ls -CF"
alias ve="vim ~/.vimrc"
alias tmx-ks="tmux kill-server"
alias tmx-ns="tmux new-session -s'didadadida93'"
alias tmx-ws="tmux new-session -s'muchamadr'"
alias cat="bat"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"

export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH="/usr/local/opt/scala@2.12/bin:$PATH"

export PATH="$PATH:/Users/didadadida93/Library/Application Support/Coursier/bin"

export BAT_THEME="Dracula"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

TMUX_SESSION_NAME=$(tmux list-sessions 2>/dev/null | sed -n '/(attached)/s/:.*//p')

if [ "$TERM_PROGRAM" == "tmux" ] && [ "$TMUX_SESSION_NAME" == "didadadida93" ]; then
  git config --global user.name "didadadida93"
  git config --global user.email "didadadida93@gmail.com"
elif [ "$TERM_PROGRAM" == "tmux" ] && [ "$TMUX_SESSION_NAME" == "muchamadr" ]; then
  git config --global user.name "Muchamad Rohman"
  git config --global user.email "muchamad.rohman@ir.com"
else
  :
fi
