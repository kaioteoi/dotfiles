"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
" General
nnoremap <Leader>vs :source ~/.vimrc<CR>
nnoremap <Leader>cp "+y
nnoremap <Leader>cw viw"+y
nnoremap <Leader>tt :GenerateTags<CR>
nnoremap <Leader>- :m-2<CR>
nnoremap <Leader>_ :m+1<CR>
nnoremap <Leader>z :call utils#window_zoom()<CR>
nnoremap U :red<CR>

" Plugins
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-m> :TagbarToggle<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>ss :Startify<CR>
nnoremap <Leader>hr :GitGutterUndoHunk<CR>
nmap <Leader>mtc :call utils#module_to_clipboard()<CR>:echo 'Module copied to clipboard!'<CR>

" Background calls
"command! RunBackgroundCommand :utils#run_background_command()
"command! -nargs=+ -complete=shellcmd RunBackgroundCommand call RunBackgroundCommand(<q-args>)
command! GenerateTags :call utils#run_ctags()

" Remap default mappings
nmap <C-]> g<C-]>
