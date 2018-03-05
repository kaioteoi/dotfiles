""""""""""""""""""""""""""""""
" General configs
""""""""""""""""""""""""""""""
set nofoldenable
set nocompatible
set encoding=utf8
set nowrap
syntax on
set backspace=indent,eol,start

""""""""""""""""""""""""""""""
" Show linenumbers
""""""""""""""""""""""""""""""
set number
set relativenumber
set ruler

""""""""""""""""""""""""""""""
" Set Proper Tabs
""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

""""""""""""""""""""""""""""""
" Always display the status line
""""""""""""""""""""""""""""""
set laststatus=2

""""""""""""""""""""""""""""""
" Enable highlighting of the current line
""""""""""""""""""""""""""""""
set cursorline

""""""""""""""""""""""""""""""
" Theme and Styling 
""""""""""""""""""""""""""""""
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 233
colo seoul256

""""""""""""""""""""""""""""""
" NERDTree configs
""""""""""""""""""""""""""""""
let NERDTreeQuitOnOpen = 1

""""""""""""""""""""""""""""""
" TagBar configs
""""""""""""""""""""""""""""""
let g:tagbar_autoclose = 1
set tags=./tags,tags;$HOME

""""""""""""""""""""""""""""""
" ALELint options
""""""""""""""""""""""""""""""
let g:ale_linters = {
\    'python' : ['pycodestyle']
\}
