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
	# Zsh
	ln -svhf $(PWD)/.zprofile ~
	ln -svhf $(PWD)/.fzf.zsh ~
	# GPG
	[ ! -d ~/.gnupg ] && mkdir ~/.gnupg
	ln -svhf $(PWD)/.gnupg/* ~/.gnupg
	# Install all brew packages
	brew bundle

install-brew:
	[ ! -f /usr/local/bin/brew ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-vim-dep:
	[ ! -d ~/.vim/bundle ] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	luarocks install luacheck
	ln -svhf $(PWD)/Library/Application\ Support/Luacheck ~/Library/Application\ Support/Luacheck
