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
Plugin 'tell-k/vim-autopep8'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'takac/vim-hardtime'
Plugin 'mindriot101/vim-yapf'

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
au Filetype python match BadWhitespace /\s\+$/
au Filetype python set tabstop=4  softtabstop=4 shiftwidth=4 textwidth=100 autoindent expandtab fileformat=unix 
set splitbelow
set splitright
set number relativenumber
set nowrap
set tabstop:4
set encoding=utf-8
highlight ColorColumn ctermbg=166 guibg=lightgrey
set colorcolumn=80
set modeline

let g:hardtime_default_on = 1

let g:syntastic_python_checkers=["flake8"]
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1
let g:autopep8_max_line_length=80
nnoremap <leader>y :Yapf<cr>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
set background=dark
set ruler
set laststatus=2
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

