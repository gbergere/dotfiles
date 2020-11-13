:call mkdir(stdpath('config'), 'p')
:exe 'edit '.stdpath('config').'/init.vim'
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

