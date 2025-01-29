" Alex Hartford's vimrc

syntax enable
filetype plugin indent on
let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
set autochdir backspace=indent,eol,start
set nonumber nowrap
set incsearch ignorecase smartcase
set noundofile nobackup noswapfile
set tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead * setlocal formatoptions-=cro
set tags+=tags;/

" Movements
inoremap jk <esc>
nnoremap <space> viw

noremap H ^
noremap L $
nnoremap J <c-f>
nnoremap K <c-b>
vnoremap J )
vnoremap K (

nnoremap <C-Tab>   :tabnext<cr>
nnoremap <C-S-Tab> :tabprevious<cr>
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

" Appearance
if has("gui_running")
    set guioptions= belloff=all

    set guifont=Fira\ Mono\ Medium:h11
    nnoremap <leader>v :set guifont=Fira\ Mono\ Medium:h11<CR>
    nnoremap <leader>b :set guifont=Fira\ Mono\ Medium:h13<CR>

    colorscheme gruvbox-high-contrast

    " Maximized window on startup
    sleep 50m
    au GUIEnter * simalt ~x
endif

" open ctags in new tabs
nnoremap <silent><leader>c <C-w><C-]><C-w>T
" baregrep
nnoremap <leader>g :!start baregrep.exe<CR>
" autosave
au TextChanged,TextChangedI * if &readonly == 0 | silent write | endif

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Cruft {{{
set laststatus=2
set statusline=\ %f\ %y%=
set statusline+=%4l/%L\ [%c]\ 
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

au BufNewFile,BufRead *.jai set filetype=jai | set syntax=jai
" }}}
