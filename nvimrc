syntax on
set number " show the line number
set relativenumber " show relative line numbers
set autoindent
set smartindent
set showcmd " show mode

set cursorline " highlight the current line

set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set ruler " show row/column
set scrolloff=1 " always show one line below/above your cursor
" set nocompatible
filetype plugin indent on

" use pipe in insert mode, and block in normal mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set undofile
set undodir=~/.config/nvim/undodir//

" vim-plug
call plug#begin('~/.config/nvim/plugs')

Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'arrufat/vala.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neomake/neomake'

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
