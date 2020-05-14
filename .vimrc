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
Plugin 'tpope/vim-surround'
Plugin 'takac/vim-hardtime'
Plugin 'psf/black', { 'tag': '19.10b0' }
Plugin 'morhetz/gruvbox'
Plugin 'alvan/vim-closetag'
Plugin 'vimwiki/vimwiki'
Plugin 'lilydjwg/colorizer'
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
let g:hardtime_allow_different_key = 1
let g:hardtime_showmsg = 1
let g:hardtime_timeout = 3000
set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=0 autoindent expandtab fileformat=unix foldmethod=indent foldlevel=99 splitbelow splitright nu rnu nowrap encoding=utf-8 modeline background=dark ruler laststatus=2 hlsearch wildmenu cursorline cursorcolumn
" need space end of line
set fillchars+=vert:\ 
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
nnoremap <leader>f za
" turn off highlight on enter
nnoremap <CR> :nohlsearch<CR><CR>
nnoremap <leader>c :Commentary<cr>
nnoremap <leader>l <C-W>l
nnoremap <leader>k <C-W>k
nnoremap <leader>j <C-W>j
nnoremap <leader>h <C-W>h
nnoremap <leader>q <C-W>q
nnoremap <leader>vim :sp<Space>~/.vimrc<CR>
nnoremap <leader>sovim :so<Space>~/.vimrc<CR>
let output = system('git rev-parse --show-toplevel')
if v:shell_error == 0
    set path+=**
    set wildignore+=**/node_modules/**
    :execute "cd" . output
endif

" Some boss split maps
function ToggleSplitMaxHeight()
    if (winheight('%') > 25)
        :execute "resize " . 'wh'
    else
        :execute "resize" . 200
    endif
endfunction
function ToggleSplitMaxWidth()
    if (winwidth('%') > 120)
        :execute "vertical-resize" . 250
    else
        :execute "vertical-resize " . 'winminwidth'
    endif
endfunction
nnoremap <leader>= <C-W>=
nnoremap <leader>m :call ToggleSplitMaxHeight()<CR>
nnoremap <leader>n :call ToggleSplitMaxWidth()<CR>
nnoremap <leader><left> 7<C-W><
nnoremap <leader><up> 7<C-W>+
nnoremap <leader><right> 7<C-W>>
nnoremap <leader><down> 7<C-W>-
nnoremap <leader>w :execute "write"
nnoremap <leader>tt :new term://zsh<CR>
nnoremap <leader>p :Vexplore<CR>
nnoremap <leader>/ :%s/
nnoremap <Space>w :w<CR>
nnoremap <Space>W :wa<CR>
nnoremap <Space>ht :HardTimeToggle<CR>
function JsonFormat(text)
    let output = system('python -m json.tool', a:text)
    if v:shell_error == 0
        return l:output
    else
        return a:text
    endif
endfunction

tnoremap <Esc> <C-\><C-n>
