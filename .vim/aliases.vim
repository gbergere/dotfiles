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
map <C-n> :NERDTreeToggle<CR>

"""
" Airline Plugin
""
Plugin 'vim-airline/vim-airline'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'

"""
" Vim GitGutter Plugin
""
Plugin 'airblade/vim-gitgutter'
