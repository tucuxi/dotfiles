alias h='history'
alias ll='ls -alF'
alias l='ls -CF'

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export GREP_OPTIONS='--color=auto'

PS1='\[\e[0;33m\]\u\[\e[0m\]:\[\e[0;34m\]\W\[\e[0m\]\$ '

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
