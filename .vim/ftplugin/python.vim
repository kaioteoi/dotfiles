""""""""""""""""""""""""""""""
" Semantic config
""""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=99
set expandtab
set autoindent
set fileformat=unix 

""""""""""""""""""""""""""""""
" On write functions
""""""""""""""""""""""""""""""
"au BufWritePost *.py :GenerateTags

""""""""""""""""""""""""""""""
" Plugin configs
""""""""""""""""""""""""""""""
let g:ale_linters = {
\    'python' : ['flake8']
\}
