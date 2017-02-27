# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey -e
# End of lines configured by zsh-newuser-install

autoload -Uz promptinit
promptinit
prompt fade magenta
alias ll='ls -la'

export GOPATH="/home/bobcat/Code/go"
export EDITOR="vim"
