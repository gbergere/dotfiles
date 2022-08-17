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
set number              " relativenumber
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
  \ 'fallback': 'find %s -type f -maxdepth 3'
  \ }

"""
" Fzf Plugin
""
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" :nnoremap <C-L> :GFiles<CR>

"""
" Vim GitGutter Plugin
""
Plugin 'airblade/vim-gitgutter'

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
