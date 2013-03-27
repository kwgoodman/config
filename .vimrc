
" Burn the bridge: don't try to be compatible with vi
set nocompatible

" Indent and tab
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
filetype indent on

" Highlight characters after column 79 (PEP8)
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Show the status line
set laststatus=2

" Damn, wish I never found this one.
" Now I'll never learn how to navigate with the keyboard. 
set mouse=a
 
" Tab completion of commands
set wildmenu
set wildmode=longest:full

" Switch from insert to normal mode by typing jj
inoremap jj <Esc>

" Search as you type, highlight result
set incsearch
set hlsearch

" Set shell title---handy way to see file name and directory. Restore on exit.
" (Restore works for me on gnome-terminator but not gnome-terminal.)
set title
set titleold=""

" Nerdtree: Toggle nerdtree with F2; ignore *.pyc files
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Sav precs keystrks
nnoremap ; :

" Cycle through buffers with F4 and F3
:nnoremap <F4> :bnext<CR>
:nnoremap <F3> :bprevious<CR>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Use CTRL-S for saving, also in Insert mode
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
"
" Add this to .bashrc:
"
" When vim is used in terminal (instead of gui) the terminal should pass
" through CNTRL-S to vim (for use as 'save') instead of stop scrolling
" vim()
" {
"    local STTYOPTS="$(stty --save)"
"    stty stop '' -ixoff
"    command vim "$@"
"    stty "$STTYOPTS"
"}

" pyflakes-vim needs this
filetype plugin indent on

nnoremap <F5> :GundoToggle<CR>

" gvim setting
if has('gui_running')
    colorscheme slate
    set guioptions-=T  " hide toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set columns=80 lines=120
    set guifont=Monospace\ 12
else
    set bg=dark
endif    
