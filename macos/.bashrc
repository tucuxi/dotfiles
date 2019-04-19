#
# ~/.bashrc
#

[[ $- != *i* ]] && return

export LANG=en_US.UTF-8

#
# Editor and pager
#
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less

#
# Aliases
#
alias cp='cp -i'                # confirm before overwriting
alias df='df -h'                # human-readable size
alias free='free -m'            # size in MB
alias h='history'
alias ll='ls -l'
alias o='open'
alias r='ranger'
alias v='nvim'

#
# Colors
#
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
PS1='\[\e[0;33m\]\u\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\]\$ '

#
# Bash options
#
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

#
# Completion
#
[ -r $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion

#
# Special application settings
#
