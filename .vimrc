set encoding=utf-8

" Vundle Plugin Manager
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

filetype off                  " required

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'rbong/vim-flog'
Plugin 'tpope/vim-eunuch'
Plugin 'godlygeek/tabular'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()            " required
filetype plugin indent on    " required

source ~/.vim/basics.vim
source ~/.vim/aliases.vim
source ~/.vim/linters.vim
source ~/.vim/functions.vim

nmap <leader>f :Files<CR>
nmap <leader>h :History<CR>
nmap <leader>l :BLines<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>rg :Rg
nmap <leader>t :Tags
nmap <leader>d :BTags <CR>

" Edit & source vimrc shortcuts
nmap <leader>ev :tabe ~/.vimrc<cr>
nmap <leader>sv :source ~/.vimrc<cr>
map <Space> <Leader>
