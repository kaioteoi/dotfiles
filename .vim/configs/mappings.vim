"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
" General
noremap <Leader>vs :source ~/.vimrc<CR>
noremap <Leader>cp "+y

" Plugins
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-m> :TagbarToggle<CR>
nnoremap <C-p> :PlugInstall<CR>
nnoremap <Leader>ss :Startify<CR>
nmap <Leader>mtc :call utils#ModuleToClipboard()<CR>:echo 'Module copied to clipboard!'<CR>

