" Alex Hartford
" My vimrc


" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

set lines=999

filetype plugin indent on

set hidden
syntax on

" Command fixes
set shortmess+=T
set cmdheight=1

" Status Line {{{
set laststatus=2
set statusline=%f " path
set statusline+=\ -\ 
set statusline+=%y " filetype
set statusline+=%= " right side
set statusline+=%4l " line
set statusline+=/
set statusline+=%L\  " lines
set statusline+=[%c]\ " column
" }}}

" Autocmds {{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_python
    autocmd!
    " Comment out a line.
    autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
    autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END

augroup filetype_c
    autocmd!
    " Comment out a line.
    autocmd FileType c nnoremap <buffer> <leader>c I//<esc>
    autocmd FileType c :iabbrev <buffer> iff if ()<left>
augroup END

augroup filetype_html
    autocmd!
    autocmd BufWritePre,BufRead *.html :normal gg=G
    autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END
" }}}

" Quick vimrc Editing/Sourcing
let mapleader = ","
nnoremap<leader>ev :vsplit $MYVIMRC<cr>
nnoremap<leader>sv :source $MYVIMRC<cr>

" Abbrevs {{{
" Header
iabbrev htmlhead <!DOCTYPE html><cr><html lang="en"><cr><head><cr><meta charset="UTF-8"><cr><meta nano="viewport" content="width=device-width, initial-scale=1.0"><cr><meta http-equiv="X-UA-Compatible" content="ie=edge"><cr><title>Document</title><cr></head><cr><body><cr>Hello, World!<cr></body><cr></html>
iabbrev chead // Author: Alex Hartford<cr>Program: <cr>Date: <cr>
iabbrev phead # Author: Alex Hartford<cr># Program: <cr># Date: <cr>
" Signature
iabbrev ssig -- <cr>Alex Hartford<cr>alexanderhartford@gmail.com
" }}}

" Mappings {{{

" Build the current project
nnoremap <c-b> :!build<esc>

" Exit insert mode
inoremap jk <esc>
vnoremap jk <esc>
" Learning new esc sequence
inoremap <esc> <nop>

" Learning new keys.
noremap <left> <nop>
noremap <down> <nop>
noremap <up> <nop>
noremap <right> <nop>

" select current word
nnoremap <space> viw
" Quotes around current word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Move to start of line
nnoremap H 0
" Move to end of line
nnoremap L $

" Move current line down
nnoremap - ddp
" Move current line up
nnoremap _ ddkkp

" Convert word to uppercase
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU
"}}}

" Indentation settings {{{
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set autochdir

set number
set nowrap
set noundofile
set nobackup
" }}}

" Junk {{{
" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" }}}

"echom ">^.^<"
