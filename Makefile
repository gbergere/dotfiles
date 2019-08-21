.DEFAULT_GOAL := init
.PHONY = init install-vim-dep

init:
	# Git
	ln -svhf $(PWD)/.gitconfig  ~
	ln -svhf $(PWD)/.gitignore  ~
	ln -svhf $(PWD)/.editorconfig ~
	ln -svhf $(PWD)/.yamllint ~
	# Hammerpsoon
	ln -svhf $(PWD)/.hammerspoon  ~
	ln -svhf $(PWD)/.tmux.conf  ~
	# Vim
	ln -svhf $(PWD)/.vimrc  ~
	ln -svhf $(PWD)/.vim  ~
	# Zsh
	ln -svhf $(PWD)/.zprofile ~
	ln -svhf $(PWD)/.fzf.zsh ~
	# GPG
	ln -svhf $(PWD)/.gnupg/* ~/.gnupg

install-vim-dep:
	[ ! -d ~/.vim/bundle ] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	luarocks install luacheck
	ln -svhf $(PWD)/Library/Application\ Support/Luacheck ~/Library/Application\ Support/Luacheck
