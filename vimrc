" Alex Hartford
" My vimrc

" General {{{
syntax enable
filetype plugin indent on

let mapleader = ","

" vimrc stuff
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" insert new journal entry with date.
nnoremap <leader>n o#<space><esc>:silent put =strftime('%x')<cr>v$hdklpkzcjji

" switch tabs
nnoremap <leader>t :tabnext<cr>
nnoremap <leader>r :tabprevious<cr>

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
" Gui {{{
if has("gui_running")
    set belloff=all
    set guifont=Lucida\ Console:h12
    set guioptions=i

    " For Sharp Dark colors:
    let ayucolor="dark"
    colorscheme ayu

    " For Soft Dark colors:
    "set background=dark
    "let g:everforest_background = "hard"
    "let g:everforest_better_performance = 1
    "colorscheme everforest

    " For Soft Light colors:
    "set background=light
    "let g:everforest_background = "soft"
    "let g:everforest_better_performance = 1
    "colorscheme everforest

endif
" }}}
" Movement {{{
inoremap jk <esc>

nnoremap <space> viw

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

nnoremap S ciw-><esc>
nnoremap s ciw.<esc>

command Q q
" }}}

" Autocmds {{{
if has("autocmd")
    " autosave (for the pinkie!!!)
    autocmd TextChanged,TextChangedI * if &readonly == 0 | silent write | endif

    " glsl
    autocmd BufNewFile,BufRead *.fs setfiletype glsl | set syntax=glsl
    autocmd BufNewFile,BufRead *.vs setfiletype glsl | set syntax=glsl
    autocmd BufNewFile,BufRead *.gs setfiletype glsl | set syntax=glsl

    " jai
    autocmd BufNewFile,BufRead *.jai set filetype=jai | set syntax=jai

    " tsv
    autocmd BufNewFile,BufRead *.tsv setlocal tabstop=10 | setlocal shiftwidth=8 | setlocal noexpandtab

    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType markdown setlocal textwidth=80

    " Go to last file position.
    au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\""

    " No comment continuation.
    autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

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
" Tab Line {{{
function! Tabline() abort
    let l:line = ''
    let l:current = tabpagenr()

    for l:i in range(1, tabpagenr('$'))
        if l:i == l:current
            let l:line .= '%#TabLineSel#'
        else
            let l:line .= '%#TabLine#'
        endif

        let l:label = fnamemodify(
            \ bufname(tabpagebuflist(l:i)[tabpagewinnr(l:i) - 1]),
            \ ':t'
        \ )

        let l:line .= '%' . i . 'T' " Starts mouse click target region.
        let l:line .= '  ' . l:label . '  '
    endfor

    let l:line .= '%#TabLineFill#'
    let l:line .= '%T' " Ends mouse click target region(s).

    return l:line
endfunction

set tabline=%!Tabline()
" }}}
