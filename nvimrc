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

Plug 'nathanaelkane/vim-indent-guides'
Plug 'flazz/vim-colorschemes' " colorschemes
Plug 'scrooloose/nerdtree' " sidebar tree
Plug 'Xuyuanp/nerdtree-git-plugin' " sidebar tree git support
Plug 'neomake/neomake' " code checkers for many languages
Plug 'vim-airline/vim-airline' " pretty status bar
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t && ruby extconf.rb && make '
    \ } " file browser

" language support
Plug 'yanqd0/nginx.vim' " nginx conf
Plug 'wlangstroth/vim-racket' " racket
Plug 'arrufat/vala.vim' " vala

" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang' " C/C++
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } " javascript
Plug 'poppyschmo/deoplete-latex' " latex
Plug 'Shougo/neco-vim' " vimL

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

" use unicode symbols for airline
let g:airline_powerline_fonts = 1
" enable deoplete autocompletion
let g:deoplete#enable_at_startup = 1
