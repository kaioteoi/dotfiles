"'"""""""""""""""""""""""""""""
" General configs
""""""""""""""""""""""""""""""
syntax on
syntax enable
set nofoldenable
set foldmethod=indent
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
let g:marvim_prefix_on_load = 0

""""""""""""""""""""""""""""""
" Ultisnips
""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

""""""""""""""""""""""""""""""
" YCM
""""""""""""""""""""""""""""""
let g:ycm_python_binary_path = 'python'
