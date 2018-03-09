""""""""""""""""""""""""""""""
" General configs
""""""""""""""""""""""""""""""
set nofoldenable
set nocompatible
set encoding=utf8
set nowrap
syntax on
set backspace=indent,eol,start
set splitright
set splitbelow

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
colorscheme dracula

""""""""""""""""""""""""""""""
" NERDTree configs
""""""""""""""""""""""""""""""
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.pyc$']

""""""""""""""""""""""""""""""
" TagBar configs
""""""""""""""""""""""""""""""
let g:tagbar_autoclose = 1
set tags=./tags,tags;$HOME

