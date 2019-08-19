#### --------------------------------------------------------------------------
##
## 	.zprofile for user (Used on Mac OS X)
##
##	  author : gbergere (Geoffrey BERGERET)
##	  version : 1.2
##	  date : 07/09/2016
##
## ----------------------------------------------------------------------------

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

export HISTFILE="${HOME}/.zhistory"
export HISTSIZE=1000
export SAVEHIST=1000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY

## ----------------------------------------------------------------------------
# ZSH GIT COMPLETION
# -----------------------------------------------------------------------------

autoload -U compinit && compinit
zmodload -i zsh/complist

## ----------------------------------------------------------------------------
# ALIASES
# -----------------------------------------------------------------------------

alias less="less -x4SRFX"
alias grep="grep --color=auto -I"
alias grep_search="grep -Eir " # extended regex, recursive, ignore case, show line number
alias diff="colordiff -y --suppress-common-lines "              # requires colordiff package

# Git Alias to merge a branch from an approved PR
function gmerge() {
    git co master && \
    git rebase $1 && \
    git push origin master && \
    git br -d $1 && \
    git push origin :$1
}

# Global aliases
alias -g H="| head"
alias -g T="| tail -f"
alias -g G="| grep"
alias -g C="| column -t"
alias -g L="| less"
alias -g M="| most"
alias -g WL="| wc -l"
alias -g RE="2>&1"
alias -g CA="| cat -A"
alias -g NULE="2> /dev/null"
alias -g NUL="> /dev/null"
alias -g P="2>&1 | pygmentize -l pytb"
alias -g S="sudo "
alias -g GS="grep_search "
alias -g PR="2>&1 | tee /dev/tty | grep -oE 'https://.*' | xargs open"

# Suffix aliases
alias -s md="vim"
alias -s conf="vim"
alias -s txt="vim"
alias -s jpg="open"
alias -s png="open"
alias -s pdf="open"
alias -s gif="open"
alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "
alias -s ace="unace l"


## ----------------------------------------------------------------------------
# Source Dependencies
# -----------------------------------------------------------------------------

# Google Cloud SDK
if [ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ]
then
    . /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
fi

# ~/.zenv
[ -f ~/.zenv ] && source ~/.zenv

# fzf for ZSH ~/.fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## ----------------------------------------------------------------------------
# krew (package manager for kubectl plugins)
# https://github.com/GoogleContainerTools/krew
# -----------------------------------------------------------------------------

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH:${HOME}/.kube/plugins"

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
