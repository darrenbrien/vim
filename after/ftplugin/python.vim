let python_highlight_all=1
let g:syntastic_python_checkers=["flake8"]

au Filetype python set tabstop=4  softtabstop=4 shiftwidth=4 textwidth=100 autoindent expandtab fileformat=unix 
au FileType python set tags=tags
au FileType python setlocal colorcolumn=90
au FileType python nnoremap <buffer> <F9> :Black<cr>
au FileType python inoremap <buffer> " ""<left>
au FileType python inoremap <buffer> ' ''<left>
au FileType python inoremap <buffer> ( ()<left>
au FileType python inoremap <buffer> [ []<left>
au FileType python inoremap <buffer> { {}<left>

au FileType python hi ColorColumn ctermbg=166 guibg=lightgrey
au Filetype python match BadWhitespace /\s\+$/
au Filetype python match BadWhitespace /^\t\+/

au BufWritePre *.py execute ':Black'
au BufWritePre *.py call flake8#Flake8()
let output = system('git rev-parse --show-toplevel')
if v:shell_error == 0
	au BufWritePost *.py silent! !ctags -R --python-kinds=-i &
endif
