""""""""""""""""""""""""""""""""""""""""
" kr4nd0m's vimrc
""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
scriptencoding utf-8

" Auto install plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
           \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    augroup PLUG
        au!
        autocmd VimEnter * PlugInstall
    augroup END
endif
""""""""""""""""""""""""""""""""""""""""
" }}}
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Plugins {{{
""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" FZF
Plug 'junegunn/fzf.vim'
    let g:fzf_command_prefix = 'Fzf'
    nnoremap ,, :FzfTags<CR>
    nnoremap ,. :FZF<CR>
    nnoremap ,b :FzfBuffers<CR>
    nnoremap <C-F> :FzfAg<CR>
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Tags
Plug 'jsfaint/gen_tags.vim'
    nnoremap <Leader>tg :GenCtags<CR>
    nnoremap <Leader>tc :ClearCtags<CR>
    nnoremap <Leader>tr :ClearCtags<CR>:GenCtags<CR>
    let g:gen_tags#statusline = 1
    let g:gen_tags#ctags_auto_gen = 1
    let g:gen_tags#ctags_opts = [
        \ "--python-kinds=+cfm-x",
        \ "--exclude=node_modules",
        \ "--exclude=__pycache__",
        \ "--exclude=schema.graphql",
        \ "--exclude=*.py[ocm]",
        \ "--append=no"
    \ ]
    let g:gen_tags#use_cache_dir = 0

" Nerdtools
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
    nnoremap ,n :NERDTreeFind<CR>
    nnoremap ,m :NERDTreeToggle<CR>
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

" ALE Lint
Plug 'w0rp/ale'
    let g:ale_sign_warning = '.'
    let g:ale_lint_on_enter = 0

" easymotion
Plug 'easymotion/vim-easymotion'
    map <Leader> <Plug>(easymotion-prefix)
    map <Plug>(easymotion-prefix)w <Plug>(easymotion-bd-w)
    map <Plug>(easymotion-prefix)e <Plug>(easymotion-bd-e)

" Vim session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
    let g:session_directory = $HOME.'/.config/nvim/sessions/'
    let g:session_command_aliases = 1
    let g:session_autosave = 'yes'
    let g:session_autoload = 'no'

" Macro management
Plug 'fakeezz/marvim'
    let g:marvim_prefix_on_load = 0

" Visual
Plug 'jdsimcoe/abstract.vim'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme='abstract'
    let g:airline#extensions#tabline#show_buffers = 0
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_close_button = 0

" Devicons
Plug 'ryanoasis/vim-devicons'

" Window navigation
Plug 't9md/vim-choosewin'
    nmap - <Plug>(choosewin)

" Conquer of Completion
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
    "" Python support
    "let g:python_host_prog = '/usr/local/bin/python'
    "let g:python3_host_prog = '/usr/local/bin/python3'

    "" Remap keys for gotos
    "nmap <silent> gd <Plug>(coc-definition)
    "nmap <silent> gy <Plug>(coc-type-definition)
    "nmap <silent> gi <Plug>(coc-implementation)
    "nmap <silent> gr <Plug>(coc-references)

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Buffers
Plug 'schickling/vim-bufonly'

" Chore
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
    nmap ys <Plug>Ysurroundw
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'

""""""""""""""""""""""""""""""""""""""""
" Language specific
""""""""""""""""""""""""""""""""""""""""
" Javascript
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'js']}
" Python
Plug 'jeetsukumaran/vim-pythonsense', {'for': ['python', 'py']}
" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'ngmy/vim-rubocop', {'for': 'ruby'}
" HTML/CSS
Plug 'mattn/emmet-vim', {'for': ['html', 'css']}
" Kotlin
Plug 'udalov/kotlin-vim', {'for': ['kotlin', 'kt', 'kts']}

filetype plugin indent on
call plug#end()

""""""""""""""""""""""""""""""""""""""""
" Post plugin loading configs
""""""""""""""""""""""""""""""""""""""""
" Colorscheme
colorscheme abstract

""""""""""""""""""""""""""""""""""""""""
" }}}
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" General configs {{{
""""""""""""""""""""""""""""""""""""""""
syntax on
syntax enable
set nofoldenable
set foldmethod=indent
set nocompatible
set encoding=utf8
set backspace=indent,eol,start
set splitright
set splitbelow
set noswapfile
set number
set relativenumber
set ruler
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set laststatus=2
set ignorecase
set autoread
set incsearch
set redrawtime=10000
set timeoutlen=1000
set ttimeoutlen=0
set scrolloff=5

""""""""""""""""""""""""""""""""""""""""
" }}}
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" #Mappings/Functions {{{
""""""""""""""""""""""""""""""""""""""""
map <Space> <Leader>
command! PrettyXML call utils#do_pretty_xml()

noremap <Leader>cp "+y:echo 'selection copied!'<CR>
noremap <Leader>cl <Esc>0v$h"+y:echo 'line copied!'<CR>
nnoremap <Leader>cw viw"+y:echo 'word copied!'<CR>
vnoremap // y/<C-R>"<CR>

" Source .vimrc
nnoremap <Leader>vs :source ~/.vimrc<CR>

" Zoom
nnoremap <Leader>z :call utils#window_zoom()<CR>

" Move line up/down
nnoremap <Leader>- :m-2<CR>
nnoremap <Leader>_ :m+1<CR>
" Redo
nnoremap U :red<CR>
" Replace on visual selection
vnoremap <C-R> :s/\%V

" tags -> jumps
nnoremap <C-]> <Esc>:exe "tjump " . expand("<cword>")<Esc>

" jump splitting vertical
nnoremap <C-W>] <C-W>v<C-]>

""""""""""""""""""""""""""""""""""""""""
" }}}
""""""""""""""""""""""""""""""""""""""""
