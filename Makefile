.DEFAULT_GOAL := install
.PHONY = install clean install-vim-dep

~/.hammerspoon: .hammerspoon
	ln -s $(PWD)/$^ $@

~/.gitconfig: .gitconfig
	ln -s $(PWD)/$^ $@

~/.gitignore: .gitignore
	ln -s $(PWD)/$^ $@

~/.vimrc: .vimrc
	ln -s $(PWD)/$^ $@

~/.zprofile: .zprofile
	ln -s $(PWD)/$^ $@

~/.tmux.conf: .tmux.conf
	ln -s $(PWD)/$^ $@

install: ~/.hammerspoon ~/.gitconfig ~/.gitignore ~/.tmux.conf ~/.vimrc ~/.zprofile

install-vim-dep:
	luarocks install luacheck

clean: ~/.hammerspoon ~/.gitconfig ~/.gitignore ~/.tmux.conf ~/.vimrc ~/.zprofile
	rm $^ 
