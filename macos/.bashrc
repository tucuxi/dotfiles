#
# ~/.bashrc
#

[[ $- != *i* ]] && return

[ -r $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion

export LANG=en_US.UTF-8
export HOMEBREW_GITHUB_API_TOKEN="a6a17885d0ac74677e614aaa724331bc2bc64317"
export RANGER_LOAD_DEFAULR_RC=FALSE
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
PS1='\[\e[0;33m\]\u\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\]\$ '

alias cp='cp -i'                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias h='history'
alias ll='ls -l'
alias v='nvim'                            # neovim

complete -cf sudo

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend
