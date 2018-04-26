"""""""""""""""""""""""""""""""""""""""""
" mTc - copy python module to clipboard
"""""""""""""""""""""""""""""""""""""""""
function! ModuleToClipboard()
    let l:word=expand("<cword>")

    if l:word != ""
        let l:package=expand("%:r")
    else
        let l:word=expand("%:t:r")
        let l:package=expand("%:h:r")
    endif

    let l:path = "from " . l:package . " import " . l:word

    let l:path=substitute(l:path, "/", ".", "g")
    let @+=l:path
endfunction


"""""""""""""""""""""""""""""""""""""""""
" pTc - copy python module as pytest path
"""""""""""""""""""""""""""""""""""""""""
function! PytestToClipboard()
    let l:word=expand("<cword>")
    let l:package=expand("%:r")

    if l:word != ""
        let l:path=l:package . " -k " . l:word . " -s"
    else
        let l:path=l:package
    endif

    let l:path=substitute(l:path, "/", ".", "g")
    let @+=l:path
endfunction

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

""""""""""""""""""""""""""""""
" Ags filter
""""""""""""""""""""""""""""""
if exists('g:ags_agargs')
    let g:ags_agargs['--python'] = [ '', '' ]
endif


""""""""""""""""""""""""""""""
" Custom mappings
""""""""""""""""""""""""""""""
nmap <Leader>mtc :call ModuleToClipboard()<CR>:echo 'Module copied to clipboard!'<CR>
nnoremap <Leader>ptc :call PytestToClipboard()<CR>:echo 'Pytest path copied to clipboard!'<CR>
