""""""""""""""""""""
" Plugins
""""""""""""""""""""

call plug#begin()
"  Functionality improvements
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'preservim/nerdcommenter'
Plug 'Raimondi/delimitMate'
" UI improvemets
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox'
" Language-specific improvements
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-scripts/indentpython.vim'
call plug#end()

""""""""""""""""""""
" Settings
""""""""""""""""""""
syntax on
set number relativenumber
colorscheme gruvbox
set background=dark
let g:highlightedyank_highlight_duration = 500
set wildmode=longest,list,full
set wildmenu
let mapleader = " "
set tabstop=4
set shiftwidth=4
set noerrorbells
