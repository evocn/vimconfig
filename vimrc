" Alex Hartford
" My vimrc

" General {{{
syntax enable
filetype plugin indent on

<<<<<<< HEAD
silent! colorscheme industry
hi Comment ctermfg=lightblue

=======
>>>>>>> f1cbb0c2eba728789e90de6d855d1ea5cb21dc7d
let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

let g:markdown_folding = 1

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
vnoremap J <nop>
nnoremap K <c-b>
vnoremap K <nop>
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

nnoremap j gj
nnoremap k gk

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
cabbrev a<CR> wa
" }}}
" {{{ Cool Mappings
" insert new journal entry with date.
nnoremap <leader>n o#<space><esc>:silent put =strftime('%x')<cr>v$hdklpkzcjji
" insert current time
nnoremap <leader>t :silent put =strftime('%T')<cr>
" Comment in Markdown
nnoremap <leader>c i<!--<cr>--><esc>O

nnoremap <leader>b :!build<cr>
" }}}
" {{{ Functions
fun! SetMyTodos()
    syn match myTodos /\%(CONSIDER:\)\|\%(NOTE:\)/
    hi link myTodos Todo
endfu
autocmd bufenter * :call SetMyTodos()
autocmd filetype * :call SetMyTodos()
" }}}

" Autocmds {{{
if has("autocmd")
    " Set filetype to markdown for files without filetypes.
    autocmd BufEnter * if &filetype == "" || &filetype == "conf" | setlocal ft=markdown | endif

    " glsl filetypes
    autocmd BufNewFile,BufRead *.frag setfiletype glsl
    autocmd BufNewFile,BufRead *.vert setfiletype glsl

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
