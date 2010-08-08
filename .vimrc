
" Burn the bridge: don't try to be compatible with vi
set nocompatible

" Indent and tab
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
filetype indent on

" Highlight characters after column 79 (PEP8)
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

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

" Toggle nerdtree with F2
map <F2> :NERDTreeToggle<CR>
