" Alex Hartford
" My vimrc

" Defaults {{{
syntax on
filetype indent on

" Quick vimrc Editing/Sourcing
let mapleader = ","
nnoremap<leader>ev :vsplit $MYVIMRC<cr>
nnoremap<leader>sv :source $MYVIMRC<cr>

" indentation
set tabstop=4
set shiftwidth=4
set expandtab

" sets current directory
set autochdir

set backspace=indent,eol,start

set nonumber
set nowrap

set incsearch
set ignorecase

set noundofile
set nobackup
" }}}
" Autocmds {{{

au BufRead,BufNewFile *.gd  set filetype=gdscript

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
    autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END

augroup filetype_c
    autocmd!
    autocmd FileType c,cpp nnoremap <buffer> <leader>c I//<esc>
    autocmd FileType c,cpp :iabbrev <buffer> iff if ()<left>
augroup END

augroup filetype_html
    autocmd!
    autocmd BufWritePre,BufRead *.html :normal gg=G
    autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

" To go to last file position.
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" }}}
" Mappings {{{
inoremap jk <esc>

nnoremap <right> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>
nnoremap <up> <nop>

nnoremap - Vdkkp<esc>
nnoremap _ Vdp<esc>

" Build the current project
nnoremap <c-b> :wa<esc>:!build<esc>

" select current word
nnoremap <space> viw
nnoremap <S-Space> viW
" Quotes around current word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

nnoremap H 0
vnoremap H 0
nnoremap L $
vnoremap L $
nnoremap J <c-f>
nnoremap K <c-b>

nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

nnoremap q <nop>
vnoremap q <nop>

nnoremap <C-j> ciw<C-r>0<esc>
"}}}
" Abbrevs {{{
" Header
iabbrev htmlhead <!DOCTYPE html><cr><html lang="en"><cr><head><cr><meta charset="UTF-8"><cr><meta nano="viewport" content="width=device-width, initial-scale=1.0"><cr><meta http-equiv="X-UA-Compatible" content="ie=edge"><cr><title>Document</title><cr></head><cr><body><cr>Hello, World!<cr></body><cr></html>
iabbrev chead // Author: Alex Hartford<cr>// Program: <cr>// File: <cr>// Date:
iabbrev phead # Author: Alex Hartford<cr># Program: <cr># Date: <cr>
" Signature
iabbrev ssig -- <cr>Alex Hartford<cr>alexanderhartford@gmail.com
" }}}
" Indentation settings {{{
set tabstop=4
set shiftwidth=4
set expandtab
" Status Line {{{
set laststatus=2
set statusline=%f\ " path
set statusline+=%y " filetype
set statusline+=%= " right side
set statusline+=%4l " line
set statusline+=/
set statusline+=%L\  " lines
set statusline+=[%c]\ " column
" }}}
