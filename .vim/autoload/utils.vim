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

function! utils#run_ctags()
  let l:filetype = &filetype == '' ? '' : &filetype

  if (l:filetype == '')
    exec '!ctags -R .'
  else
    exec '!ctags --language-force='.l:filetype.' -R .'
  endif
endfunction

" This callback will be executed when the entire command is completed
function! utils#background_command_close(channel)
  " Read the output from the command into the quickfix window
  execute "cfile! " . g:backgroundCommandOutput
  " Open the quickfix window
  copen
  unlet g:backgroundCommandOutput
endfunction

function! utils#run_background_command(command)
  " Make sure we're running VIM version 8 or higher.
  if v:version < 800
    echoerr 'utils#run_background_command requires VIM version 8 or higher'
    return
  endif

  if exists('g:backgroundCommandOutput')
    echom 'Already running task in background'
  else
    echom 'Running task in background'
    " Launch the job.
    " Notice that we're only capturing out, and not err here. This is because, for some reason, the callback
    " will not actually get hit if we write err out to the same file. Not sure if I'm doing this wrong or?
    let g:backgroundCommandOutput = tempname()
    call job_start(a:command, {'close_cb': 'utils#background_command_close', 'out_io': 'file', 'out_name': g:backgroundCommandOutput})
  endif
endfunction

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
