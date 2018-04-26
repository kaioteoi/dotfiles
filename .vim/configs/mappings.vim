"""""""""""""""""""""""""""""""""""""
" * Clipboard *
"""""""""""""""""""""""""""""""""""""
noremap <Leader>cp "+y
nnoremap <Leader>cw viw"+y
vnoremap // y/<C-R>"<CR>

"""""""""""""""""""""""""""""""""""""
" VIMRC
"""""""""""""""""""""""""""""""""""""
nnoremap <Leader>vs :source ~/.vimrc<CR>

"""""""""""""""""""""""""""""""""""""
" Custom functions
"""""""""""""""""""""""""""""""""""""
command! GenerateTags :call utils#run_ctags()
nnoremap <Leader>tt :GenerateTags<CR>
nnoremap <Leader>z :call utils#window_zoom()<CR>

"""""""""""""""""""""""""""""""""""""
" Utilities
"""""""""""""""""""""""""""""""""""""
nnoremap <Leader>- :m-2<CR>
nnoremap <Leader>_ :m+1<CR>
nnoremap U :red<CR>

"""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""
" Ctags
nnoremap <F5> :Tags<CR>
" NERDTree
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" Tagbar
nnoremap <F4> :TagbarToggle<CR>
" FZF
nnoremap <C-p> :FZF<CR>
" Startify
nnoremap <Leader>ss :Startify<CR>
" GitGutter
nnoremap <Leader>hr :GitGutterUndoHunk<CR>

"""""""""""""""""""""""""""""""""""""
" Remap defaults
"""""""""""""""""""""""""""""""""""""
" tags -> jumps
nmap <C-]> g<C-]>
