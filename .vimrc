set nocompatible             
filetype off                  
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" ...
Plugin 'itchyny/lightline.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'takac/vim-hardtime'
Plugin 'psf/black', { 'tag': '19.10b0' }
Plugin 'morhetz/gruvbox'
if has('nvim')
    Plugin 'numirias/semshi'
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'deoplete-plugins/deoplete-jedi'
    let g:deoplete#enable_at_startup = 1
endif
call vundle#end()            

filetype plugin indent on     
syntax on
colorscheme gruvbox
let g:hardtime_default_on = 1
set path+=**
set foldmethod=indent
set foldlevel=99
set tabstop=4
set splitbelow
set splitright
set number relativenumber
set nowrap
set encoding=utf-8
set modeline 
set background=dark
set ruler
set laststatus=2
set hlsearch
" need space end of line
set fillchars+=vert:\ 
set cursorline
set wildignore+=*.swp,*.ipynb,*.pyc
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

hi BadWhitespace ctermfg=16 ctermbg=166 guifg=#000000 guibg=#F8F8F0
hi MatchParen cterm=bold ctermbg=255 ctermfg=125
hi VertSplit cterm=None

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent pclose | endif

map <F2> :echo 'Current time is ' . strftime('%x %X')<CR>
map! <F3> <C-R>=strftime('%x %X')<CR>
" Enable folding with the f key
nnoremap f za
" turn of highlight on enter
nnoremap <CR> :nohlsearch<CR><CR>
nnoremap <leader>c :Commentary<cr>
nnoremap <leader>l <C-W>l
nnoremap <leader>k <C-W>k
nnoremap <leader>j <C-W>j
nnoremap <leader>h <C-W>h
nnoremap <leader>q <C-W>q
nnoremap <leader>vim :sp<Space>~/.vimrc<CR>
nnoremap <leader>sovim :so<Space>~/.vimrc<CR>
nnoremap <leader>json :%!python -m json.tool<CR>
