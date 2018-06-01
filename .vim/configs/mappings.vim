"""""""""""""""""""""""""""""""""""""
" * Clipboard *
"""""""""""""""""""""""""""""""""""""
noremap <Leader>cp "+y:echo 'selection copied!'<CR>
noremap <Leader>cl <Esc>0v$h"+y:echo 'line copied!'<CR>
nnoremap <Leader>cw viw"+y:echo 'word copied!'<CR>
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
" Move line up/down
nnoremap <Leader>- :m-2<CR>
nnoremap <Leader>_ :m+1<CR>
" Redo
nnoremap U :red<CR>
" Replace on visual selection
vnoremap <C-R> :s/\%V

"""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""
" Ctags
nnoremap ,, :Tags<CR>
" FZF
nnoremap ,. :FZF<CR>
" NERDTree
nnoremap ,n :NERDTreeFind<CR>
nnoremap ,m :NERDTreeToggle<CR>
" Tagbar
nnoremap ,t :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""
" Remap defaults
"""""""""""""""""""""""""""""""""""""
" tags -> jumps
nmap <C-]> g<C-]>
