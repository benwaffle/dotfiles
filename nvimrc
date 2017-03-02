syntax on
set number " show the line number
set relativenumber " show relative line numbers
set autoindent
set smartindent
set showcmd " show mode

set cursorline " highlight the current line

set hlsearch

set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set foldlevel=999 " start with all folds expanded

set ruler " show row/column
set scrolloff=1 " always show one line below/above your cursor
" set nocompatible
filetype plugin indent on

set undofile
set undodir=~/.config/nvim/undodir//

" vim-plug
call plug#begin('~/.config/nvim/plugs')

Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'arrufat/vala.vim'
Plug 'neomake/neomake'
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'wlangstroth/vim-racket'
Plug 'yanqd0/nginx.vim'
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t && ruby extconf.rb && make '
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'poppyschmo/deoplete-latex'
Plug 'Shougo/neco-vim'

call plug#end()

colorscheme jellybeans

" open nerdtree on start
autocmd vimenter * NERDTree 
" jump to main window
autocmd VimEnter * wincmd p
" close nerdtree if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" run neomake on write
autocmd! BufWritePost * Neomake

let g:airline_powerline_fonts = 1
let g:deoplete#enable_at_startup = 1
