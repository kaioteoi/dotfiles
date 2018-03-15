"'"""""""""""""""""""""""""""""
" General configs
""""""""""""""""""""""""""""""
syntax on
syntax enable
set nofoldenable
set nocompatible
set encoding=utf8
set nowrap
set backspace=indent,eol,start
set splitright
set splitbelow
set noswapfile

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
colorscheme apprentice

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

""""""""""""""""""""""""""""""
" Marvim configs
""""""""""""""""""""""""""""""
let g:marvim_find_key = '<C-m>f'
let g:marvim_store_key = '<C-m>k'
let g:marvim_prefix_on_load = 0
