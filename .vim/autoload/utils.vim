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

"""""""""""""""""""""""""""""""""""""""""
" PrettyXml
"""""""""""""""""""""""""""""""""""""""""
function! utils#do_pretty_xml()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
