"""
" Fuzzy Search Plugin
""
Plugin 'ggvgc/vim-fuzzysearch'

let g:fuzzysearch_prompt = 'fuzzy /'
let g:fuzzysearch_hlsearch = 1
let g:fuzzysearch_ignorecase = 1
let g:fuzzysearch_max_history = 30
let g:fuzzysearch_match_spaces = 0

nnoremap / :FuzzySearch<CR>
let g:fuzzysearch_prompt = '/'
" set hlsearch            " Highlight all search matches
set incsearch           " Highlight matching values on search as you type
