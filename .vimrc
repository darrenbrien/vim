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
if has('nvim')
    Plugin 'numirias/semshi'
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'deoplete-plugins/deoplete-jedi'
    let g:deoplete#enable_at_startup = 1
endif
call vundle#end()            

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3	
let g:netrw_winsize = 15
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_browsex_viewer = "open"
au FileType netrw au BufLeave <buffer> :bd
au FileType netrw au BufEnter <buffer> :execute "HardTimeOff"
au FileType netrw au BufLeave <buffer> :execute "HardTimeOn"

filetype plugin indent on     
syntax on
colorscheme gruvbox
let g:hardtime_default_on = 1
let g:hardtime_allow_different_key = 1
let g:hardtime_showmsg = 1
let g:hardtime_timeout = 3000
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
set wildmenu
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
nnoremap <leader>f za
" turn of highlight on enter
nnoremap <CR> :nohlsearch<CR><CR>
nnoremap <leader>c :Commentary<cr>
nnoremap <leader>l <C-W>l
nnoremap <leader>k <C-W>k
nnoremap <leader>j <C-W>j
nnoremap <leader>h <C-W>h
nnoremap <leader>q <C-W>q
nnoremap <leader>vim :sp<Space>~/.vimrc<CR>
nnoremap <leader>% :so<Space>~/.vimrc<CR>
let output = system('git rev-parse --show-toplevel')
if v:shell_error == 0
		set path+=**
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
tnoremap <Esc> <C-\><C-n>
tnoremap exit<CR> exit<CR><CR>

nnoremap <leader>p :Vexplore<CR>
