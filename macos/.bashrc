#
# ~/.bashrc
#

[[ $- != *i* ]] && return

[ -r $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion

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

complete -cf sudo

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
