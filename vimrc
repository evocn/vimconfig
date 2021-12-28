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
" }}}

" Mappings {{{
inoremap jk <esc>

" select current word
nnoremap <space> viw

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
"}}}

" Abbrevs {{{
" Header
iabbrev htmlhead <!DOCTYPE html><cr><html lang="en"><cr><head><cr><meta charset="UTF-8"><cr><meta nano="viewport" content="width=device-width, initial-scale=1.0"><cr><meta http-equiv="X-UA-Compatible" content="ie=edge"><cr><title>Document</title><cr></head><cr><body><cr>Hello, World!<cr></body><cr></html>
iabbrev chead // Author: Alex Hartford<cr>Program: <cr>Date: <cr>
iabbrev phead # Author: Alex Hartford<cr># Program: <cr># Date: <cr>
" Signature
iabbrev ssig -- <cr>Alex Hartford<cr>alexanderhartford@gmail.com
" }}}

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
