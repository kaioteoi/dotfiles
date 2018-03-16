"""""""""""""""""""""""""""""""""""""""""
" mTc - copy python module to clipboard
"""""""""""""""""""""""""""""""""""""""""
function! utils#module_to_clipboard()
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
function! utils#pytest_module_to_clipboard()
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

"""""""""""""""""""""""""""""""""""""""""
" cTags - refresh tags files
"""""""""""""""""""""""""""""""""""""""""
function! utils#run_ctags()
  let l:filetype = &filetype == '' ? '' : &filetype

  if (l:filetype == '')
    exec '!ctags -R .'
  else
    exec '!ctags --language-force='.l:filetype.' -R .'
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""
" zoomer - zoom in/out vim pane
"""""""""""""""""""""""""""""""""""""""""
function! s:is_zoomed()
  return get(t:, 'zoomed', 0)
endfunction

function! s:set_zoomed(...)
  let t:zoomed = a:0 ? a:1 : 0
endfunction

function! utils#window_zoom()
    if s:is_zoomed()
        exec "normal \<C-W>="
        call s:set_zoomed()
    else
        exec "normal \<C-W>_\<C-W>|"
        call s:set_zoomed(1)
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""
" Autosource on VIMRC write
"""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"""""""""""""""""""""""""""""""""""""""""
" Timeout between commands
"""""""""""""""""""""""""""""""""""""""""
set ttimeoutlen=10
