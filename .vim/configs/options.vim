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
set background=dark
colorscheme codedark
let g:airline_theme = 'codedark'

""""""""""""""""""""""""""""""
" NERDTree configs
""""""""""""""""""""""""""""""
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

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


""""""""""""""""""""""""""""""
" Vim Sessions
""""""""""""""""""""""""""""""
let g:session_autoload = 'no'
let g:session_autosave = 'no'

command! PrettyXML call utils#do_pretty_xml()
