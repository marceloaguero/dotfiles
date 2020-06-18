#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias ift='sudo iftop -i wlp3s0 -m 5M'
alias ll='ls -lah'
alias k=kubectl
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ue='$HOME/Documentos/sistemas/unreal/UnrealEngine/Engine/Binaries/Linux/UE4Editor -opengl'

export GOPATH=/storage/home/marcelo/go
export PATH=$HOME/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.pub-cache/bin

source ~/.git-completion.bash
source ~/.shell_prompt.sh

export OPENFAAS_PREFIX="marceloaguero"
