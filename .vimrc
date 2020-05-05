set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...
Plugin 'itchyny/lightline.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'takac/vim-hardtime'
Plugin 'psf/black', { 'tag': '19.10b0' }

if has('nvim')
    Plugin 'numirias/semshi'
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'deoplete-plugins/deoplete-jedi'
    let g:deoplete#enable_at_startup = 1
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let python_highlight_all=1
syntax on

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
highlight BadWhitespace ctermfg=16 ctermbg=166 guifg=#000000 guibg=#F8F8F0
hi MatchParen cterm=bold ctermbg=255 ctermfg=125
hi VertSplit cterm=None
au Filetype python match BadWhitespace /\s\+$/
set tabstop:4
au Filetype python set tabstop=4  softtabstop=4 shiftwidth=4 textwidth=100 autoindent expandtab fileformat=unix 
au Filetype html set tabstop=2  softtabstop=2 shiftwidth=2 textwidth=100 autoindent expandtab fileformat=unix 
set splitbelow
set splitright
set number relativenumber
set nowrap
set encoding=utf-8
autocmd FileType python highlight ColorColumn ctermbg=166 guibg=lightgrey
autocmd FileType python set colorcolumn=90
set modeline 
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
let g:hardtime_default_on = 1
let g:syntastic_python_checkers=["flake8"]
autocmd BufWritePre *.py execute ':Black'
autocmd BufWritePre *.py call flake8#Flake8()
autocmd BufwritePre *.html normal magg=G'a
autocmd FileType python nnoremap <buffer> <F9> :Black<cr>
autocmd FileType python inoremap <buffer> " ""<left>
autocmd FileType python inoremap <buffer> ' ''<left>
autocmd FileType python inoremap <buffer> ( ()<left>
autocmd FileType python inoremap <buffer> [ []<left>
autocmd FileType python inoremap <buffer> { {}<left>
autocmd FileType python inoremap <buffer> {<CR> {<CR>}<ESC>O
autocmd FileType python inoremap <buffer> {;<CR> {<CR>};<ESC>O
set background=dark
set ruler
set laststatus=2
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>
noremap <leader>c :Commentary<cr>
set path+=**
map <F2> :echo 'Current time is ' . strftime('%x %X')<CR>
map! <F3> <C-R>=strftime('%x %X')<CR>
set wildignore+=*.swp,*.ipynb,*.pyc
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent pclose | endif
" need space end of line below
set fillchars+=vert:\  
set cursorline
nnoremap <leader>l <C-W>l
nnoremap <leader>k <C-W>k
nnoremap <leader>j <C-W>j
nnoremap <leader>h <C-W>h
nnoremap <leader>q <C-W>q
nnoremap <leader>vim :sp<Space>~/.vimrc<CR>
nnoremap <leader>sovim :so<Space>~/.vimrc<CR>
set tags=tags
autocmd BufWritePost *.py silent! !ctags -R --python-kinds=-i &
