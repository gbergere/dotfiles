"""
" Linters
""
Plugin 'google/vim-jsonnet'
Plugin 'editorconfig/editorconfig-vim'

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
" Terraform Plugin
""
Plugin 'hashivim/vim-terraform'

let g:terraform_align=1
let g:terraform_remap_spacebar=1
let g:terraform_fmt_on_save=1
let g:terraform_fold_sections=1
