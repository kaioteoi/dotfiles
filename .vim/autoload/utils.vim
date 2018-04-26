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
" Timeout between commands
"""""""""""""""""""""""""""""""""""""""""
set ttimeoutlen=10
