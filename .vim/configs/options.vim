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
" YCM
""""""""""""""""""""""""""""""
let g:ycm_python_binary_path = 'python'

""""""""""""""""""""""""""""""
" Incsearch
""""""""""""""""""""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" incsearch.vim x fuzzy x vim-easymotion

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
    \   'converters': [incsearch#config#fuzzy#converter()],
    \   'modules': [incsearch#config#easymotion#module()],
    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
    \   'is_expr': 0,
    \   'is_stay': 1
    \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
