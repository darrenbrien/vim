let python_highlight_all=1

au Filetype python set tabstop=4  softtabstop=4 shiftwidth=4 textwidth=100 autoindent expandtab fileformat=unix 
au FileType python set tags=tags
nnoremap <buffer> <F9> :Black<cr>
au FileType python inoremap <buffer> " ""<left>
au FileType python inoremap <buffer> ' ''<left>
au FileType python inoremap <buffer> ( ()<left>
au FileType python inoremap <buffer> [ []<left>
au FileType python inoremap <buffer> { {}<left>

setlocal colorcolumn=90
hi ColorColumn ctermbg=166 guibg=125
au Filetype python match BadWhitespace /\s\+$/
au Filetype python match BadWhitespace /^\t\+/

au BufWritePre <buffer> execute ':Black'
let output = system('git rev-parse --show-toplevel')
if v:shell_error == 0
	au BufWritePost *.py silent! !ctags -R --python-kinds=-i &
endif
