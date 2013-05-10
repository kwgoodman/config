
" Burn the bridge: don't try to be compatible with vi
set nocompatible

" Indent, tab, wrap
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
filetype indent on
set nowrap

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

" Sav precs keystrks
nnoremap ; :

" Cycle through buffers with F4 and F3
nnoremap <F4> :bnext<CR>
nnoremap <F3> :bprevious<CR>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Space turns off highlighting and clears any messages already displayed
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

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

" Highlight characters after column 79 (PEP8)
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

nnoremap <silent> <F6> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" <leader>l shows whitespace
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" gvim setting
if has('gui_running')

    colorscheme slate
    set guioptions-=T  " hide toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set columns=80 lines=120
    set guifont=Monospace\ 12

else

    set t_Co=16

    " highlight current line in insert mode; not command
    autocmd InsertEnter,InsertLeave * set cul!

endif

syntax on
set background=dark
colorscheme solarized

" From http://www.xorcode.com/2011/04/11/solarized-vim-eclipse-ubuntu/
" To make gnome terminal use solarized colors, enter this in a terminal:
" gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_background" --type bool false
" gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_colors" --type bool false
" gconftool-2 --set "/apps/gnome-terminal/profiles/Default/palette" --type string "#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
" gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#00002B2B3636"
" gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#65657B7B8383"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins

" Nerdtree: Toggle nerdtree with F2; ignore *.pyc files
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowBookmarks=1

" pyflakes-vim needs this
filetype plugin indent on

" Gundo
nnoremap <F5> :GundoToggle<CR>
