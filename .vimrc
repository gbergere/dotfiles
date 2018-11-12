"""
"	Vundle Plugin Manager
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins 
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'hashivim/vim-terraform'
Plugin 'pearofducks/ansible-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required

"""
"	Vim configuration
""

syntax on

set number
set tabstop=2
set expandtab
set autoindent
set background=dark

let g:NERDTreeWinSize=40

let g:terraform_align=1
let g:terraform_remap_spacebar=1
let g:terraform_fmt_on_save=1

" Airline config
let g:airline#extensions#tabline#enabled = 1
if !has('gui_running')
  set t_Co=256
endif

" CtrlP config
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': 'find %s -type f'
  \ }

" Ansible config
let g:ansible_extra_syntaxes = "sh.vim ruby.vim"
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1

"""
" Install ALE Plugin
"
" Use :
" - https://github.com/koalaman/shellcheck (Bash)
" - https://github.com/wata727/tflint
" - https://github.com/willthames/ansible-lint
" - https://github.com/jorisroovers/gitlint (Git commit)
" - https://yamllint.readthedocs.io (YAML)
" - https://github.com/mrtazz/checkmake (Makefile)
" - https://github.com/hadolint/hadolint (Dockerfile)
" - https://github.com/Kuniwak/vint (Vim)
""
Plugin 'w0rp/ale'
let g:ale_list_window_size = 5 " Show 5 lines of errors (default: 10)
