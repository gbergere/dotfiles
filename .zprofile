#### --------------------------------------------------------------------------
##
## 	.zprofile for user (Used on Mac OS X)
##
##	  author : gbergere (Geoffrey BERGERET)
##	  version : 1.1.1
##	  date : 06/09/2016
##	  
## ----------------------------------------------------------------------------

## ----------------------------------------------------------------------------
# ZSH GIT COMPLETION
# -----------------------------------------------------------------------------

autoload -U compinit && compinit
zmodload -i zsh/complist

## ----------------------------------------------------------------------------
# CONFIGS
# -----------------------------------------------------------------------------

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1=$'%B%n%b@%B%m%b:[%~]%(?.. (%?%))\n>> ' 
export EDITOR="vim"

bindkey -e # Fix Ctrl-A unbinding.

## ----------------------------------------------------------------------------
# HISTORY CONF
# -----------------------------------------------------------------------------

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="${HOME}/.zhistory"

## ----------------------------------------------------------------------------
# TMUX
# -----------------------------------------------------------------------------

if tmux ls | grep --silent "main"
then
	if tmux ls | grep -e "^main: .*" | grep --silent -v -e ".* (attached)$"
	then
		tmux attach-session -t main
	fi
else
	tmux new-session -s main
fi
