" Alex Hartford
" My vimrc

" Plugins {{{
call plug#begin()
Plug 'elmcast/elm-vim'
Plug 'preservim/nerdcommenter'
Plug 'valloric/youcompleteme'
Plug 'sjl/badwolf'
call plug#end()
let g:ycm_show_diagnostics_ui = 0
" }}}
" General {{{
syntax enable
filetype plugin indent on

silent! colorscheme badwolf
hi Comment ctermfg=lightblue

let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

set nonumber
set nowrap
set incsearch
set ignorecase
set smartcase
set noundofile
set nobackup
set autochdir
set backspace=indent,eol,start

set tabstop=4
set shiftwidth=4
set expandtab
" }}}
" Movement {{{
inoremap jk <esc>

nnoremap <space> viw
vnoremap <space> v
nnoremap <S-Space> viW

nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $
nnoremap J <c-f>
vnoremap J <c-f>
nnoremap K <c-b>
vnoremap K <c-b>
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

command WQA wqa
command WQ wq
command WA wa
command Wq wq
command Wa wa
command W w
command Q q
" }}}

" Autocmds {{{
if has("autocmd")
    " Go to last file position.
    au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\""
    "No comment continuation.
    autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
    autocmd FileType vim setlocal foldmethod=marker
endif
" }}}
" Status Line {{{
set laststatus=2
set statusline=%f\  " path
set statusline+=%y  " filetype
set statusline+=%=  " switch to the right side
set statusline+=%4l  " line number
set statusline+=/
set statusline+=%L\  " total lines
set statusline+=[%c]\  " column number
" }}}
