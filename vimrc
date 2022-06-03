" My vimrc
" Defaults {{{

syntax enable

colorscheme desert

" Quick vimrc Editing/Sourcing
let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" indentation
"filetype plugin on
filetype indent off
set noautoindent
set nocindent
set nosmartindent
set indentexpr=

" Tab settings
set expandtab
set shiftwidth=4
set smarttab

" sets current directory
set autochdir

" Backspace over all characters
set backspace=indent,eol,start

set nonumber
set nowrap

" More intuitive searching
set incsearch
set ignorecase
set smartcase

set noundofile
set nobackup
" }}}
" Autocmds {{{

augroup general
    autocmd!
    "No comment continuation.
    autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
augroup END

augroup filetype_scheme
    autocmd!
    autocmd filetype scheme set smartindent
    autocmd filetype scheme set softtabstop=2
    autocmd filetype scheme set shiftwidth=2
    autocmd filetype scheme set expandtab
augroup END

augroup filetype_glsl
    autocmd!
    autocmd BufNewFile,BufRead *.vert,*.tesc,*.tese,*.glsl,*.geom,*.frag,*.comp,*.rgen,*.rmiss,*.rchit,*.rahit,*.rint,*.rcall set filetype=glsl
augroup END
    
augroup filetype_gd
    autocmd!
    autocmd BufRead,BufNewFile *.gd  set filetype=gdscript
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
augroup END

augroup filetype_c
    autocmd!
    autocmd FileType c,cpp nnoremap <buffer> <leader>c I//<esc>
augroup END

augroup filetype_html
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

augroup filetype_markdown
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal wrap
augroup END

" To go to last file position.
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" }}}
" Mappings {{{
inoremap jk <esc>
noremap <right> <nop>
noremap <left> <nop>
noremap <down> <nop>
noremap <up> <nop>

nnoremap - Vdkkp<esc>
nnoremap _ Vdp<esc>

" Build the current project
nnoremap <c-b> :wa<esc>:!build<esc>

" select current word
nnoremap <space> viw
nnoremap <S-Space> viW
" Quotes around current word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

nnoremap H ^
vnoremap H ^
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

command WQA wqa
command WQ wq
command WA wa
command Wq wq
command Wa wa
command W w
command Q q
"}}}
" Abbrevs {{{
" Header
iabbrev htmlhead <!DOCTYPE html><cr><html lang="en"><cr><head><cr><meta charset="UTF-8"><cr><meta nano="viewport" content="width=device-width, initial-scale=1.0"><cr><meta http-equiv="X-UA-Compatible" content="ie=edge"><cr><title>Document</title><cr></head><cr><body><cr>Hello, World!<cr></body><cr></html>
iabbrev chead // Author: Alex Hartford<cr>// Program: <cr>// File: <cr>// Date:
iabbrev headerhead #ifndef FILE_H<cr>#define FILE_H<cr><cr><cr>#endif
iabbrev phead # Author: Alex Hartford<cr># Program: <cr># Date: <cr>
iabbrev rackhead ;; Author:<cr>;; Program:<cr>;; Date:<cr><cr>#lang typed/racket<cr>#require typed/rackunit<cr>

" Personal
iabbrev poemhead Author: Alex Hartford<cr>Date: <cr>Title: <cr>

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
" Plugins {{{
call plug#begin()

"Plug 'junegunn/vim-easy-align'
"Plug 'valloric/youcompleteme'
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
"Plug 'godlygeek/tabular'
"Plug 'junegunn/vim-easy-align'
"Plug 'unblevable/quick-scope'

call plug#end()
" }}}
