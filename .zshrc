# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/simondevilliers/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="dracula"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# source ~/code/cloud/runner-wrapper/local-task-runner.alias.sh

rm_submod() {
  git submodule deinit -f $1
  git rm $1
  git commit -m "Removed submodule $1"
  echo "now run `rm -rf .git/modules/PATH_TO_MODULE`"
}

line_endings() {
  sed -i.bak 's/\r$//' $1.txt
}

mark() {
  export $1=`pwd`;
}

upfrom() {
  git fetch --all
  git checkout $1
  git pull origin $1
  git checkout -
  git rebase $1
}

refresh() {
  CLOUD_DIR=~/code/cloud/
  if [ -z "$2" ]
  then
    gitlab_group=cloudsquad
  else
    gitlab_group=pipelinesquad
  fi
  if [ -d $CLOUD_DIR"$1" ]; then
    cd $CLOUD_DIR
    echo "removing $1"
    rm -rf "$1"
    echo "recloning $1 (from $gitlab_group group)"
    git clone --recursive https://code.tvac.bt.co.uk/$gitlab_group/$1.git
    cd "$1"
  else
    input_string="?$CLOUD_DIR$1 not found. Do you want to try cloning https://code.tvac.bt.co.uk/$gitlab_group/$1.git? [y,n] "
    if [ -n "$ZSH_VERSION" ]; then
      # assume Zsh
      read -k 1 $input_string input
    elif [ -n "$BASH_VERSION" ]; then
      # assume Bash
      read -n 1 -p $input_string input
    fi
    case $input in
      y|Y) echo "\n" && git clone --recursive https://code.tvac.bt.co.uk/$gitlab_group/$1.git ;;
      n|N) echo "\nOk, Bye!" ;;
      *) echo didn\'t work ;;
    esac
  fi
}

rootmake() {
  make -f ~/Makefile $@
}

reqs_loc=~/code/cloud/cloud_requirements.txt

savereqs() {
  pip freeze > $reqs_loc
  echo "Saved Python requirements to $reqs_loc!:"
  head -n 3 $reqs_loc
  echo "..."
  tail -n 3 $reqs_loc
}

squashpush() {
  git add -A
  git commit -m $1
  resetbranch
  git commit -m $1
  git push --force
}

alias g-='git checkout -'
alias tfdev='cd ~/go/src/github.com/terraform-providers/terraform-provider-aws'
alias dockercleanup='docker rm -vf $(docker ps -a -q) && docker rmi -f $(docker images -a -q)'


export WORKON_HOME=$HOME/Envs
source "$(pyenv which virtualenvwrapper.sh)"

cd ~/code/octoenergy

workon kraken-core

# RabbitMQ
export PATH=/usr/local/sbin:$PATH

#---- go stuff
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# ----------------------- P9K stuff
# POWERLEVEL9K_MODE='nerdfont-complete'
# source  ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme
# POWERLEVEL9K_CUSTOM_PYTHON="echo -n '\uf81f' Python"
# POWERLEVEL9K_CUSTOM_PYTHON_FOREGROUND="black"
# POWERLEVEL9K_CUSTOM_PYTHON_BACKGROUND="blue"

# POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
# POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
# POWERLEVEL9K_BATTERY_CHARGING='yellow'
# POWERLEVEL9K_BATTERY_CHARGED='green'
# POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
# POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
# POWERLEVEL9K_BATTERY_LOW_COLOR='red'
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
# POWERLEVEL9K_BATTERY_ICON='\uf1e6 '
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
# POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
# POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
# POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon virtualenv aws battery dir vcs status)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time dir_writable ip ram load background_jobs)

# POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

# POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m/%y}"
# POWERLEVEL9K_TIME_BACKGROUND='white'
# POWERLEVEL9K_RAM_BACKGROUND='yellow'
# POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="white"
# POWERLEVEL9K_LOAD_WARNING_BACKGROUND="white"
# POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="white"
# POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
# POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
# POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="black"
# POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
# POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
# POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
# POWERLEVEL9K_HOME_ICON=''
# POWERLEVEL9K_HOME_SUB_ICON=''
# POWERLEVEL9K_FOLDER_ICON=''
# POWERLEVEL9K_STATUS_VERBOSE=true
# POWERLEVEL9K_STATUS_CROSS=true
# POWERLEVEL9K_BATTERY_HIDE_ABOVE_THRESHOLD=10
# POWERLEVEL9K_VCS_BRANCH_ICON=$'  '
alias terraform_states='terraform_states.py'
alias tests_runner='tests-runner.sh'
alias dog='pygmentize -g'

alias howmanycommits='git rev-list --count HEAD ^master'
alias resetbranch='git reset --soft HEAD~$(git rev-list --count HEAD ^master)'
alias vf='vim `fzf`'
alias copylast='echo "!!" | pbcopy'
alias opsignin='eval $(op signin octoenergy)'
alias mfa='source ~/mfa.sh'
alias d='docker'
alias dc='docker-compose'
alias de='docker exec -it'
alias dl='docker logs'
alias dp='docker ps'
alias drm='docker rm $(docker ps -a -q)'
alias gl='git log --pretty=oneline --abbrev-commit'
alias htop='sudo htop'
alias jga='jx get activity -f'
alias jxb='jx get build logs'
alias jxs='jx step syntax effective -s'
alias k='kubectl'
alias kap='kubectl get pods --all-namespaces'
alias kapw='kubectl get pods --all-namespaces -w'
alias kcg='kubectl config get-contexts'
alias kcu='kubectl config use-context'
alias ke='kubectl exec -n'
alias kl='kubectl logs -n'
alias kp='kubectl get pods -n'
alias kpf='kubectl port-forward -n'
alias ll='ls -lh'
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
alias psg='ps -ef | grep'
alias watch='watch '
alias gdlb='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias vim='nvim .'
alias ls='exa --long --git'
alias tree='exa -T'
alias glp='git log -p'

function copy(){ cat $1 | pbcopy }

autofixup() {
  git add -A
  cm=$(git log -1 --pretty=%B | cat)
  resetbranch
  git commit -m "$cm"
}

# For things that can't be commited
sh ~/.envvars.sh

# zsh autocompletions https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

eval "$(rbenv init -)"

export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,iterm/*}"'

eval "$(starship init zsh)"

export EDITOR='nvim'
export VISUAL='nvim'

ctags=/usr/local/bin/ctags
