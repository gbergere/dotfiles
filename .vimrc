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
set t_Co=256
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

"""
" Airline
""
Plugin 'vim-airline/vim-airline'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'

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

"""
" Vimux
""
Plugin 'benmills/vimux'
let g:VimuxPromptString = ">>"
let g:VimuxOrientation = "h"
let g:VimuxHeight = "25"

" Run a given command
map <leader>rg :VimuxPromptCommand<cr>
" Repeat last command
map <leader>rr :VimuxRunLastCommand<cr>

"""
" Automatically set paste mode 
"
" Automatically set paste mode in Vim when pasting in insert mode
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
""
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
