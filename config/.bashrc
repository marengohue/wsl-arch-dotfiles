#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup prompt
PS1='[\u@\h \W]\$ '

alias ls="ls -la --color=auto"
alias grep="grep --color=auto"
