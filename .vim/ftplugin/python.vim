"""""""""""""""""""""""""""""""""""""""""
" mTc - copy python module to clipboard
"""""""""""""""""""""""""""""""""""""""""
function! ModuleToClipboard()
    cd .
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
    cd .
    let l:word=expand("<cword>")
    let l:package=expand("%:r")

    if l:word != ""
        let l:path=l:package . " -k " . l:word . " -s"
    else
        let l:path=l:package
    endif

    let l:full_path="loggi test -vv " . l:path
    let l:full_path=substitute(l:path, "/", ".", "g")
    let @+=l:full_path
endfunction


"""""""""""""""""""""""""""""""""""""""""
" PTW - pytest module path as ptw command
"""""""""""""""""""""""""""""""""""""""""
function! PytestPtwToClipboard()
    cd .
    let l:word=expand("<cword>")
    let l:package=expand("%:r")

    if l:word != ""
        let l:path=l:package . " -k " . l:word . " -s"
    else
        let l:path=l:package
    endif

    let l:path="loggi ptw -- -vv " . l:path
    let l:path=substitute(l:path, "/", ".", "g")
    let @+=l:path
endfunction


""""""""""""""""""""""""""""""
" rTc - copy python module relative path
""""""""""""""""""""""""""""""
function! RelativeModuleToClipboard()
    cd .
    let l:word=expand("<cword>")
    let l:package=expand("%:r")

    let l:path=l:package . '.' . l:word
    let l:path=substitute(l:path, "/", ".", "g")
    let @+=l:path
endfunction



""""""""""""""""""""""""""""""
" bTc - breakpoint to clipboard
""""""""""""""""""""""""""""""
function! BreakpointToClipboard()
    let l:path=expand("%")

    let l:full_path="b " . l:path . ":" . line(".")

    let @+=l:full_path
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
nnoremap <Leader>ptw :call PytestPtwToClipboard()<CR>:echo 'PTW path copied to clipboard!'<CR>
nmap <Leader>rtc :call RelativeModuleToClipboard()<CR>:echo 'Relative path copied to clipboard!'<CR>
nmap <Leader>btc :call BreakpointToClipboard()<CR>:echo 'Breakpoint path copied to clipboard!'<CR>

""""""""""""""""""""""""""""""
" Abbreviations
""""""""""""""""""""""""""""""
ab ffi from __future__ import absolute_import, unicode_literals
ab cutf # coding: utf-8
