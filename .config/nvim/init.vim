" :call mkdir(stdpath('config'), 'p')
" :exe 'edit '.stdpath('config').'/init.vim'
let mapleader = "\<Space>"
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Quickfix window navigation
nnoremap <silent> <leader>] :cnext<CR>
nnoremap <silent> <leader>[ :cprevious<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" ; as :
nnoremap ; :

" rust
let g:rustfmt_autosave = 1

set mouse=a " Enable mouse usage (all modes) in terminals

" ranger
let g:ranger_map_keys = 0
map <leader>d :Ranger<CR>
" let g:ranger_replace_netrw = 1 " open ranger when vim opens a directory

" Make netrw look like nerdtree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
