set encoding=utf-8
scriptencoding utf-8

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

filetype off                  " required

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'rbong/vim-flog'
Plugin 'godlygeek/tabular'
Plugin 'sheerun/vim-polyglot'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'google/vim-jsonnet'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on    " required

"""
" General	Vim configuration
""

syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


let g:NERDSpaceDelims = 1         " Add spaces after comment delimiters by default
set nojoinspaces                  " Use one space, not two, after punctuation.

set t_Co=256
set number " relativenumber
set tabstop=2
set smarttab
set expandtab
set autoindent
set background=dark
set spelllang=en_gb

" Higlight 80 chars line and 120 chars and over.
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn='81,'.join(range(121,999),',')

" Turns backup off so avoid conflicts with git.
set nobackup
set nowritebackup
set noswapfile

"""
" NERDTree Plugin
""
Plugin 'scrooloose/nerdtree'

let g:NERDTreeWinSize=40
let g:NERDTreeNodeDelimiter = "\u00a0"

"""
" Terraform Plugin
""
Plugin 'hashivim/vim-terraform'

let g:terraform_align=1
let g:terraform_remap_spacebar=1
let g:terraform_fmt_on_save=1

"""
" Airline Plugin
""
Plugin 'vim-airline/vim-airline'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'

"""
" Ack
""
Plugin 'mileszs/ack.vim'

cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"""
" CtrlP config
""
Plugin 'ctrlpvim/ctrlp.vim'

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': 'find %s -type f'
  \ }

"""
" Vim Ansible Plugin
""
Plugin 'pearofducks/ansible-vim'
let g:ansible_extra_syntaxes = 'sh.vim ruby.vim'
let g:ansible_attribute_highlight = 'ob'
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1

"""
" Vim GitGutter Plugin
""
Plugin 'airblade/vim-gitgutter'

"""
" ALE Plugin
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
let g:ale_yaml_yamllint_options = '-c ~/.yamllint'

"""
" Vimux Plugin
""
Plugin 'benmills/vimux'
let g:VimuxPromptString = '>>'

" Run a given command
map <leader>ve :VimuxPromptCommand<cr>
" Repeat last command
map <leader>vr :VimuxRunLastCommand<cr>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>

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
  return ''
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
