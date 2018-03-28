"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
" General
" * Clipboard *
noremap <Leader>cp "+y
nnoremap <Leader>cw viw"+y
vnoremap // y/<C-R>"<CR>
" * VIMRC *
nnoremap <Leader>vs :source ~/.vimrc<CR>
" * Custom functions *
command! GenerateTags :call utils#run_ctags()
nnoremap <Leader>tt :GenerateTags<CR>
nnoremap <Leader>z :call utils#window_zoom()<CR>
nmap <Leader>mtc :call utils#module_to_clipboard()<CR>:echo 'Module copied to clipboard!'<CR>
nnoremap <Leader>ptc :call utils#pytest_module_to_clipboard()<CR>:echo 'Pytest path copied to clipboard!'<CR>
" * Utilities *
nnoremap <Leader>- :m-2<CR>
nnoremap <Leader>_ :m+1<CR>
nnoremap U :red<CR>
nnoremap <Leader>t :Tags<CR>

" Plugins
" * NERDTree (
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" * Tagbar *
nnoremap <F4> :TagbarToggle<CR>
" * FZF *
nnoremap <C-p> :FZF<CR>
" * Startify *
nnoremap <Leader>ss :Startify<CR>
" * GitGutter *
nnoremap <Leader>hr :GitGutterUndoHunk<CR>

" Remap defaults
" * tags -> jumps *
nmap <C-]> g<C-]>
