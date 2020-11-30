" Disable markdown from Polyglot as we're install a separate extension
let g:polyglot_disabled = ['markdown']

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
Plugin 'kshenoy/vim-signature'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'rust-lang/rust.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'Raimondi/delimitMate'
Plugin 'wellle/targets.vim'

call vundle#end()            " required
filetype plugin indent on    " required
colorscheme dracula

source ~/.vim/basics.vim
source ~/.vim/aliases.vim
source ~/.vim/linters.vim
source ~/.vim/functions.vim

set number                     " Show current line number
set relativenumber             " Show relative line numbers

nmap <leader>f :Files<CR>
nmap <leader>h :History<CR>
nmap <leader>l :BLines<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>rg :Rg<CR>
nmap <leader>t :Tags<CR>
nmap <leader>d :BTags<CR>


" Edit & source vimrc shortcuts
nmap <leader>ev :tabe ~/.vimrc<cr>
nmap <leader>sv :source ~/.vimrc<cr>
" map <Space> <Leader>

" Edit & source nvim
nmap <leader>en :tabe ~/.config/nvim/init.vim<cr>
nmap <leader>sn :source ~/.config/nvim/init.vim<cr>

" Drop the w for moving between windows and tabs
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" shift h and shift l to cycle tabs!
nnoremap H gT
nnoremap L gt

" Quick-save
nmap <leader>w :w<CR>

" Quick-quit
nmap <leader>q :qall<CR>

" Easy GitHub URLs from Vim (DW tip)
vnoremap <leader>gb :GBrowse! master:%<cr>

let NERDTreeShowHidden=1

" Puppet - align hashes (while editing)
let g:puppet_align_hashes = 1

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" NOTE for nvim, using coc.nvim, need to install language servers for it: coc-rust-analyzer,
" and for terraform https://dev.to/braybaut/integrate-terraform-language-server-protocol-with-vim-38g

autocmd QuickFixCmdPost [^l]* cwindow

