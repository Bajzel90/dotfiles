#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lgh --color=auto'
alias grep='grep --color=auto'
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
PS1='[\u@\h \W]\$ '

. "$HOME/.local/bin/env"

alias ghypr='cd ~/.config/hypr/'
