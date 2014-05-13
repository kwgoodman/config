
" vim not vi
set nocompatible

" Set up Vundle
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'kevinw/pyflakes-vim'
Bundle 'nvie/vim-flake8'
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/vim-easymotion'
    let g:EasyMotion_mapping_w = '<leader>w'
Bundle 'airblade/vim-gitgutter'
    let g:gitgutter_enabled = 0
Bundle 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType="context"
Bundle 'kien/ctrlp.vim'
    let g:ctrlp_working_path_mode=0
    let g:ctrlp_max_height=20
Bundle 'sjl/gundo.vim'
    nnoremap <F5> :GundoToggle<CR>
Bundle 'scrooloose/nerdtree'
    map <F2> :NERDTreeToggle<CR>
    let NERDTreeIgnore = ['\.pyc$']
    let NERDTreeShowBookmarks=1
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" display
set nowrap
set number
set laststatus=2
set incsearch
set hlsearch
set background=dark
set colorcolumn=80
set title
set titleold=""
set listchars=tab:▸\ ,eol:¬,trail:·
syntax on

" editor
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
set mouse=a

" system
set confirm
set nobackup
set noswapfile
set hidden
set history=200
set spelllang=en_us
set wildmode=longest,list,full
set wildmenu
set wildignore+=*.pyc,*.so,*.swp,.git
filetype plugin indent on

" vim/gvim setting
if has('gui_running')
    set guioptions-=T  " hide toolbar
    set guioptions-=r  " remove right-hand scroll bar
    set columns=80 lines=120
    set guifont=Monospace\ 12
else
    " highlight current line in insert mode; not command
    autocmd InsertEnter,InsertLeave * set cul!
    set t_Co=16  " to get correct solarized colors
endif

" abbreviations
ab im import
ab imnp import numpy as np
ab imbn import bottleneck as bn

" mappings
inoremap jj <Esc>
nnoremap ; :
nnoremap <F4> :bnext<CR>
nnoremap <F3> :bprevious<CR>
vmap Q gq
nmap Q gqap
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Use CTRL-S for saving, also in Insert mode
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-[>:update<CR>
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

" <leader>
let mapleader="\<Space>"
map <leader>b :CtrlPBuffer<CR>
map <leader>d :bd<CR>
map <leader>e :e %%
map <leader>f :CtrlP<CR>
map <leader>g :GitGutterToggle<CR>
map <leader>h :CtrlP ~<CR>
map <leader>l :set list!<CR>  " shows whitespace
map <leader>m "*p
map <leader>p "+p
map <leader>r :CtrlPRoot<CR>
map <leader>s :source $MYVIMRC<CR>
map <leader>u :CtrlPMRU<CR>
vmap <leader>y "+y
map <leader>z Iimport ipdb; ipdb.set_trace()<CR><C-[>
map <leader>6 :<C-6><CR>
map <leader><Space> :nohlsearch<Bar>:echo<CR>
nnoremap <leader><Up> :m-2<CR>==
nnoremap <leader><Down> :m+<CR>==

colorscheme solarized
" From http://www.xorcode.com/2011/04/11/solarized-vim-eclipse-ubuntu/
" To make gnome terminal use solarized colors, enter this in a terminal:
" gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_background" --type bool false
" gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_colors" --type bool false
" gconftool-2 --set "/apps/gnome-terminal/profiles/Default/palette" --type string "#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
" gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#00002B2B3636"
" gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#65657B7B8383"
