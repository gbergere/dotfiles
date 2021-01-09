.DEFAULT_GOAL := init-home
.PHONY = init install-vim-dep

init-home:
	# Git
	ln -svhf $(PWD)/.gitconfig  ~
	ln -svhf $(PWD)/.gitignore  ~
	ln -svhf $(PWD)/.editorconfig ~
	ln -svhf $(PWD)/.yamllint ~
	# tmux
	ln -svhf $(PWD)/.tmux.conf  ~
	# Vim
	ln -svhf $(PWD)/.vimrc  ~
	ln -svhf $(PWD)/.vim  ~
	# nVim
	ln -svhf $(PWD)/.config/nvim/  ~/.config
	# ranger
	ln -svhf $(PWD)/.config/ranger/  ~/.config
	# Zsh
	ln -svhf $(PWD)/.zprofile ~
	ln -svhf $(PWD)/.zshrc ~
	ln -svhf $(PWD)/.fzf.zsh ~
	# Ctags
	ln -svhf $(PWD)/.ctags ~
	# Install all brew packages
	brew bundle

install-brew:
	-[ ! -f /usr/local/bin/brew ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-vim-dep:
	-[ ! -d ~/.vim/bundle ] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim -c 'PluginInstall' -c 'qa!'

install-pyenv:
	pyenv install -s 3.8.3
	-[ ! -d $(pyenv root)/plugins ] && git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper
	-pyenv virtualenvwrapper
	-mkvirtualenv -p python3.8 kraken-core
