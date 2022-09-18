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

let g:markdown_folding = 1

set nonumber
set wrap
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
vnoremap J <nop>
nnoremap K <c-b>
vnoremap K <nop>
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

nnoremap <c-e> viwpviwy

nnoremap S ciw-><esc>
nnoremap s ciw.<esc>

command WQA wqa
command WQ wq
command WA wa
command Wq wq
command Wa wa
command W w
command Q q
" }}}
" {{{ Cool Mappings
" insert current date
nnoremap <leader>d :silent put =strftime('%x')<cr>
" insert current time
nnoremap <leader>t :silent put =strftime('%T')<cr>
nnoremap <leader>c i<!--<cr>--><esc>O
" }}}

" Autocmds {{{
if has("autocmd")
    " Set filetype to markdown for files without filetypes.
    autocmd BufEnter * if &filetype == "" || &filetype == "conf" | setlocal ft=markdown | endif

    " Go to last file position.
    au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\""

    " No comment continuation.
    autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType markdown setlocal textwidth=80

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
